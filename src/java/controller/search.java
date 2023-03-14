/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import java.util.List;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="search", urlPatterns={"/search"})
public class search extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet search</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet search at " + request.getParameter("filterPrice") + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("product").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String filterPrice = request.getParameter("filterPrice");
        String key = request.getParameter("search-product").trim();
        String sort = request.getParameter("sort");
        String color = request.getParameter("color");
        ProductDAO d = new ProductDAO();
        List<Products> products = d.searchProductsByName(key);
        String message = "We haven't found '" + key +" - "+color+" - "+sort+ "' product";
        // sort
        if(sort.equals("lowToHigh")){
            products = d.sortLowToHigh(products);
        } else if(sort.equals("highToLow")){
            products = d.sortHighToLow(products);
        }
        // color
        if(!color.equals("default")){
            for (int i = 0; i < products.size(); i++) {
                if(!products.get(i).getColor().equalsIgnoreCase(color)){
                    products.remove(i);
                    i--;
                }
            }
        }
        //if user need search with scope money
        if(filterPrice!=null){
            int numberProduct = products.size();
            String scopeMoney_raw = request.getParameter("scopeMoney");
            int scopeMoney = Integer.parseInt(scopeMoney_raw);
            String scopeMoneyMess = "$"+scopeMoney + " to " + "$"+(scopeMoney+100);
            message = "We haven't found '" + key + " - " + color + " - " + sort + " - "+scopeMoneyMess+ "' product";
            for (int i = 0; i < numberProduct; i++) {
                if (products.get(i).getPrice() < scopeMoney || products.get(i).getPrice() > (scopeMoney + 100)) {
                    products.remove(i);
                    numberProduct--;
                    i--;
                }
            }
            if (products.size() > 0) {
                message = "We have found " + products.size() + " search results '"+key+"'";
            }
            request.setAttribute("checked", "checked");
            request.setAttribute("scopeMin", scopeMoney);
            request.setAttribute("scopeMinA", scopeMoney);
            request.setAttribute("scopeMaxA", scopeMoney + 100);
            request.setAttribute("message", message);
            request.setAttribute("products", products);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } else { // if not search with scope money
            if (products.size() > 0) {
                message = "We have found " + products.size() + " search results '"+key+"'";
            }
            request.setAttribute("message", message);
            request.setAttribute("products", products);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
    }
    
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

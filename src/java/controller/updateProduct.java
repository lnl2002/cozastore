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
import model.Products;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="updateProduct", urlPatterns={"/updateproduct"})
public class updateProduct extends HttpServlet {
   
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
            out.println("<title>Servlet updateProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProduct at " + request.getContextPath () + "</h1>");
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
        String productId = request.getParameter("id");
        int id = Integer.parseInt(productId);
        ProductDAO d = new ProductDAO();
        Products product = d.getProductById(id);
        request.setAttribute("productId", product.getProductId());
        request.setAttribute("productName", product.getNameProduct());
        request.setAttribute("color", product.getColor());
        request.setAttribute("quantity", product.getQuantity());
        request.setAttribute("price", product.getPrice());
        request.setAttribute("descript", product.getDescript());
        request.setAttribute("categoryId", product.getCategoryId());
        request.getRequestDispatcher("update-product.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String nameProduct = request.getParameter("nameProduct");
        String color = request.getParameter("color");
        String quantity_raw = request.getParameter("quantity");
        String price_raw = request.getParameter("price");
        String descript = request.getParameter("descript");
        String categoryId_raw = request.getParameter("categoryId");
        
        int quantity = Integer.parseInt(quantity_raw);
        int categoryId = Integer.parseInt(categoryId_raw);
        double price = Double.parseDouble(price_raw);
        int productId = Integer.parseInt(id);
        ProductDAO d = new ProductDAO();
        
        long millis=System.currentTimeMillis();   
        java.sql.Date date=new java.sql.Date(millis); 
        Products product = new Products(productId, nameProduct, quantity, price, descript, categoryId, "","", date, color);
        d.update(product);
        
        request.setAttribute("productName", nameProduct);
        request.setAttribute("color", color);
        request.setAttribute("quantity", quantity);
        request.setAttribute("price", price);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("descript", descript);
        request.setAttribute("message", "Updated successfully!");
        request.setAttribute("colorStyle", "#00dfc4");
        request.getRequestDispatcher("update-product.jsp").forward(request, response);
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

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
import java.sql.Date;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="addProduct", urlPatterns={"/addproduct"})
public class addProduct extends HttpServlet {
   
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
            out.println("<title>Servlet addProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addProduct at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("add-product.jsp").forward(request, response);
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
        String nameProduct = request.getParameter("nameProduct");
        String color = request.getParameter("color");
        String descript = request.getParameter("descript");
        String quantity_raw = request.getParameter("quantity");
        String price_raw = request.getParameter("price");
        String categoryId_raw = request.getParameter("categoryId");
        
        long millis=System.currentTimeMillis();   
        java.sql.Date date=new java.sql.Date(millis); 
        
        int quantity = Integer.parseInt(quantity_raw);
        int categoryId = Integer.parseInt(categoryId_raw);
        double price = Double.parseDouble(price_raw);
        Products product = new Products();
        product.setNameProduct(nameProduct);
        product.setQuantity(quantity);
        product.setPrice(price);
        product.setColor(color);
        product.setDescript(descript);
        product.setCategoryId(categoryId);
        product.setDateRelease(date);
        product.setImage("");
        
        ProductDAO d = new ProductDAO();
        d.insertProduct(product);
        
        request.setAttribute("message", "Added successfully");
        request.setAttribute("color", "#00dfc4");
        request.getRequestDispatcher("add-product.jsp").forward(request, response);
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

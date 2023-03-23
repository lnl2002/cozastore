/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categories;
import model.Products;
import model.Size;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "addsize", urlPatterns = {"/addsize"})
public class addsize extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addsize</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addsize at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO d = new CategoryDAO();
        List<Categories> list = d.getAll();
        request.setAttribute("categories", list);
        request.getRequestDispatcher("addSize.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO d = new ProductDAO();
        String size = request.getParameter("size");
        String description = request.getParameter("description");
        String categoryid_raw = request.getParameter("category");
        if (categoryid_raw.equals("all")) {
            Size s = new Size(size, description);
            d.insertSize(s);
            List<Products> products = d.getAll();
            for (int i = 0; i < products.size(); i++) {
                d.insertSizeProduct(size, products.get(i).getProductId());
            }
            String message = "Added successfully";
            String color = "#00dfc4";
            request.setAttribute("color", color);
            request.setAttribute("message", message);
            request.getRequestDispatcher("addSize.jsp").forward(request, response);
        }
        int categoryid = Integer.parseInt(categoryid_raw);
        Size s = new Size(size, description);
        d.insertSize(s);
        List<Integer> productIds = d.getAllProductIdByCategoryId(categoryid);
        for (int i = 0; i < productIds.size(); i++) {
            d.insertSizeProduct(size, productIds.get(i));
        }
        String message = "Added successfully";
        String color = "#00dfc4";
        request.setAttribute("color", color);
        request.setAttribute("message", message);
        request.getRequestDispatcher("addSize.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

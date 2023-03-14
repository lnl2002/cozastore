/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Customers;
import model.Order;
import model.OrderDetails;
import model.OrderProduct;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="ordered", urlPatterns={"/ordered"})
public class ordered extends HttpServlet {
   
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
            out.println("<title>Servlet ordered</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ordered at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
        Customers customer = (Customers)session.getAttribute("customer");
        int customerId = customer.getCustomerId();
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO productDAO = new ProductDAO();
        List<Order> listOrders = orderDAO.getAllOrder(customerId);
        List<List> list = new ArrayList<>();
        List<OrderProduct> orderProducts = new ArrayList<>();
        for (int i = 0; i < listOrders.size(); i++) {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setTotal(listOrders.get(i).getTotal());
            orderProduct.setOrderId(listOrders.get(i).getOrderId());
            orderProduct.setOrderTime(listOrders.get(i).getOrderTime());
            orderProduct.setAddress(listOrders.get(i).getAddress());
            orderProduct.setCustomerName(listOrders.get(i).getCustomerName());
            orderProduct.setPhone(listOrders.get(i).getPhone());
            orderProduct.setTotal(listOrders.get(i).getTotal());
            
            List<OrderDetails> listDetails = orderDAO.getAllOrderDetails(listOrders.get(i).getOrderId());
            for (int j = 0; j < listDetails.size(); j++) {
                int productId = listDetails.get(j).getProductId();
                Products product = productDAO.getProductById(productId);
                String size = listDetails.get(j).getSize();
                int quantity = listDetails.get(j).getQuantity();
                orderProduct.setProductId(productId);
                orderProduct.setQuantity(quantity);
                orderProduct.setSize(size);
                orderProduct.setProductName(product.getNameProduct());
                orderProduct.setPrice(product.getPrice());
                orderProducts.add(orderProduct);
            }
            list.add(orderProducts);
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("ordered.jsp").forward(request, response);
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
        processRequest(request, response);
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

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
import java.util.List;
import model.Cart;
import model.Customers;
import model.Order;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "addToOrder", urlPatterns = {"/addtoorder"})
public class addToOrder extends HttpServlet {

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
            out.println("<title>Servlet addToOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addToOrder at " + request.getContextPath() + "</h1>");
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
        String discount_raw = request.getParameter("discountTotal");
        int discount = Integer.parseInt(discount_raw);

        String customerName = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        HttpSession session = request.getSession();
        int cartId = (int) session.getAttribute("cartId");
        Customers customer = (Customers) session.getAttribute("customer");
        OrderDAO oDAO = new OrderDAO();
        CartDAO cartDAO = new CartDAO();
        ProductDAO productDAO = new ProductDAO();
        //inser order
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        Order order = new Order();
        order.setAddress(address);
        order.setCustomerName(customerName);
        order.setPhone(phone);
        order.setCartId(cartId);
        order.setCustomerId(customer.getCustomerId());
        order.setOrderTime(date);
        //cal total
        double total = 0;
        List<Cart> list = cartDAO.getListProductById(cartId);
        for (int i = 0; i < list.size(); i++) {
            int productId = list.get(i).getProductId();
            Products product = productDAO.getProductById(productId);
            total += product.getPrice()*list.get(i).getQuantity();
        }
        total  = total - (total*discount/100);
        order.setTotal(total);
        oDAO.insertOrder(order);

        //insert orderdetails
        for (int i = 0; i < list.size(); i++) {
            OrderDetails orderDetail = new OrderDetails();
            orderDetail.setOrderId(oDAO.getOrderIdByCustomerId(customer.getCustomerId()));
            int productId = list.get(i).getProductId();
            int quantity = list.get(i).getQuantity();
            String size = list.get(i).getSize();
            orderDetail.setProductId(productId);
            orderDetail.setQuantity(quantity);
            orderDetail.setSize(size);
            oDAO.insertOrderDetails(orderDetail);
        }
        cartDAO.deleteAll(cartId);
        request.setAttribute("orderSuccess", "Success! We will contact to you soon");
        request.getRequestDispatcher("shopingcart").forward(request, response);
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
        processRequest(request, response);
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

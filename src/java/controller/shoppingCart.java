/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import dal.CustomerDAO;
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
import model.Accounts;
import model.Cart;
import model.Customers;
import model.ProductCart;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="shoppingCart", urlPatterns={"/shopingcart"})
public class shoppingCart extends HttpServlet {
   
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
            out.println("<title>Servlet shoppingCart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shoppingCart at " + request.getContextPath () + "</h1>");
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
        Accounts account = (Accounts)session.getAttribute("account");
        CartDAO d = new CartDAO();
        ProductDAO pDAO =  new ProductDAO();
        int cartId = d.getCartIdByAccountId(1);
        List<Cart> cart = d.getListProductById(cartId);
        List<ProductCart> listProduct = new ArrayList<>();
        for (int i = 0; i < cart.size(); i++) {
            Products product = pDAO.getProductById(cart.get(i).getProductId());
            ProductCart productCart = new ProductCart();
            productCart.setAmount(cart.get(i).getQuantity());
            productCart.setCartId(cart.get(i).getCartId());
            productCart.setNameProduct(product.getNameProduct());
            productCart.setPrice(product.getPrice());
            productCart.setProductId(product.getProductId());
            productCart.setImage(product.getImage());
            productCart.setSize(cart.get(i).getSize());
            listProduct.add(productCart);
        }
        CustomerDAO cusDAO = new CustomerDAO();
        Customers cus = cusDAO.getCustomerByAccountID(account.getAccountID());
        request.setAttribute("customerName", cus.getName());
        request.setAttribute("address", cus.getAddress());
        request.setAttribute("phone", cus.getPhone());
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("shoping-cart.jsp").forward(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Accounts;
import model.Customers;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="register", urlPatterns={"/register"})
public class register extends HttpServlet {
   
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
            out.println("<title>Servlet register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        String name = request.getParameter("name");
        String birth_raw = request.getParameter("birth");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String message = "";
        String display = "";
        boolean flag = false;
        Date birth = null;
        try{
             birth = Date.valueOf(birth_raw);
        } catch (Exception e){
            request.setAttribute("wrongDate", "Please enter the correct format");
            request.setAttribute("message", "Have some error!! Please try again");
            flag=true;
        }
        
        if(phone.length()<10 || phone.length()>11){
            request.setAttribute("wrongPhone", "Phone was wrong");
            request.setAttribute("message", "Have some error!! Please try again");
            flag=true;
        }
        
        AccountDAO accountDAO = new AccountDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        
        if(!rePassword.equals(password)){
            request.setAttribute("rePassword", "Not the same with password");
            request.setAttribute("message", "Have some error!! Please try again");
            request.setAttribute("fail", "flex");
            flag=true;
        }
        
        if(accountDAO.isExistAccount(username)){
            request.setAttribute("existEmail", "Email is existed");
            request.setAttribute("message", "Have some error!! Please try again");
            request.setAttribute("fail", "flex");
            flag=true;
        }
        
        
        if(flag){
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        
        if(!flag){
            accountDAO.insertAccount(username, password);
            Customers customer = new Customers();
            customer.setName(name);
            customer.setBirth(birth);
            customer.setPhone(phone);
            customer.setAddress(address);
            customer.setAccountID(accountDAO.getAccountIdByUsername(username));
            customerDAO.insertCustomer(customer);
            
            request.setAttribute("message", "Create successfully!!");
            request.setAttribute("sucess", "flex");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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

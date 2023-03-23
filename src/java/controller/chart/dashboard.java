/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.chart;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;
import model.Category_Quantity;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name="dashboard", urlPatterns={"/dashboard"})
public class dashboard extends HttpServlet {
   
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
            out.println("<title>Servlet dashboard</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dashboard at " + request.getContextPath () + "</h1>");
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
        String option = request.getParameter("option");
        String year_raw = request.getParameter("year");
        
        double ratio=0;
        double moneyInLastMonth=0;
        String symbol="",symbolYear="";
        String color="",colorYear="";
        long millis=System.currentTimeMillis();   
        java.sql.Date date=new java.sql.Date(millis);
        int thisMonth = date.getMonth()+1;
        int thisYear = date.getYear()+1900;
        OrderDAO d = new OrderDAO();
        double moneyInMonth = d.getSumMoney( date.getMonth()+1,date.getYear()+1900);
        DecimalFormat df = new DecimalFormat("#,###.##");
        DecimalFormat format = new DecimalFormat("##.##");
        if(date.getMonth()==0){
            moneyInLastMonth = d.getSumMoney( 12,date.getYear()+1900-1);
        } else {
            moneyInLastMonth=d.getSumMoney( date.getMonth(),date.getYear()+1900);
        }
        //cal total and ratio month
        if(moneyInMonth-moneyInLastMonth > 0){
            ratio = ((moneyInMonth-moneyInLastMonth)/moneyInLastMonth)*100;
            symbol="fa-arrow-up";
            color = "text-success";
            
        } else if(moneyInMonth-moneyInLastMonth < 0) {
            ratio = ((moneyInLastMonth-moneyInMonth)/moneyInMonth)*100;
            symbol="fa-arrow-down";
            color = "text-danger";
        } else {
            ratio=0;
            symbol="fa-equals";
            color = "text-success";
        }
        //cal total and ratio year
        double yearRatio = getYearRatio(date.getYear()+1900);
        if(yearRatio>0){
            symbolYear="fa-arrow-up";
            colorYear="text-success";
        } else if(yearRatio<0){
            symbolYear="fa-arrow-down";
            colorYear="text-danger";
        } else {
            symbolYear="fa-equals";
            colorYear="text-success";
        }
        int numberOrder = d.getNumberOrder(date.getMonth()+1,date.getYear()+1900);
        
        // send data chart in a month
        if(year_raw==null || year_raw.equals("2023")){
            for (int i = 1; i < 12; i++) {
                double money = d.getSumMoney(i, date.getYear()+1900);
                request.setAttribute("month"+i, money);
            }
            request.setAttribute("monthlyTitle", "2023");
            request.setAttribute("active2023", "active");
        } else {
            int year = Integer.parseInt(year_raw);
            for (int i = 1; i < 12; i++) {
                double money = d.getSumMoney(i, year);
                request.setAttribute("month"+i, money);
            }
            request.setAttribute("monthlyTitle", year);
            request.setAttribute("active"+year, "active");
        }
        //send data circle chart category and quantity
        if(option == null ||option.equals("1")){
            List<Category_Quantity> categoryQuantity = d.getQuantityCategoryInAMonth(thisMonth, thisYear);
            for (int i = 0; i < categoryQuantity.size(); i++) {
                request.setAttribute("categoryQuantity"+(i+1), categoryQuantity.get(i).getQuantity());
            }
            request.setAttribute("thisMonth", thisMonth+" / 2023");
            request.setAttribute("active1", "active");
            request.setAttribute("cicrleTitle", "Month");
        } else {
            List<Category_Quantity> categoryQuantity = d.getQuantityCategoryInAYear( thisYear);
            for (int i = 0; i < categoryQuantity.size(); i++) {
                request.setAttribute("categoryQuantity"+(i+1), categoryQuantity.get(i).getQuantity());
            }
            request.setAttribute("thisMonth", "2023");
            request.setAttribute("active2", "active");
            request.setAttribute("cicrleTitle", "Year");
        }
        
        //send number order ratio 
        double numberOrderRatio = getNumberOrderRatio(thisMonth, thisYear);
        if(numberOrder>0){
            request.setAttribute("symbolOrder", "fa-arrow-up");
            request.setAttribute("colorOrder", "text-success");
        } else if(numberOrder<0) {
            request.setAttribute("symbolOrder", "fa-arrow-down");
            request.setAttribute("colorOrder", "text-danger");
        } else {
            request.setAttribute("symbolOrder", "fa-equals");
            request.setAttribute("colorOrder", "text-success");
        }
        //send data
        request.setAttribute("total2023", d.getSumMoneyInYear(2023));
        request.setAttribute("total2022", d.getSumMoneyInYear(2022));
        request.setAttribute("total2021", d.getSumMoneyInYear(2021));
        request.setAttribute("numberOrderRatio", format.format(numberOrderRatio));
        request.setAttribute("categorySold", d.getQuantityCategoryInAMonth(numberOrder, numberOrder));
        request.setAttribute("numberOrder", numberOrder);
        request.setAttribute("yearRatio", format.format(yearRatio));
        request.setAttribute("totalYear",df.format(getTotalYear(date.getYear()+1900)) );
        request.setAttribute("color", color);
        request.setAttribute("symbol", symbol);
        request.setAttribute("colorYear", colorYear);
        request.setAttribute("symbolYear", symbolYear);
        request.setAttribute("ratio", format.format(ratio));       
        request.setAttribute("moneyInMonth", df.format(moneyInMonth));
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    } 
    public static double getNumberOrderRatio(int month, int year){
        int lastMonth=month-1;
        int lastYear=year;
        if(month==1){
            lastMonth=12;
            lastYear=year-1;
        }
        OrderDAO d = new OrderDAO();
        double numberOrderNow = d.getNumberOrder(month, year);
        double numberOrderBefore = d.getNumberOrder(lastMonth, lastYear);
        return ((numberOrderNow-numberOrderBefore)/numberOrderBefore)*100.0;
    }
    
    public static double getTotalYear(int year){
        OrderDAO d = new OrderDAO();
        double total = d.getSumMoneyInYear(year);
        return total;
    }
    public static double getYearRatio(int year){
        OrderDAO d = new OrderDAO();
        double totalYear = d.getSumMoneyInYear(year);
        double totalLastYear = d.getSumMoneyInYear(year-1);
        return ((totalYear - totalLastYear)/totalLastYear)*100.0;
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

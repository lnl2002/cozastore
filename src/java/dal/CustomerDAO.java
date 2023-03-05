/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customers;

/**
 *
 * @author Nhat Anh
 */
public class CustomerDAO extends DBContext {

    public void insertCustomer(Customers customer) {
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([name]\n"
                + "           ,[birth]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[accountID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customer.getName());
            st.setDate(2, customer.getBirth());
            st.setString(3, customer.getPhone());
            st.setString(4, customer.getAddress());
            st.setInt(5, customer.getAccountID());
            st.executeUpdate();
        } catch (SQLException e){
            System.out.println(e);
        }
    }
    public Customers getCustomerByAccountID(int accountId){
        String sql = "select * from customers where accountid = ?";
        Customers customer = new Customers();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                customer.setAccountID(accountId);
                customer.setAddress(rs.getString("address"));
                customer.setBirth(rs.getDate("birth"));
                customer.setName(rs.getString("name"));
                customer.setPhone(rs.getString("phone"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return customer;
    }
    
    public static void main(String[] args) {
        CustomerDAO d = new CustomerDAO();
        Customers customers = d.getCustomerByAccountID(1);
        System.out.println(customers.getName());
    }
}

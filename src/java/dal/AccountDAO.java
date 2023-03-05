/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nhat Anh
 */
public class AccountDAO extends DBContext {

    // check account
    public boolean isAccount(String userName, String password) {
        String sql = "select * from Accounts where userName = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO d = new AccountDAO();
        System.out.println(d.isAccount("laingoclam3112@gmail.com", "12"));
    }

    public void insertAccount(String username, String password) {
        String sql = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([userName]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean isExistAccount(String username) {
        String sql = "select * from Accounts where userName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int getAccountIdByUsername(String username) {
        String sql = "select * from Accounts where userName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("accountID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void updatePassword(String username, String password) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [password] = ?\n"
                + " WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

/**
 *
 * @author Nhat Anh
 */
public class CategoryDAO extends DBContext {
    public List<Categories> getAll(){
        List<Categories> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Categories category = new Categories();
                category.setCategoryId(rs.getInt("categoryId"));
                category.setCategoryName(rs.getString("categoryName"));
                list.add(category);
            }
        } catch (Exception e) {
            System.out.println("1" + e);
        }
        return list;
    }
    public void addCategory(String categoryName) {
        String sql = "INSERT INTO [dbo].[Categories]\n"
                + "           ([categoryName])\n"
                + "     VALUES (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryName);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("1" + e);
        }
    }

    public boolean isCategory(String categoryName) {
        String sql = "select * from Categories where categoryName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("2" + e);
        }
        return false;
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM [dbo].[Categories]\n"
                + "      WHERE categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String oldName, String newName) {
        String sql = "UPDATE [dbo].[Categories]\n"
                + "   SET [categoryName] = ?\n"
                + " WHERE categoryName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newName);
            st.setString(2, oldName);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CategoryDAO d = new CategoryDAO();
        d.update("a","b");
        System.out.println(d.isCategory("b"));
    }
}

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
import model.Products;

/**
 *
 * @author Nhat Anh
 */
public class ProductDAO extends DBContext{
    public List<Products> getAll(){
        ProductDAO d = new ProductDAO();
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Products product = new Products();
                product.setCategoryId(rs.getInt("categoryId"));
                product.setDescript(rs.getString("Descript"));
                product.setImage(rs.getString("image"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setProductId(rs.getInt("productId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategoryName(d.getCategoryNameById(rs.getInt("categoryId")).toLowerCase()); 
                list.add(product);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return  list;
    }
    public String getCategoryNameById(int id){
        String sql = "select * from Categories where categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getString("categoryName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        List<Products> list = p.getAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getImage());
        }
    }
}

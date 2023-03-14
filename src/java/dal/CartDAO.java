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
import model.Cart;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
public class CartDAO extends DBContext {

    public void insert(Cart cart) {
        String sql = "INSERT INTO [dbo].[product_cart]\n"
                + "           ([cartId]\n"
                + "           ,[productId]\n"
                + "           ,[quantity]\n"
                + "           ,[size])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart.getCartId());
            st.setInt(2, cart.getProductId());
            st.setInt(3, cart.getQuantity());
            st.setString(4, cart.getSize());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int cartId, int productId) {
        String sql = "DELETE FROM [dbo].[product_cart]\n"
                + "      WHERE cartId = ? and productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            st.setInt(2, productId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Cart cart) {
        String sql = "UPDATE [dbo].[product_cart]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE cartId = ? and productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart.getQuantity());
            st.setInt(2, cart.getCartId());
            st.setInt(3, cart.getProductId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getCartIdByAccountId(int accountId) {
        String sql = "select c.cartid\n"
                + "from Accounts a, Customers cm, cart c\n"
                + "where a.accountID = cm.accountID and  c.customerId = cm.CustomerID and c.customerId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("cartId");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public List<Cart> getListProductById(int cartId) {
        List<Cart> products = new ArrayList<>();
        String sql = "select * from product_cart where cartId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart product = new Cart();
                product.setCartId(rs.getInt("cartId"));
                product.setProductId(rs.getInt("ProductId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setSize(rs.getString("size"));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public void deleteAll(int cartId) {
        String sql = "DELETE FROM [dbo].[product_cart]\n"
                + "      WHERE cartId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CartDAO d = new CartDAO();
        ProductDAO productDAO = new ProductDAO();
        double total = 0;
        List<Cart> products = d.getListProductById(1);
        for (int i = 0; i < products.size(); i++) {

        }
    }
}

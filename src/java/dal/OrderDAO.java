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
import model.Category_Quantity;
import model.Order;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
public class OrderDAO extends DBContext {

    public void insertOrder(Order order) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([CustomerID]\n"
                + "           ,[cartId]\n"
                + "           ,[orderTime]\n"
                + "           ,[customerName]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[total])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order.getCustomerId());
            st.setInt(2, order.getCartId());
            st.setDate(3, order.getOrderTime());
            st.setString(4, order.getCustomerName());
            st.setString(5, order.getAddress());
            st.setString(6, order.getPhone());
            st.setDouble(7, order.getTotal());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertOrderDetails(OrderDetails orderDetail) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([orderID]\n"
                + "           ,[productId]\n"
                + "           ,[size]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderDetail.getOrderId());
            st.setInt(2, orderDetail.getProductId());
            st.setString(3, orderDetail.getSize());
            st.setInt(4, orderDetail.getQuantity());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getOrderIdByCustomerId(int customerId) {
        String sql = "select orderId from Orders where customerId = ?";
        List<Integer> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("orderId"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list.get(list.size() - 1);
    }

    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        int month=3;
        int year = 2023;
        int lastMonth=month-1;
        int lastYear=year;
        if(month==1){
            lastMonth=12;
            lastYear=year-1;
        }
        double numberOrderNow = d.getNumberOrder(month, year);
        double numberOrderBefore = d.getNumberOrder(lastMonth, lastYear);
        System.out.println(numberOrderBefore);
        System.out.println(numberOrderNow);
        System.out.println(( (23-18)/18)*100.0 );
        System.out.println(((numberOrderNow-numberOrderBefore)/numberOrderBefore)*100.0); 
    }

    public List<Order> getAllOrder(int customerId) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from orders where customerId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setAddress(rs.getString("address"));
                order.setCartId(rs.getInt("cartId"));
                order.setCustomerId(rs.getInt("customerId"));
                order.setCustomerName(rs.getString("customerName"));
                order.setOrderId(rs.getInt("orderId"));
                order.setOrderTime(rs.getDate("orderTime"));
                order.setPhone(rs.getString("phone"));
                order.setTotal(rs.getDouble("total"));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderDetails> getAllOrderDetails(int orderId) {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "select * from orderDetails where orderId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrderId(rs.getInt("orderId"));
                orderDetails.setProductId(rs.getInt("productId"));
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setSize(rs.getString("size"));
                list.add(orderDetails);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getBestSeller() {
        ProductDAO d = new ProductDAO();
        List<Products> list = new ArrayList<>();
        String sql = "SELECT TOP 4 productId, SUM(quantity) AS total_sold\n"
                + "FROM OrderDetails\n"
                + "GROUP BY productID\n"
                + "ORDER BY total_sold DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                Products product = d.getProductById(productId);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category_Quantity> getQuantityCategoryInAMonth(int month, int year) {
        ProductDAO d = new ProductDAO();
        List<Category_Quantity> list = new ArrayList<>();
        List<Category_Quantity> list_submit = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            list_submit.add(new Category_Quantity(i+1, 0));
        }
        String sql = "select SUM(od.quantity)[quantity],categoryID\n"
                + "from OrderDetails od, Products p, Orders o\n"
                + "where od.productId=p.productID and o.orderID=od.orderID and MONTH(o.orderTime) = ? and YEAR(o.orderTime)=?\n"
                + "group by categoryID;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category_Quantity( rs.getInt("categoryId"),rs.getInt("quantity")));
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
       
        for (int j = 0; j < list.size(); j++) {
            for (int i = 0; i < list_submit.size(); i++) {
                     if(list_submit.get(i).getCategoryId() == list.get(j).getCategoryId()){
                         list_submit.get(i).setQuantity(list.get(j).getQuantity());
                     }
            }
        }
        return list_submit;
    }
    public List<Category_Quantity> getQuantityCategoryInAYear( int year) {
        ProductDAO d = new ProductDAO();
        List<Category_Quantity> list = new ArrayList<>();
        List<Category_Quantity> list_submit = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            list_submit.add(new Category_Quantity(i+1, 0));
        }
        String sql = "select SUM(od.quantity)[quantity],categoryID\n"
                + "from OrderDetails od, Products p, Orders o\n"
                + "where od.productId=p.productID and o.orderID=od.orderID and  YEAR(o.orderTime)=?\n"
                + "group by categoryID;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category_Quantity( rs.getInt("categoryId"),rs.getInt("quantity")));
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
       
        for (int j = 0; j < list.size(); j++) {
            for (int i = 0; i < list_submit.size(); i++) {
                     if(list_submit.get(i).getCategoryId() == list.get(j).getCategoryId()){
                         list_submit.get(i).setQuantity(list.get(j).getQuantity());
                     }
            }
        }
        return list_submit;
    }

    public double getSumMoney(int month, int year) {
        String sql = "select MONTH(orderTime),Year(orderTime),sum(total)[total]\n"
                + "from [orders]\n"
                + "where Year(orderTime)=? and MONTH(orderTime)=?\n"
                + "group by MONTH(orderTime),Year(orderTime)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public double getSumMoneyInYear(int year) {
        String sql = "select Year(orderTime),sum(total)[total]\n"
                + "from [orders]\n"
                + "where Year(orderTime)=? \n"
                + "group by Year(orderTime)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getNumberOrder(int month, int year) {
        String sql = "select MONTH(orderTime), YEAR(orderTime),COUNT(orderid)[numberOrder]\n"
                + "from Orders\n"
                + "where MONTH(orderTime)=? and YEAR(orderTime)=?\n"
                + "group by MONTH(orderTime), YEAR(orderTime)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOrder");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
}

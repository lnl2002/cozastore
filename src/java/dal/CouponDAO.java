/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

/**
 *
 * @author Nhat Anh
 */
public class CouponDAO extends DBContext {

    public double isDiscount(String code) {
        String sql = "select * from vouchers where code =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble("discount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        for (int i = 15; i < 205; i++) {
            Random rand = new Random();
            int randomNum = rand.nextInt(10) + 1;
            int product = rand.nextInt(83)+1;
            System.out.println("INSERT INTO [dbo].[OrderDetails]\n"
                    + "           ([orderID]\n"
                    + "           ,[productId]\n"
                    + "           ,[size]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           ("+i+","+product+" ,'XL',"+randomNum+")");
            
        }
    }
}

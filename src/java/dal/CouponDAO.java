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
public class CouponDAO extends DBContext{
    public double isDiscount(String code){
        String sql = "select * from vouchers where code =?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getDouble("discount");
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return 0;
    }
}

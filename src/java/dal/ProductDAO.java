/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;
import model.Categories;
import model.Products;

/**
 *
 * @author Nhat Anh
 */
public class ProductDAO extends DBContext {

    public List<Products> getAll() {
        ProductDAO d = new ProductDAO();
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products product = new Products();
                product.setCategoryId(rs.getInt("categoryId"));
                product.setDescript(rs.getString("Descript"));
                product.setImage(rs.getString("image"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setProductId(rs.getInt("productId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategoryName(d.getCategoryNameById(rs.getInt("categoryId")).toLowerCase());
                product.setDateRelease(rs.getDate("dateRelease"));
                product.setColor(rs.getString("color"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getAllPaging(List<Products> list, int start, int end) {
        List<Products> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;

    }

    public String getCategoryNameById(int id) {
        String sql = "select * from Categories where categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("categoryName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Categories> getAllCategory() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = new Categories();
                c.setCategoryId(rs.getInt("categoryId"));
                c.setCategoryName(rs.getString("categoryName"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> listNew() {
        String sql = "select top 20 *\n"
                + "from Products\n"
                + "order by dateRelease desc";
        List<Products> list = new ArrayList<>();
        ProductDAO d = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products product = new Products();
                product.setCategoryId(rs.getInt("categoryId"));
                product.setDescript(rs.getString("Descript"));
                product.setImage(rs.getString("image"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setProductId(rs.getInt("productId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategoryName(d.getCategoryNameById(rs.getInt("categoryId")).toLowerCase());
                product.setDateRelease(rs.getDate("dateRelease"));
                product.setColor(rs.getString("color"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> searchProductsByName(String key) {
        String sql = "select * from products "
                + "where nameProduct like ?";
        List<Products> products = new ArrayList<>();
        ProductDAO d = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products product = new Products();
                product.setCategoryId(rs.getInt("categoryId"));
                product.setDescript(rs.getString("Descript"));
                product.setImage(rs.getString("image"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setProductId(rs.getInt("productId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategoryName(d.getCategoryNameById(rs.getInt("categoryId")).toLowerCase());
                product.setDateRelease(rs.getDate("dateRelease"));
                product.setColor(rs.getString("color"));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public List<Products> sortLowToHigh(List<Products> products) {
        Comparator<Products> compareByPrice = new Comparator<Products>() {
            @Override
            public int compare(Products o1, Products o2) {
                if (o1.getPrice() > o2.getPrice()) {
                    return 1;
                }
                if (o1.getPrice() < o2.getPrice()) {
                    return -1;
                }
                return 0;
            }
        };
        Collections.sort(products, compareByPrice);
        return products;
    }

    public List<Products> sortHighToLow(List<Products> products) {
        Comparator<Products> compareByPrice = new Comparator<Products>() {
            @Override
            public int compare(Products o1, Products o2) {
                if (o1.getPrice() > o2.getPrice()) {
                    return -1;
                }
                if (o1.getPrice() < o2.getPrice()) {
                    return 1;
                }
                return 0;
            }
        };
        Collections.sort(products, compareByPrice);
        return products;
    }

    public Products getProductById(int id) {
        String sql = "select p.productID,[nameProduct],[quantity],[price],[descript],p.[categoryID],[image],[dateRelease],[color], c.categoryName\n"
                + "from Products p join Categories c\n"
                + "	on p.categoryID = c.categoryID\n"
                + "where productID = ?";
        Products product = new Products();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product.setCategoryId(rs.getInt("categoryId"));
                product.setDescript(rs.getString("Descript"));
                product.setImage(rs.getString("image"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setProductId(rs.getInt("productId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategoryName(rs.getString("categoryName"));
                product.setDateRelease(rs.getDate("dateRelease"));
                product.setColor(rs.getString("color"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }

    public List<String> getSizeByProductId(int id) {
        String sql = "SELECT [size]\n"
                + "  FROM [dbo].[Size_Product] where productId = ?";
        List<String> listSize = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listSize.add(rs.getString("size"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listSize;
    }

    // top 8 product oldest
    public List<Products> getRealatedProducts(int categoryId) {
        List<Products> products = new ArrayList<>();
        String sql = "select top 8 *\n"
                + "from Products\n"
                + "where categoryID = ?\n"
                + "order by dateRelease ";
        ProductDAO d = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products product = new Products();
                product.setCategoryId(rs.getInt("categoryId"));
                product.setDescript(rs.getString("Descript"));
                product.setImage(rs.getString("image"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setProductId(rs.getInt("productId"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategoryName(d.getCategoryNameById(rs.getInt("categoryId")).toLowerCase());
                product.setDateRelease(rs.getDate("dateRelease"));
                product.setColor(rs.getString("color"));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public void deleteByID(int id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProduct(Products product) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([nameProduct]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[descript]\n"
                + "           ,[categoryID]\n"
                + "           ,[image]\n"
                + "           ,[dateRelease]\n"
                + "           ,[color])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getNameProduct());
            st.setInt(2, product.getQuantity());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getDescript());
            st.setInt(5, product.getCategoryId());
            st.setString(6, product.getImage());
            st.setDate(7, product.getDateRelease());
            st.setString(8, product.getColor());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Products product) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [nameProduct] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] =?\n"
                + "      ,[descript] = ?\n"
                + "      ,[categoryID] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[dateRelease] = ?\n"
                + "      ,[color] = ?\n"
                + " WHERE productId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getNameProduct());
            st.setInt(2, product.getQuantity());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getDescript());
            st.setInt(5, product.getCategoryId());
            st.setString(6, product.getImage());
            st.setDate(7, product.getDateRelease());
            st.setString(8, product.getColor());
            st.setInt(9, product.getProductId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        Products product = p.getProductById(2);
        System.out.println(product.getNameProduct());
    }
}

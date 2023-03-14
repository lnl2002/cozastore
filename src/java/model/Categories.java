/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Random;

/**
 *
 * @author Nhat Anh
 */
public class Categories {

    int categoryId;
    String categoryName;

    public Categories() {
    }

    public Categories(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public static void main(String[] args) {
        
        Random rand = new Random();
        for (int i = 17; i <= 83; i++) {
            double random = Math.random() * 999 + 1.0;
            NumberFormat formatter = new DecimalFormat("##.##");
            
          
            System.out.println("INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) \n"
                    + "VALUES ('Product " 
                    + i 
                    + "', 1000, "
                    +formatter.format(random)
                    +",'Product "
                    +i+" ',1,'images/product-"
                    + i
                    +".jpg')");
        }
    }
}

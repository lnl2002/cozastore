/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Nhat Anh
 */
import java.util.GregorianCalendar;

public class RandomDateOfBirth {

    public static void main(String[] args) {

        

        for (int i = 1; i <= 83; i++) {
               GregorianCalendar gc = new GregorianCalendar();

        int year = randBetween(2020, 2022);

        gc.set(gc.YEAR, year);

        int dayOfYear = randBetween(1, gc.getActualMaximum(gc.DAY_OF_YEAR));

        gc.set(gc.DAY_OF_YEAR, dayOfYear);
            System.out.println("UPDATE [dbo].[Products]\n"
                    + "   SET [dateRelease] = '"+ gc.get(gc.YEAR) + "-" + (gc.get(gc.MONTH) + 1) + "-" + gc.get(gc.DAY_OF_MONTH) +"'\n"
                    + " WHERE  productID = "+i);
        }
    }

    public static int randBetween(int start, int end) {
        return start + (int) Math.round(Math.random() * (end - start));
    }
}

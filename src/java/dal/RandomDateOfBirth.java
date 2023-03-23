/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Nhat Anh
 */
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.GregorianCalendar;
import java.util.concurrent.ThreadLocalRandom;

public class RandomDateOfBirth {

    public static void main(String[] args) {

        for (int i = 1; i <= 50; i++) {
            double min = 10.0;
            double max = 2000.0;

            double randomDouble = min + Math.random() * (max - min);
            randomDouble = Math.round(randomDouble * 100.0) / 100.0;
            LocalDate minDate = LocalDate.of(2023, 1, 1);
            LocalDate maxDate = LocalDate.of(2023, 3, 19);
            long daysBetween = ChronoUnit.DAYS.between(minDate, maxDate);
            long randomDays = ThreadLocalRandom.current().nextLong(daysBetween + 1);
            LocalDate randomDate = minDate.plusDays(randomDays);
//            System.out.println("UPDATE [dbo].[Products]\n"
//                    + "   SET [dateRelease] = '" + gc.get(gc.YEAR) + "-" + (gc.get(gc.MONTH) + 1) + "-" + gc.get(gc.DAY_OF_MONTH) + "'\n"
//                    + " WHERE  productID = " + i);
            System.out.println("INSERT INTO [dbo].[Orders]\n"
                    + "           ([CustomerID]\n"
                    + "           ,[cartId]\n"
                    + "           ,[orderTime]\n"
                    + "           ,[customerName]\n"
                    + "           ,[address]\n"
                    + "           ,[phone]\n"
                    + "           ,[total])\n"
                    + "     VALUES\n"
                    + "           (1,1,'" + randomDate + "','Nguyen Minh Phuong','hoang quoc viet, cau giay, ha noi','0332916668'," + randomDouble + " )");
        }

    }

    public static int randBetween(int start, int end) {
        return start + (int) Math.round(Math.random() * (end - start));
    }
}

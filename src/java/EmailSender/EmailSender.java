package EmailSender;

import dal.ProductDAO;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import model.OrderDetails;
import model.Products;

public class EmailSender {

    public static void send(String email, String customerName, double total, List<OrderDetails> listOrders,double discount) {
        DecimalFormat f = new DecimalFormat("##.##");
        ProductDAO d = new ProductDAO();
        String listProduct = "";
        for (int i = 0; i < listOrders.size(); i++) {
            int productId = listOrders.get(i).getProductId();
            int quantity = listOrders.get(i).getQuantity();
            double totalProduct = d.getProductById(productId).getPrice()*quantity;
            listProduct += "\n"+d.getProductById(productId).getNameProduct()+"\t\tQuanity: " +quantity +"\t\tTOTAL: "+f.format(totalProduct);
        }
        
        final String username = "";
        final String password = "";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("lamlnhe161656@fpt.edu.vn"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("Coza Store");
            message.setText("Dear "+customerName+","
                    + "\nHere is your order: "+listProduct
                    + "\nDISCOUNT: " +f.format(discount) +"%"
                    + "\nTOTAL of your order is $" + total + ""
                    + "\n\n---------------------- COZA STORE ----------------------"
                    + "\nThank you for choosing our store. We will contact you soon!"
                    + "\nStore owner: Lai Ngoc Lam - HE161656"
                    + "\nProject: Coza Store"
                    + "\nClass: SE1727");

            Transport.send(message);

            System.out.println("Sent message successfully....");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean isValidEmailAddress(String email) {
        boolean result = true;
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
            // gửi email kiểm tra
            props.put("mail.smtp.host", "smtp.gmail.com");
            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("lamlnhe161656@fpt.edu.vn", "lnl412204");
                }
            });
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("lamlnhe161656@gmail.com"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
            msg.setSubject("Kiểm tra email");
            msg.setText("Xin chào,\n\nBộ phận hỗ trợ của chúng tôi đang kiểm tra email của bạn.\n\nThân ái,\nBộ phận hỗ trợ.");
            Transport.send(msg);
        } catch (AddressException ex) {
            result = false;
        } catch (MessagingException ex) {
            result = false;
        }
        return result;
    }

    

}

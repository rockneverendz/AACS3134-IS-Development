package control.user.account;

import entity.Customer;
import entity.Token;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CustomerService;
import service.TokenService;

public class recovery extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get email and password from enviornment variables
        final String user = System.getProperty("mail");
        final String password = System.getProperty("pass");

        // Get request object
        String userIdCard = request.getParameter("UserIDCard");
        String email = request.getParameter("Email");

        // Initialize variables
        StringBuilder url = new StringBuilder("../account/passrecovery.jsp");
        CustomerService cs = new CustomerService();
        TokenService ts = new TokenService();

        try {
            // Find that customer
            Customer customer = cs.findCustByUserIdCard(userIdCard);
            if (!customer.getEmail().equals(email)) {
                throw new IllegalArgumentException();
            }

            // TOKEN GENERATOR HERE
            String uniqueID = UUID.randomUUID().toString();
            Token token = new Token();
            Date date = new Date();

            token.setToken(uniqueID);
            token.setStutus("Sent");
            token.setDate(date);
            token.setTime(date);
            token.setId(customer.getCustId());

            ts.addToken(token);

            //Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });

            //Compose the message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("St. Freya Bricks");
            message.setText("Token is " + uniqueID);

            //send the message  
            Transport.send(message);
            
            // Redirect back with status 'Success'
            url.append("?status=0");
            
        } catch (MessagingException ex) {
            Logger.getLogger(recovery.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoResultException ex) {
            url.append("?status=U");
        } catch (IllegalArgumentException ex) {
            url.append("?status=E");
        } finally {
            cs.close();
            ts.close();
        }

        response.sendRedirect(url.toString());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

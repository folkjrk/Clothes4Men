/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.CheckoutDAO;
import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import static java.util.Map.entry;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductOrder;

/**
 *
 * @author astroxjrk
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //  Shopping cart
        String user = (String) request.getSession().getAttribute("customer-user");
        String resultcheckuser = "";
        String status = "";
        //  Address
        String FirstName = request.getParameter("firstName");
        String LastName = request.getParameter("lastName");
        String Name = FirstName + " " + LastName;
        String Address = request.getParameter("address");
        String Country = request.getParameter("country");
        String Postcode = request.getParameter("postcode");
        String AddressFinal = Name + Address + Country + Postcode;
        String resultcheckout = "";

//        String Id = request.getParameter("id");
//        String Product_Name = request.getParameter("Product_Name");
//        String Quantity = request.getParameter("quantity");
//        String TotalPrice = request.getParameter("show-grandTotal");
        Date currentDate = new Date();

        // check user 
        if (user == null || user == "") {
            resultcheckuser = "Please register before making a purchase.";

            HttpSession session = request.getSession();
            session = request.getSession(true);
            session.setAttribute("resultcheckuser", resultcheckuser);
            response.sendRedirect("Checkout.jsp");
            return;
        }
        String jsonString = request.getParameter("hidden-input");

        ObjectMapper mapper = new ObjectMapper();
        List<Map<String, Object>> mapList = mapper.readValue(jsonString, new TypeReference<List<Map<String, Object>>>() {
        });

        int order_Id = 0;
        int grandTotal = 0;
        // add purchase order
        for (Map<String, Object> map : mapList) {
            String source =null;
            int subTotal = 0;
            int count = 0;
            int price = 0;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();

                if (key == "Price") {
                    price = (int) value;
                }

                if (key == "Count") {
                    count = (int) value;
                }
                if (key == "Source") {
                    source = (String) value;
                }
                if (price != 0 && count != 0 && source != null && !source.isEmpty()) {
                    subTotal = price * count;
                    grandTotal += subTotal;
                }
            }
        }
        status = "waiting for approve";
        ProductOrder purchaseorder = new ProductOrder(user, currentDate, grandTotal, status, AddressFinal);
        CheckoutDAO purdao = new CheckoutDAO();
        try {
            resultcheckout = purdao.insertCheckoutprodorder(purchaseorder);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
        // get order_id
        if(resultcheckout == "successfully")
        {
            ProductOrder checkorderid = new ProductOrder(user);
            CheckoutDAO chdao = new CheckoutDAO();

            try {
                order_Id = chdao.SelectCheckoutprodorder(checkorderid);
            } catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
          
        }
     

        // add order product
        if (order_Id != 0) {

            for (Map<String, Object> map : mapList) {
                int count = 0;
                String product_Name = "";
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    String key = entry.getKey();
                    Object value = entry.getValue();

                    if (key == "Product_Name") {
                        product_Name = (String) value;
                    }

                    if (key == "Count") {
                        count = (int) value;
                    }

                }
                ProductOrder productorder = new ProductOrder(order_Id, count, product_Name);
                CheckoutDAO podao = new CheckoutDAO();
                try {
                    resultcheckout = podao.insertCheckoutProdcut(productorder);
                } catch (Exception ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);

                }

            }

            // Update quantity product
            for (Map<String, Object> map : mapList) {
                    int quantity = 0;
                    int Id = 0;
                    for (Map.Entry<String, Object> entry : map.entrySet()) {
                        String key = entry.getKey();
                        Object value = entry.getValue();

                        if (key == "Product_Id") {
                            Id = (int) value;
                        }

                        if (key == "Quantity") {
                            quantity = (int) value;
                        }
                    }
                        
                        Product product = new Product(Id, quantity);
                        ProductDAO pdao = new ProductDAO();
                        try {
                            resultcheckout = pdao.UpdateProduct(product);
                        } catch (Exception ex) {
                            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);

                        
                    }
                }
            
        } else {

            resultcheckout = "Something wrong please contact support";

        }
        HttpSession session = request.getSession();
        session = request.getSession(true);
        session.setAttribute("resultcheckout", resultcheckout);
        response.sendRedirect("index.jsp");
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

@MultipartConfig(
    fileSizeThreshold   = 1024 * 1024 * 2,  // 2MB
    maxFileSize         = 1024 * 1024 * 10, // 10MB
    maxRequestSize      = 1024 * 1024 * 50 // 50MB
)
/**
 *
 * @author astroxjrk
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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
       
        //upload file img
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String savePath = "/Users/astroxjrk/NetBeansProjects/Business_of_Clothes_4_Men/src/main/webapp/img/" + fileName;
    
        try (InputStream inputStream = filePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(savePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            } catch (IOException ex) {
                // error
            }
        
        // upload value to database        
        String Product_Name = request.getParameter ("product_Name");
        String Category_IdSt = request.getParameter ("category_Id");
        String QuantitySt = request.getParameter ("quantity");
        String PriceSt =request.getParameter ("price");
        
        int Category_Id = Integer.parseInt(Category_IdSt);
        int Quantity = Integer.parseInt(QuantitySt);
        int Price = Integer.parseInt(PriceSt);
        String Source = "img/"+ fileName;
        String result = "";
        //String cat_Id = null;
        
        Product checkCategory =new Product (Price, Quantity, Product_Name, Category_Id, Source);
        ProductDAO pdao = new ProductDAO();

        try {
            result = pdao.insertProduct(checkCategory);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        HttpSession session = request.getSession();
        session = request.getSession(true);
        
        
        session.setAttribute("resultprod",result);
        response.sendRedirect("Product.jsp");
 
        
    }

 

}

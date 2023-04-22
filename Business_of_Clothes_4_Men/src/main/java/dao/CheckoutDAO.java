/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Product;
import model.ProductOrder;

/**
 *
 * @author astroxjrk
 */
public class CheckoutDAO {

    private String dbURL = "jdbc:mysql://localhost:3306/Clothes4Mendb"; //?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private String dbUser = "root";
    private String dbPassword = "my-secret-pw";
    private String dbDriver = "com.mysql.jdbc.Driver";
    
    private static final String SELECT_ORDERID_SQL = "SELECT Id FROM Purchase_Order WHERE Customer_Email= ? ORDER BY Id DESC LIMIT 1 ;";

    private static final String INSERT_PRODUCTORDER_SQL = "Insert INTO Order_Product"
            + " ( Order_Id, Product_Name, Quantity ) VALUES " + " (?,?,?); ";

    private static final String INSERT_PURCHASEORDER_SQL = "Insert INTO Purchase_Order"
            + " ( Customer_Email, Date, Total, Status, Address ) VALUES " + " (?,?,?,?,?); ";

    protected Connection getConnection() throws SQLException {
        Connection con = null;
        try {
            try {
                Class.forName(dbDriver); //loading mysql
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            }
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());

        }
        return con;
    }

    public String insertCheckoutProdcut(ProductOrder productorder) throws SQLException {
        String resultcheckout = "successfully";

        Connection con = getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(INSERT_PRODUCTORDER_SQL);
            {
                ps.setInt(1, productorder.getOrder_Id());
                ps.setString(2, productorder.getProduct_Name());
                ps.setInt(3, productorder.getQuantity());

                ps.executeUpdate();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resultcheckout = "Something wrong please contact support";

        }
        con.close();
        return resultcheckout;
    }

    public String insertCheckoutprodorder(ProductOrder productorder) throws SQLException {
        String resultcheckout = "successfully";

        Connection con = getConnection();
        try {
            java.sql.Date sqlDate = new java.sql.Date(productorder.getDate().getTime());
            PreparedStatement ps = con.prepareStatement(INSERT_PURCHASEORDER_SQL);
            {
                ps.setString(1, productorder.getEmail());
                ps.setDate(2, sqlDate);
                ps.setInt(3, productorder.getTotal());
                ps.setString(4, productorder.getStatus());
                ps.setString(5, productorder.getAddress());

                ps.executeUpdate();   
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resultcheckout = "Something wrong please  contact support";

        }
        con.close();
        return resultcheckout;
    }

    public int SelectCheckoutprodorder(ProductOrder productorder)throws SQLException 
     {   
         int order_Id = 0;

         Connection con = getConnection();
         try
         {
             PreparedStatement stmt = con.prepareStatement(SELECT_ORDERID_SQL);
             stmt.setString(1, productorder.getEmail());
             ResultSet rs = stmt.executeQuery();
             
             if (rs.next()) {
                 order_Id =rs.getInt("Id");
             }
                  
       }
         catch (Exception ex) 
        {
            ex.printStackTrace();
                
        }  
         con.close();
         return (order_Id);
     
       
     } 
    



}

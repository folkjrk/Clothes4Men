/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Product;
import model.ProductOrder;

/**
 *
 * @author astroxjrk
 */
public class ProductDAO {
    private String dbURL = "jdbc:mysql://localhost:3306/Clothes4Mendb"; //?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private String dbUser = "root";
    private String dbPassword = "my-secret-pw";
    private String dbDriver = "com.mysql.jdbc.Driver";
    
    
    
    private static final String UPDATE_PRODUCT_SQL = "UPDATE Product SET Quantity = ? WHERE Id = ?;"; 
     
    
    private static final String INSERT_CATE_SQL = "Insert INTO Product_Categories" 
     + " ( Category_Name) VALUES " + " (?); ";
    
    private static final String INSERT_PRODUCT_SQL = "Insert INTO Product" 
     + " (Product_Name, Quantity, Price, Source, Category_Id) VALUES " + " (?,?,?,?,?); ";
    
      protected Connection getConnection() throws SQLException {
        Connection  con = null;
        try 
     {
         try
         {
         Class.forName(dbDriver); //loading mysql
         }
         catch (ClassNotFoundException ex)
         {
            ex.printStackTrace();         
         }       
         con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
     }
        catch (SQLException ex) 
        {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
           
        }               
        return con;
    }
     // insert category
    public String insertcategory(Product product) throws SQLException 
     {   
         String result = "Category entered successfully";
         
         Connection con = getConnection();
         try
         {
             PreparedStatement ps = con.prepareStatement(INSERT_CATE_SQL);
             {
                 ps.setString(1, product.getCategory_Name());
                 ps.executeUpdate();
             }
         }
         catch (Exception ex) 
        {
            ex.printStackTrace();
            result = "Category not entered";
                
        }  
         con.close();
         return result;
     } 
      
      
      
    // Add Product
    public String insertProduct(Product product) throws SQLException 
     {   
         String result = "Product entered successfully";
         
         Connection con = getConnection();
         try
         {
             PreparedStatement ps = con.prepareStatement(INSERT_PRODUCT_SQL);
             {
                 ps.setString(1, product.getProduct_Name());
                 ps.setInt(2, product.getQuantity());
                 ps.setInt(3, product.getPrice());
                 ps.setString(4, product.getSource());
                 ps.setInt(5, product.getCategory_Id());
                 ps.executeUpdate();
             }
         }
         catch (Exception ex) 
        {
            ex.printStackTrace();
            result = "Product not entered";
                
        }  
         con.close();
         return result;
     } 
    
        // Update Product
    public String UpdateProduct(Product product) throws SQLException 
     {   
         String resultcheckout = "successfully";
         
         Connection con = getConnection();
         try
         {
             PreparedStatement ps = con.prepareStatement(UPDATE_PRODUCT_SQL);
             {
                 ps.setInt(1, product.getQuantity());
                 ps.setInt(2, product.getId());

     
                 ps.executeUpdate();
             }
         }
         catch (Exception ex) 
        {
            ex.printStackTrace();
            resultcheckout = "Something wrong plase contact support";
                
        }  
         con.close();
         return resultcheckout;
     } 
    


      
      
      
      
    
    
    
    
    
    
    
}

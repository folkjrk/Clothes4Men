/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Customer;
/**
 *
 * @author astroxjrk
 */
public class CustomerDAO {
    private String dbURL = "jdbc:mysql://localhost:3306/Clothes4Mendb"; //?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private String dbUser = "root";
    private String dbPassword = "my-secret-pw";
    private String dbDriver = "com.mysql.jdbc.Driver";
    
    private static final String SELECT_CUSTOMER_SQL = " SELECT * "
            + " FROM Customer where Email=? and Password=? ";
    private static final String INSERT_CUSTOMER_SQL = "Insert INTO Customer" 
            + " (Name, Email, Password,Role) VALUES " + " (?,?,?,?); ";
    
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
    // Select customer
    
 
    // Create customer
    public String insertCustomer(Customer customer) throws SQLException 
     {   
         String result = "Data entered successfully";
         String Role = "0";
         Connection con = getConnection();
         try
         {
             PreparedStatement ps = con.prepareStatement(INSERT_CUSTOMER_SQL);
             {
                 ps.setString(1, customer.getName());
                 ps.setString(2, customer.getEmail());
                 ps.setString(3, customer.getPassword());
                 ps.setString(4, Role);
                 ps.executeUpdate();
             }
         }
         catch (Exception ex) 
        {
            ex.printStackTrace();
            result = "Data not entered";
                
        }  
         con.close();
         return result;
     } 
    public String SelectCustomer(Customer customer)throws SQLException 
     {   
         String lcEmail = customer.getEmail();
         String lcPassword = customer.getPassword();
         String emaildb = null;
         String passworddb = null;
         String Roledb = "-1"; 
//         String result = "";

         Connection con = getConnection();
         try
         {
             PreparedStatement stmt = con.prepareStatement(SELECT_CUSTOMER_SQL);
             stmt.setString(1, lcEmail);
             stmt.setString(2, lcPassword);
             ResultSet rs = stmt.executeQuery();
             while (rs.next()){
                    emaildb =rs.getString("Email");
                    passworddb =rs.getString("Password");
                    Roledb = rs.getString("Role"); 
             }
                     
       }
         catch (Exception ex) 
        {
            ex.printStackTrace();
                
        }  
         con.close();
         return (Roledb);
     
       
     }
}



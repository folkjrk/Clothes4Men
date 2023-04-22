/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author astroxjrk
 */
public class ProductOrder {

    private int Total,Order_Id,Quantity;
    private String Email,Status,Product_Name,Address;
    private Date Date;
    
    public ProductOrder(String Email){
        this.Email = Email;
    
    }
    
    public ProductOrder(int Order_Id, int Quantity, String Product_Name){
        this.Order_Id = Order_Id;
        this.Quantity = Quantity;
        this.Product_Name = Product_Name;
        
    }
 
    public ProductOrder(String Email,Date Date, int Total, String Status,String Address){
        this.Email = Email;
        this.Date = Date;
        this.Total = Total;
        this.Status = Status;
        this.Address = Address;
    }
    
     public int getTotal(){  
        return Total; 
    }
     public void setTotal(int Total){
        this.Total = Total;
    }
          public int getOrder_Id(){  
        return Order_Id; 
    }
     public void setOrder_Id(int Order_Id){
        this.Order_Id = Order_Id;
    }
          public int getQuantity(){  
        return Quantity; 
    }
     public void setQuantity(int Quantity){
        this.Quantity = Quantity;
    }
     public String getEmail(){  
        return Email; 
    }
     public void setEmail(String Email){
        this.Email = Email;
    }  
     public String getStatus(){  
        return Status; 
    }
     public void setStatus(String Status){
        this.Status = Status;
    }
    public String getProduct_Name(){  
        return Product_Name; 
    }
     public void setProduct_Name(String Product_Name){
        this.Product_Name = Product_Name;
    }
    public String getAddress(){  
        return Address; 
    }
     public void setAddress(String Address){
        this.Address = Address;
    }
     public Date getDate(){  
        return Date; 
    }
     public void setdate(Date Date){
        this.Date = Date;
    }
    
}

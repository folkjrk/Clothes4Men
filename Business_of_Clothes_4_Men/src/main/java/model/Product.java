/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author astroxjrk
 */
public class Product {
    private int Id, Quantity,Price,Category_Id;
    private String Product_Name,Source,Category_Name;
    
    public Product(String Category_Name){
        this.Category_Name= Category_Name;
    
    }
    public Product(int Id, int Quantity){
        this.Id= Id;
        this.Quantity= Quantity;
    
    }
    
    public Product(int Price, int Quantity, String Product_Name,int Category_Id,String Source){
        this.Quantity = Quantity;
        this.Product_Name = Product_Name;
        this.Price = Price;
        this.Category_Id = Category_Id;
        this.Source = Source;
    }
    
     public int getId(){  
        return Id; 
    }
     public void setId(int Id){
        this.Id = Id;
    }
    public int getQuantity(){  
        return Quantity; 
    }
     public void setQuantity(int Quantity){
        this.Quantity = Quantity;
    }
     public int getPrice(){  
        return Price; 
    }
     public void setPrice(int Price){
        this.Price = Price;
    }
     public int getCategory_Id(){  
        return Category_Id; 
    }
     public void setCategory_Id(int Category_Id){
        this.Category_Id = Category_Id;
    }
     public String getProduct_Name(){  
        return Product_Name; 
    }
     public void setProduct_Name(String Product_Name){
        this.Product_Name = Product_Name;
    }
     public String getSource(){  
        return Source; 
    }
     public void setSource(String Source){
        this.Source = Source;
    }
     public String getCategory_Name(){  
        return Category_Name; 
    }
     public void setCategory_Name(String Category_Name){
        this.Category_Name = Category_Name;
    }
     
     
    
    
}

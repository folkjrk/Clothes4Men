/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author astroxjrk
 */
public class Customer {
    private int Id,Phone;
    private String Name, Address,Email,Password,ConfirmPassword;   
    
    //public Customer(){
    //    super();
    //}
    
    public Customer (String Email, String Password)  {
        this.Password = Password;
        this.Email = Email;
    }
    
    public Customer( String Password, String Name, String Email){
        super();
        this.Password = Password;
        this.Name = Name;  
        this.Email = Email;
    }
     
    public int getId(){  
        return Id; 
    }
    public String getName(){
        return Name;
    }
    public String getAddress(){
        return Address;
    }
     public String getPassword(){
        return Password;
    }
       public String getConfirmPassword(){
        return ConfirmPassword;
    }
    public int getPhone(){
        return Phone;
    }
    public String getEmail(){
        return Email;
    }
    public void setId(int Id){
        this.Id = Id;
    }
    public void setName(String Name){
        this.Name = Name;
    }
    public void setAddress(String Address){
        this.Address = Address;
    }
         public void setPassword(String Password){
        this.Password = Password;
    }
       public void setConfirmPassword(String ConfirmPassword){
        this.ConfirmPassword = ConfirmPassword;
    }
       public void setPhone(int Phone){
        this.Phone = Phone;
    }
        public void getEmail(String Email){
        this.Email = Email;
    }
}

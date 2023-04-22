<%-- 
    Document   : Track_order
    Created on : Apr 1, 2023, 11:24:47 PM
    Author     : astroxjrk
--%>
<!-- Connect db to get information -->
        <%
         Connection con =null;
        Statement st= null;
        ResultSet rs = null;
         Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
     try 
     {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Clothes4Mendb?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "my-secret-pw"); //&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
        }
 catch (SQLException ex) {
   
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
}
  String query = "SELECT t1.Id , Customer_Email , t1.Date , Product_Name, Quantity ,Address , Status FROM `Purchase_Order` t1 LEFT JOIN `Order_Product` t2 ON t1.Id=t2.Order_Id ORDER BY t1.Id DESC;";
  st = con.createStatement();
  rs = st.executeQuery(query);
 
%>
<!--check user-->
<% 
        String emailid = (String) request.getSession().getAttribute("customer-user"); 
        String role = (String)request.getSession().getAttribute("role");
        
        String loginstatus = "Login";
        if(role == null ){
            emailid = " " ;
        } 
        else {
            loginstatus = "Log out";
        }
  
     
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Track order-Clothes 4 Mean</title>
    </head>
    <body>

<!--Header-->
        <header class="p-3">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>
          <a href="Product.jsp"><img src="img/logo.png" alt="logo page" width="90px" height="90px"></img></a> 
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="Product.jsp" class="nav-link px-2 text-black">Products</a></li>
            <li><a href="Track_order.jsp" class="nav-link px-2 text-black">Tacking order</a></li>
            <li><a href="UserMg.jsp" class="nav-link px-2 text-black">User</a></li>
            
        </ul>
        <div class="mx-1" ><%= emailid %></div>
        <div class="text-end mx-2">
          <a href="Login.jsp" class="btn btn-outline-dark me-2"><%= loginstatus %></a>
        </div>
      </div>
    </div>
  </header>

    <div class="container">
                <h3 class="d-flex justify-content-between align-items-center mb-2">
                    <span class="text-muted">Tracking order</span>   
                </h3>
    </div>    

    <div class="container  d-flex justify-content-center ">
   
        <TABLE BORDER="1" class="table table-striped" style="width:100%">
            <TR>
                <TH>Order id</TH>
                <TH>User</TH>
                <TH>Date</TH>
                <TH>Product Name</TH>
                <TH>Quantity</TH> 
                <TH>Address</TH> 
                <TH>Status</TH> 
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <td> <%= rs.getString(1) %></td> 
                <td> <%= rs.getString(2) %></td>                
                <td> <%= rs.getString(3) %></td>
                <td> <%= rs.getString(4) %></td>
                <td> <%= rs.getString(5) %></td>            
                <td> <%= rs.getString(6) %></td> 
                <td> <%= rs.getString(7) %></td> 
            </TR>
            <% } %>
        </TABLE>      

    </div>
  
        
        
          
    </body>
</html>


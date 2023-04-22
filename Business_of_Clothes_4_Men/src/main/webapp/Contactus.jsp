<%-- 
    Document   : Contactus
    Created on : Apr 11, 2023, 7:37:45 PM
    Author     : astroxjrk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<% 
        String emailid = (String) request.getSession().getAttribute("customer-user"); 
        String role = (String)request.getSession().getAttribute("role");
        String resultcheckout = (String)request.getSession().getAttribute("resultcheckout");
        
        String loginstatus = "Login";
        if(role == null ){
            emailid = " " ;
        } 
        else {
            loginstatus = "Log out";
        }
  
       
     
%>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

<html>
    <head>
        <title>Contract us-Clothes 4 Men</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           
    </head>

    
    <body>
          <header class="p-3">
            <div class="container">
              <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
                  <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                </a>
                <a href="index.jsp"><img src="img/logo.png" alt="logo page" width="90px" height="90px"></img></a>
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                  <li><a href="index.jsp" class="nav-link px-2 text-black">Home</a></li>
                  <li><a href="Search.jsp" class="nav-link px-2 text-black">Products</a></li>
                  <li><a href="Track_orderofCM.jsp" class="nav-link px-2 text-black">Tracking order</a></li>
                  <li><a href="Contactus.jsp" class="nav-link px-2 text-black">Contact us</a></li>
                  
                </ul>
                    
                <div class="mx-1" ><%= emailid %></div>
                <div class="text-end mx-2">
                    <a href="Login.jsp" class="btn btn-outline-dark me-2"><%= loginstatus %></a>
                    <a href="Register.jsp" class="btn btn-dark">Sign-up</a>
                </div>
                
                <div class="container my-5 "> 
                <!--Section heading-->
                <h2 class="h1-responsive font-weight-bold text-center my-4 " style="text-align: left">Contact us</h2>
                <!--Section description-->
                <p class="text-center w-responsive mx-auto mb-5">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
                    a matter of hours to help you.</p>
                </div>
                <div class="container align-items-center">
          
                    <div class="col text-center my-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                        </svg>
                        <ul class="list-unstyled my-5">
                            <li><i class="fas fa-map-marker-alt fa-2x"></i>
                                <p>Coventry, CV1 2JU, UK</p>
                            </li>

                            <li><i class="fas fa-phone mt-4 fa-2x"></i>
                                <p>PRODUCTS & ORDERS </p>
                                <p>+ 01 234 567 89 </p>
                                <p>8:00 - 20:00 Monday - Friday 8:00 - 17:00Saturday</p>
                                
                            </li>
                             
                            <li><i class="fas fa-envelope mt-4 fa-2x"></i>
                                <p>Email: jarmekorntec@gmail.com</p>
                            </li>
                        </ul>
                    </div>

                    
                    
                </div>
        
   
                
                
              </div>
            </div>
        </header>

    

   
  

        
    </body>
</html>

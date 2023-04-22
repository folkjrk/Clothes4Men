<%-- 
    Document   : index
    Created on : Apr 3, 2023, 6:32:57 PM
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<html>
    <head>
        <title>Home page-Clothes 4 Men</title>
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
                <!--                alert-->
                <div class="myAlert-top alert alert-success " style="display: none" >                       
                        ${resultcheckout}  
                </div> 
                <div class="mx-1" ><%= emailid %></div>
             
                <div class="text-end mx-2">
                    
                    <a href="Login.jsp" class="btn btn-outline-dark me-2" id="login"><%= loginstatus %></a>
                   <a href="Register.jsp" class="btn btn-dark">Sign-up</a>

                </div>
              </div>
            </div>
        </header>
   
        <div class="container d-flex justify-content-center" >
        <img src="https://images.unsplash.com/photo-1554230142-6e0f4ab6af7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
              class="object-fit-cover"  alt="head-bg" style="width:100%; height:500px">            
        </div>
       
        <form action="SearchServlet" method="post" >
        
            <div class="container d-flex justify-content-center my-3 ">
            <div class="row row-cols row-cols-sm-2 row-cols-lg-4 ">
                
                <div class="col my-2">
                    <div class="card" style="width: 20rem; height: 27rem;">
                        <img src="img/white_tshirts.jpg" style="object-fit: cover; height: 15rem;" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                        <h5 class="card-title">TOPS</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <input type="hidden" name="cateid" value="3">
                        <button type="submit" class="btn btn-outline-dark">Shop now</button>
                        </div>
                    </div> 
                </div>
                </form>
                   <form action="SearchServlet" method="post" >

                       <div class="col my-2">
                           <div class="card" style="width: 20rem; height: 27rem;">
                               <img src="img/young-man-wearing-shirt-posing-chair.jpg" style="object-fit: cover; height: 15rem;" class="card-img-top img-fluid" alt="...">
                               <div class="card-body">
                                   <h5 class="card-title">BOTTOMS</h5>
                                   <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>            
                                   <input type="hidden" name="cateid" value="4">
                                   <button type="submit" class="btn btn-outline-dark">Shop now</button>
                               </div>
                           </div> 
                       </div>
                   </form>
                   <form action="SearchServlet" method="post" >
                       <div class="col my-2">
                           <div class="card" style="width: 20rem; height: 27rem;">
                               <img src="img/vapor.jpg" style="object-fit: cover; height: 15rem;" class="card-img-top img-fluid" alt="...">
                               <div class="card-body">
                                   <h5 class="card-title">SHOES</h5>
                                   <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                   <input type="hidden" name="cateid" value="1">
                                   <button type="submit" class="btn btn-outline-dark">Shop now</button>
                               </div>
                           </div> 
                       </div>
                   </form>
                   <form action="SearchServlet" method="post" >
                       <div class="col my-2">
                           <div class="card" style="width: 20rem; height: 27rem;">
                               <img src="img/medium-shot-stylish-model.jpg" style="object-fit: cover; height: 15rem"  class="card-img-top img-fluid" alt="...">
                               <div class="card-body">
                                   <h5 class="card-title">ACCESSORIES</h5>
                                   <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                   <input type="hidden" name="cateid" value="5">
                                   <button type="submit" class="btn btn-outline-dark">Shop now</button>
                               </div>
                           </div> 
                       </div>
                   </form>

</div>
</div>   


        
    </body>
</html>

  <c:if test="${not empty resultcheckout }">
    <script>
    var resultcheckout = "${resultcheckout}";
    if (resultcheckout !== "") {
        $(".myAlert-top").show();
        setTimeout(function(){
        $(".myAlert-top").hide(); 
     }, 3500);   
    }
    if (resultcheckout === "successfully") {
        
        sessionStorage.removeItem('AddProduct');
        sessionStorage.removeItem('cartModal');
    }

    </script>
    <c:remove var="resultcheckout" scope="session" />
  </c:if>
  


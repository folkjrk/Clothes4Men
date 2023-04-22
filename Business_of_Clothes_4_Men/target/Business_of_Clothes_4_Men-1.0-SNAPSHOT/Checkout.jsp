<%-- 
    Document   : Checkout
    Created on : Apr 5, 2023, 1:28:43 PM
    Author     : astroxjrk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

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





<!DOCTYPE html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout-Clothes 4 Mean</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/Checkoutjavascript.js"></script>
    </head> 
    <body>                   
        <!--Header-->
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
                        ${resultcheckuser}
                        ${messagevisa}
                </div> 
                <div class ="visa-message" id="messagevisa">
                </div> 
                <div class="mx-1" ><%= emailid %></div>
        
                <div class="text-end mx-2">
                    <a href="Login.jsp" class="btn btn-outline-dark me-2"><%= loginstatus %></a>
                   <a href="Register.jsp" class="btn btn-dark">Sign-up</a>
                    
                    <button type="button" class="btn btn-primary position-relative bg-dark mx-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                    <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger rounded-circle " id="AddProduct" >
                        <span class="visually-hidden">New alerts</span>
                    </span>
                    </button>

                </div>
              </div>
            </div>
        </header>

<!-- shopping cart-->
    <form action="CheckoutServlet" method="post" id="CheckoutForm">
        <div class="container d-flex justify-content-center " style="width: 100%; height: 150%;">      
        <div class="container"> 
            
            <div class="col">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                  <span class="text-muted">Your cart</span>
                </h4>
                    <ul class="list-group mb-3" >
  
                        <table class="center my-2" style="border: 1px solid #DCDCDC; border-radius: 10px;">
                            <thead>
                                <tr>
                                    <th scope="col" ></th>
                                    <th scope="col">Product</th>

                                    <th scope="col" style="text-align: start">Qty</th>
                                    <th scope="col"> </th>
                                    <th scope="col" class="text-center">Total</th>
                                </tr>
                            </thead>
                            <tbody id="show-finalcart">      
<!--                      Showing the table by javascript              -->
                            </tbody>                             
                        </table>
  

                  <li class="list-group-item d-flex justify-content-between">
                    <span>Total (GBP)</span>
                    <strong id="show-grandTotal" name="show-grandTotal"></strong>
                  </li>
                </ul>
            </div>

               <div class="col">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted ">Shipping Address</span>
                    </h4>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                                <label for="firstName">First name</label>
                                <input type="text" class="form-control" name="firstName" placeholder="" value="" required="">
                                <div class="invalid-feedback">
                                  Valid first name is required.
                                </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Last name</label>
                            <input type="text" class="form-control" name="lastName" placeholder="" value="" required="">
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                    </div>


                    <div class="mb-3">
                      <label for="address">Address</label>
                      <input type="text" class="form-control" id="address" name="address" placeholder="1234 Main St" required="">
                      <div class="invalid-feedback">
                        Please enter your shipping address.
                      </div>
                    </div>

                    <div class="row">
                        
                        <div class="col-md-5 mb-3">
                          <label for="country">Country</label>
       <select class="form-select d-block w-100" id="country" name="country" required="" style="width:10px;">
                            <option value="">Select...</option>
                            <option>United Kingdom</option>
                          </select>
                          <div class="invalid-feedback">
                            Please select a valid country.
                          </div>
                        </div>      
                        
                        <div class="col-md-3 mb-3">
                          <label for="zip">Post code</label>
                          <input type="text" class="form-control" id="postcode" name="postcode" placeholder="" required="">
                          <div class="invalid-feedback">
                            Post code required.
                          </div>
                        </div>
                    </div>                  
                </div> 
            <input type="hidden" id="hidden-input" name="hidden-input" > 
        </div> 
                  
    <!--        payment-->                 
            <div class="container" style="margin-left: 10%;  "> 
                <h4 class="d-flex justify-content-between align-items-center mb-3">              
                    <span class="text-muted">Payment information</span>
                </h4>
                <div class="padding">                    
                    <div class="row my-2">                 
                        <div class="col-sm-15">                   
                            <div class="card">                  
                                <div class="card-header">

                                    <strong>Credit Card</strong>
                                    <small>enter your card details</small>
                                </div>
                                <div class="card-body">
                                    <div class="row my-2">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="name">Name</label>
                                                <input class="form-control" id="nameCard" name="nameCard" type="text" placeholder="Enter your name">                                        
                                            </div>
                                        </div>
                                    </div>
                   <div class="row my-2">
                       <div class="col-sm-12">
                           <div class="form-group">
                               <label for="ccnumber">Credit Card Number</label>
                               <div class="input-group">
                                   <input class="form-control" type="text" id="credit-card-number" name="creditCardNumber" placeholder="0000 0000 0000 0000" autocomplete="email">
                                   <div class="input-group-append">
                                       <span class="input-group-text">
                                           <i class="mdi mdi-credit-card"></i>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
                                           <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
                                           <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
                                           </svg>
                                       </span>
                                   </div>
                               </div> 
                           </div>
                       </div>
                    </div>
                                    <div class="row my-2">
                                        <div class="form-group col-sm-4">
                                            <label for="ccmonth">Month</label>
                                            <select class="form-control" id="ccmonth" name="ccmonth">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                                <option>11</option>
                                                <option>12</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label for="ccyear">Year</label>
                                            <select class="form-control" id="ccyear" name="ccyear">
                                            <option>2014</option>
                                            <option>2015</option>
                                            <option>2016</option>
                                            <option>2017</option>
                                            <option>2018</option>
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                            <option>2023</option>
                                            <option>2024</option>
                                            <option>2025</option>
                                            </select>
                                         </div>           
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="cvv">CVV</label>
                                                <input class="form-control" id="cvv" name="cvv" type="text" placeholder="123">
                                            </div>
                                       </div>
                                    </div>
                               </div>
                                <div class="card-footer">
                                    <button onclick="CheckoutForm" class="btn btn-sm btn-success float-right" type="submit">
                                        <i class="mdi mdi-gamepad-circle"></i> Checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                
            </div>                 
        </div>
    </form>
    
  
  </body>
</html>

<script>
    var cardNumberInput = document.getElementById('credit-card-number');
var alertBox = document.querySelector('.myAlert-top');

cardNumberInput.addEventListener('blur', function() {
  var cardNumber = cardNumberInput.value;
  if (isValidVisaCardNumber(cardNumber)) {
    sessionStorage.setItem("messagevisa", "This is a valid Visa card number!");
    var messagevisa = sessionStorage.getItem("messagevisa");
    alertBox.innerHTML = messagevisa;
    alertBox.style.display = 'block';
    setTimeout(function(){
      alertBox.style.display = 'none'; 
    }, 3500);  
    sessionStorage.removeItem("messagevisa");
    console.log('This is a valid Visa card number!');
  } else {
    sessionStorage.setItem("messagevisa", "This is not a valid Visa card number.");
    var messagevisa = sessionStorage.getItem("messagevisa");
    alertBox.innerHTML = messagevisa;
    alertBox.style.display = 'block';
    setTimeout(function(){
      alertBox.style.display = 'none'; 
    }, 3500);  
    sessionStorage.removeItem("messagevisa");
    console.log('This is not a valid Visa card number.');
  }
});






//   var cardNumberInput = document.getElementById('credit-card-number');
//   var messagevisa ="";
//cardNumberInput.addEventListener('blur', function() {
//  var cardNumber = cardNumberInput.value;
//  if (isValidVisaCardNumber(cardNumber)) {
//      sessionStorage.setItem("messagevisa", "This is a valid Visa card number!");
//      messagevisa = sessionStorage.getItem("messagevisa");
//            $(".myAlert-top").show();
//        setTimeout(function(){
//        $(".myAlert-top").hide(); 
//     }, 3500);  
//     
//     sessionStorage.removeItem("messagevisa");
//     console.log('This is a valid Visa card number!');
//    
//    
//  } else {
//      sessionStorage.setItem("messagevisa", "This is a valid Visa card number!");
//      messagevisa = sessionStorage.getItem("messagevisa");
//      $(".myAlert-top").show();
//        setTimeout(function(){
//        $(".myAlert-top").hide(); 
//     }, 3500);  
//     sessionStorage.removeItem("messagevisa");
//     console.log('This is not a valid Visa card number.');
//    }
//  
//  }); 

</script>



  <c:if test="${not empty resultcheckuser }">
    <script>
    var resultcheckuser = "${resultcheckuser}";
    if (resultcheckuser !== "") {
        $(".myAlert-top").show();
        setTimeout(function(){
        $(".myAlert-top").hide(); 
     }, 3500);   
    }
    </script>
    <c:remove var="resultcheckuser" scope="session" />
  </c:if>






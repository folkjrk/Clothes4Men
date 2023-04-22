<%-- 
    Document   : Search
    Created on : Apr 1, 2023, 11:20:23 PM
    Author     : astroxjrk
--%>
<!-- Connect db to get information -->
       

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

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


<%  
    Integer cateid = 0;

    String cateID = (String) request.getSession().getAttribute("category_Id");

    if(cateID != null && !cateID.equals("")) 
    {
        cateid = Integer.parseInt((String) request.getSession().getAttribute("category_Id"));
    }         
%>         

<!-- Connect db to get information -->
        <%
         Connection con =null;
         Statement st= null;
         PreparedStatement ps = null;
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
  if (cateid != null && cateid != 0){

    String query = (String) "";
    query = "SELECT * FROM product WHERE Category_Id = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, cateid);
                rs = ps.executeQuery();
}
else{
        String query = "SELECT * FROM product;";
        st = con.createStatement();
        rs = st.executeQuery(query);
        }



%>


<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/js/Searchjavascript.js" async="" ></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<html>
    <head>
        <title>Category-Clothes 4 Men</title>
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
                    
                    <a href="#cartModal" class="btn btn-primary position-relative bg-dark mx-2" data-bs-toggle="modal" onclick="showCartTable()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        
                        <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger rounded-circle " id="AddProduct" >
                        <span class="visually-hidden">New alerts</span>
                        </span>
                    </a>

                </div>
              </div>
            </div>
        </header>
    
        
<!--Modal for view cart-->

        <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header border-bottom-0">
                <h5 class="modal-title" id="ModalLabel">
                  Shopping Cart
                </h5>
                <button type="button" class="close" onclick="clickCloseModal()" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                <table class="table table-image">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Product</th>
                            <th scope="col">Price</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Total</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                  
                    <tbody id="show-cart">      
<!--                      Showing the table by javascript              -->
                    </tbody>                
                </table> 
                    
                <div class="d-flex justify-content-end">
                    <h5>Total: <span class="price text-success" id="show-grandTotal">0</span></h5>
                </div>
                </div>
                <div class="modal-footer border-top-0 d-flex justify-content-end">
                    <a href="Checkout.jsp" class="btn btn-success">Checkout</a>
                </div>
            </div>
          </div>
        </div>
        

<!--   header category   -->
        <div class="container">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted"> Categories </span>
            </h4>
        </div>

<!--showing Categories-->
        <div class="container d-flex justify-content my-3">

                <div class="col-2 ">
                    <div class="d-flex flex-column flex-shrink-0 p-3 h-100 " style="width: 180px;">
                        <div class="dropdown-item">
                        <form id="category-form" action="SearchServlet" metod="get">
                                      <button type="button" class="dropdown-item" onclick="submitCategoryForm('0')">
                                        <input type="hidden" name="category" id="category-input" value=null/>                        
                                        <h5>All categories</h5>
                                    </button> 
                  
                            <sql:setDataSource var = "ds" driver = "com.mysql.cj.jdbc.Driver"
                                url = "jdbc:mysql://localhost:3306/Clothes4Mendb?user=root&password=my-secret-pw" />

                             <sql:query dataSource = "${ds}" var = "result">
                                SELECT * from Product_Categories 
                             </sql:query>
                               
                                <c:forEach var="row" items="${result.rows}">
                                    <button type="button" class="dropdown-item" onclick="submitCategoryForm('<c:out value='${row.Id}'/>')">
                                        <input type="hidden" name="category" id="category-input" value="<c:out value='${row.Id}'/>"/>                        
                                        <h5><c:out value="${row.Category_Name}"/></h5>
                                    </button>    
                               </c:forEach>                
                         </form >
                         </div> 
                    </div>
                </div>  
<!--showing product-->  
    
            <div class="col-10  ">
                <div class="row row-cols row-cols-sm-2 row-cols-lg-3 ">

                        <% while(rs.next()){ %>
                            <div class="col my-2">
                                        <div class="card shadow" style="width: 20rem; height: 25rem;">
                                        <img src="<%= rs.getString(5) %>" style="object-fit: cover; height: 15rem;" class="card-img-top img-fluid" alt="product_img" " >
                                            <div class="card-body">
                                            <h6 class="card-title" id="product_Name"><%= rs.getString(2) %></h6>
                                            <h5 id="price">£<%= rs.getInt(4) %></h5>                                    
                                            <div class="form-group my-2">
                                                    <input type="hidden" id="quantity" value="<%= rs.getInt(3) %>"/>  
                                                    <input type="hidden" id="product_Id" value="<%= rs.getInt(1) %>"/>                                
                                                    <button onclick="clickAdd( <%=rs.getInt(1) %>,<%= rs.getInt(3) %>,'<%= rs.getString(2) %>',<%= rs.getInt(4) %>, '<%= rs.getString(5) %>')" class="btn btn-outline-dark my-2" type="button">Add to Cart</button>
                                            </div>
                                            </div> 
                                        </div>
                            </div>
                        <% } %>

                </div>
            </div>
        </div>   
    </body>
</html>




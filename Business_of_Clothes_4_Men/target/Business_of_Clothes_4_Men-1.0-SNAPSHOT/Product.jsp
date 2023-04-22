<%-- 
    Document   : Product
    Created on : Apr 8, 2023, 1:05:00 PM
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
  String query = "SELECT t1.Id, Product_Name, Category_Name, Quantity, Price FROM `Product` t1 LEFT JOIN `Product_Categories` t2 ON t1.Category_Id=t2.Id;";
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
<!--add category-->
<% 
        String resultcate = (String) request.getSession().getAttribute("resultcate");
        String resultprod = (String) request.getSession().getAttribute("resultprod"); 
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/AddProductjavascript.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product management-Clothes 4 Mean</title>
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
<!--                alert-->
                <div class="cateAlert-top alert alert-success " style="display: none" >                       
                        ${resultcate}  
                </div> 
 <!--                alert-->
                <div class="prodAlert-top alert alert-success " style="display: none" >                       
                        ${resultprod}  
                </div>                
                
        <div class="mx-1" ><%= emailid %></div>
        <div class="text-end mx-2">
          <a href="Login.jsp" class="btn btn-outline-dark me-2"><%= loginstatus %></a>
        </div>
      </div>
    </div>
  </header>
        
        <div class="container my-2">
            <h3 class="d-flex justify-content-between align-items-center mb-2">
                <span class="text-muted">All Products</span>
            </h3>
         <a href="#addcategoryModal" class="btn btn-primary position-relative bg-dark my-2"  data-bs-toggle="modal" >
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
            </svg>
            Add Category
        </a>  
            
            <a href="#addproductModal" class="btn btn-primary position-relative bg-dark my-2"  data-bs-toggle="modal" >
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
            </svg>
            Add Product
        </a>
            
        </div>  
             <div class="container  d-flex justify-content-center ">

                <table BORDER="1" class="table table-striped" style="width:100%">
                    <tr>
                        <th>Product Id</th>
                        <th>Product Name</th>
                        <th>Category Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                             
                    </tr>
                    <% while(rs.next()){ %>
                    <tr>
                        <td> <%= rs.getString(1) %></td>  	 
                        <td> <%= rs.getString(2) %></td>              
                        <td> <%= rs.getString(3) %></td>
                        <td> <%= rs.getString(4) %></td>
                        <td> <%= rs.getString(5) %></td>

                    </tr>
                    <% } %>
                </table>      
            </div>

        <!--        Modal for add product-->
            <div class="modal fade" id="addproductModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header border-bottom-0 my-2">
                            <h5 class="modal-title" id="ModalLabel">
                              Add product
                            </h5>
                                <button type="button" class="close" onclick="clickCloseProductModal()" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>              
                            <form action="ProductServlet" method="post" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                                <label for="product_Name">Product Name</label>
                                                <input type="text" class="form-control" name="product_Name" placeholder="" value="" required="">
                                        </div> 
<!--                                         view category list-->
                                         <div class="col-md-6 mb-3">
                                           <label for="category_Name">Category Name</label>
                                            <select class="form-select" name="category_Id">
                                                <option value=" "> Select category </option> 
                                     
                                                <sql:setDataSource var = "ds" driver = "com.mysql.cj.jdbc.Driver"
                                                    url = "jdbc:mysql://localhost:3306/Clothes4Mendb?user=root&password=my-secret-pw" />
                                                 <sql:query dataSource = "${ds}" var = "result">
                                                    SELECT * from Product_Categories 
                                                 </sql:query>
                                                    <c:forEach var="row" items="${result.rows}"> 
                                                
                                                        <option value="${row.Id}">${row.Category_Name}</option>          
                                                    </c:forEach> 
                                                   
                                           </select>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                                <label for="quantity">Quantity</label>
                                                <input type="text" class="form-control" name="quantity" placeholder="" value="" required="">          
                                        </div> 

                                        <div class="col-md-6 mb-3">
                                                <label for="price">Price</label>
                                                <input type="text" class="form-control" name="price" placeholder="" value="" required="">         
                                        </div>                            
                                    </div>                   
                                    <div class="row"><!-- Add img -->
                                            <input type="file" name="file" accept="image/jpeg, image/png, image/jpg">
                                            <output></output>                             
                                    </div>
                                    
                                    <div class="modal-footer border-top-0 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-success">submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        
        <!--        Modal for view Add category-->
            <div class="modal fade" id="addcategoryModal" tabindex="-1" role="dialog" >
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header border-bottom-0 my-2">
                            <h5 class="modal-title" id="ModalLabel">
                              Add Category
                            </h5>
                                <button type="button" class="close" onclick="clickCloseCetrgoryModal()" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div> 
                                <form action="CategoryServlet" method="post" >
                                    <div class="modal-body">             
                                        <div class="col-md-6 mb-3">
                                                <label for="category_Name">Category Name</label>
                                                <input type="text" class="form-control" name="category_Name" placeholder="" value="" required="">
                                        </div>                            
                                    </div>                                
                                    <div class="modal-footer border-top-0 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-success">submit</button>
                                    </div>
                                 </form>
                                </div>
                            </form>
                        </div>
                    </div>
  
  

    </body>
</html>
            
<c:if test="${not empty resultcate }">
    <script>
    var resultcate = "${resultcate}";
    if (resultcate !== "") {
        $(".cateAlert-top").show();
        setTimeout(function(){
        $(".cateAlert-top").hide(); 
     }, 3500);   
    }
    </script>
    <c:remove var="resultcate" scope="session" />
  </c:if>
    

<c:if test="${not empty resultprod }">
    <script>
    var resultprod = "${resultprod}";
    if (resultprod !== "") {
        $(".prodAlert-top").show();
        setTimeout(function(){
        $(".prodAlert-top").hide(); 
     }, 3500);   
    }
    </script>
    <c:remove var="resultprod" scope="session" />
  </c:if>

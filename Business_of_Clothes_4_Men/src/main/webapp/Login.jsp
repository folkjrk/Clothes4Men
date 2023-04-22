
<!--check user-->
<% 
        String status = (String) request.getSession().getAttribute("status"); 
        
        if (status == null || status.equals(""))
        {
            status = " ";
        } 
        else if (status == "wrong" ){
            status = "Something went wrong please try again!";
            request.getSession().removeAttribute("status");
        }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Login-Clothes 4 Men</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<!--js-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

    </head>
    
        <body>
            <div class="container  d-flex justify-content-center ">
                <form class="col-md-6 p-5 text-center" action="LoginServlet" method="post">
                    <img src="img/logo.png" alt="logo page" width="150px" height="150px"></img> 
                        <h1 class="h2 mb-3 fw-normal">Welcome</h1>
                            <div class="form-floating mb-2">
                                <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                                <label for="floatingPassword">Password</label>
                            </div>
                            <div class="checkbox mb-3">
                                <div class="mx-1" style="color:red" ><%= status %></div>
                            </div>
                        <button class="w-100 btn btn-dark me-2" type="Submit">Sign in</button>  
                        <a href="Register.jsp" class="w-100 btn btn-lg btn-primar">Create account</a>
                        <p class="mt-5 mb-3 text-body-secondary">©7051CEM - Web Applications and AI-2023</p>
                </form>
            </div>
</body>      
</html>

<%-- 
    Document   : Register
    Created on : Mar 30, 2023, 3:42:10 PM
    Author     : astroxjrk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create an account-Clothes 4 Men</title>
    </head>
    <body>
        <form action="RegisterServlet" method="post">
            <section class="h-100 bg-dark">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card card-registration my-4">
                                <div class="row g-0">
                                    <div class="col-xl-6 d-none d-xl-block">
                                        <img src="https://images.unsplash.com/photo-1559697242-07e90b48b9fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                             alt="Photo" class="img-fluid"
                                             style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card-body p-md-5 text-black">
                                            <h3 class="mb-5 text-uppercase">CREATE ACCOUNT</h3>
                               
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" name="firstName" id="firstName" class="form-control form-control-lg" />
                                                        <label class="form-label" for="form3Example1m">First name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" name="lastName" id="lastName" class="form-control form-control-lg" />
                                                        <label class="form-label" for="form3Example1n">Last name</label>
                                                    </div>
                                                </div>
                                            </div>           


                                            <div class="form-outline mb-4">
                                                <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="name@example.com"/>
                                                <label class="form-label" for="form3Example99">Email</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Password"/>
                                                <label class="form-label" for="form3Example97">Password</label>
                                            </div>
                                            
                             

                                            <div class="d-flex justify-content-end pt-3">
                                                <button type="button" class="btn btn-dark btn-lg ms-2">
                                                <a href="Login.jsp" class="btn btn-dark btn-lg ">Cancel</a>      
                                                </button>
                                                <button type="Submit" class="btn btn-dark btn-lg ms-2">Create account</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </body>
</html>

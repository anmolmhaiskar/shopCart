<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid">


            <div class="row mt-3">

                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        
                        <%@include file="component/message.jsp" %>
                        
                        <div class="card-body px-4">
                            <img src="img/signup.png"  style="max-width: 90px" class="rounded mx-auto d-block img-fluid" alt="SignUp">                        
                            <h3 class="text-center my-3"> Sign up here!!</h3>
                            <hr></hr>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                                </div>
                                <div class="form-group">
                                    <label for="password">User password</label>
                                    <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter PhoneNo.">
                                </div>
                                <div class="form-group">
                                    <label for="address">User address</label>
                                    <textarea style="height: 200px;" name="user_address" class="form-control" placeholder="Enter your address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type = "submit" class="btn btn-outline-success">Register</button>
                                    <button type = "reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>

            </div>


        </div>   
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class ="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    
                    <div class="card mt-5">
                        
                        <!--<div class="card-header">-->
                             <img src="img/login.png"  style="max-width: 90px" class="rounded mx-auto d-block img-fluid mt-4" alt="Login">
                            
                            
                        <!--</div>-->
                        
                        <div class="card-body">
                            <h3 class="text-center">Login</h3>
                            <hr></hr>
                            <%@include file="component/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2">If not registered click here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary bored-0">Submit</button>
                                    <button type="reset" class="btn btn-primary border-0">Reset</button>
                                </div>
                                
                            </form>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>

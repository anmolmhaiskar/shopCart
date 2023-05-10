<%@page import="com.anmol.shopcart.entities.User" %>
<%@page import="com.anmol.shopcart.entities.Category" %>
<%@page import="com.anmol.shopcart.dao.CategoryDao" %>
<%@page import="com.anmol.shopcart.helper.FactoryProvider" %>
<%@page import="java.util.List" %>
<%
    User adminUser = (User)session.getAttribute("current-user");
    if(adminUser == null){
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    }
    else if(adminUser.getUserType().equals("normal")){
        session.setAttribute("message", "You are not an admin user !! Please do not try to access this page.");
        response.sendRedirect("login.jsp");
        return;
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container admin mt-3">
            <div class="container-fluid">
                <%@include file="component/message.jsp" %>
            </div>
            <div class="row">
                <!--first row first box-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">

                            <div class="container">
                                <img src="img/users.png" style="max-width: 130px" class="img-fluid" alt="users_icon">
                            </div>
                            <h2>2345231</h2>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>

                <!--first row second box-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/categories.png" style="max-width: 130px" class="img-fluid" alt="users_icon">
                            </div>
                            <h2>23425</h2>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>

                <!--first row third box-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/products.png" style="max-width: 130px" class="img-fluid" alt="users_icon">
                            </div>
                            <h2>235</h2>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row text-center mt-3">
                <!--second row first box-->
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#categoryModal">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/add categories.png" style="max-width: 130px" class="img-fluid" alt="users_icon">
                            </div>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div>
                </div>

                <!--second row second box-->
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#productModal">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/add products.png" style="max-width: 130px" class="img-fluid" alt="users_icon">
                            </div>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--add category modal-->

        <div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            
                            <input type="hidden" name="operation" value="addCategory">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" />
                            </div>
                            <div class="form-group">
                                <textarea name="catDescription" style="height: 200px" class="form-control" placeholder="Enter category description" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn text-light custom-bg hoverbtn">Save Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end add category modal-->
        
        
        <!--add product modal-->

        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addProduct">
                            
                            <!--product name-->
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="productName" placeholder="Enter product name" />
                            </div>
                            
                            <!--product description-->
                            
                            <div class="form-group">
                                <textarea name="productDescription" style="height: 150px" class="form-control" placeholder="Enter product description" required></textarea>
                            </div>
                            
                            <!--product price-->
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="productPrice" placeholder="Enter product price" />
                            </div>
                            
                            <!--product discount-->
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="productDiscount" placeholder="Enter product discount" />
                            </div>
                            
                            <!--product quantity-->
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="productQuantity" placeholder="Enter product quantity" />
                            </div>

                            
                            <!--product category-->
                            <% 
                                CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> catList = catDao.getCategories();
                            %>
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    
                                    <%
                                        for(Category cat : catList){
                                    %>
                                    <option value="<%= cat.getCategoryId() %>" > <%= cat.getCategoryTitle() %> </option>
                                    <% 
                                        }
                                    %>
                                </select>
                            </div>
                            
                            
                            <!--product pic-->
                            
                            <div class="form-group">
                                <label for="prodPic">Select picture of product</label>
                                <br>
                                <input type="file" id="prodPic" name="prodPic" required />
                            </div>
                            <div class="container text-center">
                                <button class="btn text-light custom-bg hoverbtn">Save Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end add product modal-->
    </body>
</html>

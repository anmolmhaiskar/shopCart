<%@page import="com.anmol.shopcart.helper.FactoryProvider" %>
<%@page import="com.anmol.shopcart.dao.ProductDao" %>
<%@page import="com.anmol.shopcart.dao.CategoryDao" %>
<%@page import="com.anmol.shopcart.entities.Category" %>
<%@page import="com.anmol.shopcart.entities.Product" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopCart</title>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="row">

            <%
            ProductDao prodDao = new ProductDao(FactoryProvider.getFactory());
            List<Product> prodList = prodDao.getProducts();
            
            CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> catList = catDao.getCategories();
            %>
            <div class="col-md-2">
                <%
                    for(Category cat: catList){
                        out.println(cat.getCategoryTitle() + "<br>");
                    }
                 %>
            </div>
            <div class="col-md-8">
                <%
                    for(Product prod: prodList){
                        out.println(prod.getProductName() + "<br>");
                    }
                 %>
            </div>
        </div>

    </body>
</html>

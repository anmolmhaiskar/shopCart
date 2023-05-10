<%@page import="com.anmol.shopcart.entities.User" %>
<%
    User normalUser = (User)session.getAttribute("current-user");
    if(normalUser == null){
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    }
//    else if(normalUser.getUserType().equals("normal")){
//        session.setAttribute("message", "You are not an admin user !! Please do not try to access this page.");
//        response.sendRedirect("login.jsp");
//        return;
//    }
    
 %><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User Page</title>
    <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <h1>This is normal panel page!</h1>
    </body>
</html>

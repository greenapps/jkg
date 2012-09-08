<%-- 
    Document   : admaction
    Created on : Apr 24, 2012, 1:01:30 PM
    Author     : Anshujkumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String sales = request.getParameter("sales");
        String service = request.getParameter("service");
        String admin = request.getParameter("admin");
        String inventory = request.getParameter("inventory");
        String crm = request.getParameter("crm");
        %>
    </body>
</html>

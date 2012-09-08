<%-- 
    Document   : appmenu.jsp
    Created on : Apr 24, 2012, 12:32:36 PM
    Author     : Anshujkumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="./css/effects.css">
    </head>
    <body>
        <h1></h1>
        <%
            String role = request.getParameter("roles");
            System.out.println("Value OF ROLE ID" + request.getParameter("roles"));
            if (role.equals("adm")) {

        %>
        <form id="MainContainer" method="post" action="admaction.jsp">
            Hello Administrator
            <table class="table" align="center">
                <tr>
                    <td>
                        <input type="radio" name="sales" value="sales">
                    </td>
                    <td>
                        SALES
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="service" value="service">
                    </td>
                    <td>
                        SERVICE
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="admin" value="admin">
                    </td>
                    <td>
                        ADMIN
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="inventory" value="inventory">
                    </td>
                    <td>
                        INVENTORY
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="crm" value="crm">
                    </td>
                    <td>
                        CRM
                    </td>
                </tr>
            </table>
            <input class="button" type="submit" value="submit">
        </form>

        <%        } else if (role.equals("smng")) {
        %>
        <form id="MainContainer" method="post" action="smngction.jsp">
            Hello Sales Manager
            <table class="radiotable" align="left">
                <tr>
                    <td align="right">
                        <input type="radio" name="sales" value="sales">
                    </td>
                    <td align="left">
                        SALES
                    </td>
                </tr>

            </table>
            <table class="table">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="left">
                        <input class="button" type="submit" value="submit">
                    </td>
                </tr>
            </table>
        </form>
        <%}%>
    </body>
</html>

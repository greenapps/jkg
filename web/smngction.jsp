<%-- 
    Document   : smngction
    Created on : Apr 24, 2012, 1:01:09 PM
    Author     : Anshujkumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="./css/effects.css">
        <jsp:include page="home.jsp"/>
    </head>
    <body>

        <%
        String sales = request.getParameter("sales");
        System.out.println("in snmg"+sales);
        //if(sales != null){
        %>
        <form>
            <table>
                <tr>
                    <td>
                        <form method="post" action="custId.jsp">
                            <input type="submit" value="Customer ID">
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="FinalQuot.jsp">Quotation</a>
                    </td>
                </tr>
            </table>
        </form>
        <%//}%>
    </body>
</html>

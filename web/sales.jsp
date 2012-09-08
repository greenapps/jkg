<%-- 
    Document   : sales
    Created on : May 20, 2012, 4:25:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="daoservice.extendedDao, com.allin1.beans.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
    <%
String menuId = request.getParameter("menuId");
String role = (String) session.getAttribute("role");
System.out.println("Testing in SUB MENU "+menuId+"ROLES"+role);
extendedDao extDao = new extendedDao();
Vector subMenuVect = new Vector();
subMenuVect = extDao.getSubMenu(menuId,role);
    %>
    <head>
        <meta charset="UTF-8" />
        <title>SUB MENU</title>

        <meta name="description" content="" />

        <jsp:include page="home.jsp"/>

        <script type="text/javascript" src="http://azadcreative.com/wp-content/themes/Instinct/javascript/jquery.js"></script>

        <script type="text/javascript">



        </script>

    </head>
    <body>

        <div class="animatedtabs">
            <ul>
                <% if(subMenuVect.size()>0){
                for(int i=0;i<subMenuVect.size();i++){
                    generalBean gen = (generalBean) subMenuVect.get(i);
                    System.out.println("IN HOME "+gen.getSubmenuId());
                %>

                <li><a href="<%=gen.getSubMenuHref()%>?menuId=<%=menuId%>" title="Home"><span><%=gen.getSubMenuName()%></span></a></li>

                <%}
    }%>
            </ul>
        </div>

    </body>
</html>

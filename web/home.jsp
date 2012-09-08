
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.awt.*, java.awt.event.* , java.sql.* , com.allin1.beans.*"%>
<%@page import="daoservice.extendedDao, com.allin1.beans.*"%>
<!DOCTYPE html>
<html>
    <head><title>
            SUB MENU
        </title>

    </head>
    <body>
        <h1></h1>
        <a class="hrefss" href ="login.jsp">Log Out</a>

        <%
            if (request.getParameter("menuId") != null && !request.getParameter("menuId").equals("")) {
                String menuId = request.getParameter("menuId");
                session.removeAttribute("menuId");
                session.setAttribute("menuId", menuId);
                String role = (String) session.getAttribute("role");
                System.out.println("Testing in SUB MENU " + menuId + "ROLES" + role);
                extendedDao extDao = new extendedDao();
                Vector subMenuVect = new Vector();
                subMenuVect = extDao.getSubMenu(menuId, role);
        %>




        <div class="animatedtabs">
            <ul>
                <% if (subMenuVect.size() > 0) {
                        for (int i = 0; i < subMenuVect.size(); i++) {
                            generalBean gen = (generalBean) subMenuVect.get(i);
                            System.out.println("IN HOME " + gen.getSubmenuId());
                %>

                <li><a href="<%=gen.getSubMenuHref()%>" title="Home"><span><%=gen.getSubMenuName()%></span></a></li>

                <%}
                    }%>
            </ul>
        </div>
    </body>
    <%
    } else if (session.getAttribute("menuId") != null && !session.getAttribute("menuId").equals("")) {
        String menuId = (String) session.getAttribute("menuId");
        String role = (String) session.getAttribute("role");
        System.out.println("Testing in SUB MENU " + menuId + "ROLES" + role);
        extendedDao extDao = new extendedDao();
        Vector subMenuVect = new Vector();
        subMenuVect = extDao.getSubMenu(menuId, role);
    %>
    <div class="animatedtabs">
        <ul>
            <% if (subMenuVect.size() > 0) {
                    for (int i = 0; i < subMenuVect.size(); i++) {
                        generalBean gen = (generalBean) subMenuVect.get(i);
                        System.out.println("IN HOME " + gen.getSubmenuId());
            %>

            <li><a href="<%=gen.getSubMenuHref()%>" title="Home"><span><%=gen.getSubMenuName()%></span></a></li>

            <%}
                }%>
        </ul>
    </div>
    <%
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>
        <link rel="stylesheet" type="text/css" href="./css/effects.css">
    </head>

    <SCRIPT>
        function check(){
            //alert('hiii');
        }
    </SCRIPT>
    <%
        session.getAttribute("Usern");
        //print user name
        Vector menuAccess = (Vector) session.getAttribute("menuAccess");
        //System.out.println("ANUJ in HOME jsp");

    %>
    <body>

        <div class="navbox">
            <ul class="nav">

                <% if (menuAccess.size() > 0) {
                        for (int i = 0; i < menuAccess.size(); i++) {
                            generalBean gen = (generalBean) menuAccess.get(i);
                            System.out.println("IN HOME " + gen.getMenuId());
                %>

                <li><a href="home.jsp?menuId=<%=gen.getMenuId()%>"><%=gen.getMenuName()%></a></li>

                <%}
                    }%>
            </ul>
        </div>
    </body>
</html>

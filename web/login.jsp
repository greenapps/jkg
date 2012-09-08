
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="com.allin1.beans.*"%>

<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="./css/effects.css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/Ajax.js"></script>

    </head>

    <%
        session.removeAttribute("Usern");
        session.removeAttribute("ID");
        session.removeAttribute("menuAccess");
        String errorMsg = request.getParameter("errorMsg");
        if (errorMsg == null) {
            errorMsg = "";

        }
        Vector rolesVec = (Vector) session.getAttribute("rolesVec");
        //System.out.println("ANUJ in jsp");

    %>
    <SCRIPT>
        function checkRoles()
        {
            //alert('hii');
            if((eval("document.master.user").value!=null && eval("document.master.pass").value!=null)){
                //alert(' test here '+eval("document.master.user").value+'val'+eval("document.master.pass").value);
                var url='getData.jsp?uname='+eval("document.master.user").value+'&pass='+eval("document.master.pass").value;
                reqInit=2;
                getData(url,setRoleValues);
            }
        }
        function getRoles(url)
        {
            //alert(url+eval("document.master.name"+rownum));
            // alert(' test here ');
            if((eval("document.master.pass").value!=null && eval("document.master.user").value!=null)){
                //alert(' test here ');
                var url='getData.jsp?uname='+eval("document.master.user").value+'&pass='+eval("document.master.pass").value;
                reqInit=2;
                getData(url,setRoleValues);
            }
        }
        function setRoleValues(output){
            reqInit=0;
            var parent = output.getElementsByTagName("parent")[0];
            if(parent==null || parent==undefined || parent.getElementsByTagName("child")==undefined || parent.getElementsByTagName("child")==null){//|| parent.getElementsByTagName("child").length <3
                //alert("in null");
            }
            else if(parent != null && parent != undefined && parent.getElementsByTagName("child")!=undefined ){ //&& parent.getElementsByTagName("child").length != 3
                var child = parent.getElementsByTagName("child");
                for(j=0; j< child.length;j++){
                    //alert('checking inside');
                    //alert(child[j].getElementsByTagName('roleName')[0].firstChild.nodeValue);
                    var opt = document.createElement("option");

                    // Add an Option object to Drop Down/List Box
                    document.getElementById("role").options.add(opt);
                    //alert(child[0].getElementsByTagName('roleName')[j].firstChild.nodeValue);
                    // Assign text and value to Option object
                    opt.text = child[j].getElementsByTagName('roleName')[0].firstChild.nodeValue;
                    opt.value = child[j].getElementsByTagName('roleId')[0].firstChild.nodeValue;
                    // eval("document.master.role").value=child[0].getElementsByTagName('ContactDetails')[0].firstChild.nodeValue;
                }
            }
        }
    </SCRIPT>
    <body onload="checkRoles();">
        <h1></h1>
        <form id="MainContainer" autocomplete="off" name="master" method="post" action ="CheckLoginServlet">

            <table class="table" align="center">
                <tr>
                    <td>
                        <font color="red">
                        <%out.println(errorMsg);%>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="1">
                        <label>UserName:</label> 
                    </td>
                    <td align="left">
                        <input type="text" class="textBox" size="25" name="user" id="user" onchange="getRoles(this.value);"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="1">
                        <label>Password: </label>

                    </td>
                    <td align="left">
                        <input type="password" class="textBox" size="25" name="pass" id="pass" onchange="getRoles(this.value);"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="1"> <label>Roles:</label></td>
                    <td align="left"><select class="selectBox" size="1" name="role" id="role">
                            <option value="">-----------------------</option>
                        </select></td>
                </tr>

                <tr>

                    <td align="right" width="30%"><br><br></td>
                    <td align="left"><br>
                        <input class="button" type="submit" name="login" id="login" value="login" />

                    </td>
                </tr>

            </table>
            <%
                String username = request.getParameter("user");
                session.setAttribute("UserN", username);
            %>
        </form>
        <%--<form  method="post" action="appmenu.jsp">

            <table class="table" align="center">
                <tr>
                    <td align="right" colspan="1">
                <label>Roles:</label>
            </td>
            <td align="left">

                <select name="roles" >
                <option value=" " selected="selected">----------------------</option>
                    <% if(rolesVec.size()>0)
                    for(int i=0;i<rolesVec.size();i++){
                        RolesBean bean = (RolesBean) rolesVec.get(i);

                    %>
                <option value="<%=bean.getRoleId()%>"><%=bean.getRoleName()%></option>
                <% } %>
                </select>
              </td>
            </tr>
            <tr><td><br></td></tr>
            <tr>
           <td align="right" width="30%"></td>
            <td align="left">
                    <input class="button" type="submit" value="submit">

                </td>
            </tr>
           </table>


<div class="navbox">
<ul class="nav">
<li><a href="#">XHTML</a></li>
<li><a href="#">HTML5</a></li>
<li><a href="#">CSS</a></li>
<li><a href="#">jQuery</a></li>
<li><a href="#">Ajax</a></li>
<li><a href="#">PHP</a></li>
</ul>
</div>

<div class="navbox">
<ul class="nav">
<li><a href="#">XHTML</a></li>
<li><a href="#">HTML5</a></li>
<li><a href="#">CSS</a></li>
</ul>
</div>
            </form>
        </table>--%>
    </body>
</html>

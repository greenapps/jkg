/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.allin1.login;

import java.sql.*;
import com.allin1.beans.*;
import configuration.DBConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anshujkumar
 */
public class CheckLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            /*
//             * TODO output your page here. You may use following sample code.
//             */
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CheckLoginServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CheckLoginServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        } finally {            
//            out.close();
//        }
//    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("ANUJ CHECK");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String dynawhichdb = "com.mysql.jdbc.Driver";
        String url = DBConfig.dbUrl;
        String userid = DBConfig.dbUserName;
        String password = DBConfig.dbPassword;
        Connection conn = null;
        System.out.println("ANUJ CHECK1");
        try {
            System.out.println("ANUJ CHECK before ");
            Class.forName(dynawhichdb);
            System.out.println("ANUJ CHECK2");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                Statement st = conn.createStatement();
                String username = request.getParameter("user");        //it will take id or name
                String pwd = request.getParameter("pass");        //it will take id or name
                ResultSet rs = st.executeQuery("select * from t_login_t where UserName='" + username + "'and password='" + pwd + "'");
                System.out.println(username + pwd);
                System.out.println("ANUJ CHECKQ" + rs);
                String roles = request.getParameter("role");
                System.out.println("ROLES IS " + roles);
                Vector menuAccess = new Vector();
                if (rs.next()) {
                    System.out.println("ANUJ inside rs.next");
                    if (rs.getString("UserName").equals(username) && rs.getString("password").equals(pwd)) {
                        System.out.println("ANUJ inside checking if" + rs.getString("UserName"));
                        System.out.println("NOW WAT" + roles);
                        ResultSet rsRoles = st.executeQuery("select menuName,href,appId from t_appaccess_t where roleId ='" + roles + "' ");
                        while (rsRoles.next()) {
                            generalBean gen = new generalBean();
                            System.out.println("ANUJ MAIN MENUs" + rsRoles.getString(1) + "MENU IDS" + rsRoles.getString(3));
                            gen.setMenuName(rsRoles.getString(1));
                            gen.setMenuRef(rsRoles.getString(2));
                            gen.setMenuId(rsRoles.getString(3));
                            menuAccess.add(gen);
                        }
                        String id = "";
                        ResultSet rsID = st.executeQuery("select max(QuotationId)+1 from sal_quotation_t ");
                        while (rsID.next()) {
                            System.out.println("ANUJ Cuuuuuu" + rsID.getString(1));
                            id = rsID.getString(1);
                        }
                        HttpSession session = request.getSession();
                        session.setAttribute("Usern", username);
                        session.setAttribute("role", roles);
                        session.setAttribute("ID", id);
                        session.setAttribute("menuAccess", menuAccess);
                        response.sendRedirect("home.jsp");

                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("Usern", username);
                        response.sendRedirect("home.jsp");
                    }
                } else {
                    System.out.println("ANUJ CHECKe");
                    response.sendRedirect("login.jsp?errmsg= Invalid username or password");
                }
            }
            conn.close();  // problem may be faced
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     * /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

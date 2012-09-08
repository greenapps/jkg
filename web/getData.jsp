<%-- 
    Document   : getData
    Created on : Apr 24, 2012, 10:24:14 PM
    Author     : Anshujkumar
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.allin1.beans.generalBean"%>
<%@page import="java.util.Properties"%>
<%@page import="com.allin1.beans.ArticleInBean"%>
<%@page import="com.allin1.beans.RolesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.StringFormat"%>
<%@page import="daoservice.extendedDao"%>
<%@ page language="java" %>
<%
StringBuffer xml = new StringBuffer();
extendedDao extendDAO = new extendedDao();
System.out.println("IN GET DATA .jsp");
if (request.getParameter("articleDescQty") != null) {
           System.out.println("Testing in get data"+request.getParameter("articleDescQty").trim().replaceAll("'","''"));
           ArrayList articleDetail = extendDAO.getArticleDescQty(request.getParameter("articleDescQty").trim().replaceAll("'","''"));
           System.out.println("Testing in get data"+articleDetail.size());
           if(articleDetail.size() >0){
                xml.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
                xml.append("<parent>\n");
                for(int i=0;i<articleDetail.size();i++){
                  ArticleInBean articleBean = (ArticleInBean)articleDetail.get(i);
                  
                  xml.append("<child>\n");
                              xml.append("<desc>");
                              xml.append(StringFormat.replaceSpecialCharacter(articleBean.getArticleDesc()));
                              xml.append("</desc>\n");
                              xml.append("<qty>");
                              xml.append("0");
                              xml.append("</qty>\n");
                  xml.append("</child>\n");
                  
                  }
                System.out.println("HELLLOOO TESTING !!!!!!"+xml);
                xml.append("</parent>\n");
                
                }
}else if (request.getParameter("articleId") != null) {
         ArrayList articleDetail = extendDAO.getArticleInfo(request.getParameter("articleId").trim());
         System.out.println("NOW IN GET DATA ACTUALLY"+articleDetail.size());
           if(articleDetail.size() >0){
                xml.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
                xml.append("<parent>\n");
                for(int i=0;i<articleDetail.size();i++){
                  ArticleInBean articleBean = (ArticleInBean)articleDetail.get(i);
                  xml.append("<child>\n");
                              xml.append("<id>");
                              xml.append(StringFormat.replaceSpecialCharacter(articleBean.getArticleId()));
                              xml.append("</id>\n");
                              xml.append("<desc>");
                              xml.append(StringFormat.replaceSpecialCharacter(articleBean.getArticleDesc()));
                              xml.append("</desc>\n");
                              xml.append("<techDesc>");
                              xml.append(StringFormat.replaceSpecialCharacter(articleBean.getArticleTechDesc()));
                              xml.append("</techDesc>\n");
                              xml.append("<price>");
                              xml.append(articleBean.getPrice());
                              xml.append("</price>\n");
                              xml.append("<currency>");
                              xml.append(articleBean.getCurrency());
                              xml.append("</currency>\n");
                              xml.append("<quantity>");
                              xml.append("0");
                              xml.append("</quantity>");
                              xml.append("<discount>");
                              xml.append("0.00");
                              xml.append("</discount>\n");
                              xml.append("<minprice>");
                              xml.append("0");
                              xml.append("</minprice>\n");
                              xml.append("<retminprice>");
                              xml.append("0");
                              xml.append("</retminprice>\n");
                              xml.append("<offerarticle>");
                              xml.append("0");
                              xml.append("</offerarticle>\n");
                              xml.append("<offerqty>");
                              xml.append("0");
                              xml.append("</offerqty>\n");
                              xml.append("<invalidPrice>");
                              xml.append("0");
                              xml.append("</invalidPrice>\n");
                              xml.append("<articletype>");
                              xml.append("0");
                              xml.append("</articletype>\n");
                              xml.append("<taxamt>");
                              xml.append("0");
                              xml.append("</taxamt>\n");
                              //Following Part added by Manoj For Approve/Reject/Edit Invoice.
                              //prop=generalDAO.getPrcCostForArticle(String.valueOf(wdao.getArticleID(StringFormat.replaceSpecialCharacter(articleBean.getArticleId()))),(String)session.getAttribute("outlet_id"));
                              xml.append("<avgcost>");
                              xml.append("0");
                              xml.append("</avgcost>\n");
                              xml.append("<rmp>");
                              xml.append("0");
                              xml.append("</rmp>\n");
                              xml.append("<rgp>");
                              xml.append("0");
                              xml.append("</rgp>\n");
                              xml.append("<wh1>");
                              xml.append("0");
                              xml.append("</wh1>\n");
                              xml.append("<wh2>");
                              xml.append("0");
                              xml.append("</wh2>\n");
                   xml.append("</child>\n");
                  }
                  
                xml.append("</parent>\n");
                //System.out.println("XML FOR NEW ARTICLE CODE IS"+xml);
                }
}else if (request.getParameter("name") != null) {
           System.out.println("Testing in get data for CONTACT DETAILS"+request.getParameter("name").trim().replaceAll("'","''"));
           ArrayList contactDetail = extendDAO.getcontactDeatils(request.getParameter("name").trim().replaceAll("'","''"));
           System.out.println("Testing in get data"+contactDetail.size());
           if(contactDetail.size() >0){
                xml.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
                xml.append("<parent>\n");
                for(int i=0;i<contactDetail.size();i++){
                  generalBean general = (generalBean)contactDetail.get(i);
                  
                  xml.append("<child>\n");
                              xml.append("<ContactDetails>");
                              xml.append(StringFormat.replaceSpecialCharacter(general.getContactAddress()));
                              xml.append("</ContactDetails>\n");
                  xml.append("</child>\n");
                  
                  }
                xml.append("</parent>\n");
                
                }
}else if (request.getParameter("countryName") != null) {
           System.out.println("Testing in get data for country DETAILS"+request.getParameter("countryName").trim().replaceAll("'","''"));
           ArrayList countryDetail = extendDAO.getcountryDeatils(request.getParameter("countryName").trim().replaceAll("'","''"));
           System.out.println("Testing in get data"+countryDetail.size());
           if(countryDetail.size() >0){
                xml.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
                xml.append("<parent>\n");
                for(int i=0;i<countryDetail.size();i++){
                  generalBean general = (generalBean)countryDetail.get(i);
                  System.out.println("Testing in get data company name inside for loop");
                  xml.append("<child>\n");
                              xml.append("<countryDetail>");
                              xml.append(StringFormat.replaceSpecialCharacter(general.getCountryAdd()));
                              xml.append("</countryDetail>\n");
                              
                  xml.append("</child>\n");
                  
                  }
                xml.append("</parent>\n");
                
                }
           System.out.println("JUST TO CHECK VALUE OF XML IS"+xml);
}else if (request.getParameter("options") != null) {
           System.out.println("Testing in get data for option DETAILS"+request.getParameter("options").trim().replaceAll("'","''"));
           Vector optionsVal= new Vector();
           Hashtable optionsDetail = extendDAO.getoptionDeatils(request.getParameter("options").trim());
           System.out.println("Testing in get data"+optionsDetail.size());
           Enumeration enumApprov = optionsDetail.keys();
           if(optionsDetail.size() >0){
               
               xml.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
                xml.append("<parent>\n");
                 while (enumApprov.hasMoreElements()) {
                     String keyName = (String) enumApprov.nextElement();
                     System.out.println(">>>>>>  "+keyName);
                     optionsVal =(Vector) optionsDetail.get(keyName);
                     System.out.println("NOW IN GETGETGETGET DATA SIZE ---->>>"+optionsVal.size());
                     xml.append("<ArticleCode>\n");
                     xml.append("<ArticleId>\n");
                     xml.append(StringFormat.replaceSpecialCharacter(keyName));
                     xml.append("</ArticleId>\n");
                  for(int i=0;i<optionsVal.size();i++){
                      ArticleInBean options = new ArticleInBean();
                      options = (ArticleInBean) optionsVal.get(i);
                     xml.append("<child>\n");
                              xml.append("<ItemCode>");
                              xml.append(StringFormat.replaceSpecialCharacter(options.getArticleOptionItem()));
                              xml.append("</ItemCode>\n");
                              xml.append("<Desc>");
                              xml.append(StringFormat.replaceSpecialCharacter(options.getArticleOptionDesc()));
                              xml.append("</Desc>\n");
                              xml.append("<Price>");
                              xml.append(StringFormat.replaceSpecialCharacter(options.getArticleOptionPrice()));
                              xml.append("</Price>\n");
                              xml.append("<Currency>");
                              xml.append(StringFormat.replaceSpecialCharacter(options.getArticleOptionCurr()));
                              xml.append("</Currency>\n");
                              
                  xml.append("</child>\n");
                                   }
                     System.out.println("ARTICLE ADDED IN NORMAL optionsDetail TABLE >>>>>>>>>>>>  "+keyName);
                     xml.append("</ArticleCode>\n");
                     }
                xml.append("</parent>\n");
                //System.out.println("HELLO XML"+xml);
                  }
}else if (request.getParameter("uname") != null && request.getParameter("pass") != null) {
           System.out.println("Testing in get data for LOGIN DETAILS"+request.getParameter("uname").trim().replaceAll("'","''"));
           System.out.println("Testing in get data for LOGIN DETAILS"+request.getParameter("pass").trim().replaceAll("'","''"));
           Vector vecRoles = extendDAO.checlLogin(request.getParameter("uname").trim().replaceAll("'","''"),request.getParameter("pass").trim().replaceAll("'","''"));
           System.out.println("Testing in get data"+vecRoles.size());
           if(vecRoles.size() >0){
                xml.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
                xml.append("<parent>\n");
                for(int i=0;i<vecRoles.size();i++){
                  RolesBean rbean = (RolesBean)vecRoles.get(i);
                  System.out.println("Testing in get data FOE CHILD "+rbean.getRoleName());
                  xml.append("<child>\n");
                              xml.append("<roleId>");
                              xml.append(StringFormat.replaceSpecialCharacter(rbean.getRoleId()));
                              xml.append("</roleId>\n");
                               xml.append("<roleName>");
                              xml.append(StringFormat.replaceSpecialCharacter(rbean.getRoleName()));
                              xml.append("</roleName>\n");
                  xml.append("</child>\n");

                  }
                xml.append("</parent>\n");

                }
}
response.getWriter().write(xml.toString());
response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-cache");

%>


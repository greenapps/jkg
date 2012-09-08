<%-- 
    Document   : QuotationPdf
    Created on : May 9, 2012, 10:13:36 PM
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

        <%--
            Document   : newPDF
            Created on : Sep 22, 2011, 11:54:49 AM
            Author     : mann
        --%>

        <%@page language="Java" import="java.io.*,java.util.*,common.*,daoservice.*"%>
        <%@ page import="reports.*,java.io.FileWriter" %>
        <%@page import="com.allin1.beans.generalBean"%>
        <%@page import="com.allin1.beans.QuotationDetailsBean"%>
        <%@page import="com.allin1.beans.ArticleInBean"%>

        <%
            reports.ReportBase rep = new ReportBase();
            try {
                System.out.println("Hello Rahul on this new page");
                System.out.println("WE ARE IN PDF VIEW -->" + request.getParameter("VAL"));
                String val = request.getParameter("VAL");
                rep.initReport("QuotPdf", request, response);
                FileWriter output = rep.getFileWriter();
                String contextpath = request.getContextPath();
                Vector contactDetails = (Vector) session.getAttribute("contactDetails");
                Vector otherDetails = (Vector) session.getAttribute("otherDetails");
                Hashtable hashInvoiceDetails = (Hashtable) session.getAttribute("hashInvoiceDetails");
                Vector articleDesc = (Vector) session.getAttribute("hashArticleDesc");
                Vector articleSpec = (Vector) session.getAttribute("hashArticleSpec");
                Hashtable optionDetails = (Hashtable) session.getAttribute("optionDetails");
                Vector companyDetails = (Vector) session.getAttribute("companyDetails");
                Vector amtDetails = (Vector) session.getAttribute("amtDetails");
                int blockedInventoryCount = 0;
                double totalCreditNoteAmt = 0;
                String cedulaNo = "";
                String invoice_id = "";
                String outlet_id = "";
                String condition = "";
                String showPayment = "";
                Vector blockedInventory = null;
                Vector paymentBreakUp = null;
                Vector creditNoteVector = null;
                Properties prop = new Properties();
                Properties proptwo = new Properties();
                Properties propone = new Properties();
                Properties propthree = new Properties();
                Properties proptax = new Properties();


                Vector vecone = null;
                //String invoiceNo = request.getParameter("invoiceId") == null ? "" : request.getParameter("invoiceId");

                output.write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
                output.write("<fo:root xmlns:fo=\"http://www.w3.org/1999/XSL/Format\">\n");
                output.write("<fo:layout-master-set>\n");
                output.write("		<fo:simple-page-master master-name=\"first\" margin-right=\"1.0cm\" margin-left=\"1.0cm\" margin-bottom=\"1.0cm\" margin-top=\"1.0cm\" page-width=\"20.32cm\" page-height=\"19cm\" >\n");
                output.write("			<fo:region-before extent=\"0.47625cm\"/>\n");
                output.write("			<fo:region-body margin=\"0.5cm\" />\n");
                output.write("			<fo:region-after extent=\"0.5cm\"/>\n");
                output.write("			<fo:region-start extent=\"0.5cm\"/>\n");
                output.write("			<fo:region-end extent=\"0.47625cm\"/>\n");
                output.write("		</fo:simple-page-master>\n");
                output.write("</fo:layout-master-set>\n");
                output.write("<fo:page-sequence master-reference=\"first\" master-name=\"first\">\n");
                rep.writeHeader("");
                System.out.println("calling method 3");
                System.out.println("calling method 4");
                rep.writeFooter(false, false, "");
                System.out.println("calling method 5");
                generalBean general = (generalBean) otherDetails.get(0);
                output.write("<fo:flow flow-name=\"xsl-region-body\">");
                output.write("<fo:block  break-before=\"page\">");
                if (val.equals("Y")) {
                    output.write("<fo:external-graphic src=\"E:/anuj/jkg/web/css/images/header.jpg\"/>");
                }
                output.write("<fo:table table-layout=\"fixed\" space-before=\"0pt\" margin-right=\"9.75pt\" margin-left=\"14.3pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:table-column column-width=\"250pt\"/>");
                output.write("<fo:table-column column-width=\"180pt\"/>");
                output.write("<fo:table-column column-width=\"150pt\"/>");
                output.write("<fo:table-body>");


                output.write("<fo:table-row height=\"25.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                output.write("<fo:table-cell  border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"left\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Quotation No: </fo:inline>");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"normal\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(general.getQuotId() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");


                output.write("<fo:table-cell  border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"end\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Date:  </fo:inline>");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"normal\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(general.getDate() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                generalBean gBeanCN = (generalBean) contactDetails.get(0);
                output.write("<fo:table-cell  border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#FFFFFF #FFFFFF #FFFFFF #FFFFFF\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"2.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#FFFFFF #FFFFFF #FFFFFF #FFFFFF\" padding=\"0.0pt 0.0pt 0.0pt 0.0pt\">");
                output.write("<fo:block text-align=\"left\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("  </fo:inline>");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"normal\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(" " + gBeanCN.getContactName() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                //for(int i=0;i<contactDetails.size();i++){
                generalBean geBean = (generalBean) contactDetails.get(0);
                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell  border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#FFFFFF #FFFFFF #FFFFFF #FFFFFF\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"2.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#FFFFFF #FFFFFF #FFFFFF #FFFFFF\" padding=\"0.0pt 0.0pt 0.0pt 0.0pt\">");
                output.write("<fo:block text-align=\"left\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("  </fo:inline>");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"normal\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(" " + geBean.getContactAddress().replaceAll("<AnujTestingJKG>", "\n") + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");
                // }
                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell  border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#FFFFFF #FFFFFF #FFFFFF #FFFFFF\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"2.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#FFFFFF #FFFFFF #FFFFFF #FFFFFF\" padding=\"2.0pt 2.0pt 2.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"left\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(" Subject:  </fo:inline>");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"normal\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(general.getSub() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");


                /*                        output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                 output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                 output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                 output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                 output.write("Net Amount</fo:inline>");
                 output.write("</fo:block>");
                 output.write("</fo:block>");
                 output.write("</fo:table-cell>");*/
                //output.write("</fo:table-row>");
                output.write("</fo:table-body>");
                output.write("</fo:table>");

                output.write("<fo:table table-layout=\"fixed\" space-before=\"20pt\" margin-right=\"9.75pt\" margin-left=\"14.3pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:table-column column-width=\"160pt\"/>");
                output.write("<fo:table-column column-width=\"250pt\"/>");
                output.write("<fo:table-column column-width=\"30pt\"/>");
                output.write("<fo:table-column column-width=\"30pt\"/>");
                output.write("<fo:table-column column-width=\"30pt\"/>");
                output.write("<fo:table-body>");
                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Article Code</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Description</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Qty</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Currency</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Unit Price</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");
                Enumeration enumchange = hashInvoiceDetails.keys();
                while (enumchange.hasMoreElements()) {
                    //System.out.println(" block III in save ");
                    String keyName = (String) enumchange.nextElement();
                    QuotationDetailsBean idb = (QuotationDetailsBean) hashInvoiceDetails.get(keyName);


                    output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"0pt 0pt 0.0pt 0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write(idb.getArticleId() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"9.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");

                    output.write(idb.getArticle_desc() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    //output.write(wdao.getArticleTechDesc("",prop.getProperty("article_desc"))+"</fo:inline>" );
                    output.write(idb.getArticleQty() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");
                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write(idb.getArticleCurrency() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");
                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write(idb.getArticlePrice() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");


                    output.write("</fo:table-row>");
                    output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"9.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");

                    output.write(idb.getArticleDesc().replaceAll("<AnujTestingJKG>", "\n") + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");


                    output.write("</fo:table-row>");

                }



                output.write("</fo:table-body>");
                output.write("</fo:table>");


                generalBean amtgen = (generalBean) amtDetails.get(0);
                output.write("<fo:table table-layout=\"fixed\" space-before=\"40pt\" margin-right=\"9.75pt\" margin-left=\"14.3pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:table-column column-width=\"400pt\"/>");
                output.write("<fo:table-column column-width=\"100pt\"/>");
                output.write("<fo:table-body>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Total Price:</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(amtgen.getTotPrice() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Discount:</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(amtgen.getDiscount() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Special Discount:</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(amtgen.getSpecialDisc() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Add Estimated Handling, local transportation, SEA/AIR Port charges:</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(amtgen.getPortCharges() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Total FOB</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(amtgen.getTotFOB() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                if (amtgen.getShipCharges() != null && !amtgen.getShipCharges().equals("") && !amtgen.getShipCharges().equals("")) {
                    output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("Add Estimated Handling, local transportation, SEA Freight charges</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");
                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write(amtgen.getShipCharges() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");
                    output.write("</fo:table-row>");
                }

                if (amtgen.getAirCharges() != null && !amtgen.getAirCharges().equals("") && !amtgen.getAirCharges().equals("")) {
                    output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("Add Estimated Handling, local transportation, AIR Freight charges</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");
                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write(amtgen.getAirCharges() + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");
                    output.write("</fo:table-row>");
                }


                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Total Net Amt.</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(amtgen.getTotNetAmt() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");
                output.write("</fo:table-row>");

                output.write("</fo:table-body>");
                output.write("</fo:table>");


                Enumeration enumoptions = optionDetails.keys();
                Vector optionsVec = new Vector();
                while (enumoptions.hasMoreElements()) {
                    //System.out.println(" block III in save ");
                    String article_code = (String) enumoptions.nextElement();
                    //     System.out.println(" block 3 in save ");
                    //vecArticleList.add(keyName);
                    int i = 0;
                    optionsVec = (Vector) optionDetails.get(article_code);
                    output.write("<fo:table table-layout=\"fixed\" space-before=\"20pt\" margin-right=\"9.75pt\" margin-left=\"14.3pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:table-column column-width=\"150pt\"/>");
                    output.write("<fo:table-column column-width=\"150pt\"/>");
                    output.write("<fo:table-column column-width=\"150pt\"/>");
                    output.write("<fo:table-column column-width=\"50pt\"/>");
                    output.write("<fo:table-body>");

                    output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("Article Code</fo:inline>");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("    " + article_code + "</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("Item Code</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("Description</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");

                    output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                    output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                    output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                    output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                    output.write("Unit Price In USD</fo:inline>");
                    output.write("</fo:block>");
                    output.write("</fo:block>");
                    output.write("</fo:table-cell>");

                    output.write("</fo:table-row>");
                    for (int y = 0; y < optionsVec.size(); y++) {
                        ArticleInBean options = new ArticleInBean();
                        options = (ArticleInBean) optionsVec.get(y);


                        output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                        output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                        output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"0pt 0pt 0.0pt 0pt\">");
                        output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                        output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                        output.write("" + "</fo:inline>");
                        output.write("</fo:block>");
                        output.write("</fo:block>");
                        output.write("</fo:table-cell>");

                        output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                        output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"0pt 0pt 0.0pt 0pt\">");
                        output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                        output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                        output.write(options.getArticleOptionItem() + "</fo:inline>");
                        output.write("</fo:block>");
                        output.write("</fo:block>");
                        output.write("</fo:table-cell>");

                        output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                        output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                        output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                        output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                        //output.write(wdao.getArticleTechDesc("",prop.getProperty("article_desc"))+"</fo:inline>" );
                        output.write(options.getArticleOptionDesc() + "</fo:inline>");
                        output.write("</fo:block>");
                        output.write("</fo:block>");
                        output.write("</fo:table-cell>");

                        output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                        output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"2.0pt 2.0pt 0.0pt 2.0pt\">");
                        output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                        output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                        //output.write(wdao.getArticleTechDesc("",prop.getProperty("article_desc"))+"</fo:inline>" );
                        output.write(options.getArticleOptionPrice() + "</fo:inline>");
                        output.write("</fo:block>");
                        output.write("</fo:block>");
                        output.write("</fo:table-cell>");

                        output.write("</fo:table-row>");
                    }
                    output.write("</fo:table-body>");
                    output.write("</fo:table>");
                }
                generalBean gBeanName = (generalBean) companyDetails.get(0);
                output.write("<fo:table table-layout=\"fixed\" space-before=\"20pt\" margin-right=\"9.75pt\" margin-left=\"14.3pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:table-column column-width=\"250pt\"/>");
                output.write("<fo:table-column column-width=\"250pt\"/>");
                output.write("<fo:table-body>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");

                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"0pt 0pt 0.0pt 0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write("Company Name:" + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");

                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"0pt 0pt 0.0pt 0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(gBeanName.getCountryName() + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");

                output.write("</fo:table-row>");

                output.write("<fo:table-row height=\"15.7pt\" keep-with-next=\"auto\" keep-with-previous=\"auto\" keep-together=\"always\">");



                output.write("<fo:table-cell border-width=\"0.5pt 0.5pt 0.5pt 0.5pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\">");
                output.write("<fo:block space-before=\"0.0pt\" margin-right=\"0.0pt\" margin-left=\"0.0pt\" border-width=\"0.0pt 0.0pt 0.0pt 0.0pt\" border-style=\"solid solid solid solid\" border-color=\"#000000 #000000 #000000 #000000\" padding=\"0pt 0pt 0.0pt 0pt\">");
                output.write("<fo:block text-align=\"center\" font-size=\"10.0pt\">");
                output.write("<fo:inline white-space-collapse=\"false\"  font-weight=\"bold\" font-style=\"normal\" font-size=\"10.0pt\" font-family=\"Times New Roman\" color=\"#000000\">");
                output.write(gBeanName.getCountryAdd().replaceAll("<AnujTestingJKG>", "\n") + "</fo:inline>");
                output.write("</fo:block>");
                output.write("</fo:block>");
                output.write("</fo:table-cell>");

                output.write("</fo:table-row>");

                output.write("</fo:table-body>");
                output.write("</fo:table>");
                if (val.equals("Y")) {
                    output.write("<fo:external-graphic src=\"E:/anuj/jkg/web/css/images/sign.jpg\"/>");
                    output.write("<fo:external-graphic src=\"E:/anuj/jkg/web/css/images/footer.jpg\"/>");
                }
                output.write("</fo:block>");
                output.write("</fo:flow>");

            } catch (Exception ee) {

                System.out.println("PROBELM " + ee);
                ee.printStackTrace();
            }
            try {
                rep.generatePDF();

        %>


        <h1>BUILDING THE PDF -- done</h1>

        <%
            } catch (Exception ie) {
                System.out.println("PROBELM " + ie);
            }
        %>


    </body>
</html>
</body>
</html>

<%-- 
    Document   : QuotDOC
    Created on : May 19, 2012, 10:42:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.io.*,java.util.*"%>
<%@page import="com.allin1.beans.generalBean"%>
<%@page import="com.allin1.beans.QuotationDetailsBean"%>
<%@page import="com.allin1.beans.ArticleInBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="daoservice.extendedDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.docx4j.openpackaging.packages.WordprocessingMLPackage"%>
<%@page import="org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart"%>
<%@page import="org.docx4j.jaxb.Context"%>
<%@page import="org.docx4j.wml.ObjectFactory"%>
<%@page import="org.docx4j.openpackaging.parts.CustomXmlDataStoragePart"%>
<%@page import="org.docx4j.openpackaging.parts.CustomXmlDataStoragePropertiesPart"%>
<%@page import="org.docx4j.openpackaging.parts.Part"%>
<%@page import="org.docx4j.openpackaging.parts.PartName"%>
<%@page import="org.docx4j.openpackaging.parts.Parts"%>
<%@page import="org.docx4j.wml.STBrType"%>
<%@page import="org.docx4j.wml.*"%>
<%@page import="org.docx4j.XmlUtils"%>
<%@page import="org.docx4j.convert.out.flatOpcXml.FlatOpcXmlCreator"%>
<%@page import="org.docx4j.jaxb.NamespacePrefixMapperUtils"%>
<%@page import="org.docx4j.model.table.TblFactory"%>
<%@page import="org.docx4j.openpackaging.contenttype.ContentType"%>
<%@page import="org.docx4j.openpackaging.exceptions.Docx4JException"%>
<%@page import="org.docx4j.model.datastorage.BindingHandler"%>
<%@page import="java.math.BigInteger"%>
<%@page import="org.docx4j.openpackaging.parts.relationships.Namespaces"%>
<%@page import="javax.xml.bind.JAXBException"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body style="height:400px">

        <%
        String contextPath=request.getContextPath();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy-");
        java.util.Date date = new java.util.Date();
        extendedDao extDao = new extendedDao();
        String maxSeq = extDao.getSeqVale();
        String name = dateFormat.format(date)+"-"+maxSeq;
        System.out.println("ACTUAL SEQ  : " +name );
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires",0);
        //response.setContentType("application/vnd.ms-excel");
        response.setContentType("application/msword");
        response.setHeader("Content-Disposition","attachment; filename=\""+ name + "\"");
        System.out.println("TESTING");
        float tot_price = 0;
        Vector contactDetails = (Vector) session.getAttribute("contactDetails");
                                Vector otherDetails = (Vector) session.getAttribute("otherDetails");
                                Hashtable hashInvoiceDetails = (Hashtable) session.getAttribute("hashInvoiceDetails");
                                Hashtable optionDetails = (Hashtable) session.getAttribute("optionDetails");
                                Vector companyDetails = (Vector) session.getAttribute("companyDetails");
                                Vector amtDetails = (Vector) session.getAttribute("amtDetails");
                                generalBean general = (generalBean) otherDetails.get(0);
                                generalBean gBeanCN = (generalBean) contactDetails.get(0);
                                Enumeration enumchange = hashInvoiceDetails.keys();
                                //gBeanCN.getContactAddress().replaceAll("<AnujTestingJKG>", "<br>");
                                generalBean amtgen = (generalBean) amtDetails.get(0);
                                Enumeration enumoptions = optionDetails.keys();
                                Vector optionsVec = new Vector();
                                generalBean gBeanName = (generalBean) companyDetails.get(0);
                                //String[] articleTechDesc = gBeanCN.getContactAddress().split("<AnujTestingJKG>");
                                
        WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage();
        //wordMLPackage.getMainDocumentPart().addStyledParagraphOfText("Title", "Hello world");

        wordMLPackage.getMainDocumentPart().addParagraphOfText("Date: "+general.getDate());
        wordMLPackage.getMainDocumentPart().addParagraphOfText("Our Ref: "+general.getQuotId());
        wordMLPackage.getMainDocumentPart().addParagraphOfText(gBeanCN.getContactName());
        wordMLPackage.getMainDocumentPart().addParagraphOfText(gBeanCN.getContactAddress().replaceAll("<AnujTestingJKG>", "\n"));
        wordMLPackage.getMainDocumentPart().addParagraphOfText(general.getSub());
        int writableWidthTwips = wordMLPackage.getDocumentModel().getSections().get(0).getPageDimensions().getWritableWidthTwips();
        int cols = 5;
        int cellWidthTwips = new Double(Math.floor((writableWidthTwips / cols))).intValue();

        // Tbl tbl = TblFactory.createTable(3, 3, cellWidthTwips);

        Tbl tbl = Context.getWmlObjectFactory().createTbl();
        org.docx4j.wml.ObjectFactory factory = new org.docx4j.wml.ObjectFactory();
        // ///////////////////
        String strTblPr = "<w:tblPr " + Namespaces.W_NAMESPACE_DECLARATION
        + ">" + "<w:tblStyle w:val=\"TableGrid\"/>"
        + "<w:tblW w:w=\"0\" w:type=\"auto\"/>"
        + "<w:tblLook w:val=\"04A0\"/>" + "</w:tblPr>";
        TblPr tblPr = null;
        String text =   "<w:p>" +
                       "   <w:r>" +
                       "              <w:t>line 1</w:t>" +
                       "              <w:br/>" +
                       "              <w:t>line 2</w:t>" +
                       "   </w:r>" +
                       "</w:p>";
        try {
        tblPr = (TblPr) XmlUtils.unmarshalString(strTblPr);
        
        }

        catch (JAXBException e) {
        // Shouldn't happen
        e.printStackTrace();
        }
        tbl.setTblPr(tblPr);

        TblGrid tblGrid = Context.getWmlObjectFactory().createTblGrid();
        tbl.setTblGrid(tblGrid);

        int writableWidthTwips1 = wordMLPackage.getDocumentModel()
        .getSections().get(0).getPageDimensions()
        .getWritableWidthTwips();
        int cellWidthTwips1 = new Double(
        Math.floor((writableWidthTwips / cols))).intValue();

        for (int i = 0; i < cols; i++) {
        TblGridCol gridCol = Context.getWmlObjectFactory()
        .createTblGridCol();
        gridCol.setW(BigInteger.valueOf(cellWidthTwips));
        tblGrid.getGridCol().add(gridCol);
        }

        List<String> ls = new ArrayList<String>();
        ls.add("Cat No. ");
        ls.add("Description");
        ls.add("Unit Price In USD ");
        ls.add("Qty");
        ls.add("Amt. In USD ");

        Tc tc = null;
        Tr tr = null;
        int rows = 1;
        for (int j = 0; j < rows; j++) {
        tr = Context.getWmlObjectFactory().createTr();
        // tbl.getEGContentRowContent().add(tr);
        // for (int i = 1; i <= cols; i++) {
        for (int i = 0; i < cols; i++) {
        tc = Context.getWmlObjectFactory().createTc();

        TcPr tcPr = Context.getWmlObjectFactory().createTcPr();
        tc.setTcPr(tcPr);
        TblWidth cellWidth = Context.getWmlObjectFactory().createTblWidth();
        tcPr.setTcW(cellWidth);
        cellWidth.setType("dxa");
        cellWidth.setW(BigInteger.valueOf(cellWidthTwips));
        org.docx4j.wml.ObjectFactory factory1 = Context.getWmlObjectFactory();
        org.docx4j.wml.P p1 = factory.createP();
        org.docx4j.wml.Text t1 = factory.createText();
        // ls.add("val :" + i);
        t1.setValue(ls.get(i));
        org.docx4j.wml.R run1 = factory.createR();
        run1.getRunContent().add(t1);

        p1.getParagraphContent().add(run1);
        tc.getEGBlockLevelElts().add(p1);
        tr.getEGContentCellContent().add(tc);

        }

        tbl.getEGContentRowContent().add(tr);
        }

        wordMLPackage.getMainDocumentPart().addObject(tbl);
        org.docx4j.wml.P p = new org.docx4j.wml.P();
        org.docx4j.wml.R r = new org.docx4j.wml.R();
        org.docx4j.wml.Text t = new org.docx4j.wml.Text();
        t.setValue("Line1");
        org.docx4j.wml.Text t1 = new org.docx4j.wml.Text();
        t1.setValue("Line2");
        org.docx4j.wml.Br br = new org.docx4j.wml.Br();
        wordMLPackage.getMainDocumentPart().addParagraphOfText("LINE1 \n LINE2");
        
                org.docx4j.wml.P pNewLine = new org.docx4j.wml.P();

                org.docx4j.wml.R  run = factory.createR();
                pNewLine.getContent().add(run);

                run.getContent().add(factory.createRTab() );

                org.docx4j.wml.Text  text1 = factory.createText();
                text1.setValue("that was a tab");

                run.getContent().add(text1 );

                

                org.docx4j.wml.Text  text2 = factory.createText();
                text2.setValue("and that was a new line");
                run.getContent().add(factory.createBr() );
                // Check you got what you expected
                System.out.println(XmlUtils.marshaltoString(pNewLine, true));
        br.setType(STBrType.PAGE);
        r.getContent().add(t1);
        r.getContent().add(t);
        r.getContent().add(br);
        p.getContent().add(r);
        wordMLPackage.getMainDocumentPart().addObject(p);
	CustomXmlDataStoragePart customXmlDataStoragePart = extendedDao.injectCustomXmlDataStoragePart(wordMLPackage.getMainDocumentPart(),wordMLPackage.getParts() );
	extendedDao.addProperties(customXmlDataStoragePart);
        //BindingHandler.applyBindings(wordMLPackage.getMainDocumentPart());
        // Create main document part content
        wordMLPackage.save(new java.io.File(System.getProperty("user.dir") + "/"+ name + ".docx") );
       


        


        %>


        <b>Date : <%=general.getDate()%></b>
        <br>
        <b>Our Ref : <%=general.getQuotId()%></b>

        <br><br>
        <%=gBeanCN.getContactName()%>
        <br>
        <%=gBeanCN.getContactAddress().replaceAll("<AnujTestingJKG>", "<br>")%>                
        <br>
        <b><%=general.getSub()%></b>
        <br><br>
        <table id="article_table" width="100%" align="left" cellspacing="0" bordercolor="#FFFFFF">
            <tr>
                <td width="60%" style="border-bottom:black solid thin; border-top:black solid thin; border-left:black; border-left-color:black; border-left-style:solid; border-left-width:thin" align="left">
                    &nbsp;  Cat No. & Description
                </td>
                <td align="left" width="12%" style="border-bottom:black solid thin; border-top:black solid thin;">
                    Unit Price In USD
                </td>
                <td align="center" width="16%" style="border-bottom:black solid thin; border-top:black solid thin;">
                    Qty
                </td>
                <td align="left" width="12%" style="border-bottom:black solid thin; border-top:black solid thin; border-right:black; border-right-color:black; border-right-style:solid; border-right-width:thin">
                    Amt. In USD
                </td>
            </tr>



            <% while (enumchange.hasMoreElements()) {
                String keyName = (String) enumchange.nextElement();
                QuotationDetailsBean idb = (QuotationDetailsBean) hashInvoiceDetails.get(keyName);
            %>
            <tr>
                <td>
                    &nbsp;&nbsp;<%=idb.getArticleId()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=idb.getArticle_desc()%>
                </td>
                <td>
                    <%=idb.getArticlePrice()%></td>
                <td align="center">
                    <%=idb.getArticleQty()%></td>
                <td>
                    <%     float price = Float.parseFloat(idb.getArticlePrice());
                           int qty= Integer.parseInt(idb.getArticleQty());
                           float after_price = price*qty;
                           tot_price = tot_price + after_price;
                    %>
                    <%=after_price%><br>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%=idb.getArticleDesc().replaceAll("<AnujTestingJKG>", "<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                                                                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")%>
                </td></tr>
                <%}if(amtgen.getTotPrice()!=null && amtgen.getTotPrice()!="0"){%>
            <tr>
                <td colspan="3"><b>Total Ex Works Price USD Currency</b></td>
                <td><%=tot_price%></td>
            </tr>
            <%}if(amtgen.getDiscount()!=null && amtgen.getDiscount()!="0"){%>
            <tr>
                <td colspan="3">Discount::</td>
                <td><%=amtgen.getDiscount()%></td>
            </tr>
            <%}if(amtgen.getSpecialDisc()!=null && amtgen.getSpecialDisc()!="0"){%>
            <tr>
                <td colspan="3">Special Discount::</td>
                <td><%=amtgen.getSpecialDisc()%></td>
            </tr>
            <%}if(amtgen.getPortCharges()!=null && amtgen.getPortCharges()!="0"){%>
            <tr>
                <td colspan="3">Add Estimated Handling, local transportation, SEA/AIR Port charges:</td>
                <td><%=amtgen.getPortCharges()%></td>
            </tr>
            <%}%>
            <%if(amtgen.getTotFOB()!=null && amtgen.getTotFOB()!="0"){%>
            <tr>
                <td colspan="3">Total FOB::</td>
                <td><%=amtgen.getTotFOB()%></td>
            </tr>
            <%}if(amtgen.getShipCharges() != null && !amtgen.getShipCharges().equals("") && !amtgen.getShipCharges().equals("")){%>
            <tr>
                <td colspan="3">Add Estimated Handling, local transportation, SEA Freight charges::</td>
                <td><%=amtgen.getShipCharges()%></td>
            </tr>
            <%}if(amtgen.getAirCharges() != null && !amtgen.getAirCharges().equals("") && !amtgen.getAirCharges().equals("")){%>
            <tr>
                <td colspan="3">Add Estimated Handling, local transportation, AIR Freight charges::</td>
                <td><%=amtgen.getAirCharges()%></td>
            </tr>
            <%}if(amtgen.getTotNetAmt() != null && !amtgen.getTotNetAmt().equals("") && !amtgen.getTotNetAmt().equals("")){%>
            <tr>
                <td colspan="3">Total Net Amt ::</td>
                <td><%=amtgen.getTotNetAmt()%></td>
            </tr>
            <tr>
                <td>
                    <br><br><b>For J.K.G. Bio science Pvt. Ltd</b><br><br><br><br>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Authorized Signatory</b>
                </td>
            </tr>
   </table>
    </body>


    <body style="height:400px">

        <table>
            <%}
                                                                if(optionDetails.size()>0){%>
            <tr>
                <td align="center" colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <font face="verdona" size="4"><b><u> Optional</u></b></font>
                </td>
            </tr>
            <tr><td colspan="4">
                    <table id="optiondetails" cellspacing="0" bordercolor="#FFFFFF">                                                                        
                        <%while (enumoptions.hasMoreElements()) {
                            String article_code = (String) enumoptions.nextElement();
                            optionsVec = (Vector) optionDetails.get(article_code);
                        %>
                        <tr>
                            <td>Article Code:-&nbsp;&nbsp;&nbsp;&nbsp;<%=article_code%>
                            </td>
                        </tr>
                        <tr>
                            <th align="left"></th>
                            <th align="left"></th>
                            <th align="right"></th>
                        </tr>
                        <% for(int y=0;y<optionsVec.size();y++){
                                ArticleInBean options = new ArticleInBean();
                                options = (ArticleInBean)optionsVec.get(y);
                        %>
                        <tr>
                            <td align="left" ><%=options.getArticleOptionItem()%></td>
                            <td align="left"><%=options.getArticleOptionDesc()%></td>
                            <td align="right"><%=options.getArticleOptionPrice()%></td>
                        </tr>
                        <%}
                                                                }%>
                    </table>
                </td>
            </tr>
            <%}%>
            <tr>
                <td align="center" colspan="4"><br><br>
                    <font face="verdona" size="4"><b><u> Terms & Conditions</u></b></font>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <br>
                    <%=gBeanName.getCountryAdd().replaceAll("ÃÆφ&eur;&tmp;","'").replaceAll("<AnujTestingJKG>", "<br>")%>
                </td>
            </tr>
        </table>

    </body>
</html>

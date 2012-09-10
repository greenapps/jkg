<%--
    Document   : quotation2
    Created on : Apr 24, 2012, 1:16:33 PM
    Author     : Anshujkumar
--%>

<%@page import="com.allin1.beans.ArticleInBean"%>
<%@page import="com.allin1.beans.generalBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="daoservice.extendedDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>

<%@page import="com.allin1.beans.QuotationDetailsBean"%>
<%@page import="net.sf.textile4j.Textile"%>
<%@page import="common.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String amt = "";
    String invoice_ID = "";
    boolean taxFlag = true;
    String countryName;
    String fob = "";
    String totAmt = request.getParameter("grandTotal");
    String articles = (String) session.getAttribute("Articles");
    String currency = (String) session.getAttribute("ArticleCurrency");
    String quot_id = (String) session.getAttribute("ID");
    System.out.println("TESTING IN 222" + currency);
    Hashtable hashArticleDetails = new Hashtable();
    Vector hashArticleDesc = new Vector();
    Vector hashArticleSpec = new Vector();
    Vector otherDetails = new Vector();
    Vector contactDetails = new Vector();
    Hashtable optionDetail = new Hashtable();
    extendedDao extDao = new extendedDao();
    Textile textile = new Textile();
    hashArticleDetails = (Hashtable) session.getAttribute("hashInvoiceDetails");
    contactDetails = (Vector) session.getAttribute("contactDetails");
    otherDetails = (Vector) session.getAttribute("otherDetails");
    hashArticleDesc = (Vector) session.getAttribute("hashArticleDesc");
    hashArticleSpec = (Vector) session.getAttribute("hashArticleSpec");
    generalBean gbean = new generalBean();
    gbean = (generalBean) otherDetails.get(0);
    if (request.getParameter("saveQuot") != null && request.getParameter("saveQuot").equals("true")) {
        System.out.println("INSIDE QUOT2 SAVE");
        Vector countryDetails = new Vector();
        Vector amtDetails = new Vector();

        for (int i = 0; i <= Integer.parseInt(request.getParameter("records")); i++) {

            if (request.getParameter("countryName") != null && !request.getParameter("countryName").equals("") && !request.getParameter("countryName").trim().equals("")) {

                if (request.getParameter("companyAddress") != null && !request.getParameter("companyAddress").equals("")) {
                    generalBean gbNew = new generalBean();
                    System.out.println(request.getParameter("companyAddress"));
                    countryName = request.getParameter("countryName").trim();
                    gbNew.setCountryName("" + countryName);
                    String companyDetails = request.getParameter("companyAddress");
//                String[] lines = companyDetails.split("/\r|\r\n|\n/");
//                System.out.println("TESTING AFTER SPLITTING"+lines.length);
                    gbNew.setCountryAdd(companyDetails);
                    System.out.println(companyDetails);
                    countryDetails.add(gbNew);
                }


                System.out.println("added into countryDetails " + countryDetails.size());
            }
        }
        String[] articleIds = articles.split(",");
        for (int y = 0; y < articleIds.length; y++) {

            if (request.getParameter("ArticleCode" + y) != null && !request.getParameter("ArticleCode" + y).equals("") && !request.getParameter("ArticleCode" + y).trim().equals("")) {
                Vector optionsVal = new Vector();
                for (int i = 0; i <= Integer.parseInt(request.getParameter("itemrecords")); i++) {



                    if (request.getParameter("optionItem" + y + "Code" + i) != null && !request.getParameter("optionItem" + y + "Code" + i).equals("") && !request.getParameter("optionItem" + y + "Code" + i).equals("-")) {
                        ArticleInBean options = new ArticleInBean();
                        System.out.println(request.getParameter("optionItem" + y + "Code" + i));
                        //countryName = request.getParameter("countryName").trim();
                        options.setArticleOptionItem(request.getParameter("optionItem" + y + "Code" + i).trim());
                        //options.setCountryAdd(request.getParameter("countryDetails" + i).trim());
                        if (request.getParameter("optionItem" + y + "Desc" + i) != null && !request.getParameter("optionItem" + y + "Desc" + i).equals("") && !request.getParameter("optionItem" + y + "Desc" + i).equals("-")) {
                            options.setArticleOptionDesc(request.getParameter("optionItem" + y + "Desc" + i).trim());
                        }
                        if (request.getParameter("optionItem" + y + "Price" + i) != null && !request.getParameter("optionItem" + y + "Price" + i).equals("") && !request.getParameter("optionItem" + y + "Price" + i).equals("-")) {
                            options.setArticleOptionPrice(request.getParameter("optionItem" + y + "Price" + i).trim());
                        }
                        optionsVal.add(options);
                    }


                    System.out.println("added into countryDetails " + countryDetails.size());
                }
                optionDetail.put(articleIds[y], optionsVal);
            }

        }
        String CountryName = request.getParameter("countryName");
        generalBean gBeanCN = (generalBean) contactDetails.get(0);
        generalBean general = (generalBean) otherDetails.get(0);
        String[] QuotationInfo = new String[10]; //THIS ARRAY CONTAINS ALL THE INVOICE RELATED DETAILS e.g. clienteDetails,paymentDetails,chequeDetails etc.
        System.out.println("\n..................................................PAYMENT\n");
        QuotationInfo[0] = "";//invoiceId
        QuotationInfo[1] = gBeanCN.getContactName();
        QuotationInfo[2] = general.getDate();
        QuotationInfo[3] = request.getParameter("Total");
        QuotationInfo[4] = general.getSub();
        QuotationInfo[5] = "JKG/11-12/";
        QuotationInfo[6] = (String) session.getAttribute("Usern");
        QuotationInfo[7] = CountryName;


        String totalAMt = request.getParameter("Total");
        generalBean gen = new generalBean();
        if (request.getParameter("hiddenamt") != null && !request.getParameter("hiddenamt").equals("")) {
            gen.setTotPrice(request.getParameter("hiddenamt"));
        }
        if (request.getParameter("discount") != null && !request.getParameter("discount").equals("")) {
            gen.setDiscount(request.getParameter("discount"));
        }
        if (request.getParameter("specialdiscount") != null && !request.getParameter("specialdiscount").equals("")) {
            gen.setSpecialDisc(request.getParameter("specialdiscount"));
        }
        if (request.getParameter("portcharges") != null && !request.getParameter("portcharges").equals("")) {
            gen.setPortCharges(request.getParameter("portcharges"));
        }
        if (request.getParameter("fob") != null && !request.getParameter("fob").equals("")) {
            gen.setTotFOB(request.getParameter("fob"));
        }
        if (request.getParameter("fpexsea") != null && !request.getParameter("fpexsea").equals("")) {
            gen.setShipCharges(request.getParameter("fpexsea"));
        }
        if (request.getParameter("fpexair") != null && !request.getParameter("fpexair").equals("")) {
            gen.setAirCharges(request.getParameter("fpexair"));
        }
        if (request.getParameter("Total") != null && !request.getParameter("Total").equals("")) {
            gen.setTotNetAmt(request.getParameter("Total"));
        }
        amtDetails.add(gen);
        invoice_ID = extDao.saveQuotation(QuotationInfo, hashArticleDetails, hashArticleDesc, hashArticleSpec, contactDetails, otherDetails, countryDetails, CountryName, totalAMt, optionDetail);
        session.setAttribute("optionDetails", optionDetail);
        session.setAttribute("companyDetails", countryDetails);
        session.setAttribute("amtDetails", amtDetails);
        System.out.println("INSAVE" + invoice_ID);

        if (!invoice_ID.equals("false")) {

%>
<jsp:forward page="MsgPage.jsp">
    <jsp:param name="msg" value="Saved"/>
    <jsp:param name="link" value="quotation.jsp"/>
</jsp:forward>
<%}
    }//END OF SAVE MODE
%>
<html>
    <head>
        <jsp:include page="include.jsp"></jsp:include>
        <title>Create Quotation</title>
    </head>
    <body>
        <SCRIPT>
            function getCountryDetails(url)
            {
                if((url.length != 0 && eval("document.master.countryName")!=null)){
                    var url='getData.jsp?countryName='+replaceSplChar(url);
                    reqInit=2;
                    console.log(url);
                    $.ajax({
                        url: url,
                        dataType: "xml",
                        success: function(data) {
                            setCountryDetails(data);
                        }
                    });
                    
                }
            }
            
            function setCountryDetails(data){
                var countryDetail = $(data).find("countryDetail").text();
                removeTinyMCE();
                $('#companyAddress').val(''+countryDetail+'');
                initiateTinyMCE();
            }
                
            function addCountryDet(max){
                //alert('HAAN in addDesc'+max);
                for(u=0; u< max;u++){
                    tableid=document.getElementById("termCondTable");
                    rows=tableid.getElementsByTagName("tr").length;
                    //alert('hi'+rows+"articleTechDesc.length "+max);
                    if(navigator.appName!='Microsoft Internet Explorer')
                    {
                        var no=parseInt(rows)+parseInt(u);
                        trid=tableid.insertRow(rows-1);
                        trid.id="rowID"+(rows+u);
                        // alert("hi");
                        trid.innerHTML="<td><input type='text' name='countryDetails"+(rows+u)+"' id='countryDetails"+(rows+u)+"' size='10' value='' autocomplete='on' maxlength='50'> <input type='hidden' name='cuontryAddNewHidden"+(rows+u)+"' value=''></td>"+
                            "<td><input type='text' name='countryAddress"+(rows+u)+"' id='countryAddress"+(rows+u)+"' size='10' value='' autocomplete='on' maxlength='50'> <input type='hidden' name='cuontryAddressNewHidden"+(rows+u)+"' value=''></td>";

                    }
                    else
                    {

                        trid=document.getElementById("termCondTable").insertRow(rows+u);
                        trid.id="rowID"+(rows+u);
                        var no=parseInt(rows)+parseInt(u);

                        tcell=trid.insertCell();
                        tcell.innerHTML="<input type='text' name='countryDetails"+no+"' id='countryDetails"+no+"' size='10' value='' autocomplete='on' maxlength='50'> <input type='hidden' name='countryAddressHidden"+no+"' value=''></td>";

                    }
                }
            }

            function replaceSplChar(str)
            {
                if(str!='') {
                    strToReplace=str.toString();
                    finalstrToReplace='';
                    for(var i=0;i<strToReplace.length;i++){
            <%--if(strToReplace.charAt(i)=='&'){
                //strToReplace=strToReplace.replace('&', '%26');
                finalstrToReplace=finalstrToReplace+'%26';

                //i=i+2;
                //strToReplace.length=strToReplace.length+2;
            }else--%>  if(strToReplace.charAt(i)=='˚'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&deg;';
                        }else if(strToReplace.charAt(i)=='Ω'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&ohm;';
                        }else if(strToReplace.charAt(i)=='±'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&pls;';
                        }else if(strToReplace.charAt(i)=='Â'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'';
                        }else if(strToReplace.charAt(i)=='•'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&bul;';
                        }else if(strToReplace.charAt(i)==''){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&nbsp;';
                        }else if(strToReplace.charAt(i)==' ' && strToReplace.charAt(i+1)==' '){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&nbsp;';
                        }else if(strToReplace.charAt(i)=='®'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&reg;';
                        }else if(strToReplace.charAt(i)=='€'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&eur;';
                        }else if(strToReplace.charAt(i)=='£'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&pnd;';
                        }else if(strToReplace.charAt(i)=='¥'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&yen;';
                        }else if(strToReplace.charAt(i)=='©'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&cyt;';
                        }else if(strToReplace.charAt(i)=='™'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&tmp;';
                        }else if(strToReplace.charAt(i)=='≠'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&net;';
                        }else if(strToReplace.charAt(i)=='≤'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&let;';
                        }else if(strToReplace.charAt(i)=='≥'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&get;';
                        }else if(strToReplace.charAt(i)=='÷'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&did;';
                        }else if(strToReplace.charAt(i)=='¢'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&phi;';
                        }else if(strToReplace.charAt(i)=='Φ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&nph;';
                        }else if(strToReplace.charAt(i)=='Δ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&tri;';
                        }else if(strToReplace.charAt(i)=='ψ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&phy;';
                        }else if(strToReplace.charAt(i)=='σ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&res;';
                        }else{
                            strToReplace=strToReplace;
                            finalstrToReplace=finalstrToReplace+strToReplace.charAt(i);
                        }
                        // alert('i'+i+'strToReplace.length'+strToReplace.length+'STRING'+finalstrToReplace);

                    }
                    return finalstrToReplace;
                }



            }
            function replaceSplCharBack(str)
            {
                if(str!='') {
                    strToReplace=str.toString();
                    finalstrToReplace='';
                    for(var i=0;i<strToReplace.length;i++){
                        if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='d' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='g' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'˚';
                            strToReplace=strToReplace.replace('deg;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='p' && strToReplace.charAt(i+2)=='l' && strToReplace.charAt(i+3)=='s' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'±';
                            strToReplace=strToReplace.replace('pls;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='o' && strToReplace.charAt(i+2)=='h' && strToReplace.charAt(i+3)=='m' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'Ω';
                            strToReplace=strToReplace.replace('ohm;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='b' && strToReplace.charAt(i+2)=='u' && strToReplace.charAt(i+3)=='l' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'•';
                            strToReplace=strToReplace.replace('bul;', '');
                        }else if(strToReplace.charAt(i)=='Â'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'';
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='n' && strToReplace.charAt(i+2)=='b' && strToReplace.charAt(i+3)=='s' && strToReplace.charAt(i+4)=='p' && strToReplace.charAt(i+5)==';'){

                            finalstrToReplace=finalstrToReplace+'';
                            strToReplace=strToReplace.replace('nbsp;', ' ');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='r' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='g' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'®';
                            strToReplace=strToReplace.replace('reg;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='e' && strToReplace.charAt(i+2)=='u' && strToReplace.charAt(i+3)=='r' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'€';
                            strToReplace=strToReplace.replace('eur;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='p' && strToReplace.charAt(i+2)=='n' && strToReplace.charAt(i+3)=='d' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'£';
                            strToReplace=strToReplace.replace('pnd;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='y' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='n' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'¥';
                            strToReplace=strToReplace.replace('yen;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='c' && strToReplace.charAt(i+2)=='y' && strToReplace.charAt(i+3)=='t' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'©';
                            strToReplace=strToReplace.replace('cyt;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='t' && strToReplace.charAt(i+2)=='m' && strToReplace.charAt(i+3)=='p' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'™';
                            strToReplace=strToReplace.replace('tmp;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='n' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='t' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'≠';
                            strToReplace=strToReplace.replace('net;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='l' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='t' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'≤';
                            strToReplace=strToReplace.replace('let;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='g' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='t' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'≥';
                            strToReplace=strToReplace.replace('get;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='d' && strToReplace.charAt(i+2)=='i' && strToReplace.charAt(i+3)=='d' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'÷';
                            strToReplace=strToReplace.replace('did;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='p' && strToReplace.charAt(i+2)=='h' && strToReplace.charAt(i+3)=='i' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'¢';
                            strToReplace=strToReplace.replace('phi;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='n' && strToReplace.charAt(i+2)=='p' && strToReplace.charAt(i+3)=='h' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'Φ';
                            strToReplace=strToReplace.replace('nph;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='t' && strToReplace.charAt(i+2)=='r' && strToReplace.charAt(i+3)=='i' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'Δ';
                            strToReplace=strToReplace.replace('tri;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='p' && strToReplace.charAt(i+2)=='h' && strToReplace.charAt(i+3)=='y' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'ψ';
                            strToReplace=strToReplace.replace('phy;', '');
                        }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='r' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='s' && strToReplace.charAt(i+4)==';'){

                            finalstrToReplace=finalstrToReplace+'σ';
                            strToReplace=strToReplace.replace('res;', '');
                        }else{
                            strToReplace=strToReplace;
                            finalstrToReplace=finalstrToReplace+strToReplace.charAt(i);
                        }
                        // alert('i'+i+'strToReplace.length'+strToReplace.length+'STRING'+finalstrToReplace);

                    }
                    return finalstrToReplace;
                }



            }

            function replaceSplCharSuggestion(str){

                if(str!='') {

                    //  strToReplace=str.toString();

                    str=str.replace('&amp;','&');

                    str=str.replace('&lt;','<');

                    str=str.replace('&gt;','>');
                    str=str.replace('&quot;','"');


                }
                return str;
            }
            function getdiscount(value){
                //alert('value'+value);
                if(value != null && eval("document.master.discount").value != ""){
                    var amt = document.getElementById('hiddenamt').value;
                    var afterdiscount = parseFloat(amt) - parseFloat(value);
                    document.master.fob.value = afterdiscount;
                    document.master.Total.value=afterdiscount;
                }
            }
            function getspecialdiscount(value){

                if(value != null && eval("document.master.specialdiscount").value != ""){
                    if(document.master.discount.value != null && eval("document.master.discount").value != ""){
                        var disc = document.master.discount.value;
                        //alert(disc);
                    }
                    var amt = document.getElementById('hiddenamt').value;
                    var afterdiscount = parseFloat(amt) - parseFloat(value) -parseFloat(disc);
                    document.master.fob.value = afterdiscount;
                    document.master.hiddenamt.value = afterdiscount;
                    document.master.Total.value=afterdiscount;
                }
            }
            function getport(value){
                //alert(value+'in port'+document.master.hiddenamt.value);
                if(value != null && eval("document.master.portcharges").value != ""){
                    if(document.master.hiddenamt.value != null && eval("document.master.hiddenamt").value != ""){
                        var amt = document.master.hiddenamt.value;
                    }
                    var afterport = parseFloat(amt) + parseFloat(value);
                    document.master.fob.value = afterport;
                    document.master.hiddenamt.value = afterport;
                    document.master.Total.value=afterport;
                }
            }
            function addsea(value){
                //alert(value+'in port'+document.master.hiddenamt.value);
                if(value != null && eval("document.master.fpexsea").value != ""){
                    if(document.master.hiddenamt.value != null && eval("document.master.hiddenamt").value != ""){
                        var amt = document.master.hiddenamt.value;
                    }
                    var afterport = parseFloat(amt) + parseFloat(value);
                    document.master.hiddenamt.value = afterport;
                    document.master.Total.value=afterport;
                }
            }
            function addair(value){
                //alert(value+'in port'+document.master.hiddenamt.value);
                if(value != null && eval("document.master.fpexair").value != ""){
                    if(document.master.hiddenamt.value != null && eval("document.master.hiddenamt").value != ""){
                        var amt = document.master.hiddenamt.value;
                    }
                    var afterport = parseFloat(amt) + parseFloat(value);
                    document.master.hiddenamt.value = afterport;
                    document.master.Total.value=afterport;
                }
            }
            function resetRow(){
                document.getElementById("searow").innerHTML = "";
                document.getElementById("searow1").innerHTML = "";
            }
            function resetOptionDetails(val){
                var totrows = document.getElementById('optionsDetails').rows.length-1;
                //alert('IN RESET OPTIONDETAILS'+val+'TOT ROWS==='+totrows);
                for(i=0;i<totrows;i++){
                    if(document.getElementById("optionItem"+val+"Code"+i) != null)
                        document.getElementById("optionItem"+val+"Code"+i).innerHTML = "";
                    if(document.getElementById("optionItem"+val+"Desc"+i) != null)
                        document.getElementById("optionItem"+val+"Desc"+i).innerHTML = "";
                    if(document.getElementById("optionItem"+val+"Price"+i) != null)
                        document.getElementById("optionItem"+val+"Price"+i).innerHTML = "";
                }
            }
            function resetRowAir(){
                document.getElementById("airrow").innerHTML = "";
                document.getElementById("airrow1").innerHTML = "";
            }
            function resetOptions(){
                document.getElementById("options").innerHTML = "";
            }
            function addoptions(){
                //alert('hiii');
                var url = document.getElementById("articleIds").value;
                if((url.length != 0 && eval("document.master.articleIds")!=null)){
                    //alert(' test here ');
                    var url='getData.jsp?options='+url;
                    reqInit=2;
                    getData(url,setOptionDetails);
                }
            }
            function setOptionDetails(output){
                //alert ('setOptionDetails called')
                //reqInit=0;
                //document.getElementById("notificationFrame").style.visibility="hidden";
                var parent = output.getElementsByTagName("parent")[0];
                //alert('parent '+parent)
                if(parent==null || parent==undefined || parent.getElementsByTagName("ArticleCode")==undefined || parent.getElementsByTagName("ArticleCode")==null){//|| parent.getElementsByTagName("child").length <3
                    //alert("in null");
                }
                else if(parent != null && parent != undefined && parent.getElementsByTagName("child")!=undefined ){ //&& parent.getElementsByTagName("child").length != 3
                    var article_code = parent.getElementsByTagName("ArticleCode");
                    //alert("article code len"+article_code.length);
                    var child = parent.getElementsByTagName("child");
                    //alert("child len"+child.length);
                    var curr1 = document.master.curr.value;
                    curr1 = curr1.split(",");
                    for(y=0;y<article_code.length;y++){
                        var check = article_code[y].getElementsByTagName('child');
                        //alert("VALUE "+article_code[y].getElementsByTagName('ArticleId')[0].firstChild.nodeValue+'iski'+check.length);
                        tableid=document.getElementById("optionsDetails");
                        rows=tableid.getElementsByTagName("tr").length;
                        if(rows == "1"){
                            //alert("INSIDE IF"+document.master.curr.value);

                            trid=tableid.insertRow(1);
                            trid.id="rowID"+(1);
                            trid.innerHTML=
                                "<td align='center'><b><font color='black' size='2' face='verdana'>Article Code</font></b></td>"+
                                "<td align='center'><b><font color='black' size='2' face='verdana'>Item Code</font></b></td>"+
                                "<td align='center'><b><font color='black' size='2' face='verdana'>Description</font></b></td>"+
                                "<td align='center'><b><font color='black' size='2' face='verdana'>Unit Price In '"+curr1[y]+"'</font></b></td>";

                        }
                        rows=tableid.getElementsByTagName("tr").length;
                        trid=tableid.insertRow(rows);
                        trid.id="rowID"+(rows);
                        trid.innerHTML=
                            "<td align='center'><input type='text' name='ArticleCode"+(y)+"' id='ArticleCode"+(y)+"' size='10' value='"+article_code[y].getElementsByTagName('ArticleId')[0].firstChild.nodeValue+"' autocomplete='on' > <input type='hidden' name='ArticleCode"+(y)+"' value=''></td>";
                        //"<td align='center'><input type='radio' name='removeItemDetails"+(y)+"' id='removeItemDetails"+(y)+"' value='"+y+"' onclick='resetOptionDetails(this.value);'> </td>"+


                        for(j=0; j< check.length;j++){
                            //alert('ITEMCODEVALUE--->'+check[j].getElementsByTagName('ItemCode')[0].firstChild.nodeValue);

                            //alert('hi'+rows);

                            if(navigator.appName!='Microsoft Internet Explorer')
                            {

                                rows=tableid.getElementsByTagName("tr").length;
                                //alert('hi outside if'+rows+'jjjj'+j+'nodeeeee'+child[j].getElementsByTagName('ItemCode')[0].firstChild.nodeValue);
                                //alert('hi outside if'+rows+'jjjj'+j+'nodeeeee'+child[j].getElementsByTagName('Desc')[0].firstChild.nodeValue);
                                //alert('hi outside if'+rows+'jjjj'+j+'nodeeeee'+child[j].getElementsByTagName('Price')[0].firstChild.nodeValue);
                                var no=parseInt(rows)+parseInt(j);
                                trid=tableid.insertRow(rows);
                                trid.id="rowID"+(rows);
                                //alert("hi again");
                                trid.innerHTML= "<td></td>"+
                                    "<td align='center'><input type='text' name='optionItem"+y+"Code"+(j)+"' id='optionItem"+y+"Code"+(j)+"' size='10' value='"+check[j].getElementsByTagName('ItemCode')[0].firstChild.nodeValue+"' autocomplete='on'> <input type='hidden' name='optionItemCode"+(j)+"' value=''></td>"+
                                    "<td align='center'><input type='text' name='optionItem"+y+"Desc"+(j)+"' id='optionItem"+y+"Desc"+(j)+"' size='100' value='"+check[j].getElementsByTagName('Desc')[0].firstChild.nodeValue+"' autocomplete='on'> <input type='hidden' name='optionItemDesc"+(j)+"' value=''></td>"+
                                    "<td align='center'><input type='text' name='optionItem"+y+"Price"+(j)+"' id='optionItem"+y+"Price"+(j)+"' size='10' value='"+check[j].getElementsByTagName('Price')[0].firstChild.nodeValue+"' autocomplete='on'> <input type='hidden' name='optionItemPrice"+(j)+"' value=''></td>";
                                if(j==(check.length-1)){
                                    //alert("Yes in the end");
                                    var addrow = parseInt(rows) + parseInt(1);
                                    //alert("Yes in the end"+addrow);
                                    trid=tableid.insertRow(addrow);
                                    trid.id="rowID"+(addrow);

                                    // alert("hi");
                                    trid.innerHTML="<td align='center'><a href='javascript:addOptionsDet("+addrow+","+y+");' >ADD MORE.</a><input type='hidden' name='countryAddHidden"+(j)+"' value=''></td>";

                                }
                            }

                            else
                            {

                                trid=document.getElementById("optionsDetails").insertRow(rows);
                                trid.id="rowID"+(rows+j);
                                var no=parseInt(rows)+parseInt(j);

                                tcell=trid.insertCell();
                                tcell.innerHTML="<td></td>";

                                tcell=trid.insertCell();
                                tcell.innerHTML="<td align='center'><input type='text' name='optionItem"+y+"Code"+(j)+"' id='optionItemCode"+(j)+"' size='10' value='"+check[j].getElementsByTagName('ItemCode')[0].firstChild.nodeValue+"' autocomplete='on'> <input type='hidden' name='optionItemCode"+(j)+"' value=''></td>";

                                tcell=trid.insertCell();
                                tcell.innerHTML="<td align='center'><input type='text' name='optionItem"+y+"Desc"+(j)+"' id='optionItemDesc"+(j)+"' size='100' value='"+check[j].getElementsByTagName('Desc')[0].firstChild.nodeValue+"' autocomplete='on'> <input type='hidden' name='optionItemDesc"+(j)+"' value=''></td>";

                                tcell=trid.insertCell();
                                tcell.innerHTML="<td align='center'><input type='text' name='optionItem"+y+"Price"+(j)+"' id='optionItemPrice"+(j)+"' size='10' value='"+check[j].getElementsByTagName('Price')[0].firstChild.nodeValue+"' autocomplete='on'> <input type='hidden' name='optionItemPrice"+(j)+"' value=''></td>";
                                if(j==(check.length-1)){
                                    //alert("Yes in the end");
                                    var addrow = parseInt(rows) + parseInt(1);
                                    //alert("Yes in the end"+addrow);
                                    trid=tableid.insertRow(addrow);
                                    trid.id="rowID"+(addrow);
                                    // alert("hi");
                                    trid.innerHTML="<td align='center'><a href='javascript:addOptionsDet("+addrow+","+y+");'>ADD MORE DET.</a><input type='hidden' name='countryAddHidden"+(rows+j)+"' value=''></td>";

                                }
                            }
                        }
                    }

                }
            }
            function addOptionsDet(max,index){
                //alert('HAAN in addDesc'+max+'VALOF INDEX'+index);
                for(u=0; u< 1;u++){
                    tableid=document.getElementById("optionsDetails");
                    rows=tableid.getElementsByTagName("tr").length;
                    //alert('hi'+rows+"articleTechDesc.length "+max);
                    if(navigator.appName!='Microsoft Internet Explorer')
                    {
                        var no=parseInt(rows)+parseInt(u);
                        trid=tableid.insertRow(max);
                        trid.id="rowID"+(rows+u);
                        // alert("hi");
                        trid.innerHTML=" <td></td>"+
                            "<td align='center'><input type='text' name='optionItem"+index+"Code"+no+"' id='optionItemCode"+no+"' size='10' value='' autocomplete='on' > <input type='hidden' name='optionItemCode"+no+"' value=''></td>"+
                            "<td align='center'><input type='text' name='optionItem"+index+"Desc"+no+"' id='optionItemDesc"+no+"' size='100' value='' autocomplete='on'> <input type='hidden' name='optionItemDesc"+no+"' value=''></td>"+
                            "<td align='center'><input type='text' name='optionItem"+index+"Price"+no+"' id='optionItemPrice"+no+"' size='10' value='' autocomplete='on'> <input type='hidden' name='optionItemPrice"+no+"' value=''></td>";

                    }
                    else
                    {

                        trid=document.getElementById("optionsDetails").insertRow(rows+u);
                        trid.id="rowID"+(rows+u);
                        var no=parseInt(rows)+parseInt(u);

                        tcell=trid.insertCell();
                        tcell.innerHTML="<td></td>";

                        tcell=trid.insertCell();
                        tcell.innerHTML="<td align='center'><input type='text' name='optionItem"+index+"Code"+no+"' id='optionItemCode"+no+"' size='10' value='' autocomplete='on'> <input type='hidden' name='optionItemCode"+no+"' value=''></td>";

                        tcell=trid.insertCell();
                        tcell.innerHTML="<input type='text' name='optionItemDesc"+no+"' id='optionItem"+index+"Desc"+no+"' size='100' value='' autocomplete='on'> <input type='hidden' name='optionItemDesc"+no+"' value=''></td>";

                        tcell=trid.insertCell();
                        tcell.innerHTML="<td align='center'><input type='text' name='optionItem"+index+"Price"+no+"' id='optionItemPrice"+no+"' size='10' value='' autocomplete='on'> <input type='hidden' name='optionItemPrice"+no+"' value=''></td>";

                    }
                }

            }

            function createXHR()//Cross Browser Method to Create XMLHttpRequest Object.
            {
                var req;
                try
                {
                    req = new XMLHttpRequest();//For Opera 8.0+,Firefox,Safari

                }
                catch(e)
                {
                    try//For Internet Explorer old and new Versions.
                    {
                        req = new ActiveXObject("Msxml2.XMLHTTP");

                    }
                    catch(e)
                    {
                        try
                        {
                            req = new ActiveXObject("Microsoft.XMLHTTP");

                        }
                        catch(e)
                        {
                            alert("Your Browser doesn't support AJAX");
                            return false;
                        }
                    }
                }
                return req;
            }

            function getData(url,callbackFunction)
            {
                var req = createXHR();
                //alert("in get data");
                req.onreadystatechange = function(){
                    this.r = req;
                    this.callback = callbackFunction;
                    processStateChange(this.r, this.callback);
                }

                req.open("get",url, true);

                req.send(null);
            }

            function processStateChange(req, callback)
            {

                if (req.readyState == 4)
                {
                    //alert("INSIDE req.readyState"+req.status);
                    if(req.status == 200)
                    {

                        var output=req.responseXML;
                        callback(output);

                    }
                    else{
                        alert("There Was A Problem Communicating With Server, Please Try Again.");
                        if(typeof(ajax_cleanup_on_failure) != 'undefined'){ajax_cleanup_on_failure();}
                    }
                }
                else{
                }
            }
            
            function save() {
                document.master.records.value=document.getElementById('termCondTable').rows.length-1;
                document.master.itemrecords.value=document.getElementById('optionsDetails').rows.length-1;
                //alert("before action"+document.master.itemrecords.value);

                if(document.getElementById("companyAddress") != null){
                    document.master.action="quotation2.jsp?saveQuot=true";
                    document.master.submit();
                }
                else{
                    document.master.action="quotation2.jsp?saveQuot=true";
                    document.master.submit();
                }
            }
            
            function initiateTinyMCE(){
                tinyMCE.init({
                    mode : "textareas",
                    elements : 'companyAddress',
                    theme : "advanced"
                }); 
            }
            
            function removeTinyMCE(){
                tinymce.execCommand('mceRemoveControl',true,'companyAddress');
            }
            
            
            $(function(){
                initiateTinyMCE(); 
            });
            
            
        </SCRIPT>


        <form id="InsideContainer" name="master" method="post">
            <input type="hidden" name="records" value=""/>
            <input type="hidden" name="itemrecords" value=""/>
            <input type="hidden" name="curr" id="curr" value="<%= currency%>"/>
            <table width="100%" >
                <tr>
                    <td>
                        Our Ref : <input type="hidden" name="articleIds" id="articleIds" value="<%= articles%>"/>
                    </td>
                    <td>
                        <input type="hidden" name="quotId" id="qID" value="<%= gbean.getQuotId()%>"/><%= gbean.getQuotId()%>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        Date :
                    </td>
                    <td>
                        <%= gbean.getDate()%>
                    </td>
                </tr>
                <tr><td><br/></td></tr>
            </table>
            <table id="netAmtTable" width="100%"  align="center" border="1" cellspacing="0" bordercolor="#FFFFFF">
                <tr>
                    <th width="50%" align="left" bgcolor="#0092C8"><b><font color="white" size="2" face="verdana">Charges</font></b></th>
                    <th width="50%" align="left" bgcolor="#0092C8"><b><font color="white" size="2" face="verdana">Amount</font></b></th>
                </tr>
                <tr>
                    <th width="50%" align="left"><font size="1" face="verdana">Total Price</font></th>
                    <th width="50%" align="left"><font size="1" face="verdana"><input type="text" name="hiddenamt" id="hiddenamt" value="<%= totAmt%>"/></font></th>
                </tr>
                <tr>
                    <th width="50%" align="left"><font size="1" face="verdana">Discount</font></th>
                    <th width="50%" align="left"><input type="text" name="discount" id="discount" size="20" onchange="getdiscount(this.value);"></th>
                </tr>
                <tr>
                    <th width="50%" align="left"><font size="1" face="verdana">Special Discount</font></th>
                    <th width="50%" align="left"><input type="text" name="specialdiscount" id="specialdiscount" size="20" onchange="getspecialdiscount(this.value);"></th>
                </tr>
                <tr>
                    <th width="50%" align="left"><font size="1" face="verdana">Add Estimated Handling, local transportation, SEA/AIR Port charges</font></th>
                    <th width="50%" align="left"><input type="text" name="portcharges" id="portcharges" onchange="getport(this.value);" size="20"></th>
                </tr>
                <tr>
                    <th width="50%" align="left"><font size="1" face="verdana">Total FOB</font></th>
                    <th width="50%" align="left"><input type="text" name="fob" id="fob" size="20"></th>
                </tr>
                <tr>
                    <td>
                        <br><br>
                    </td>
                </tr>
                <tr id="searow">

                    <th width="100%" align="center" colspan="2" bgcolor="#0092C8">
                        <span class="radioC"><input type="radio" name="rowsea" onclick="resetRow();"/></span>
                        <b><font color="white" size="2" face="verdana">SHIPMENT thru SEA</font></b></th>

                </tr>
                <tr id="searow1">
                    <th width="50%" align="left"><font size="1" face="verdana">Add Estimated Handling, local transportation, SEA Freight charges</font></th>
                    <th width="50%" align="left"><input type="text" name="fpexsea" id="fpexsea" onchange="addsea(this.value);" size="20"></th>
                </tr>
                <tr>
                    <td>
                        <br><br>
                    </td>
                </tr>
                <tr id="airrow">
                    <th width="100%" align="center" colspan="2" bgcolor="#0092C8">
                        <span class="radioC"><input type="radio" name="rowair" onclick="resetRowAir();"/></span>
                        <b><font color="white" size="2" face="verdana">SHIPMENT thru AIR</font></b></th>

                </tr>
                <tr id="airrow1">
                    <th width="50%" align="left"><font size="1" face="verdana">Add Estimated Handling, local transportation, AIR Freight charges</font></th>
                    <th width="50%" align="left"><input type="text" name="fpexair" id="fpexair" onchange="addair(this.value);" size="20"></th>
                </tr>

            </table>
            <table width="100%" align="center" cellspacing="0" bordercolor="#FFFFFF">

                <tr>

                    <td width="100%" align="right"><b>Total Net Amt.</b><input type="text" name='Total' id="Total" size='10' value=""></td>

                </tr>
                <tr>
                    <td>
                        <br><br>
                    </td>
                </tr>
                <tr id="options">
                    <th width="100%" align="center" colspan="2" bgcolor="#0092C8"><span class="radioC">
                            <input type="radio" name="addoptions" onclick="resetOptions();"/></span>
                        <b><font color="white" size="2" face="verdana">
                            <a class="colorA" href="javascript:addoptions();">ADD OPTIONS</a></font></b></th>
                </tr>

            </table>
            <table id="optionsDetails" width="100%" align="center" cellspacing="0" bordercolor="#FFFFFF">
                <tr><td></td></tr>
            </table>
            <table id="termCondTable" width="100%" align="center" border="1" cellspacing="0" bordercolor="#FFFFFF">
                <tr>
                    <th width="100%"align="center" colspan="2" bgcolor="#0092C8"><b><font color="white" size="2" face="verdana">TERMS AND CONDITIONS</font></b></th>
                </tr>

                <tr>
                    <th width="50%" align="left"><font size="1" face="verdana">Company Name</font></th>
                    <th width="50%" align="left"><input type="text" name="countryName" size="20" onchange="getCountryDetails(this.value);"></th>
                </tr>
                <tr>
                    <td width="20%" ></td>
                    <td width="80%" colspan="2" align="left">
                        <textarea name="companyAddress" id="companyAddress" cols="100" rows="10">

                        </textarea>
                    </td>
                </tr>
            </table>
            <table width="100%" align="center" cellspacing="0" bordercolor="#FFFFFF">

                <tr>
                    <td align="center" colspan="3">


                        <input class="button" type="submit" value="save" name="saveQuot" onclick="save();">

                    </td></tr>
                </tr>
            </table>
        </form>
    </body>
</html>
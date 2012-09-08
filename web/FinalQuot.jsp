<%--
    Document   : quotation
    Created on : Apr 24, 2012, 1:16:33 PM
    Author     : Anujkumar
--%>

<%@page import="javax.swing.text.Document"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.allin1.beans.generalBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="daoservice.extendedDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.allin1.beans.QuotationDetailsBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("hashInvoiceDetails");
    session.removeAttribute("contactDetails");
    session.removeAttribute("otherDetails");
    session.removeAttribute("hashArticleDesc");
    session.removeAttribute("hashArticleSpec");
    String invoice_ID = "";
    String quot_id = (String) session.getAttribute("ID");
    extendedDao extDao = new extendedDao();
    Date today = new Date();
    SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
    String todayStr = fmt.format(today);
//String MenuId = request.getParameter("menuId");
    if (request.getParameter("save") != null && request.getParameter("save").equals("true")) {


        //if(clientId!=null && !clientId.equals(""))
        //creditDetails = generalDAO.clientCreditDetails(clientId, outlet_id);
        System.out.println("INSIDE save");
        Hashtable hashInvoiceDetails = new Hashtable();
        Vector hashArticleDesc = new Vector();
        Vector hashArticleSpec = new Vector();
        Vector otherDetails = new Vector();
        Vector contactDetails = new Vector();
        String article_id = "";
        String contactName = "";
        String QuotDate = "";
        String quotId = "";
        String QuotSub = "";
        String commaArticle = "";
        String commaArticleCurr = "";
        if (request.getParameter("name1") != null && !request.getParameter("name1").equals("") && !request.getParameter("name1").trim().equals("")) {
            contactName = request.getParameter("name1");
            System.out.println("FIRST TIME" + contactName);
        }
        if (request.getParameter("quotId") != null && !request.getParameter("quotId").equals("")) {
            quotId = request.getParameter("quotId");
            System.out.println("QUOT ID" + request.getParameter("quotId"));
        }
        if (request.getParameter("date") != null && !request.getParameter("date").equals("")) {
            QuotDate = request.getParameter("date");
        }
        if (request.getParameter("subject") != null && !request.getParameter("subject").equals("")) {
            QuotSub = request.getParameter("subject");
        }
        for (int i = 1; i <= Integer.parseInt(request.getParameter("records")); i++) {
            //System.out.println(request.getParameter("article_type" + i) + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
            if (request.getParameter("article_id" + i) != null && !request.getParameter("article_id" + i).equals("")) {
                QuotationDetailsBean idbNew = new QuotationDetailsBean();
                article_id = request.getParameter("article_id" + i).trim();
                commaArticle = commaArticle + article_id + ",";
                System.out.println("commaArticle---->>>>>>" + commaArticle);
                idbNew.setArticleId("" + article_id);
                if (request.getParameter("article_desc" + i) != null && !request.getParameter("article_desc" + i).equals("")) {
                    idbNew.setArticle_desc(request.getParameter("article_desc" + i).trim());
                } else {
                    idbNew.setArticle_desc("0");
                }
                if (request.getParameter("quantity" + i) != null && !request.getParameter("quantity" + i).equals("")) {
                    idbNew.setArticleQty(request.getParameter("quantity" + i).trim());
                } else {
                    idbNew.setArticleQty("0");
                }
                if (request.getParameter("price" + i) != null && !request.getParameter("price" + i).equals("")) {
                    idbNew.setArticlePrice(request.getParameter("price" + i).trim());
                } else {
                    idbNew.setArticlePrice("0.00");
                }
                if (request.getParameter("article_curr" + i) != null && !request.getParameter("article_curr" + i).equals("")) {
                    commaArticleCurr = commaArticleCurr + request.getParameter("article_curr" + i).trim() + ",";
                    System.out.println("commaArticleCurr---->>>>>>" + commaArticleCurr);
                    idbNew.setArticleCurrency(request.getParameter("article_curr" + i).trim());
                } else {
                    idbNew.setArticleCurrency("-");
                }
                System.out.println("PRINTING THE ARTICLE TECH DESC " + request.getParameter("article_tech_desc" + i));
                if (request.getParameter("article_tech_desc" + i) != null && !request.getParameter("article_tech_desc" + i).equals("")) {
                    System.out.println(request.getParameter("article_tech_desc" + i));
                    String articleTechDesc = request.getParameter("article_tech_desc" + i);
                    String[] lines = articleTechDesc.split("/\r|\r\n|\n/");
                    //System.out.println("TESTING AFTER SPLITTING"+lines.length);
                    String actualTechDesc = "";
                    for (int j = 0; j < lines.length; j++) {
                        //System.out.println("INSIDE FOR OF SPLITTING"+lines[j]);
                        actualTechDesc = actualTechDesc + lines[j] + "<AnujTestingJKG>";
                        //System.out.println("INSIDE FOR OF SPLITTING"+actualTechDesc);
                    }
                    idbNew.setArticleDesc(actualTechDesc);
                } else {
                    idbNew.setArticleDesc("-");
                }


                double article_amount = Double.parseDouble(idbNew.getArticlePrice()) * Double.parseDouble(idbNew.getArticleQty());
                idbNew.setArticleAmount(article_amount + "");

                float netAmt = ((Float.parseFloat(idbNew.getArticlePrice()) * Float.parseFloat(idbNew.getArticleQty())));
                //idbNew.setArticle_net_amt(netAmt + "");

                if (request.getParameter("quantity" + i) != null && !request.getParameter("quantity" + i).equals("") && !request.getParameter("quantity" + i).equals("0")) {
                    hashInvoiceDetails.put(article_id + "", idbNew);
                }

                System.out.println("added into hashinvoicedetails  LINE 190+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_" + hashInvoiceDetails.size());
            }


        }
        int commaLen = commaArticle.length() - 1;
        commaArticle = commaArticle.substring(0, commaLen);
        session.setAttribute("Articles", commaArticle);
        int commaCurrLen = commaArticleCurr.length() - 1;
        commaArticleCurr = commaArticleCurr.substring(0, commaCurrLen);
        session.setAttribute("ArticleCurrency", commaArticleCurr);

        if (request.getParameter("name1") != null && !request.getParameter("name1").equals("") && !request.getParameter("name1").trim().equals("")) {

            if (request.getParameter("contactAddress") != null && !request.getParameter("contactAddress").equals("")) {
                generalBean gbNew = new generalBean();
                //System.out.println(request.getParameter("contactAddress"));
                contactName = request.getParameter("name1").trim();
                gbNew.setContactName("" + contactName);
                String contactAdd = request.getParameter("contactAddress");
                //System.out.println("TESTING "+contactAdd);
                //contactAdd.replaceAll("/\r|\r\n|\n/", "<AnujTestingJKG>");
                String[] lines = contactAdd.split("/\r|\r\n|\n/");
                System.out.println("TESTING AFTER SPLITTING" + lines.length);
                String actualCA = "";
                for (int i = 0; i < lines.length; i++) {
                    //System.out.println("INSIDE FOR OF SPLITTING"+lines[i]);
                    actualCA = actualCA + lines[i] + "<AnujTestingJKG>";
                    //System.out.println("INSIDE FOR OF SPLITTING"+actualCA);
                }
                gbNew.setContactAddress(actualCA);
                contactDetails.add(gbNew);
            }


            System.out.println("added into contactDetails " + contactDetails.size());
        }
        //}
        System.out.println("\n......................1............................SAVE\n");

        if (hashInvoiceDetails != null && hashInvoiceDetails.size() > 0) {
            System.out.println("IN hashinvoice details test blcok > >     >>>>>>>>>>>>>>>>>>>>>>>>>>... ");
            Enumeration enumApprov = hashInvoiceDetails.keys();
            String keyID = "";
            while (enumApprov.hasMoreElements()) {
                double priceCheck = 0.00;
                keyID = (String) enumApprov.nextElement();
                System.out.println("ARTICLE ADDED IN NORMAL HASHINVOICEDETAILS TABLE >>>>>>>>>>>>  " + keyID);
                QuotationDetailsBean idBean = new QuotationDetailsBean();
                idBean = (QuotationDetailsBean) hashInvoiceDetails.get(keyID);
                priceCheck = Double.parseDouble(idBean.getArticlePrice());
            }
        }
        generalBean general = new generalBean();
        general.setQuotId(quotId);
        general.setDate(QuotDate);
        general.setSub(QuotSub);
        general.setContactName(contactName);
        otherDetails.add(general);
        session.setAttribute("contactDetails", contactDetails);
        session.setAttribute("otherDetails", otherDetails);
        session.setAttribute("hashInvoiceDetails", hashInvoiceDetails);
        session.setAttribute("hashArticleDesc", hashArticleDesc);
        session.setAttribute("hashArticleSpec", hashArticleSpec);

        /*if (request.getParameter("grandTotal").trim() != null) {
         session.setAttribute("totalInvoiceAmount", request.getParameter("grandTotal").trim());
         }*/

        boolean taxFlag = true;

        if (taxFlag) //invoice_ID = extDao.saveQuotation(hashInvoiceDetails,hashArticleDesc,hashArticleSpec,contactDetails,quotId,QuotDate,QuotSub,contactName);
        {
            invoice_ID = "true";
        }
        System.out.println("INSAVE" + invoice_ID);

        if (!invoice_ID.equals("false")) {

%>
<jsp:forward page="quotation2.jsp">
    <jsp:param name="msg" value="Saved"/>
    <jsp:param name="link" value="FinalQuot.jsp"/>
</jsp:forward>
<%}
    }//END OF SAVE MODE
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Quotation</title>
        <link rel="stylesheet" type="text/css" href="./css/effects.css">
        <jsp:include page="home.jsp"></jsp:include>
        </head>
        <body>
            <SCRIPT>
                var editArtSetQty=0;//ADDED TO POPULATE THE QUANTITY FOR EDIT ARTICLE SET CASE ON 18-06-2009
                var cajeraRole=0;// OnLoad function will check the role If Person Logged in is Cashier this variable will be updated to 1 to restrict Price field as read only for cahsier
                var retPrice=0;
                var resetType=0;// this variable is used when user edits article already entered to some other article , then to reset previous article's details this variable is updated
                var editmodeIndex=-1;
                //var editLastPrice=0.00;// This variable populates the offer price if user enters price less than blocked price for offer articles
                var taxArrayIndex=0;
                var reqInit=1;//This variable checks status of all request to server have been received back or not initially it is set to 1 if it is 2 means response pending from server, if it is 0 means no response pending from server
                var taxarray=new Array();
                var mpwd='';
                var articleSelected='';
                var updateClickCounter=0;
                var blocked=0;
                var saveClickCounter=0;
                var resultDiv='';
                var resultText='';
                var resultId='';
                var over=0;
                var count=1;
                var arrayIndex=0;
                var row=0;
                var quantity=0;
                var minprice=0.00;
                var retminprice=0.00;
                var needApproval=false;
                var tax=true;
                var success=false;
                var availableOfferQty=new Array();
                var cCedula = new Array();
                var cId = new Array();
                var cAddress = new Array();
                var offerQty = new Array();
                var mail = new Array();
                var mailid='';
                var mailcount=0;
                var mainqty=0;
                var search=false;
                var llrow=0;
                var totDivs=15;//THIS VALUE SHOULD BE CHANGED WHEN THE NO. OF ROWS OF THE DROPDOWN ARE CHANGING.
                var rownumber;
                var idArray = new Array(50);
                idArray[0] = "1";
                idArray[1] = "-1";
                var val='1';
                function KeyCheck(e,fieldname,idfield,divname,url){

                    //alert('hello'+fieldname);
                    resultDiv=divname;
                    resultText=fieldname;
                    resultId=idfield;
                    var lastdown=0;
                    articleSelected='';

                    // alert(document.getElementById(fieldname).value.length);
                    if(eval("document.master."+fieldname).readOnly==true){
                        return;
                    }

                    var KeyID = (window.event) ? event.keyCode : e.keyCode;
                    // alert(KeyID)
                    if(KeyID==120){
                        callOutletsInventory(fieldname);
                        //return;
                    }

                    if(KeyID==123){
                        callSearchFromForNewInvoice(fieldname);
                    }
                    if(KeyID==119){
                        viewInvPrice(fieldname);
                    }

                    if(KeyID != 27 && KeyID != 13 && KeyID != 38 && KeyID != 40){
                        this.over=0;
                        this.count=1;
                    }

                    if( (KeyID >= 48 && KeyID <= 105) || (KeyID == 8 || KeyID== 46))
                    {

                        if(eval("document.master."+fieldname) != null && document.getElementById(fieldname).value.length >= 2) //Modified By Sarika Gupta to show suggestion when user input 5 characters.
                        {
                            getData(url,result);
                        }
                        else{
                            //hideSuggestion(divname);
                        }
                    }
                    else
                    {

                        var last=totDivs-1;
                        switch(KeyID)
                        {
                            case 13:
                                if(over != 0)
                                {
                                    var set=over;
                                    if(count==1)
                                        set=set-1;
                                }
                                else{
                                    set=last;
                                }
                                arrayIndex=set;

                                // if(resultText.toString().substr(0,10) == 'article_id'){
                                //    var focusId=resultText.toString().substr(10, resultText.length-1);
                                //   eval("document.master.quantity"+focusId).focus();
                                //} else {
                                setSearch(document.getElementById('div'+set).innerHTML);
                                // }

                                break;

                            case 27:
                                hideSuggestion(divname);
                                break;

                            case 37:
                                hideSuggestion(divname);
                                break;

                            case 39:
                                hideSuggestion(divname);
                                break;

                            case 38:
                                if(over>0){
                                    over=over-1;
                                    if(count==1)
                                        over=over-1;
                                    out=over+1;
                                    if(over<0)
                                        over=last;
                                    suggestOver(document.getElementById('div'+over));
                                    suggestOut(document.getElementById('div'+out));
                                    count=0;
                                }
                                else{
                                    suggestOut(document.getElementById('div'+over));
                                    suggestOver(document.getElementById('div'+last));
                                    over=last;
                                    count=0;
                                }

                                break;

                            case 40:
                                if(count==0)
                                    over=over+1;
                                if(over == totDivs)
                                {
                                    var out=over-1;
                                    if(parseInt(out)>=0)
                                        suggestOut(document.getElementById('div'+out));
                                    over=0;
                                }
                                suggestOver(document.getElementById('div'+over));
                                if(over != 0){
                                    out=over-1;
                                    suggestOut(document.getElementById('div'+out));
                                }
                                over=over+1;
                                count=1;
                                break;
                        }
                    }
                }
                function result(output)
                {
                    var ajaxText = eval("document.getElementById('"+resultDiv+"')");
                    //alert(output);
                    if(output.getElementsByTagName("parent")[0] == undefined)
                    {
                        ajaxText.innerHTML='&nbsp;';
                        ajaxText.style.display="none";
                    }
                    else
                    {
                        var result='';
                        ajaxText.style.display="block";
                        //alert(output);
                        var parent = output.getElementsByTagName("parent")[0];
                        var child = parent.getElementsByTagName("child");

                        getArticleSuggestion(output);

                    }
                }

                function getArticleSuggestion(output){
                    var result='';
                    var ajaxText = eval("document.getElementById('"+resultDiv+"')");
                    var parent = output.getElementsByTagName("parent")[0];
                    var child = parent.getElementsByTagName("child");

                    if(child.length > 0)
                    {
                        totDivs=child.length;
                        for(var i=0; i< child.length;i++)
                        {
                            result+='<tr><td width="100%"><div name="suggest_div" onmouseover=\"javascript:suggestOver(this);\" onmouseout=\"javascript:suggestOut(this);\"  onclick=\"javascript:setSearch(this.innerHTML);\"  class=\"suggest_link\" id=\"div'+i+'\" >'+child[i].getElementsByTagName('desc')[0].firstChild.nodeValue+'---<font color="red">'+child[i].getElementsByTagName('qty')[0].firstChild.nodeValue+'</font></div></td></tr>';
                        }
                    }
                    ajaxText.innerHTML = '<table width=\"100%\">'+result+'</table>';
                    //alert(ajaxText.innerHTML)

                }
                function setSearch(value) {

                    var array=value.split("---") ;
                    //alert(' resultText in setsearch '+resultText)

                    eval("document.getElementById('"+resultText+"')").value=array[0].replace(/&amp;/, "&");
                    //alert();
                    var focusId=resultText.toString().substr(10, resultText.length-1);
                    // alert(' focus id '+focusId)
                    //eval("document.master.quantity"+focusId).focus();
                    if(resultId != ''){
                        eval("document.getElementById('"+resultId+"')").value=array[1].replace(/&amp;/, "&");
                    }
                    // alert('mohit 1')
                    var setText=eval("document.getElementById('"+resultDiv+"')");

                    if(resultText.toString().substr(0,10) != 'article_id'){
                        //   alert('mohit2')
                        document.master.cedulaNo.value=cCedula[arrayIndex];
                        document.master.clientsAddress.value=cAddress[arrayIndex].replace(/&amp;/, "&");
                        document.master.clientId.value=cId[arrayIndex];
                        mailid=mail[arrayIndex];
                    } else {
                        // alert('mohit3')
                        getValues(focusId,eval("document.getElementById('"+resultText+"')").value);
                    }
                    setText.innerHTML = '';
                    setText.style.display="none";
                }
                function suggestOut(div_value) {
                    div_value.className = 'suggest_link';
                }
                function suggestOver(div_value) {
                    // alert(' here in suggest over '+div_value)
                    var array=(div_value.innerHTML.toString()).split("---");
                    articleSelected=array[0].replace(/&amp;/, "&");
                    if(resultText=='clientName')
                        articleSelected=array[1].replace(/&amp;/, "&");
                    div_value.className = 'suggest_link_over';
                }

                function getValues(rownum,url)
                {
                    rownum=parseInt(rownum);
                    //alert("IN GET VALUES");
                    if(articleSelected!=''){
                        // alert(' mohit articleselected '+articleSelected)
                        url=articleSelected;
                    }
                    //  alert(' search '+search)
                    if(search == false){
                        var divname='search_suggest'+(parseInt(rownum)+2);
                        // alert(divname)
                        hideSuggestion(divname);
                        // alert(' url '+url)
                        if((url.length != 0 && eval("document.master.article_id"+rownum)!=null) || blocked==1){
 
                            if( (eval("document.master.quantity"+rownum).style.backgroundColor=='' || eval("document.master.quantity"+rownum).style.backgroundColor=='white') ){

                                if(blocked==0)
                                    eval("document.master.quantity"+rownum).readOnly=false;
                                row=rownum;
                                var url='getData.jsp?articleId='+replaceSplChar(url);
                                articleSelected='';
                                reqInit=2;
                                getData(url,setValues);
                                //}
                            }
                            else if(eval("document.master.article_id"+rownum).readOnly=false){
                                eval("document.master.article_id"+rownum).value='';
                                eval("document.master.quantity"+rownum).focus();
                            }
                        }
                        else if(eval("document.master.article_id"+rownum) != null && eval("document.master.article_id"+rownum).readOnly==false){

                            resetType=1;
                            //resetRow(rownum);

                        }
                        //grandTotal();
                    }
                }
                function getContactValues(rownum,url)
                {
                    //alert(url+eval("document.master.name"+rownum));
                    if((url.length != 0 && eval("document.master.name"+rownum)!=null)){
                        //alert(' test here ');
                        var url='getData.jsp?name='+replaceSplChar(url);
                        reqInit=2;
                        getData(url,setContactValues);
                    }
                }
                function setContactValues(output){
                    reqInit=0;
                    var parent = output.getElementsByTagName("parent")[0];
                    if(parent==null || parent==undefined || parent.getElementsByTagName("child")==undefined || parent.getElementsByTagName("child")==null){//|| parent.getElementsByTagName("child").length <3
                        //alert("in null");
                    }
                    else if(parent != null && parent != undefined && parent.getElementsByTagName("child")!=undefined ){ //&& parent.getElementsByTagName("child").length != 3
                        var child = parent.getElementsByTagName("child");
                        var childVal = child[0].getElementsByTagName('ContactDetails')[0].firstChild.nodeValue;
                        //alert(childVal);
                        eval("document.master.contactAddress").value=childVal;
            
                    }
                }

                function callAjax(event,id,value) {
                    var param1='article_id';
                    var param2='';
                    var param3='search_suggest';
                    var param4='getData.jsp?articleDescQty=';
                    param1=param1+id;
                    param3=param3+(id+2);
                    param4=param4+replaceSplChar(value);
                    KeyCheck(event,param1,param2,param3,param4);
                }
                function addArticle(max){
                    tableid=document.getElementById("article_table");
                    alert('hii'+ idArray[0]+'SECOND=='+idArray[1]);
                    rows=tableid.getElementsByTagName("tr").length;
                    var row= rows-1;

                    alert('hi'+row+"articleTechDesc.length "+max);
                    if(navigator.appName!='Microsoft Internet Explorer')
                    {
                        //alert(document.getElementById('article_id'+max).value);
            <%--for(var k=0;idArray[k]!='-1';k++){
                alert(idArray[k]);
                alert(document.getElementById('article_id'+idArray[k]).value);
                if(document.getElementById('article_id'+idArray[k]).value == "" || document.getElementById('article_id'+idArray[k]).value == null)
                {
                    val=0;
                    break;
                }
                val=1;
            }--%>
                        alert('VALUE of val'+val);
                        if(val==1){
                            for(j=0;j<max;j++){
                                var no=parseInt(rows)+parseInt(j);
                                trid=tableid.insertRow(rows+j);
                                trid.id="rowID"+(rows+j);

                                trid.innerHTML="<td><input type='text' id='article_id"+(rows+j)+"' name='article_id"+(rows+j)+"' size='10' maxlength='25' autocomplete='off' onkeyup='callAjax(event,"+(rows+j)+",this.value)'  onchange='getValues("+(rows+j)+",this.value);' ><br><div  name='suggestion' id='search_suggest"+(rows+j+2)+"' style='display:none;width:280px;'></div><input type='hidden' name='article_type"+(rows+j)+"' value=''></td><input type='hidden' name='blockedOutlet"+(rows+j)+"' value=''>"+
                                    "<td align='center' ><input type='text' name='article_desc"+(rows+j)+"' size='100'  autocomplete='off'></td>"+
                                    "<td align='center'><input type='text' name='quantity"+(rows+j)+"' readOnly  size='5' maxlength='10' onchange=calTotal(this.value,"+(rows+j)+")></td>"+
                                    "<td align='center'><input type='text' name='article_curr"+(rows+j)+"' size='10'  autocomplete='off'></td>"+
                                    "<td align='center'><input type='text' name='price"+(rows+j)+"' size='9'  maxlength='10' onchange=calTotal(this.value,"+(rows+j)+")></td>"+
                                    "<td align='center'><div id='total"+(rows+j)+"'>&nbsp;</div><input type='hidden' name='total"+(rows+j)+"' value=''></td>";
                                trid=tableid.insertRow(rows+j+1);
                                trid.id="rowID"+(rows+j+1);

                                trid.innerHTML="<td></td>"+
                                    "<td align='center'>"+
                                    "<textarea name='article_tech_desc"+(rows+j)+"' id='article_tech_desc"+(rows+j)+"' cols='100' rows='20'></textarea>"+
                                    "</td>"+
                                    "<td></td>"+
                                    "<td></td>"+
                                    "<td></td>"+
                                    "<td></td>";

                            }
                            //alert('k & rows'+k+'&&'+tableid.getElementsByTagName("tr").length);
                            idArray[k]=tableid.getElementsByTagName("tr").length-1;
                            idArray[k+1]='-1';
                        }else{
                            alert("Please fill the empty rows first.");
                        }


                    }else
                    {
                        for(j=0;j<max;j++){
                            trid=document.getElementById("article_table").insertRow(rows+j);
                            trid.id="rowID"+(rows+j);
                            var no=parseInt(rows)+parseInt(j);

                            tcell=trid.insertCell();
                            tcell.align="center";
                            tcell.innerHTML="<input type='radio' name='row' onclick='resetRow("+no+")'></td>";

                            tcell=trid.insertCell();
                            tcell.align="";
                            tcell.innerHTML="<input type='text' id='article_id"+no+"' name='article_id"+no+"' size='10' maxlength='25' onchange='getValues("+no+",this.value);' onkeyup='callAjax(event,"+no+",this.value)'><br><div  name='suggestion' id='search_suggest"+(no+2)+"' style='display:none;width:280px;'></div><input type='hidden' name='article_type"+no+"' value=''></td><input type='hidden' name='blockedOutlet"+no+"' value=''>";

                            tcell=trid.insertCell();
                            tcell.align="center";
                            tcell.innerHTML="<div id='article_desc"+no+"' style='width:230px'>&nbsp;</div></td>";

                            tcell=trid.insertCell();
                            tcell.align="center";
                            tcell.innerHTML="<input type='text' name='quantity"+no+"' readOnly size='4' maxlength='10'  onchange=calTotal(this.value,"+no+")></td>";

                            tcell=trid.insertCell();
                            tcell.align="center";
                            tcell.innerHTML="<input type='text' name='price"+no+"' size='9'  readOnly maxlength='10' onchange=calTotal(this.value,"+no+")></td>";

                            tcell=trid.insertCell();
                            tcell.align="center";
                            tcell.innerHTML="<div id='total"+no+"'>&nbsp;</div><input type='hidden' name='total"+no+"' value=''></td>";

                        }
                    }
                }
 
                function setValues(output){
                    //alert ('setvalues called')
                    reqInit=0;
                    //document.getElementById("notificationFrame").style.visibility="hidden";
                    var parent = output.getElementsByTagName("parent")[0];
                    //alert('parent '+parent)
                    if(parent==null || parent==undefined || parent.getElementsByTagName("child")==undefined || parent.getElementsByTagName("child")==null){//|| parent.getElementsByTagName("child").length <3
                        //  alert('inside null and search is '+search)
                        if(search==false){
                            var divname='search_suggest'+(row+2);
                            hideSuggestion(divname);
                            alert("Invalid Article Code");
                            resetType=1;
                            //resetRow(row);

                        }
                    }
                    else if(parent != null && parent != undefined && parent.getElementsByTagName("child")!=undefined ){ //&& parent.getElementsByTagName("child").length != 3

                        var child = parent.getElementsByTagName("child");
                        //var articleTechDesc = parent.getElementsByTagName("articleDesc");
                        //var articleTechSpec = parent.getElementsByTagName("articleSpec");
                        // alert('length of response '+child.length)
                        if(parseInt(eval("document.master.price"+row).value) >0 && parseInt(eval("document.master.quantity"+row).value) >=0){
                            resetType=1;
                            // alert('i am sending to clear previous article details')
                            //resetRow(row)
                        }
                        //  alert(' length of child just below reset is   '+child.length)

                        for(var i=0; i< child.length;i++){


                            if(i==0 && child[0].getElementsByTagName('invalidPrice')[0].firstChild.nodeValue == 0){

                                // eval("document.master.article_id"+row).readOnly=true;

                                var desc = child[0].getElementsByTagName('desc')[0].firstChild.nodeValue;
                                var techDesc = child[0].getElementsByTagName('techDesc')[0].firstChild.nodeValue;
                                var price = child[0].getElementsByTagName('price')[0].firstChild.nodeValue;
                                var currency = child[0].getElementsByTagName('currency')[0].firstChild.nodeValue;
                                quantity = child[0].getElementsByTagName('quantity')[0].firstChild.nodeValue;
                                minprice = child[0].getElementsByTagName('minprice')[0].firstChild.nodeValue;
                                retminprice = child[0].getElementsByTagName('retminprice')[0].firstChild.nodeValue;
                                offerQty[i]= child[0].getElementsByTagName('offerqty')[0].firstChild.nodeValue;
                                eval("document.master.article_id"+row).value=child[0].getElementsByTagName('id')[0].firstChild.nodeValue.replace(/^\s+|\s+$/g,"");
                                eval("document.master.article_type"+row).value=child[0].getElementsByTagName("articletype")[0].firstChild.nodeValue.replace(/^\s+|\s+$/g,"");
                                //document.getElementById("article_desc"+row).innerHTML=desc;
                                eval("document.master.article_desc"+row).value=desc;
                                var tech_desc = replaceSplCharBack(techDesc);
                                eval("document.master.article_tech_desc"+row).value=tech_desc;
                                var offerArticle=child[0].getElementsByTagName('offerarticle')[0].firstChild.nodeValue;
                                if(offerArticle==1){

                                    if(cajeraRole==1){
                                        eval("document.master.price"+row).readOnly=true;
                                    }else{
                                        eval("document.master.price"+row).readOnly=false;
                                    }
                                    eval("document.master.price"+row).style.backgroundColor = "#F75D59";
                                }
                                else{
                                    if(cajeraRole==0)
                                        eval("document.master.price"+row).readOnly=false;
                                    eval("document.master.quantity"+row).readOnly=false;
                                    eval("document.master.price"+row).style.backgroundColor = "white";
                                }
                                //eval("document.master.request_article"+row).disabled=false;
                                eval("document.master.article_curr"+row).value=currency;
                                eval("document.master.cur").value=currency;
                                eval("document.master.price"+row).value=parseFloat(price.replace(/^\s+|\s+$/g,"")).toFixed(2);
                                //eval("document.master.price"+row).value=price;
                                //document.getElementById("tax"+row).innerHTML=0.00;
                                //taxarray[row]=child[0].getElementsByTagName('taxamt')[0].firstChild.nodeValue;
                                //document.getElementById("discount"+row).innerHTML=child[0].getElementsByTagName('discount')[0].firstChild.nodeValue;
                                //eval("document.master.discount"+row).value=child[0].getElementsByTagName('discount')[0].firstChild.nodeValue;
                                if(blocked==0){
                                    eval("document.master.quantity"+row).readOnly=false;
                                    eval("document.master.quantity"+row).value='';
                                }
                                else if(blocked==1){
                                    eval("document.master.article_id"+row).readOnly=true;
                                    eval("document.master.quantity"+row).readOnly=true;
                                    eval("document.master.price"+row).focus();
                                }
                                //                                if(eval("document.master.blockedOutlet"+row).value=='Y'){
                                //                                    eval("document.master.quantity"+row).readOnly=true;
                                //
                                //                                }
                                //Update when article added with its empId as logged In Employee

                                //eval("document.master.empId"+row).value=eval("document.master.currentEmpId").value;
                                // alert(' for article '+eval("document.master.article_id"+row).value+' emp Id is '+eval("document.master.empId"+row).value)
                            }
                            else if(i>=1 && child[0].getElementsByTagName('invalidPrice')[0].firstChild.nodeValue == 0)
                            {
                                var newrow=row+i;
                                var id = child[i].getElementsByTagName('id')[0].firstChild.nodeValue;

                                //  alert('getting juzz in here ')
                                // var newrow=row+i;


                                var totrows=document.getElementById('article_table').rows.length-1;
                                if(newrow > totrows)
                                    addRow(1);


                                desc = child[i].getElementsByTagName('desc')[0].firstChild.nodeValue;
                                techDesc = child[0].getElementsByTagName('techDesc')[0].firstChild.nodeValue;
                                offerQty[i-1]= child[i].getElementsByTagName('offerqty')[0].firstChild.nodeValue;
                                availableOfferQty[i-1]=child[i].getElementsByTagName('quantity')[0].firstChild.nodeValue;
                                price = child[i].getElementsByTagName('price')[0].firstChild.nodeValue;
                                currency = child[0].getElementsByTagName('currency')[0].firstChild.nodeValue;
                                offerArticle=child[i].getElementsByTagName('offerarticle')[0].firstChild.nodeValue;
                                taxarray[newrow]=child[i].getElementsByTagName('taxamt')[0].firstChild.nodeValue;
                                // alert("tax for row"+newrow+" is "+taxarray[newrow]);
                                // alert(' on page '+eval("document.master.article_id"+newrow).value)
                                // alert('from database '+id)
                                // alert ('document.master.article_id'+newrow)
                                eval("document.master.article_id"+newrow).value=id;
                                eval("document.master.article_type"+newrow).value=child[i].getElementsByTagName("articletype")[0].firstChild.nodeValue.replace(/^\s+|\s+$/g,"");
                                eval("document.master.article_desc"+newrow).value=desc;
                                var tech_desc = replaceSplCharBack(techDesc);
                                eval("document.master.article_tech_desc"+newrow).value=tech_desc;
                                eval("document.master.article_id"+newrow).readOnly=true;
                                eval("document.master.price"+newrow).readOnly=true;
                                eval("document.master.article_curr"+newrow).value=currency;
                                //document.getElementById("article_curr"+newrow).innerHTML=currency;
                                eval("document.master.price"+newrow).value=price;
                                //document.getElementById("discount"+newrow).innerHTML=0.0;
                                eval("document.master.quantity"+newrow).readOnly=true;
                                eval("document.master.row["+(newrow-1)+"]").disabled=false;//allow offer articles to be removed
                                //eval("document.master.request_article"+newrow).disabled=true;
                                //eval("document.master.request_qty"+newrow).readOnly=true;
                                eval("document.master.quantity"+newrow).style.backgroundColor = "#54C571";


                                if(offerArticle==2){

                                    eval("document.master.row["+(newrow-1)+"]").disabled=false;//allow offer articles to be removed
                                    //document.getElementById("discount"+newrow).innerHTML=0.0;
                                    eval("document.master.price"+newrow).value=0.0;
                                    availableOfferQty[i-1]=child[i].getElementsByTagName('quantity')[0].firstChild.nodeValue;
                                    //document.getElementById("discount"+newrow).innerHTML=child[i].getElementsByTagName('discount')[0].firstChild.nodeValue;
                                    //eval("document.master.price"+newrow).value=parseFloat(child[i].getElementsByTagName('price')[0].firstChild.nodeValue).toFixed(2);
                                    llrow=newrow;
                                }
                                resetType=1;
                                /*if(!validateArticle(newrow)) {

                                               alert('You have added '+id+' in this Loss Ladder/Article Set which is already Present \n Either enter it as Normal Article or in Loss Ladder/Article Set ')

                                               resetRow(row)

                                               return;


                                           }*/
                                resetType=0;
                                //Update when article added with its empId as logged In Employee
                                // eval("document.master.empId"+newrow).value=eval("document.master.currentEmpId").value;
                                // alert(' for article '+eval("document.master.article_id"+newrow).value+' emp Id is '+eval("document.master.empId"+newrow).value);
                            }
                            else{
                                alert("The article can not be sold, \n Price is not defined for this article");
                                eval("document.master.article_id"+row).value='';
                                eval("document.master.quantity"+row).focus();
                                eval("document.master.quantity"+row).readOnly=false;
                                eval("document.master.quantity"+row).value='';
                                return;
                            }
                        }
                            

                    }
                    blocked=0;
                    //Calling replaceDetails();
                    //eval("document.master.quantity"+row).focus();
                    //replaceDetails('article_id'+row);
                }

                function hideSuggestion(divname){
                    document.getElementById(divname).innerHTML='&nbsp;';
                    document.getElementById(divname).style.display='none';
                    last=0;
                }
                function validateArticle(rownum) {
                    var articleTobeValidated='';
                    if(articleSelected!='')
                        articleTobeValidated=articleSelected;
                    else
                        articleTobeValidated=eval("document.master.article_id"+rownum).value.replace(/^\s+|\s+$/g,"").toUpperCase();
                    for(k=1;k<=document.getElementById('article_table').rows.length-1;k++){
                        if (k==rownum) {
                            k++;
                        }
                        if(k>document.getElementById('article_table').rows.length-1){
                            return true;
                        }
                        // Condition inside if modified by Madhav on 12-05-2010 : To allow user to add an article as duplicate ,if that article id added as secondary article
                        if(articleTobeValidated==eval("document.master.article_id"+k).value.replace(/^\s+|\s+$/g,"").toUpperCase() && (eval("document.master.article_type"+k).value!='set' && eval("document.master.article_type"+k).value!='LL' )){
                            // if(eval("document.master.quantity"+k).style.backgroundColor == '' || eval("document.master.quantity"+k).style.backgroundColor=='white'){

                            if(eval("document.master.article_id"+rownum).value.replace(/^\s+|\s+$/g,"") != ''){
                                if(parseInt(resetType)==0){
                                    alert("Article already exist.");
                                    eval("document.master.article_id"+rownum).value='';
                                }
                            }
                            return false;
                            // }
                        }
                    }
                    return true;
                }
                /*
         @ Author Manoj Kumar Jena. Dt.23-12-2008
           Mann-India Technologies Pvt. Ltd.
           manoj.kumar@mann-india.com
                 */

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
                        }else if(strToReplace.charAt(i)=='Ω'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#8486;';
                        }else if(strToReplace.charAt(i)=='±'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&plusmn;';
                        }else if(strToReplace.charAt(i)=='•'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#149;';
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
                            finalstrToReplace=finalstrToReplace+'&#128;';
                        }else if(strToReplace.charAt(i)=='£'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&pound;';
                        }else if(strToReplace.charAt(i)=='¥'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&yen;';
                        }else if(strToReplace.charAt(i)=='©'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&copy;';
                        }else if(strToReplace.charAt(i)=='™'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&trade;';
                        }else if(strToReplace.charAt(i)=='≠'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#8800;';
                        }else if(strToReplace.charAt(i)=='≤'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#8804;';
                        }else if(strToReplace.charAt(i)=='≥'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&8805;';
                        }else if(strToReplace.charAt(i)=='÷'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#43;';
                        }else if(strToReplace.charAt(i)=='!'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#33;';
                        }else if(strToReplace.charAt(i)=='"'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&quot;';
                        }else if(strToReplace.charAt(i)=='`'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#96;';
                        }else if(strToReplace.charAt(i)=='�'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#129;';
                        }else if(strToReplace.charAt(i)=='ƒ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#131;';
                        }else if(strToReplace.charAt(i)=='„'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#132;';
                        }else if(strToReplace.charAt(i)=='…'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#133;';
                        }else if(strToReplace.charAt(i)=='†'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#134;';
                        }else if(strToReplace.charAt(i)=='‡'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#135;';
                        }else if(strToReplace.charAt(i)=='‰'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#137;';
                        }else if(strToReplace.charAt(i)=='Š'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#138;';
                        }else if(strToReplace.charAt(i)=='Œ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#140;';
                        }else if(strToReplace.charAt(i)=='Ž'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#142;';
                        }else if(strToReplace.charAt(i)=='š'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#154;';
                        }else if(strToReplace.charAt(i)=='œ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#156;';
                        }else if(strToReplace.charAt(i)=='ž'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#158;';
                        }else if(strToReplace.charAt(i)=='Ÿ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#159;';
                        }else if(strToReplace.charAt(i)=='¡'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&iexcl;';
                        }else if(strToReplace.charAt(i)=='¢'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&cent;';
                        }else if(strToReplace.charAt(i)=='¤'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&curren;';
                        }else if(strToReplace.charAt(i)=='§'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&sect;';
                        }else if(strToReplace.charAt(i)=='¨'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&uml;';
                        }else if(strToReplace.charAt(i)=='ª'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&ordf;';
                        }else if(strToReplace.charAt(i)=='¬'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&not;';
                        }else if(strToReplace.charAt(i)=='¯'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&macr;';
                        }else if(strToReplace.charAt(i)=='²'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&sup2;';
                        }else if(strToReplace.charAt(i)=='³'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&sup3;';
                        }else if(strToReplace.charAt(i)=='µ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&micro;';
                        }else if(strToReplace.charAt(i)=='¶'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&para;';
                        }else if(strToReplace.charAt(i)=='·'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&middot;';
                        }else if(strToReplace.charAt(i)=='¹'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&sup1;';
                        }else if(strToReplace.charAt(i)=='¿'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#191;';
                        }else if(strToReplace.charAt(i)=='À'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#192;';
                        }else if(strToReplace.charAt(i)=='Á'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#193;';
                        }else if(strToReplace.charAt(i)=='Â'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#194;';
                        }else if(strToReplace.charAt(i)=='Ã'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#195;';
                        }else if(strToReplace.charAt(i)=='Ä'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#196;';
                        }else if(strToReplace.charAt(i)=='Å'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#197;';
                        }else if(strToReplace.charAt(i)=='Æ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#198;';
                        }else if(strToReplace.charAt(i)=='Ç'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#199;';
                        }else if(strToReplace.charAt(i)=='È'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#200;';
                        }else if(strToReplace.charAt(i)=='É'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#201;';
                        }else if(strToReplace.charAt(i)=='Ê'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#202;';
                        }else if(strToReplace.charAt(i)=='Ë'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#203;';
                        }else if(strToReplace.charAt(i)=='Ì'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#204;';
                        }else if(strToReplace.charAt(i)=='Í'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#205;';
                        }else if(strToReplace.charAt(i)=='Î'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#206;';
                        }else if(strToReplace.charAt(i)=='Ï'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#207;';
                        }else if(strToReplace.charAt(i)=='Ð'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#208;';
                        }else if(strToReplace.charAt(i)=='Ñ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#209;';
                        }else if(strToReplace.charAt(i)=='Ò'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#210;';
                        }else if(strToReplace.charAt(i)=='Ó'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#211;';
                        }else if(strToReplace.charAt(i)=='Ô'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#212;';
                        }else if(strToReplace.charAt(i)=='Õ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#213;';
                        }else if(strToReplace.charAt(i)=='Ö'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#214;';
                        }else if(strToReplace.charAt(i)=='×'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#215;';
                        }else if(strToReplace.charAt(i)=='Ø'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#216;';
                        }else if(strToReplace.charAt(i)=='Ù'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#217;';
                        }else if(strToReplace.charAt(i)=='Ú'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#218;';
                        }else if(strToReplace.charAt(i)=='Û'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#219;';
                        }else if(strToReplace.charAt(i)=='Ü'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#220;';
                        }else if(strToReplace.charAt(i)=='Ý'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#221;';
                        }else if(strToReplace.charAt(i)=='Þ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#222;';
                        }else if(strToReplace.charAt(i)=='ß'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#223;';
                        }else if(strToReplace.charAt(i)=='à'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#224;';
                        }else if(strToReplace.charAt(i)=='á'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#225;';
                        }else if(strToReplace.charAt(i)=='â'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#226;';
                        }else if(strToReplace.charAt(i)=='ã'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#227;';
                        }else if(strToReplace.charAt(i)=='ä'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#228;';
                        }else if(strToReplace.charAt(i)=='å'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#229;';
                        }else if(strToReplace.charAt(i)=='æ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#230;';
                        }else if(strToReplace.charAt(i)=='ç'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#231;';
                        }else if(strToReplace.charAt(i)=='è'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#232;';
                        }else if(strToReplace.charAt(i)=='é'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#233;';
                        }else if(strToReplace.charAt(i)=='ê'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#234;';
                        }else if(strToReplace.charAt(i)=='ë'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#235;';
                        }else if(strToReplace.charAt(i)=='ì'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#236;';
                        }else if(strToReplace.charAt(i)=='í'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#237;';
                        }else if(strToReplace.charAt(i)=='î'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#238;';
                        }else if(strToReplace.charAt(i)=='ï'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#239;';
                        }else if(strToReplace.charAt(i)=='ð'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#240;';
                        }else if(strToReplace.charAt(i)=='ñ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#241;';
                        }else if(strToReplace.charAt(i)=='ò'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#242;';
                        }else if(strToReplace.charAt(i)=='ó'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#243;';
                        }else if(strToReplace.charAt(i)=='ô'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#244;';
                        }else if(strToReplace.charAt(i)=='õ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#245;';
                        }else if(strToReplace.charAt(i)=='ö'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#246;';
                        }else if(strToReplace.charAt(i)=='÷'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#247;';
                        }else if(strToReplace.charAt(i)=='ø'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#248;';
                        }else if(strToReplace.charAt(i)=='ù'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#249;';
                        }else if(strToReplace.charAt(i)=='ú'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#250;';
                        }else if(strToReplace.charAt(i)=='û'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#251;';
                        }else if(strToReplace.charAt(i)=='ü'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#252;';
                        }else if(strToReplace.charAt(i)=='ý'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#253;';
                        }else if(strToReplace.charAt(i)=='þ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#254;';
                        }else if(strToReplace.charAt(i)=='ÿ'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&#255;';
                        }else if(strToReplace.charAt(i)=='♠'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&spades;';
                        }else if(strToReplace.charAt(i)=='♣'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&clubs;';
                        }else if(strToReplace.charAt(i)=='♦'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&diams;';
                        }else if(strToReplace.charAt(i)=='♥'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&hearts;';
                        }else if(strToReplace.charAt(i)=='‾'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&oline;';
                        }else if(strToReplace.charAt(i)=='←'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&larr;';
                        }else if(strToReplace.charAt(i)=='→'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&rarr;';
                        }else if(strToReplace.charAt(i)=='↑'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&uarr;';
                        }else if(strToReplace.charAt(i)=='↓'){
                            //strToReplace=strToReplace.replace('%', '%5C');
                            finalstrToReplace=finalstrToReplace+'&darr;';
                        }else{
                            strToReplace=strToReplace;
                            finalstrToReplace=finalstrToReplace+strToReplace.charAt(i);
                        }
                    }
                    return finalstrToReplace;
                }
            }
            function format () {
                // code for IE
                var textarea = document.getElementById("textarea");

                if (document.selection)
                {
                    textarea.focus();
                    var sel = document.selection.createRange();
                    // alert the selected text in textarea
                    alert(sel.text);

                    // Finally replace the value of the selected text with this new replacement one
                    sel.text = '<b>' + sel.text + '</b>';
                }

                // code for Mozilla

                var textarea = document.getElementById("textarea");

                var len = textarea.value.length;
                var start = textarea.selectionStart;
                var end = textarea.selectionEnd;
                var sel = textarea.value.substring(start, end);

                // This is the selected text and alert it
                //    alert(sel);

                var replace = '<b>' + sel + '</b>';

                // Here we are replacing the selected text with this one
                textarea.value = textarea.value.substring(0,start) + replace + textarea.value.substring(end,len);

                var formatted = textarea.value;
                document.getElementById('field').value = formatted;
            }
            <%--function replaceSplChar(str)
            {
              if(str!='') {
                    strToReplace=str.toString();
                    finalstrToReplace='';
                    for(var i=0;i<strToReplace.length;i++){
                        if(strToReplace.charAt(i)=='&'){
                            //strToReplace=strToReplace.replace('&', '%26');
                            finalstrToReplace=finalstrToReplace+'%26';

                //i=i+2;
                //strToReplace.length=strToReplace.length+2;
            }else  if(strToReplace.charAt(i)=='˚'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'&deg;';
            }else if(strToReplace.charAt(i)=='Ω'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'&#8486;';
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
                finalstrToReplace=finalstrToReplace+'&rig;';
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



}--%>
function replaceSplCharBack(str)
{
    if(str!='') {
        strToReplace=str.toString();
        finalstrToReplace='';
        for(var i=0;i<strToReplace.length;i++){
            if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='d' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='g' && strToReplace.charAt(i+4)==';'){
                
                finalstrToReplace=finalstrToReplace+'˚';
                strToReplace=strToReplace.replace('deg;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='8' && strToReplace.charAt(i+3)=='4' && strToReplace.charAt(i+4)=='8' && strToReplace.charAt(i+5)=='6' && strToReplace.charAt(i+6)==';'){

                finalstrToReplace=finalstrToReplace+'Ω';
                strToReplace=strToReplace.replace('#8486;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='p' && strToReplace.charAt(i+2)=='l' && strToReplace.charAt(i+3)=='u' && strToReplace.charAt(i+4)=='s' && strToReplace.charAt(i+5)=='m' && strToReplace.charAt(i+6)=='n' && strToReplace.charAt(i+7)==';'){

                finalstrToReplace=finalstrToReplace+'±';
                strToReplace=strToReplace.replace('plusmn;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='1' && strToReplace.charAt(i+3)=='4' && strToReplace.charAt(i+4)=='9' && strToReplace.charAt(i+5)==';'){

                finalstrToReplace=finalstrToReplace+'•';
                strToReplace=strToReplace.replace('&#149;', '');
            }else if(strToReplace.charAt(i)=='Â'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'';
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='n' && strToReplace.charAt(i+2)=='b' && strToReplace.charAt(i+3)=='s' && strToReplace.charAt(i+4)=='p' && strToReplace.charAt(i+5)==';'){

                finalstrToReplace=finalstrToReplace+'';
                strToReplace=strToReplace.replace('nbsp;', ' ');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='r' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='g' && strToReplace.charAt(i+4)==';'){

                finalstrToReplace=finalstrToReplace+'®';
                strToReplace=strToReplace.replace('reg;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='1' && strToReplace.charAt(i+3)=='2' && strToReplace.charAt(i+4)=='8' && strToReplace.charAt(i+5)==';'){

                finalstrToReplace=finalstrToReplace+'€';
                strToReplace=strToReplace.replace('&#128;;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='p' && strToReplace.charAt(i+2)=='o' && strToReplace.charAt(i+3)=='u' && strToReplace.charAt(i+4)=='n' && strToReplace.charAt(i+5)=='d' && strToReplace.charAt(i+6)==';'){

                finalstrToReplace=finalstrToReplace+'£';
                strToReplace=strToReplace.replace('pound;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='y' && strToReplace.charAt(i+2)=='e' && strToReplace.charAt(i+3)=='n' && strToReplace.charAt(i+4)==';'){

                finalstrToReplace=finalstrToReplace+'¥';
                strToReplace=strToReplace.replace('yen;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='c' && strToReplace.charAt(i+2)=='o' && strToReplace.charAt(i+3)=='p' && strToReplace.charAt(i+4)=='y' && strToReplace.charAt(i+5)==';'){

                finalstrToReplace=finalstrToReplace+'©';
                strToReplace=strToReplace.replace('copy;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='t' && strToReplace.charAt(i+2)=='r' && strToReplace.charAt(i+3)=='a' && strToReplace.charAt(i+4)=='d' && strToReplace.charAt(i+5)=='e' && strToReplace.charAt(i+6)==';'){

                finalstrToReplace=finalstrToReplace+'™';
                strToReplace=strToReplace.replace('trade;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='8' && strToReplace.charAt(i+3)=='8' && strToReplace.charAt(i+4)=='0' && strToReplace.charAt(i+5)=='0' && strToReplace.charAt(i+6)==';'){

                finalstrToReplace=finalstrToReplace+'≠';
                strToReplace=strToReplace.replace('#8800;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='8' && strToReplace.charAt(i+3)=='8' && strToReplace.charAt(i+4)=='0' && strToReplace.charAt(i+5)=='4' && strToReplace.charAt(i+6)==';'){

                finalstrToReplace=finalstrToReplace+'≤';
                strToReplace=strToReplace.replace('#8804;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='8' && strToReplace.charAt(i+3)=='8' && strToReplace.charAt(i+4)=='0' && strToReplace.charAt(i+5)=='5' && strToReplace.charAt(i+6)==';'){

                finalstrToReplace=finalstrToReplace+'≥';
                strToReplace=strToReplace.replace('#8805;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='4' && strToReplace.charAt(i+3)=='3' && strToReplace.charAt(i+4)==';'){

                finalstrToReplace=finalstrToReplace+'÷';
                strToReplace=strToReplace.replace('&#43;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='3' && strToReplace.charAt(i+3)=='3' && strToReplace.charAt(i+4)==';'){

                finalstrToReplace=finalstrToReplace+'!';
                strToReplace=strToReplace.replace('&#33;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='q' && strToReplace.charAt(i+2)=='u' && strToReplace.charAt(i+3)=='o' && strToReplace.charAt(i+4)=='t' && strToReplace.charAt(i+5)==';'){

                finalstrToReplace=finalstrToReplace+'"';
                strToReplace=strToReplace.replace('quot;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='9' && strToReplace.charAt(i+3)=='6' && strToReplace.charAt(i+4)==';'){

                finalstrToReplace=finalstrToReplace+'`';
                strToReplace=strToReplace.replace('#96;', '');
            }else if(strToReplace.charAt(i)=='&' && strToReplace.charAt(i+1)=='#' && strToReplace.charAt(i+2)=='1' && strToReplace.charAt(i+3)=='2' && strToReplace.charAt(i+4)=='9' && strToReplace.charAt(i+5)==';'){

                finalstrToReplace=finalstrToReplace+' ';
                strToReplace=strToReplace.replace('#129;', '');
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

function validateForm() {
    var count=0;
    var count1=0;
    var msg='';
    var articleExist=0;
    if((document.master.contactDetails1.value.replace(/^\s+|\s+$/g,""))==''){
        alert("Customer name is required.");
        updateClickCounter=0;
        saveClickCounter=0;
        return false;
    }
    for(k=1;k<=document.getElementById('article_table').rows.length-1;k++){
        if(eval("document.master.article_id"+k)!=null && eval("document.master.article_id"+k)!=undefined){
            if((eval("document.master.article_id"+k).value).replace(/^\s+|\s+$/g,"").length<=1 && document.getElementById("article_desc"+k).innerHTML.length <= 6 && articleExist!=1){
                msg='Quotation can not be created, \n Enter at least one item';
                count1=count1+1;
            }

            if((eval("document.master.article_id"+k).value).replace(/^\s+|\s+$/g,"").length >3  && document.getElementById("article_desc"+k).innerHTML.length >15 && (eval("document.master.quantity"+k).value == '' || eval("document.master.quantity"+k).value == '0' || parseInt(eval("document.master.quantity"+k).value) == 0)){
                msg='Please enter valid quantity for the item you have selected';
                count=count+1;
                articleExist=1;
            }
        }
    }
    if(count==0 && parseInt(count1) != parseInt(document.getElementById('article_table').rows.length-1)){
        return true;
    }
    else{
        alert(msg);
        return false;
    }

}
function calTotal(value,id){

    //alert(eval("document.master.quantity"+id).value);
    //alert(eval("document.master.price"+id).value);
    if(eval("document.master.quantity"+id).value != "" && eval("document.master.price"+id).value != ""){
        var tot=accMul(parseFloat(eval("document.master.quantity"+id).value),parseFloat(eval("document.master.price"+id).value));
        document.getElementById("total"+id).innerHTML=(tot.toFixed(2));
        grandTotal();
    }else{
        alert("Please Enter either quantity or Article Price.");
    }
}

function accMul(arg1,arg2){
    var m=0,s1=arg1.toString(),s2=arg2.toString();
    try{
        m+=s1.split(".")[1].length;
    }catch(e){
    }
    try{
        m+=s2.split(".")[1].length;
    }catch(e){}
    return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
}

function next() {

    document.master.records.value=document.getElementById('article_table').rows.length-1;
    document.master.contactrecords.value=document.getElementById('contactDetailsTable').rows.length-1;
    oArea = document.getElementById('contactAddress');
    //alert(document.getElementById('contactAddress').rows);
    var aNewlines = oArea.value.split("\n");
    var lines = document.getElementById("contactAddress").value.split(/\r|\r\n|\n/);
    for(i=1; i<= document.master.records.value;i++){
        if(document.getElementById("article_tech_desc"+i) != null){
            var articleTechDesc = document.getElementById("article_tech_desc"+i).value;
            var intIndexOfMatch = articleTechDesc.indexOf("  +");

            while (intIndexOfMatch != -1){
                articleTechDesc = articleTechDesc.replace( "  +", "&spc;" )
                intIndexOfMatch = articleTechDesc.indexOf( "  +" );
            }


            document.getElementById("article_tech_desc"+i).value = replaceSplChar(articleTechDesc);
            //for(j=0;j<articleTechDesc.length;j++){
            //  alert(articleTechDesc[j]);
            //}
        }else{
            continue;
        }
    }
    //var iNewlineCount = aNewlines.length();
    //alert(lines.length);
    //alert("before action"+document.master.records.value+"VALUE OF CDET."+document.master.contactrecords.value);
    document.master.action="FinalQuot.jsp?save=true";
    document.master.submit();

}
function grandTotal(){
    var grandTotal=0;
    var totalNet=0;
    for(k=1;k<=document.getElementById('article_table').rows.length-1;k++)
    {
        if(document.getElementById("total"+k) != null && document.getElementById("total"+k) != undefined){
            if(isNaN(parseInt(document.getElementById("total"+k).innerHTML.replace('&nbsp;','')))){
                grandTotal=grandTotal+0;
                document.master.grandTotal.value=grandTotal.toFixed(2);
            }
            else{
                grandTotal=parseFloat(grandTotal)+parseFloat(document.getElementById("total"+k).innerHTML.replace('&nbsp;',''));
                document.master.grandTotal.value=grandTotal.toFixed(2);
            }
            //                  if(!isNaN(parseFloat(eval("document.master.quantity"+k).value)*parseFloat(eval("document.master.price"+k).value)))
            //                      totalNet=parseFloat(totalNet)+parseFloat(eval("document.master.quantity"+k).value)*parseFloat(eval("document.master.price"+k).value);
        }
    }
    //document.master.totalNet.value=parseFloat(totalNet).toFixed(2);
    //document.master.totalTax.value=(parseFloat(document.master.grandTotal.value)-parseFloat(document.master.totalNet.value)).toFixed(2);
}
function formatText(el,tag){
    if (window.getSelection) {  // all browsers, except IE before version 9
        var selectionRange = window.getSelection ();
        alert ("The text content of the selection:\n" + selectionRange);
    }
    else {
        if (document.selection.type == 'None') {
            alert ("No content is selected, or the selected content is not available!");
        }
        else {
            var textRange = document.selection.createRange ();
            alert ("The text content of the selection:\n" + textRange.text);
        }
    }
    var selectedText = document.selection.createRange().text;
    alert(selectedText);

    var selectedText=document.selection?document.selection.createRange().text:el.value.substring(el.selectionStart,el.selectionEnd);// IE:Moz
    var newText='<'+tag+'>'+selectedText+'</'+tag+'>';
    if(document.selection){//IE
        document.selection.createRange().text=newText;
    }
    else{//Moz
        el.value=el.value.substring(0,el.selectionStart)+newText+el.value.substring(el.selectionEnd,el.value.length);
    }
} 

        </SCRIPT>

        <form id="InsideContainer" name="master" method="post">
            <input type="hidden" name="records" value=""/>
            <input type="hidden" name="contactrecords" value=""/>
            <input type="hidden" name="cur" id="cur"/>
            <table>
                <tr>
                    <td>
                        Our Ref :
                    </td>
                    <td>
                        <input type="text" name="quotId" id="qID" value="JKG/11-12/<%= quot_id%>"/>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        Date :
                    </td>
                    <td>
                        <input type="text" name="date" id="date" value="<%= todayStr%> "/>
                    </td>
                </tr>

            </table>
            <table id="contactDetailsTable">
                <% for (int k = 1; k <= 1; k++) {%>
                <tr id="rowID<%=k%>"><td></td></tr>
                <tr>
                    <td><input type="textbox" name="name<%= k%>" size="50" value="" onchange="getContactValues(<%= k%>,this.value);"/></td><br>
                </tr>
                <%}%>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td>
                        <textarea name="contactAddress" id="contactAddress" cols="50" rows="5">

                        </textarea>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        Subject:
                    </td>
                    <td>
                        <input type="textbox" size="130" name="subject" value=""/>
                    </td>
                </tr>
            </table>
            <table id="article_table" width="80%" align="center" border="1" cellspacing="0" bordercolor="#FFFFFF">
                <tr>
                    <th align="center" bgcolor="#0092C8" width="10%"><b><font color="white" size="2" face="verdana">Article Code</font></b></th>
                    <th align="center" bgcolor="#0092C8" width="40%"><b><font color="white" face="verdana">Description</font></b></th>
                    <th align="center" bgcolor="#0092C8" width="5%"><b><font color="white" face="verdana">Qty.</font></b></th>
                    <th align="center" bgcolor="#0092C8" width="5%"><b><font color="white" face="verdana">Currency</font></b></th>
                    <th align="center" bgcolor="#0092C8" width="10%"><b><font color="white" face="verdana">Price</font></b></th>
                    <th align="center" bgcolor="#0092C8" width="10%"><b><font color="white" face="verdana">Net<BR>Amnt.</font></b></th>
                </tr>
                <% for (int i = 1; i <= 1; i++) {%>
                <tr id="rowID<%=i%>">
                    <td>
                        <input type="text" name="article_id<%= i%>" id="article_id<%= i%>" size="10" autocomplete="off" maxlength="25"  onchange="getValues(<%= i%>,this.value);"   onkeyup="KeyCheck(event,'article_id<%= i%>','','search_suggest<%=(i + 2)%>','getData.jsp?articleDescQty='+replaceSplChar(this.value));">
                        <input type="hidden" name="article_type<%= i%>" value=""><br><div  name="suggestion" id="search_suggest<%= i + 2%>" style="display:none;width:280px;"></div>
                    </td>
                    <td align="center" >
                        <input type="text"  name="article_desc<%= i%>" size="100"   autocomplete="off" >

                    </td>
                    <td align="center"><input type="text" name="quantity<%= i%>" size="2" maxlength="10" autocomplete="off"  onkeypress="" onchange="calTotal(this.value,<%= i%>)"></td>
                    <td align="center"><input type="text"  name="article_curr<%= i%>" size="2"   autocomplete="off"  ></td>
                    <td align="center"><input type="text"  name="price<%= i%>" size="5"   autocomplete="off"  onchange="calTotal(this.value,<%= i%>)"  onblur='calTotal(this.value,<%= i%>)' ></td>
                    <td align="center"><div id="total<%= i%>">&nbsp;</div>
                        <input type="hidden" name="total<%= i%>" value="" >
                    </td>
                </tr>

                <tr id="rowID<%=i + 1%>">
                    <td>
                    </td>
                    <td align="center" >
                        <div id="wmd-button-bar" class="wmd-button-bar">
                            <ul id="wmd-button-row" class="wmd-button-row">
                                <li id="wmd-bold-button" class="wmd-button" style="left: 0px; ">
                                    <span style="background-position: 0px -20px; "></span>
                                </li>
                                <li id="wmd-italic-button" class="wmd-button" style="left: 25px; ">
                                    <span style="background-position: -20px -20px; "></span>
                                </li>
                                <li id="wmd-spacer1" class="wmd-spacer" style="left: 50px; ">
                                    <span style="background-position: -40px -20px; "></span>
                                </li>
                                <li id="wmd-link-button" class="wmd-button" style="left: 75px; ">
                                    <span style="background-position: -40px -20px; "></span>
                                </li>
                                <li id="wmd-quote-button" class="wmd-button" style="left: 100px; ">
                                    <span style="background-position: -60px -20px; "></span>
                                </li>
                                <li id="wmd-code-button" class="wmd-button" style="left: 125px; ">
                                    <span style="background-position: -80px -20px; "></span>
                                </li>
                                <li id="wmd-image-button" class="wmd-button" style="left: 150px; ">
                                    <span style="background-position: -100px -20px; "></span>
                                </li>
                                <li id="wmd-spacer2" class="wmd-spacer" style="left: 175px; ">
                                    <span style="background-position: -120px -20px; "></span>
                                </li>
                                <li id="wmd-olist-button" class="wmd-button" style="left: 200px; ">
                                    <span style="background-position: -120px -20px; "></span>
                                </li>
                                <li id="wmd-ulist-button" class="wmd-button" style="left: 225px; ">
                                    <span style="background-position: -140px -20px; "></span>
                                </li>
                                <li id="wmd-heading-button" class="wmd-button" style="left: 250px; ">
                                    <span style="background-position: -160px -20px; "></span>
                                </li>
                                <li id="wmd-hr-button" class="wmd-button" style="left: 275px; ">
                                    <span style="background-position: -180px -20px; "></span>
                                </li>
                                <li id="wmd-spacer3" class="wmd-spacer" style="left: 300px; ">
                                    <span style="background-position: -200px -20px; "></span>
                                </li>
                                <li id="wmd-undo-button" class="wmd-button" style="left: 325px; ">
                                    <span style="background-position: -200px -20px; "></span>
                                </li>
                                <li id="wmd-redo-button" class="wmd-button" style="left: 350px; ">
                                    <span style="background-position: -220px -20px; "></span>
                                </li>
                            </ul>
                        </div>

                        <%--<input type="button" value="bold" onclick="formatText ('article_tech_desc<%=i%>','b');" />
                                        <input type="button" value="italic" onclick="formatText ('article_tech_desc<%=i%>','i');" />
                                        <input type="button" value="underline" onclick="formatText ('article_tech_desc<%=i%>','u');" />--%>

                        <textarea name='article_tech_desc<%=i%>' id='article_tech_desc<%=i%>' cols='100' rows='20'></textarea>
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                </tr>
                <%
                    }%>
            </table>
            <table width="80%" align="center" cellspacing="0" bordercolor="#FFFFFF">
                <tr>

                    <td align="left" width="20%">
                        <a href="javascript:addArticle(1);" >ADD ARTICLES</a><input type='hidden' name='articleDescAddHidden"+(rows+j)+"' value=''>
                    </td>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td align="right"><b>Total Net Amt.</b><input type="text" readonly name='grandTotal' size='10' value=""></td>

                </tr>
                <tr>
                    <td align="center" colspan="3">


                        <input type="button" class="button"  value="next" name="saveQuot" onclick="next();">

                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>

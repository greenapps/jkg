<html>
    <link rel="stylesheet" type="text/css" href="./css/effects.css">
    <jsp:include page="home.jsp"></jsp:include>
    <SCRIPT>
        function print() {
            //document.master.records.value=document.getElementById('termCondTable').rows.length-1;
            //document.master.itemrecords.value=document.getElementById('optionsDetails').rows.length-1;

            for (var i=0; i < document.master.check.length; i++)
            {
                if (document.master.check[i].checked)
                {
                    var rad_val = document.master.check[i].value;
                    alert(rad_val);
                    document.master.VAL.value=rad_val;
                    document.master.action="QuotationPdf.jsp";
                    document.master.submit();
                }
            }
        }
        function createDoc() {
            alert('HIII');
            document.master.action="QuotDOC.jsp";
            document.master.submit();
        }
  

    </SCRIPT>

    <form id="InsideContainer" name="master" method="get">
        <input type="hidden" name="VAL">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th width="100%" align="center"> <b>:: MESSAGE PAGE ::</b></th>
            </tr>
            <tr>
                <td width="100%" align="center">
                    <font align="center" size="2" color="blue"><b>Data saved successfully. congrats</b></font>
                </td>
            </tr>
            <tr>
                <th width="100%" align="center">Do You Want Header /Footer and Digital Signature in pdf.</th>
            </tr>
            <tr>
                <th width="100%" align="center">
                    <input type="radio" name="check" id="Y" value="Y" CHECKED>YES
                </th>
            </tr>
            <tr>
                <th width="100%" align="center">
                    <input type="radio" name="check" id="N" value="N">NO
                </th>
            </tr>

            <tr>
                <th colspan="1" align="center">
                    <input class="button"  type="button" value="CreateDoc" name="createDo" onclick="createDoc();">
                    <input class="button"  type="button" value="Print" name="saveQuot" onclick="print();">
                </th>
                <th colspan="1" align="left">

                </th>
            </tr>

        </table>
    </form>
</html>
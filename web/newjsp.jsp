<%-- 
    Document   : newjsp
    Created on : Jun 11, 2012, 9:02:02 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script type="text/javascript">
            function GetSelection () {
                var selection = "";

                var textarea = document.getElementById("field");
                if ('selectionStart' in textarea) {
                    // check whether some text is selected in the textarea
                    if (textarea.selectionStart != textarea.selectionEnd) {
                        selection = textarea.value.substring  (textarea.selectionStart,

                        textarea.selectionEnd);
                    }
                }
                else {  // Internet Explorer before version 9
                    // create a range from the current selection
                    var textRange = document.selection.createRange ();
                    // check whether the selection is within the textarea
                    var rangeParent = textRange.parentElement ();
                    if (rangeParent === textarea) {
                        selection = textRange.text;

                    }
                }

                if (selection == "") {
                    alert ("No text is selected.");
                }
                else {
                    selection = "<b>"+selection+"</b>";
                    document.getElementById('field').value = selection;

                }
            }
        </script>

    <body>
        <textarea id="field" spellcheck="false">Select some text within this field.</textarea>
        <button onclick="GetSelection ()">Get the current selection</button>
    </body>
</html>

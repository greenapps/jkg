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
            if(strToReplace.charAt(i)=='&'){
                //strToReplace=strToReplace.replace('&', '%26');
                finalstrToReplace=finalstrToReplace+'%26';

                //i=i+2;
                //strToReplace.length=strToReplace.length+2;
            }else if(strToReplace.charAt(i)=='%'){
                //strToReplace=strToReplace.replace('%', '%25');
                finalstrToReplace=finalstrToReplace+'%25';
                //i=i+2;
               // strToReplace.length=strToReplace.length+2;
            }else if(strToReplace.charAt(i)=='#'){
                //strToReplace=strToReplace.replace('%', '%23');
                finalstrToReplace=finalstrToReplace+'%23';
            }else if(strToReplace.charAt(i)=='$'){
                //strToReplace=strToReplace.replace('%', '%24');
                finalstrToReplace=finalstrToReplace+'%24';
            }else if(strToReplace.charAt(i)=='.'){
                //strToReplace=strToReplace.replace('%', '%2E');
                finalstrToReplace=finalstrToReplace+'%2E';
            }else if(strToReplace.charAt(i)=='/'){
                //strToReplace=strToReplace.replace('%', '%2F');
                finalstrToReplace=finalstrToReplace+'%2F';
            }else if(strToReplace.charAt(i)=='\\'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%5C';
            }else if(strToReplace.charAt(i)=='\''){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%27';
            }else if(strToReplace.charAt(i)=='"'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%22';
            }else if(strToReplace.charAt(i)=='/+'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%2B';
            }else if(strToReplace.charAt(i)=='*'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%2A';
            }else if(strToReplace.charAt(i)=='˚'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'&deg;';
            }else if(strToReplace.charAt(i)=='Ω'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'&#8486;';
            }
            else if(strToReplace.charAt(i)=='±'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'&plus;';
            }else{
                strToReplace=strToReplace;
                finalstrToReplace=finalstrToReplace+strToReplace.charAt(i);
            }
           // alert('i'+i+'strToReplace.length'+strToReplace.length+'STRING'+finalstrToReplace);

        }
        return finalstrToReplace;
  }



}
function replaceSplCharback(str)
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
            }else if(strToReplace.charAt(i)=='%'){
                //strToReplace=strToReplace.replace('%', '%25');
                finalstrToReplace=finalstrToReplace+'%25';
                //i=i+2;
               // strToReplace.length=strToReplace.length+2;
            }else if(strToReplace.charAt(i)=='#'){
                //strToReplace=strToReplace.replace('%', '%23');
                finalstrToReplace=finalstrToReplace+'%23';
            }else if(strToReplace.charAt(i)=='$'){
                //strToReplace=strToReplace.replace('%', '%24');
                finalstrToReplace=finalstrToReplace+'%24';
            }else if(strToReplace.charAt(i)=='.'){
                //strToReplace=strToReplace.replace('%', '%2E');
                finalstrToReplace=finalstrToReplace+'%2E';
            }else if(strToReplace.charAt(i)=='/'){
                //strToReplace=strToReplace.replace('%', '%2F');
                finalstrToReplace=finalstrToReplace+'%2F';
            }else if(strToReplace.charAt(i)=='\\'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%5C';
            }else if(strToReplace.charAt(i)=='\''){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%27';
            }else if(strToReplace.charAt(i)=='"'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%22';
            }else if(strToReplace.charAt(i)=='/+'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%2B';
            }else if(strToReplace.charAt(i)=='*'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'%2A';
            }else if(strToReplace.charAt(i)=='&deg;'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'˚';
            }else if(strToReplace.charAt(i)=='&#8486;'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'Ω';
            }
            else if(strToReplace.charAt(i)=='&plus;'){
                //strToReplace=strToReplace.replace('%', '%5C');
                finalstrToReplace=finalstrToReplace+'±';
            }else{
                strToReplace=strToReplace;
                finalstrToReplace=finalstrToReplace+strToReplace.charAt(i);
            }
           // alert('i'+i+'strToReplace.length'+strToReplace.length+'STRING'+finalstrToReplace);

        }
        return finalstrToReplace;
  }


return str;
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

//The Follwing block added by Manoj to Disable Right Click through out the Application
/*var message="";
function clickIE(){
    if (document.all){
        (message);
        return false;
    }
}
function clickNS(e) {
    if(document.layers||(document.getElementById&&!document.all)){
        if (e.which==2||e.which==3) {
            (message);
            return false;
        }
    }
}
if (document.layers){
    document.captureEvents(Event.MOUSEDOWN);
    document.  onmousedown=clickNS;
}
else{
    document.onmouseup=clickNS;
    document.oncontextmenu  =clickIE;
}
document.oncontextmenu=new Function("return false")
*/
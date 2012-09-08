/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

/**
 *
 * @author Anshujkumar
 */
public class StringFormat {
    /** Creates a new instance of StringFormat */
    public StringFormat() {
    }

    public static String replaceSpecialCharacter(String str){
        if(str.equals(""))
            return "";
        else if(str.equals("null"))
            return "null";
        else{
            StringBuffer sbr = new StringBuffer(2*str.length());
            for(int i=0;i<str.length();i++){
                if(str.charAt(i)=='&'){
                    sbr.append("&amp;");
                }else if(str.charAt(i)=='<'){
                    sbr.append("&lt;");
                }else if(str.charAt(i)=='>'){
                    sbr.append("&gt;");
                }/* Commented By subodh Dubey on 14-04-2007 because it print & inplace of "." */
		/*else if(str.charAt(i)=='.'){
                    sbr.append("&middot;");
                }*/else if(str.charAt(i)=='"'){
                    sbr.append("&quot;");
                }/*else if(str.charAt(i)=='\''){
                    sbr.append("&apos;");
                }else if(str.charAt(i)=='%'){
                    sbr.append("&permil;");
                }else if(str.charAt(i)=='*'){
                    sbr.append("&lowast;");
                }else if(str.charAt(i)=='ñ'){
                    sbr.append("&ntilde;");
                }else if(str.charAt(i)=='@'){
                    sbr.append("%");
                }*/else{
                    sbr.append(str.charAt(i));
                }
            }
            return sbr.toString();
        }
    }//end of method

    /* Below Method Added By Madhav - 28-07-2009 : To insert while space in the string according to pos.
     specified by breakpoint  */

    public static String addSpaceToString(String str,int breakpoint){

        String[] strArr=str.split(" ");
        int check=0;
        String chngString="";
        for(int i=0;i<strArr.length;i++){

            StringBuffer sb=new StringBuffer(strArr[i]);
            check=sb.length()/breakpoint;

            for(int j=1;j<=check;j++){
                sb.insert((j*breakpoint+j-1), ' ');
              }

            System.out.println(sb);
            chngString=chngString+sb;
        }
        System.out.println("\nRETURN......"+chngString);

        return chngString;
    
    } // END OF METHOD
}

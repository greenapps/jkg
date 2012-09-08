package reports;

//import org.apache.fop.apps.Options;
import org.xml.sax.InputSource;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Calendar;
import java.util.Properties;
import java.util.Vector;

//import common.ServletHelp;
//import daoservice.*;
//import general.PrinterBean;
//import org.apache.log.*;
public class FileOpenerServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        //ServletHelp sh = new ServletHelp();
        //DAOService dao = sh.lookUp();
        //ApproversDAO adao = dao.getApproversDAO();
        System.out.println("MUBARAKAN THODI SI HAI");
        String PDFDIR = "/html/pdf/";
        PDFDIR = req.getSession().getServletContext().getRealPath("") + java.io.File.separator + PDFDIR;

        //String userConfigPath = "userConfigPath";
        //userConfigPath=PDFDIR+java.io.File.separator+userConfigPath;

        String contextPath = req.getContextPath();
        String filetoopen = req.getParameter("filetoopen");
        String foFileName = filetoopen + ".fo";

        //Logger log = null;
        try {
//            if (log == null) {
//                Hierarchy hierarchy = Hierarchy.getDefaultHierarchy();
//                log = hierarchy.getLoggerFor("fop");
//                log.setPriority(Priority.WARN);
//            }
            FileInputStream foFile = new FileInputStream(PDFDIR + foFileName);
            ByteArrayOutputStream out = new ByteArrayOutputStream();



            //Options option = new Options(new File(userConfigPath));


            org.apache.fop.apps.Driver renderer = new org.apache.fop.apps.Driver(new InputSource(foFile), out);
            System.err.println("value of inasciiformat=" + req.getParameter("inasciiformat"));
            String textFileName = "";
            if (req.getParameter("inasciiformat") != null) {
                System.err.println("Report Output in TextFormat");
                //if (req.getSession().getAttribute("userlayout") == null) {
                Calendar cal = Calendar.getInstance();
                String date = "" + cal.get(Calendar.DATE);
                date = date + cal.get(Calendar.MONTH);
                date = date + cal.get(Calendar.YEAR);
                date = date + cal.get(Calendar.HOUR);
                date = date + cal.get(Calendar.MINUTE);
                date = date + cal.get(Calendar.SECOND);
                textFileName = filetoopen + date + ".txt";

                System.err.println("Path to Text File=" + textFileName);
                OutputStream outputStream = new FileOutputStream(new File(PDFDIR + textFileName));
                renderer.setRenderer(org.apache.fop.apps.Driver.RENDER_TXT);
                //renderer.setLogger(log);
                renderer.run();
                byte[] content = out.toByteArray();
                res.setContentType("text/html");
                out.writeTo(outputStream);
                out.close();
                outputStream.close();
                //}
                String emp = (String) session.getAttribute("emp_id");
                String outlet_id = (String) session.getAttribute("outlet_id");
//                Vector vecPrinter = new Vector();
//                vecPrinter = adao.getPrinter(emp);

                String remarks = (String) session.getAttribute("remarks");
                String crnoteamt = (String) session.getAttribute("FinalCRNAmt");


                String serverLocation = "http://" + req.getServerName() + ":" + req.getServerPort();
                String textFileURL = serverLocation + req.getContextPath() + "/html/pdf/" + textFileName;
                String appletLocation = serverLocation + req.getContextPath() + "/applet/";
                System.out.println("++++++++++FormatTYpe++++++++++" + req.getSession().getAttribute("formattype") + "APllet LOCATION" + appletLocation);

                String pageContent = "<html><head>\n<applet codebase='" + appletLocation + "' archive='commons-httpclient.jar,log4j.jar'  code='PrintApplet' width='1000' height='950'>"
                        + "\n<param name='formattype' value='" + req.getSession().getAttribute("formattype") + "' >"
                        + (req.getSession().getAttribute("userlayout") != null ? "\n<param name='userlayout' value='y'>" : "")
                        + "\n<param name='textFileURL' value='" + textFileURL + "'>"
                        + "\n<param name='clientName' value='" + req.getSession().getAttribute("clientName") + "'>"
                        + "\n<param name='clientAddress' value='" + req.getSession().getAttribute("clientAddress") + "'>"
                        + "\n<param name='cedulaNo' value='" + req.getSession().getAttribute("cedulaNo") + "'>"
                        + "\n<param name='phone' value='" + req.getSession().getAttribute("phone") + "'>"
                        + "\n<param name='remarks' value='" + req.getSession().getAttribute("remarks") + "'>"
                        + "\n<param name='crnoteamt' value='" + req.getSession().getAttribute("FinalCRNAmt") + "'>"
                        + "\n<param name='condition' value='" + req.getSession().getAttribute("condition") + "'>"
                        + "\n<param name='vencimiento' value='" + req.getSession().getAttribute("vencimiento") + "'>"
                        + "\n<param name='via' value='" + req.getSession().getAttribute("via") + "'>"
                        + "\n<param name='instruccion' value='" + req.getSession().getAttribute("instruccion") + "'>"
                        + "\n<param name='ponumber' value='" + req.getSession().getAttribute("ponumber") + "'>"
                        + "\n<param name='client_id' value='" + req.getSession().getAttribute("client_id") + "'>"
                        + "\n<param name='employeeName' value='" + req.getSession().getAttribute("employeeName") + "'>"
                        + "\n<param name='gv_id' value='" + req.getSession().getAttribute("gv_id") + "'>"
                        + "\n<param name='outletName' value='" + req.getSession().getAttribute("outletName") + "'>"
                        + "\n<param name='clientVendorId' value='" + req.getSession().getAttribute("clientVendorId") + "'>"
                        + "\n<param name='invoiceAgainst' value='" + req.getSession().getAttribute("invoiceAgainst") + "'>"
                        + "\n<param name='invoiceAmt' value='" + req.getSession().getAttribute("invoiceAmt") + "'>"
                        + "\n<param name='invoiceDt' value='" + req.getSession().getAttribute("invoiceDt") + "'>"
                        + "\n<param name='invoiceId' value='" + req.getSession().getAttribute("invoiceId") + "'>"
                        + "\n<param name='clientRemarks' value='" + req.getSession().getAttribute("clientRemarks") + "'>"
                        + "\n<param name='salsmanId' value='" + req.getSession().getAttribute("salsmanId") + "'>"
                        + "\n<param name='outlet_id' value='" + req.getSession().getAttribute("outlet_id") + "'>"
                        + //Added By Anuj Kumar on 24th Nov,2011 to perform ip base invoice printing
                        "\n<param name='ipaddress' value='" + req.getLocalAddr().toString() + "'>"
                        + "\n<param name='showPayment' value='" + req.getSession().getAttribute("showPayment") + "'>"
                        + "\n<param name='refundAmount' value='" + req.getSession().getAttribute("refundAmount") + "'>"
                        + //                        "\n<param name='vecPrinterSize' value='" + vecPrinter.size() + "'>" +
                        "\n<param name='abonoCancelflag' value='" + req.getSession().getAttribute("abonoCancelFlag") + "'>"
                        + "\n<param name='articleSize' value='" + req.getSession().getAttribute("articleSize") + "'>"
                        + "\n<param name='articleSizeWH' value='" + req.getSession().getAttribute("articleSizeWH") + "'>"
                        + "\n<param name='farticletot' value='" + req.getSession().getAttribute("farticletot") + "'>";
                int articleSize = java.lang.Integer.parseInt((String) (req.getSession().getAttribute("articleSize")) != null ? (String) req.getSession().getAttribute("articleSize") : "0");
                int articleSizeWH = java.lang.Integer.parseInt((String) (req.getSession().getAttribute("articleSizeWH")) != null ? (String) req.getSession().getAttribute("articleSizeWH") : "0");
                String articleParam = "";


                int articleSizeVec = java.lang.Integer.parseInt((String) (req.getSession().getAttribute("articleSizeVec")) != null ? (String) req.getSession().getAttribute("articleSizeVec") : "0");
                for (int m = 0; m < articleSizeVec; m++) {
                    String Article_id = (String) req.getSession().getAttribute("articleId" + m);
                    System.out.println("Article idd is Layaway**********------>>>>>>" + Article_id);
                    articleParam = articleParam + "\n<param name='articleId" + m + "' value='" + req.getSession().getAttribute("articleId" + m) + "'>";

                    String articleDesc = (String) req.getSession().getAttribute("articleDesc" + m);

                    if (articleDesc.length() > 30) {
                        articleDesc = articleDesc.substring(0, 30);
                        System.out.println("articleDesc.after substring..." + articleDesc);

                        req.getSession().setAttribute("articleDesc" + m, articleDesc);
                    }
                    articleParam = articleParam + "\n<param name='articleDesc" + m + "'  value='" + req.getSession().getAttribute("articleDesc" + m) + "'>";
                    articleParam = articleParam + "\n<param name='articleQty" + m + "'  value='" + req.getSession().getAttribute("articleQty" + m) + "'>";
                    articleParam = articleParam + "\n<param name='articleRate" + m + "'  value='" + req.getSession().getAttribute("articleRate" + m) + "'>";
                    articleParam = articleParam + "\n<param name='unitPrice" + m + "'  value='" + req.getSession().getAttribute("unitPrice" + m) + "'>";
                    articleParam = articleParam + "\n<param name='valueWithTax" + m + "'  value='" + req.getSession().getAttribute("valueWithTax" + m) + "'>";

                }
                articleParam = articleParam + "\n<param name='currentAmount'  value='" + req.getSession().getAttribute("currentAmount") + "'>";
                articleParam = articleParam + "\n<param name='amountPaid'  value='" + req.getSession().getAttribute("amountPaid") + "'>";
                //System.out.println("VALUE OF PAID AMOUNT INSIDE FILE OPENER SERVLET-->>>"+String(req.getSession().getAttribute("amountPaid")));
                articleParam = articleParam + "\n<param name='balanceAmount'  value='" + req.getSession().getAttribute("balanceAmount") + "'>";
                articleParam = articleParam + "\n<param name='articleSizeVec'  value='" + req.getSession().getAttribute("articleSizeVec") + "'>";





                for (int i = 0; i < articleSize; i++) {

                    String articleDesc = (String) req.getSession().getAttribute("articleDesc" + i);

                    if (articleDesc.length() > 30) {
                        articleDesc = articleDesc.substring(0, 30);
                        System.out.println("articleDesc.after substring..." + articleDesc);

                        req.getSession().setAttribute("articleDesc" + i, articleDesc);

                    }


                    articleParam = articleParam + "\n<param name='articleId" + i + "' value='" + req.getSession().getAttribute("articleId" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleDesc" + i + "'  value='" + req.getSession().getAttribute("articleDesc" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleQty" + i + "'  value='" + req.getSession().getAttribute("articleQty" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleRate" + i + "'  value='" + req.getSession().getAttribute("articleRate" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleTot" + i + "'  value='" + req.getSession().getAttribute("articleTot" + i) + "'>";
                    articleParam = articleParam + "\n<param name='printForStore" + i + "'  value='" + req.getSession().getAttribute("printForStore" + i) + "'>";
                }


                for (int i = 0; i < articleSizeWH; i++) {

                    String articleDescWH = (String) req.getSession().getAttribute("articleDescWH" + i);

                    if (articleDescWH.length() > 30) {
                        articleDescWH = articleDescWH.substring(0, 30);
                        req.getSession().setAttribute("articleDescWH" + i, articleDescWH);
                    }


                    articleParam = articleParam + "\n<param name='articleIdWH" + i + "' value='" + req.getSession().getAttribute("articleIdWH" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleDescWH" + i + "'  value='" + req.getSession().getAttribute("articleDescWH" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleQtyWH" + i + "'  value='" + req.getSession().getAttribute("articleQtyWH" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleRateWH" + i + "'  value='" + req.getSession().getAttribute("articleRateWH" + i) + "'>";
                    articleParam = articleParam + "\n<param name='articleTotWH" + i + "'  value='" + req.getSession().getAttribute("articleTotWH" + i) + "'>";
                    articleParam = articleParam + "\n<param name='printForStoreWH" + i + "'  value='" + req.getSession().getAttribute("printForStoreWH" + i) + "'>";
                }


                pageContent = pageContent + articleParam;
                pageContent = pageContent + "\n<param name='blockInvSize' value='" + req.getSession().getAttribute("blockInvSize") + "'>";
                articleParam = "";
                articleSize = java.lang.Integer.parseInt((String) (req.getSession().getAttribute("blockInvSize")) != null ? (String) req.getSession().getAttribute("blockInvSize") : "0");
                for (int i = 0; i < articleSize; i++) {

                    articleParam = articleParam + "\n<param name='blockInvArticleId" + i + "' value='" + req.getSession().getAttribute("blockInvArticleId" + i) + "'>";
                    articleParam = articleParam + "\n<param name='blockInvOutletName" + i + "'  value='" + req.getSession().getAttribute("blockInvOutletName" + i) + "'>";
                    articleParam = articleParam + "\n<param name='blockInvQty" + i + "'  value='" + req.getSession().getAttribute("blockInvQty" + i) + "'>";
                }

//                if (vecPrinter != null && vecPrinter.size() != 0) {
//                    for (int i = 0; i < vecPrinter.size(); i++) {
//                        PrinterBean prb = new PrinterBean();
//                        prb = (PrinterBean) vecPrinter.get(i);
//                        articleParam = articleParam + "\n<param name='printerId" + i + "' value='" + prb.getPrinter_id() + "'>";
//                        articleParam = articleParam + "\n<param name='printerName" + i + "'  value='" + prb.getPrinter_name() + "'>";
//                        articleParam = articleParam + "\n<param name='printerIp" + i + "'  value='" + prb.getPrinter_ip() + "'>";
//                        articleParam = articleParam + "\n<param name='printerPort" + i + "'  value='" + prb.getPrinter_port() + "'>";
//                        articleParam = articleParam + "\n<param name='manualAuto" + i + "'  value='" + prb.getManual_auto() + "'>";
//
//                    }
//                }
                pageContent = pageContent + articleParam;
                pageContent = pageContent + "\n<param name='invoiceSubTot' value='" + req.getSession().getAttribute("invoiceSubTot") + "'>";
                pageContent = pageContent + "\n<param name='invoiceItbm' value='" + req.getSession().getAttribute("invoiceItbm") + "'>";
                pageContent = pageContent + "\n<param name='invoiceTot' value='" + req.getSession().getAttribute("invoiceTot") + "'>";

                Vector veccrnote = (Vector) req.getSession().getAttribute("creditnotebal");

                String CrNotebalinfo = "";
                if (veccrnote != null && veccrnote.size() != 0) {
                    CrNotebalinfo = CrNotebalinfo + "\n<param name='creditnotesize' value='" + veccrnote.size() + "'>";
                    for (int j = 0; j < veccrnote.size(); j++) {
                        CrNotebalinfo = CrNotebalinfo + "\n<param name='creditnote" + j + "' value='" + veccrnote.get(j) + "'>";

                    }
                }
                //add arvind gupta 15-9-05
                Properties propCCardInfo = (Properties) req.getSession().getAttribute("creditcardinfo");

                if (propCCardInfo != null && propCCardInfo.size() != 0) {
                    Properties prop = propCCardInfo;


                    if (propCCardInfo.getProperty("ccname1") != null && propCCardInfo.getProperty("ccname1").length() != 0) {
                        pageContent = pageContent + "\n<param name='ccardname1'  value='" + prop.getProperty("ccname1") + "'>";
                        pageContent = pageContent + "\n<param name='ccardamt1'  value='" + prop.getProperty("ccamt1") + "'>";
                    }
                    if (prop.getProperty("ccname2") != null && prop.getProperty("ccname2").length() != 0) {
                        pageContent = pageContent + "\n<param name='ccardname2'  value='" + prop.getProperty("ccname2") + "'>";
                        pageContent = pageContent + "\n<param name='ccardamt2'  value='" + prop.getProperty("ccamt2") + "'>";
                    }
                    if (prop.getProperty("ccname3") != null && prop.getProperty("ccname3").length() != 0) {
                        pageContent = pageContent + "\n<param name='ccardname3'  value='" + prop.getProperty("ccname3") + "'>";
                        pageContent = pageContent + "\n<param name='ccardamt3'  value='" + prop.getProperty("ccamt3") + "'>";
                    }
                    if (prop.getProperty("ccname4") != null && prop.getProperty("ccname4").length() != 0) {
                        pageContent = pageContent + "\n<param name='ccardname4'  value='" + prop.getProperty("ccname4") + "'>";
                        pageContent = pageContent + "\n<param name='ccardamt4'  value='" + prop.getProperty("ccamt4") + "'>";
                    }
                    if (prop.getProperty("ccname5") != null && prop.getProperty("ccname5").length() != 0) {
                        pageContent = pageContent + "\n<param name='ccardname5'  value='" + prop.getProperty("ccname5") + "'>";
                        pageContent = pageContent + "\n<param name='ccardamt5'  value='" + prop.getProperty("ccamt5") + "'>";
                    }

                }
                //////////////////////////////////////

                pageContent = pageContent + CrNotebalinfo;
                pageContent = pageContent + "\n</applet><title>Print Applet</title></head><body><!--Text file is generated at " + textFileURL + "--></body></html>";
                res.getOutputStream().print(pageContent);
                res.getOutputStream().flush();
                req.getSession().removeAttribute("formattype");
                req.getSession().removeAttribute("clientName");
                req.getSession().removeAttribute("clientAddress");
                req.getSession().removeAttribute("phone");
                req.getSession().removeAttribute("remarks");//added by pradeep Gupta On 21-09-2005
                req.getSession().removeAttribute("FinalCRNAmt");//added by pradeep 0n 22-09-2005
                req.getSession().removeAttribute("condition");
                req.getSession().removeAttribute("vencimiento");
                req.getSession().removeAttribute("cedulaNo");
                req.getSession().removeAttribute("via");
                req.getSession().removeAttribute("instruccion");
                req.getSession().removeAttribute("ponumber");
                req.getSession().removeAttribute("client_id");
                req.getSession().removeAttribute("employeeName");
                req.getSession().removeAttribute("clientVendorId");
                req.getSession().removeAttribute("invoiceAgainst");
                req.getSession().removeAttribute("invoiceAmt");
                req.getSession().removeAttribute("invoiceDt");
                req.getSession().removeAttribute("invoiceId");
                req.getSession().removeAttribute("clientRemarks");
                req.getSession().removeAttribute("salsmanId");

                req.getSession().removeAttribute("showPayment");
                req.getSession().removeAttribute("refundAmount");
                req.getSession().removeAttribute("articleSize");
                req.getSession().removeAttribute("articleSizeWH");
                req.getSession().removeAttribute("blockInvSize");
                req.getSession().removeAttribute("invoiceSubTot");
                req.getSession().removeAttribute("invoiceItbm");
                req.getSession().removeAttribute("invoiceTot");
                req.getSession().removeAttribute("gv_id");

                for (int i = 0; i < articleSize; i++) {
                    session.removeAttribute("articleId" + i);
                    session.removeAttribute("articleDesc" + i);
                    session.removeAttribute("articleQty" + i);
                    session.removeAttribute("articleRate" + i);
                    session.removeAttribute("articleTot" + i);
                    session.removeAttribute("printForStore" + i);
                }
                session.removeAttribute("farticleTot");
                for (int m = 0; m < articleSizeVec; m++) {

                    session.removeAttribute("articleId" + m);
                    session.removeAttribute("articleDesc" + m);
                    session.removeAttribute("unitPrice" + m);
                    session.removeAttribute("articleQty" + m);
                    session.removeAttribute("articleRate" + m);
                    session.removeAttribute("valueWithTax" + m);

                }
                session.removeAttribute("currentAmount");
                session.removeAttribute("articleSizeVec");
                session.removeAttribute("amountPaid");
                session.removeAttribute("balanceAmount");


            } else {
                System.err.println("Report Output in PDF Format");
                renderer.setRenderer(org.apache.fop.apps.Driver.RENDER_PDF);
                //renderer.setLogger(log);
                renderer.run();
                byte[] content = out.toByteArray();
                res.setContentType("application/pdf");
                res.setContentLength(content.length);
                res.getOutputStream().write(content);
                res.getOutputStream().flush();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

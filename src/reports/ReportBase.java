package reports;



import org.apache.fop.apps.Options;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.io.*;

//import common.ServletHelp;

//import org.apache.xerces.parsers.DOMParser;
import java.io.IOException;
import org.xml.sax.SAXException;
import java.io.FileWriter;
//import java.util.logging.Logger;
//import org.apache.log.*;
import java.io.FileOutputStream;
import org.xml.sax.InputSource;


public class ReportBase extends HttpServlet {
    
    public java.io.FileWriter output = null;
    public String foFileName=null;
    public String pdfFileName=null;
    
    private int margin_right=0;
    private int margin_left=0;
    private int margin_bottom=0;
    private int margin_top=0;
    private int page_width=0;
    private int page_height=0;
    private boolean displayDate=true;
    private boolean displayPageNum=true;
    private String footer="THIS IS GREAT ";
    private String header ="THIS IS A BIG ACHIEVEMENT";
    private String alignHeader="start";
    
    HttpServletRequest request=null;
    HttpServletResponse response=null;
    //private org.apache.avalon.framework.logger.Logger Logger;
    
    public void init(ServletConfig config)
    throws ServletException {
        System.out.println("Report builder has been initialized");
    }
    
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
        //request=req;
        //response=res;
        
    }
    
    public FileWriter getFileWriter() {
        return this.output;
    }
    
    
    private void sop(String str) {
        //System.out.println(str);
    }
    
    public void generatePDF() {
        
        try {
            output.write("  </fo:page-sequence>");
            output.write("  </fo:root>");
            output.close();
            //String PDFDIR=sh.siteConfig("PDFDIR");
            response.sendRedirect(request.getContextPath()+"/servlet/reports.FileOpenerServlet?"+(request.getAttribute("inasciiformat")!=null?"inasciiformat=y":"")+"&filetoopen="+foFileName+"");
            request.removeAttribute("inasciiformat");
//            output.write("  </fo:page-sequence>");
//            output.write("  </fo:root>");
//            output.close();
//            //String PDFDIR=sh.siteConfig("PDFDIR");
//            System.out.println("IN GENERATE PDF"+request.getContextPath());
////            response.sendRedirect(request.getContextPath()+"/servlet/reports.FileOpenerServlet?inasciiformat=null"+"&filetoopen="+foFileName+"");
////            request.removeAttribute("inasciiformat");
//            String PDFDIR = "/html/pdf/";
//        PDFDIR=request.getSession().getServletContext().getRealPath("")+java.io.File.separator+PDFDIR;
//        //Logger log = null;
//
//        String userConfigPath = "/userconfig.xml";
//        userConfigPath=PDFDIR+java.io.File.separator+userConfigPath;
////        if(log == null) {
////		            Hierarchy hierarchy = Hierarchy.getDefaultHierarchy();
////		            log = hierarchy.getLoggerFor("fop");
////		            log.setPriority(Priority.WARN);
////			}
////        //org.apache.avalon.framework.logger.Log4JLogger log1 = (org.apache.avalon.framework.logger.Log4JLogger) log;
//        String contextPath = request.getContextPath();
//        //String filetoopen = req.getParameter("filetoopen");
//        //String
//        foFileName = foFileName + ".fo";
//        FileInputStream foFile = new FileInputStream(PDFDIR+foFileName);
//			ByteArrayOutputStream out = new ByteArrayOutputStream();
//                        Options option = new Options(new File(userConfigPath));
//			org.apache.fop.apps.Driver renderer = new org.apache.fop.apps.Driver(new InputSource(foFile),out);
//
//			renderer.setRenderer(org.apache.fop.apps.Driver.RENDER_PDF);
////			renderer.setLogger(log);
//			renderer.run();
//			byte[] content = out.toByteArray();
//			response.setContentLength(content.length);
//			response.getOutputStream().write(content);
//			response.getOutputStream().flush();
        } catch ( java.io.IOException ioe ) {
            System.out.println("Error writing to .PDF file."+ioe);
        } catch( Exception ex ) {
            ex.printStackTrace();
        }
    }
    
    
    
    //this method is to be called in all the subclasses to initialize the report.
    public void initReport(String reportName,HttpServletRequest req,HttpServletResponse res) {
        request=req;
        response=res;
        
        //sh.getDateCurrent()+
        //	foFileName= reportName+".fo";
        foFileName= reportName;
        pdfFileName=reportName+".pdf";
        System.out.println("INIT CALLED ");
        //ServletHelp sh =new ServletHelp();
        
        try {
            
            String PDFDIR="/html/pdf/";

            PDFDIR=req.getSession().getServletContext().getRealPath("")+java.io.File.separator+PDFDIR;

            output = new FileWriter(PDFDIR+foFileName+".fo");
            
        } catch ( IOException ioe ) {
            ioe.printStackTrace();
            
        }
        
        // create a validating parser and read report definition
        
        /*DOMParser parser = new DOMParser();
        try {
        parser.setFeature("http://xml.org/sax/features/validation", true);
        parser.setFeature("http://apache.org/xml/features/dom/include-ignorable-whitespace", false );
        //parser.parse( reportFileName );
        } catch (SAXException se) {
        se.printStackTrace();

        } catch (Exception e ) {
        e.printStackTrace();

        }*/
        
    }
    
    
    
    
    //this called to write the master set or definition for the report
    //multiple header set can be defined
    
    public void pageSetup(){
        
        sop("pagesetup called");
        
        try {
            output.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
            output.write("<fo:root xmlns:fo=\"http://www.w3.org/1999/XSL/Format\">\n");
            
            output.write("<fo:layout-master-set>\n");
            output.write("		<fo:simple-page-master margin-right=\"2.0cm\" margin-left=\"2.0cm\" margin-bottom=\"1.0cm\" margin-top=\"2.0cm\" page-width=\"21cm\" page-height=\"29.7cm\" master-name=\"first\">\n");
            output.write("			<fo:region-before extent=\"2.0cm\"/>\n");
            output.write("			<fo:region-body margin-bottom=\"1.5cm\" margin-top=\"0.7cm\"/>\n");
            output.write("			<fo:region-after extent=\"1.0cm\"/>\n");
            output.write("		</fo:simple-page-master>\n");
            output.write("</fo:layout-master-set>\n");
            output.write("  <fo:page-sequence master-name=\"first\">\n");
        }
        catch( java.io.IOException ioe ){
            ioe.printStackTrace();
            //System.out.println("Error writing to output file1.");
        }
    }
    
    //Added by Anuj Kumar on 18th may to print gen avail sin price report with active outlet only
    public void pageSetupSinPrice(){

        sop("pagesetup called");

        try {
            output.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
            output.write("<fo:root xmlns:fo=\"http://www.w3.org/1999/XSL/Format\">\n");

            output.write("<fo:layout-master-set>\n");
            output.write("		<fo:simple-page-master margin-right=\"1.0cm\" margin-left=\"1.0cm\" margin-bottom=\"1.0cm\" margin-top=\"2.0cm\" page-width=\"23cm\" page-height=\"29.7cm\" master-name=\"first\">\n");
            output.write("			<fo:region-before extent=\"2.0cm\"/>\n");
            output.write("			<fo:region-body margin-bottom=\"1.5cm\" margin-top=\"0.7cm\"/>\n");
            output.write("			<fo:region-after extent=\"1.0cm\"/>\n");
            output.write("		</fo:simple-page-master>\n");
            output.write("</fo:layout-master-set>\n");
            output.write("  <fo:page-sequence master-name=\"first\">\n");
        }
        catch( java.io.IOException ioe ){
            ioe.printStackTrace();
            //System.out.println("Error writing to output file1.");
        }
    }
    //this method is called to display the actual body
    public void writeBody() {
        try {
            output.write("  <fo:flow flow-name=\"xsl-region-body\">\n");
            
            output.write(" <fo:block font-size=\"10pt\" text-align=\""+alignHeader+"\">\n");
            for(int i=0; i<101;i++) {
                output.write("This has been generated by vivek \n");
            }
            output.write("</fo:block> \n");
            
            
            output.write("</fo:flow >\n");
        }catch(Exception ee) {
            ee.printStackTrace();
        }
    }
    
    
    //this method to display the header
    //before calling this method the setHeader() has to be called
    public void writeHeader(String header) {
        this.header=header;
        
        try {
            output.write("  <fo:static-content flow-name=\"xsl-region-before\" >\n");
            output.write(" <fo:block line-height=\"13pt\"  font-size=\"8pt\" text-align=\"center\">"+header+"</fo:block>");
            
            output.write("  </fo:static-content>\n");
            
        }catch(Exception ee) {
            ee.printStackTrace();
        }
    }
    
    
    
    //this method is called to display the footer
    //before calling this method the displayDate(), setFooter() and displayPageNumber() needds to be called
    
    public void writeFooter(boolean displayDate, boolean displayPageNum, String footer) {
        
        this.displayDate = displayDate;
        this.displayPageNum=displayPageNum;
        this.footer=footer;
        
        try {
            output.write("  <fo:static-content flow-name=\"xsl-region-after\">\n");
            output.write("     <fo:table >\n");
            output.write("     	<fo:table-column column-width=\"4.84cm\"/>\n");
            output.write("     	<fo:table-column column-width=\"6.34cm\"/>\n");
            output.write("     	<fo:table-column column-width=\"3.02cm\"/>\n");
            output.write("     	<fo:table-body>\n");
            output.write("     		<fo:table-row>\n");
            
            //*****************************
            
            //String date =common.get("CUR_DATE").toString()
            String currentDate="13-05-2004";
            
            //***************************
            //condition to display current date in the footer
            output.write("     			<fo:table-cell height=\"24pt\">\n");
            if(displayDate) {
                output.write("<fo:block line-height=\"12pt\"  font-size=\"8pt\" keep-together=\"always\" text-align=\"start\">"+currentDate+"</fo:block>\n");
                //output.write("<fo:block><fo:leader leader-pattern=\"rule\" leader-length=\"1cm\" /></fo:block>");
            }else {
                //output.write("<fo:block line-height=\"12pt\"  font-size=\"8pt\" keep-together=\"always\" text-align=\"start\"> </fo:block>\n");
                
                
            }
            output.write("     			</fo:table-cell>\n");
            
            
            //condition to display footer statement
            output.write("     			<fo:table-cell height=\"24pt\">\n");
            output.write("<fo:block line-height=\"12pt\"  font-size=\"8pt\" keep-together=\"always\" text-align=\"center\">"+footer+"</fo:block>\n");
            output.write("     			</fo:table-cell>\n");
            
            //condition to display page number
            output.write("     			<fo:table-cell height=\"24pt\">\n");
            
            if(displayPageNum) {
                output.write("<fo:block line-height=\"12pt\"   font-size=\"8pt\" space-before.optimum=\"1.5pt\" space-after.optimum=\"1.5pt\" keep-together=\"always\" text-align=\"end\">Page <fo:page-number/> </fo:block>\n");
            }
            else {
                output.write("	<fo:block line-height=\"12pt\"   font-size=\"8pt\" space-before.optimum=\"1.5pt\" space-after.optimum=\"1.5pt\" keep-together=\"always\" text-align=\"end\"></fo:block>\n");
            }
            
            output.write("	</fo:table-cell>\n");
            output.write("	</fo:table-row>\n");
            output.write(" 	</fo:table-body>\n");
            output.write("  </fo:table>\n");
            output.write("  </fo:static-content>\n");
            
            
            
            //output.write("<fo:block text-align=\"center\" space-after.optimum=\"1.5pt\">\n");
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    
    //this is to display the error page
    public void displayErrorPage() {
        sop("error page called");
        try {
            output.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
            output.write("<fo:root xmlns:fo=\"http://www.w3.org/1999/XSL/Format\">\n");
            output.write("  	<fo:layout-master-set>\n");
            output.write("  		<fo:simple-page-master margin-right=\"2.0cm\" margin-left=\"2.0cm\" margin-bottom=\"1.0cm\" margin-top=\"1.0cm\"\n");
            output.write("  					page-width=\"11in\" \n");
            output.write("  					page-height=\"8.5in\" \n");
            output.write("  					master-name=\"first\">\n");
            output.write("  				<fo:region-before extent=\"1.5cm\"/>\n");
            output.write("  				<fo:region-body margin-bottom=\"1.5cm\" margin-top=\"1.5cm\"/>\n");
            output.write("  				<fo:region-after extent=\"1.0cm\"/>\n");
            output.write("  		</fo:simple-page-master>\n");
            output.write("  	</fo:layout-master-set>\n");
            output.write("  <fo:page-sequence master-name=\"first\" language=\"en\" hyphenate=\"true\">\n");
            output.write("<fo:flow flow-name=\"xsl-region-body\">\n");
            output.write("<fo:block font-size=\"20pt\" font-weight=\"bold\" text-align=\"center\">\n");
            output.write("	No data available for the report.....\n");
            output.write("	</fo:block>  \n");
            output.write("  </fo:flow>\n");
            output.write("</fo:page-sequence>\n");
        }catch(Exception ee) {
            ee.printStackTrace();
        }
        
        
    }
    
    
    
    
}
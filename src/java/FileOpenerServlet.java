import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
//import org.apache.fop.apps.Options;
//import common.ServletHelp;
//import org.apache.xerces.parsers.DOMParser;
import java.io.IOException;
import org.xml.sax.InputSource;
//import org.apache.log.*;


public class FileOpenerServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
		   doPost(req,res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		res.setContentType("application/pdf");
		//ServletHelp sh =new ServletHelp();
		String filetoopen = "QuotPdf";
		String foFileName =filetoopen+".fo";

		String PDFDIR="/html/pdf/";
        PDFDIR=req.getSession().getServletContext().getRealPath("")+java.io.File.separator+PDFDIR;
		//Logger log = null;
		try{
//		
//			Options option=new Options(new File("/forpanafoto/html/pdf/userconfig.xml"));
//			
//		    if(log == null) {
//		            Hierarchy hierarchy = Hierarchy.getDefaultHierarchy();
//		            log = hierarchy.getLoggerFor("fop");
//		            log.setPriority(Priority.WARN);					
//			}
			
			FileInputStream foFile = new FileInputStream(PDFDIR+foFileName);
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			org.apache.fop.apps.Driver renderer = new org.apache.fop.apps.Driver(new InputSource(foFile),out);
			
			renderer.setRenderer(org.apache.fop.apps.Driver.RENDER_PDF);
			//renderer.setLogger(log);
			renderer.run();
			byte[] content = out.toByteArray();
			res.setContentLength(content.length);
			res.getOutputStream().write(content);
			res.getOutputStream().flush();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}

		
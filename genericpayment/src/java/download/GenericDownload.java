package download;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;

public class GenericDownload extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        SimpleDateFormat sdff =new SimpleDateFormat("ddMMyyyyhhmmss");
    //  String path1=request.getParameter("pat");
     // String filenam=request.getParameter("filname");
        java.util.Date date=new java.util.Date();
        String date1=sdff.format(date);
        String path="D:\\genr" ;
        String path1=path+"\\paymentDetails_"+date1+".xls";
        String filenam="paymentDetails_"+date1+".xls" ;
       // String url=getServletContext().getRealPath("/");
       // String path=url+"/paymentDetails.xls";
       // String path3=(String)getServletContext().getAttribute("path");
       // path3=path3+"/pans";
        download.GenericDownload fdn=new download.GenericDownload();
       
       // download.GenericDownload.F_Download.download(request,response, path1  ,filenam );
      
        // vicclas.F_Download.download(request,response, path1 ,filenam );
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>GenericDownload</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a POST. This is the reply.</p>");
        out.println("</body></html>");
        out.close();
    }
}

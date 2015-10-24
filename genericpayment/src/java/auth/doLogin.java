package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;

public class doLogin extends HttpServlet{
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType(CONTENT_TYPE);
        if(request.getParameter("logout")!=null) {
            System.out.println("Logout & New Session is created");
            Session.create(request);
        }
        
       /*if( request.getSession().isNew()){
            System.out.println("New Session is created");
            Session.create(request);
            }
        */
        RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
        rd.forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType(CONTENT_TYPE);
        System.out.println("Method Post");
        Enumeration headerNames = request.getHeaderNames();
        System.out.println("Session ID:"+request.getSession());
        while(headerNames.hasMoreElements()){
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            System.out.println(key+" : "+value);
        }       
    }
}

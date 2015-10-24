package auth;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

public class Auth extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType(CONTENT_TYPE);
        String JSESSIONID=""+request.getParameter("JSESSIONID");
        String session_id=request.getSession().getId();
        PrintWriter out = response.getWriter();
        try{
            if(!JSESSIONID.equals("null")){
                if(!JSESSIONID.equals(session_id)){
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    request.getSession().invalidate();
                    out.print("invalide session");
                }else{
                    out.print("session ok");
                }
            }    
        }catch(Exception er){
            System.err.println(er.getMessage());
        }
    }
}

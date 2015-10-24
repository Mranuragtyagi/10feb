package genericepayment;

import java.io.IOException;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;
import utility.SystemGlobals;
import vicclass.User;

public class GenericLogin extends HttpServlet {

    private static final String CONTENT_TYPE =
            "text/html; charset=windows-1252";
    private static Random rnd = new Random(1234);
    String appPath = null;
    boolean status = false;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        appPath = config.getServletContext().getRealPath("");
        appPath = appPath + "/WEB-INF/bdb.properties";
        status = SystemGlobals.getStatus(appPath);
        if (status) {
            SystemGlobals.initGlobals(appPath);
            SystemGlobals.initGlobalsGeneric();
        }
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        response.setContentType(CONTENT_TYPE);
        RequestDispatcher rd = null;
       
        try{
            if(!SystemGlobals.getEnabled().equals("true")){
                if(rd == null){
                    rd = request.getRequestDispatcher("/install.jsp");
                }
            }
            String step = request.getParameter("step");
            if (step == null || "login".equals(step) || step.equalsIgnoreCase("login")) {
                if (rd == null) {
                    rd = request.getRequestDispatcher("/landing.jsp");
                }
            } else if (step.equalsIgnoreCase("logoutuser")) {
                try {
                    ((User) request.getSession().getAttribute("user")).getConnection().close();
                    String salt=(String ) request.getAttribute("csrfPreventionSalt");
                    Object csalt= request.getSession().getAttribute("csrfPreventionSaltCache");
                    request.getSession().removeAttribute("user");
                    request.getSession().invalidate();
                    request.getSession(true);
                    request.setAttribute("csrfPreventionSalt",salt);
                    request.getSession().setAttribute("csrfPreventionSaltCache",csalt);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                if (rd == null) {
                    rd = request.getRequestDispatcher("/landing.jsp");
                }
            }else if (step.equalsIgnoreCase("logoutdept")) {
                try {
                    ((User) request.getSession().getAttribute("user")).getConnection().close();
                    String salt=(String ) request.getAttribute("csrfPreventionSalt");
                    Object csalt= request.getSession().getAttribute("csrfPreventionSaltCache");
                    request.getSession().removeAttribute("user");
                    request.getSession().invalidate();
                    request.getSession(true);
                    request.setAttribute("csrfPreventionSalt",salt);
                    request.getSession().setAttribute("csrfPreventionSaltCache",csalt);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                if (rd == null) {
                    rd = request.getRequestDispatcher("/landing.jsp");
                }
            }
            else if(step.equals("logoutuserloggedin")){
                try {
                    auth.Session.destroy(request);
                    auth.Session.create(request);

                    ((User) request.getSession().getAttribute("userloggedin")).getConnection().close();
                    request.getSession().removeAttribute("userloggedin");
                    request.getSession().invalidate();

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                if (rd == null) {
                    rd = request.getRequestDispatcher("/landing.jsp");
                }
            } else if (request.getSession().getAttribute("u") == null) {
                if (rd == null) {
                    rd = request.getRequestDispatcher("/GenericLogin?step=login");
                }
            } else {
                if (rd == null) {
                    rd =request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp");
                }
            }
        } catch (NullPointerException e) {
            if (rd == null) {
                rd = request.getRequestDispatcher("/GenericLogin?step=login");
            }
        }
        rd.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException,
            IOException {
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package genericepayadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.Captcha;
import utility.HTMLSanitizer;
import vicclass.User;

/**
 *
 * @author zephaniah
 */
public class GenericAdServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GenericAdServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenericAdServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String step = request.getParameter("step") != null ? request.getParameter("step") : "";                                                   
                 
        RequestDispatcher rd = null;
        if(!step.equals("14")){
            if (step.equals("1")){                
                try {
                    if (rd == null) {
                        rd = request.getRequestDispatcher("adminpayment/addAdminUser.jsp");
                        rd.forward(request, response);
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }else if (step == null || step.equalsIgnoreCase("adminlogin")){
                response.sendRedirect("http://" + request.getHeader("HOST")+request.getContextPath()+"/adminpayment/adminLogin.jsp");
            }else if (request.getSession().getAttribute("user")==null){
                response.sendRedirect("http://" + request.getHeader("HOST")+request.getContextPath()+"/adminpayment/adminLogin.jsp");
            }else{
                response.sendRedirect("http://" + request.getHeader("HOST")+request.getContextPath()+"/adminpayment/adminLogin.jsp");
            }
        }else if (step.equalsIgnoreCase("logoutuser")|| (step == null )) {
                try {
                    ((User) request.getSession().getAttribute("user")).getConnection().close();
                    request.getSession().removeAttribute("user");
                    request.getSession().invalidate();
                    request.getSession(true);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                if (rd == null) {
                    rd = request.getRequestDispatcher("/GenericLogin?step=login");
                }
            }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         User u = new User();
        u.createConnection();
        Connection con = u.getConnection();
        String step = request.getParameter("step");
        RequestDispatcher rd = null;        
        if (step.equals("1")) {//Admin Login
             String rnd=request.getSession().getAttribute("rnds")==null?"":request.getSession().getAttribute("rnds").toString();
             String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            String msg1 = "";
            try {
                Captcha captcha = null;
                String username = request.getParameter("useradmin");
                String pass = request.getParameter("passwordadmin");
                GenericAdminDao gd = new GenericAdminDao();
                captcha = (Captcha) request.getSession().getAttribute("Acaptcha");
                
                // String cain = request.getParameter("captcha").trim();
                 String cain = "abcd";
                 gb.setUsername(username);  
                 gb.setPassword(pass);
                 HTMLSanitizer.sanitizeString(gb);
                 msg1 = gb.deptValidatioAdmin(con, gb,cain);
                 
                    if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                     
             //  if (captcha.getAnswer().toUpperCase().equals(cain.toUpperCase())) {
                    if (true) {
                    try {
                        
                                  String salt=(String ) request.getAttribute("csrfPreventionSalt");
                                    Object csalt= request.getSession().getAttribute("csrfPreventionSaltCache");
                       // boolean f = gd.doFindAdminLogin(con, username, pass,rnd);
                         boolean f = gd.doFindAdminLogin(con, username, pass);
                        if (f == false) {
                            if (rd == null) {
                              
                                    request.getSession().invalidate();
                                    request.getSession(true);
                                   
                                String mesg = "Invalid username or password";
                                rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?mesg=" + mesg);
                            }
                        } else {
                            if (rd == null) {
                                rd = request.getRequestDispatcher("adminpayment/adminContent.jsp");
                            }
                            request.getSession().invalidate();
                            request.getSession(true);
                            request.getSession().setAttribute("user", u);
                            request.getSession().setAttribute("adminUserName", username);
                        }
                         request.setAttribute("csrfPreventionSalt",salt);
                         request.getSession().setAttribute("csrfPreventionSaltCache",csalt);
                    }
                    catch (NullPointerException e) {
                        System.out.println(e.getMessage());
                    }
                    
                } 
                else {
                    if (rd == null) {
                        String mesg = "Invalid captcha input";
                        rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?mesg=" + mesg);
                    }
                }
                    }
                   else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?mesg=Invalid username or password");
                    }}
                
            } catch (Exception e) {
                if (rd == null) {
                    rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?mesg=Invalid username or password");
                }
            }
        }
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

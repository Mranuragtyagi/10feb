package dept_integration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import vicclass.User;

public class Dept_Intcode extends HttpServlet {

    boolean flag = false;
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";
    private Iterable<String> strings;
    private Exception sqlException;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();
        String stp = request.getParameter("step");
        Connection con=null;
        try {
            User u = (User) request.getSession().getAttribute("user");
             con=u.getConnection();
            Dept_Integbean tbeans = new Dept_Integbean();
            if (stp.equals("step1")) {
                String dptnm = request.getParameter("deptname");
                //System.out.println("jj" + dptnm);
                String dptcode = request.getParameter("deptcode");
                String ipadrs = request.getParameter("ipadrs");
                String seccode = request.getParameter("secrtcod");
                String url = request.getParameter("respurl");
                String error_url = request.getParameter("error_url");
                tbeans.setDept_name(dptnm);
                tbeans.setDept_code(dptcode);
                tbeans.setIp_adrs(ipadrs);
                tbeans.setResponse_url(url);
                tbeans.setSecret_code(seccode);
                tbeans.setError_url(error_url);
                String msg = tbeans.deptValidation(con, tbeans);
                if (msg.equalsIgnoreCase("Please Fill The Appropriate")) {
                    tbeans.doInsertTax(u.getConnection(), tbeans);
                    msg = "Data Inserted Successfully";
                    request.setAttribute("message", msg);
                   if(rd==null) rd = request.getRequestDispatcher("dept_integration/department_info.jsp?message="+msg);
                 
                } else {
                    request.setAttribute("message", msg);
                     if(rd==null) rd = request.getRequestDispatcher("dept_integration/department_info.jsp");
                   
                }
            } else if (stp.equals("step2")) {
              
                String sts = request.getParameter("getslno");
                String ac = request.getParameter("srstatus");//getslno
               // String getslno = request.getParameter("getslno");
                Dept_Integbean deptintegerbean = new Dept_Integbean();
                deptintegerbean.setStatus(sts);
                deptintegerbean.setSno(ac);
                deptintegerbean.doUpdate(con, deptintegerbean);
               // u.endConnection();
                if(rd==null)rd = request.getRequestDispatcher("dept_integration/department_view.jsp");
            }
        } catch (Exception e) {
            System.out.println("Exception is ......" + e.getMessage());
            String msg = e.getMessage();
            request.setAttribute("message", msg);
            if (stp.equalsIgnoreCase("step1")) {
                if(rd==null)rd = request.getRequestDispatcher("dept_integration/department_info.jsp");
            } else if (stp.equalsIgnoreCase("step2")) {
               if(rd==null) rd = request.getRequestDispatcher("dept_integration/department_view.jsp");
            }
        }

        rd.forward(request, response);
    }   
}

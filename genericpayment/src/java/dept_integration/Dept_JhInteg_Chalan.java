/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dept_integration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import jhpolice.Challan;
import vicclass.User;
import java.sql.*;
/**
 *
 * @author santosh
 */
public class Dept_JhInteg_Chalan extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>JhPoliceChallan</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a GET. This is the reply.</p>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
     RequestDispatcher dispatcher=null;
    
        String msg="";
        String CHALLAN_NO=request.getParameter("CHALLAN_NO");
        String AMOUNT=request.getParameter("AMOUNT");
      //  String BANK_NAME=request.getParameter("BANK_NAME");
        String TREASURY_CODE=request.getParameter("TREASURY_CODE");
        String NAME=request.getParameter("NAME");
        String DEPT_CODE=request.getParameter("DEPT_CODE");
        String MISC=request.getParameter("MISC");
        Dept_Integchalan ch=new Dept_Integchalan();
        ch.setCHALLAN_NO(CHALLAN_NO);
        ch.setAMOUNT(Double.valueOf(AMOUNT.equals("")?"0":AMOUNT).doubleValue());
        ch.setTREASURY_CODE(TREASURY_CODE);
        ch.setNAME(NAME);
        ch.setDEPT_CODE(DEPT_CODE);
        ch.setMISC(MISC);
        Connection conn=null;
        User u = new User(); 
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {  
          ipAddress = request.getRemoteAddr();  
                            }
       System.out.println("ip address is...."+ipAddress);
        System.out.println("Challan No...."+ch.getCHALLAN_NO());
       conn=u.getConnection();
       PreparedStatement ps = null;
       ResultSet rs=null;
       String ipadrs="";
       String secrtcod="";
       String flag = "false";
       String error_url="";
       try {
            String sql = "select ip_adrs, secret_code, error_url from department_integration where dept_code=?";
            ps =conn.prepareStatement(sql);
            ps.setString(1, ch.getDEPT_CODE());
            rs = ps.executeQuery();
            if(rs.next()){
                ipadrs=rs.getString(1);
                secrtcod=rs.getString(2);
               error_url=rs.getString(3);
            }
            rs.close();
            ps.close();
            conn.close();
            } catch (SQLException ex) {
            Logger.getLogger(Dept_JhInteg_Chalan.class.getName()).log(Level.SEVERE, null, ex);
             }
             try {
            if(ipadrs.matches(ipAddress) && secrtcod.matches(request.getParameter("scode")))
            {  
            ch.doInsert();
            request.getSession().setAttribute("challan",ch);
        if(dispatcher==null)
            dispatcher= request.getRequestDispatcher("dept_integration/dept_integpay.jsp");
            
            }else if(secrtcod.matches(request.getParameter("scode"))){
           //  ch.doInsert();
            request.getSession().setAttribute("challan",ch);
       
            if(dispatcher==null) dispatcher= request.getRequestDispatcher("dept_integration/dept_integpay.jsp");
            
            }
            else{
                msg="Invalid Credentials";
                request.getSession().setAttribute("msg", msg);
                  request.getSession().setAttribute("error_url", error_url);
                  if(dispatcher==null)  dispatcher= request.getRequestDispatcher("dept_integration/dept_error.jsp");
            }
             }
            catch (Exception e) {
            msg=e.getMessage();
            request.getSession().setAttribute("msg", msg);
             request.getSession().setAttribute("error_url", error_url);
            if(dispatcher==null)
              dispatcher= request.getRequestDispatcher("dept_integration/dept_error.jsp");
                // response.sendRedirect(error_url+"?msg="+msg);
               } 
           dispatcher.forward(request,response); 
   
 }
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genericepayadmin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import vicclass.User;
import genericepayadmin.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author santosh
 */
public class AddIp extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        
      
      
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();
          String flag = "false";
        String stp = request.getParameter("step");
        try {
            /* TODO output your page here. You may use following sample code. */
            User u = new User();
            u.createConnection();
            Connection conn = null;
            conn = u.getConnection();
            if (stp.equals("setip")) {
                System.out.println("hello reaching or not");
                String deprtment = request.getParameter("department");
                String ipadrs = request.getParameter("ip");
                String chksum = request.getParameter("checksum");
                AddIpBean aip = new AddIpBean();
                aip.setIpaddress(ipadrs);
                aip.setDeptid(deprtment);
                aip.setChecksum(chksum);
                   String msg1 = "";
                try {
                msg1 = aip.deptValidation(conn, aip);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                   aip.doInsertTax(conn, aip);
                      if (rd == null) {
                        String msg = "Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/addIp.jsp?msg=" + msg);
                         
                    }
                } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/addIp.jsp?msg=" + msg1);
                         
                    }
                }
            } catch (Exception e) {
                System.out.println("add IP error : " + e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("adminpayment/addIp.jsp?msg=" + e.getMessage());
                                            
                }
                }
            }else if (stp.equals("upd")) {
                String deptupd = request.getParameter("department_name");
                String ipupd = request.getParameter("ipadres");
                String checkupd = request.getParameter("checksum");
                String idup = request.getParameter("id");//chk
                String chk = request.getParameter("chk");
                  String msg1 = "";
                   AddIpBean aip = new AddIpBean();
                     aip.setIpaddress(ipupd);
                aip.setDeptid(deptupd);
                aip.setChecksum(checkupd);
                aip.setId(idup);
                aip.setStatus(chk);
                    msg1 = aip.deptValidationEdit(conn, aip);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
               // AddIpBean aip = new AddIpBean();
                flag = aip.doEdit(conn, aip);
                   } else {
                        System.err.println("wrong input");
                    if (rd == null) {
                        rd = request.getRequestDispatcher("adminpayment/addIp.jsp?tsg=" + msg1);
                    }
                }
                out.print(flag);
            }

        } catch (Exception e) {
            if (stp.equals("setip")) {
                rd = request.getRequestDispatcher("adminpayment/addIp.jsp?msg=" + e.getMessage());
            } else {
                out.print(flag);
            }
        } 
           rd.forward(request, response);
    }
}

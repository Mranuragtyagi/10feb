/*@author Rajiv*/
package genericepayadmin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.Captcha;
import vicclas.PasswordService;
import vicclass.User;
public class GenericDepartment extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
       
        RequestDispatcher rd = null;
        try{
            User u =(User)request.getSession().getAttribute("user");
            if(request.getSession().getAttribute("user")!=null){
            Connection con = u.getConnection();
            GenericDepartmentBean gdbean =(GenericDepartmentBean)request.getSession().getAttribute("gdbean");
            ArrayList al = gdbean.getDetailsByDepartment(con);
            if (rd == null){
                request.getSession().setAttribute("al", al);
                rd = request.getRequestDispatcher("/adminpayment/departmentReportByPeriod.jsp");
            }
            }else{
                 rd = request.getRequestDispatcher("logout.jsp");
            }
        }catch(Exception exception){
            System.err.println("" +exception.getMessage());
        }
        rd.forward(request, response);
    }
    
      public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = null;
        User u = new User();
                u.createConnection();
                Connection con = u.getConnection();
        try{            
            String step = request.getParameter("step");            
             if(step.equalsIgnoreCase("login")){// Department Login
                 String rnd=request.getSession().getAttribute("rnds")==null?"":request.getSession().getAttribute("rnds").toString();
                
                Captcha captcha = null;
                boolean flag = false;
                 String mesg = "Please Fill The Appropriate";
                  GenericAdminBean gb = new GenericAdminBean();
                  String msg1 = "";
               // String cain = request.getParameter("captcha").trim();
                   String cain ="abcd";
                String username = request.getParameter("username");
                String password = request.getParameter("password1");
                String department = request.getParameter("department");
                gb.setUsername(username);
                gb.setPassword(password);
                gb.setDepartment(department);
                try{
                    captcha = (Captcha)request.getSession().getAttribute("Ccaptcha");
                     msg1 = gb.deptValidatioDept(con, gb,cain);
                    if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                     
                   // if(captcha.getAnswer().toUpperCase().equals(cain.toUpperCase())){   
                        if(true){
                        try{
                            GenericDepartmentBean gdbean = new GenericDepartmentBean();
                            gdbean.setUsername(username);
                            gdbean.setDepartment_id(department);
                            gdbean.setPassword(password);
                            flag = gdbean.getLogin(con,rnd);
                            if (flag == false){
                                if (rd == null){
                                    String msg = "Invalid username or password";
                                    rd =request.getRequestDispatcher("adminpayment/departmentLogin.jsp?mesg="+msg);
                                }                                
                            }else if(gdbean.getIspwdchng().equals("0")){ 
                                request.getSession().setAttribute("departmentUsername", username);
                                if(rd==null){                                
                                    rd=request.getRequestDispatcher("adminpayment/chndPwdFirstTimeDeptAdmin.jsp");
                                }
                            }else{ 
                                ArrayList al = gdbean.getDetailsByDepartment(con);
                                if (al != null || !al.isEmpty()){
                                    request.getSession().setAttribute("al", al);
                                    request.getSession().setAttribute("loggedin", step);
                                    if (rd == null){
                                        rd = request.getRequestDispatcher("adminpayment/departmentReportByPeriod.jsp");
                                    }
                                }
                            }
                            request.getSession().setAttribute("user", u);
                            request.getSession().setAttribute("gdbean", gdbean);
                        }catch (Exception e){
                            System.out.println(e.getMessage());
                            if (rd == null){
                                String msg = "Invalid username or password";
                                rd =request.getRequestDispatcher("adminpayment/departmentLogin.jsp?mesg="+msg);
                            }
                        }
                    }else{
                         if (rd == null){
                            String msg = "Invalid captcha input";
                            rd = request.getRequestDispatcher("adminpayment/departmentLogin.jsp?mesg="+msg);
                        }
                    }
                }else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/departmentLogin.jsp?mesg=Invalid username or password");
                    }}}
                    
                catch (Exception e){
                    if (rd == null){
                        String msg = "Captcha Expired. Login Again or " +e.getMessage()+".";
                        rd = request.getRequestDispatcher("adminpayment/departmentLogin.jsp?mesg=Invalid username or password");                        
                    }
                }
            }else if (step.equalsIgnoreCase("verifychallan")) {// Challan Verify
                GenericDepartmentBean gbean = new GenericDepartmentBean();
                String chalan =request.getParameter("chid") != null ? request.getParameter("chid") :"";
                String dept = request.getParameter("dept");
               
                if (!chalan.equals("")) {
                    try {
                        gbean.doVerifyStatusByChallan(con, chalan, dept);
                        gbean.getUserDetailsByChallan(con, dept, chalan);
                        request.setAttribute("gbean", gbean);
                        if (rd == null) 
                        rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?mesg=Verified Successfully &status=0");
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }else{                    
                    try{
                        GenericDepartmentBean gdbean =(GenericDepartmentBean)request.getSession().getAttribute("gdbean");
                        ArrayList al = gdbean.getDetailsByDepartment(con);
                        if (rd == null){
                            request.getSession().setAttribute("al", al);
                            rd = request.getRequestDispatcher("/adminpayment/departmentReportByPeriod.jsp");
                        }
                    }catch(Exception e){
                        System.out.println(e.getMessage());
                    }
                }
            }else if (step.equals("changepasswordfirsttime")){// Change Password FirstTime
                try {
                    GenericDepartmentBean gdbean =(GenericDepartmentBean)request.getSession().getAttribute("gdbean");
                    
                    String oldpwd = request.getParameter("oldpassword");                    
                    String newpasswrd = request.getParameter("password");
                    String repassword = request.getParameter("repassword");
                    String user = gdbean.getUsername();
                    String deptid = gdbean.getDepartment_id();
                    PasswordService ps = new PasswordService();
                    ps.setPwd(request.getParameter("password"));                    
                    if (newpasswrd.equalsIgnoreCase(repassword)) {
                        GenericDepartmentBean.changeDeptPaswrdFirstTime(oldpwd,con, user, newpasswrd, deptid);
                        if (rd == null) {
                            rd = request.getRequestDispatcher("/adminpayment/departmentReloginAdmin.jsp");
                        }
                    } else {
                        if (rd == null) {
                        rd = request.getRequestDispatcher("adminpayment/chndPwdFirstTimeDeptAdmin.jsp?msg=Password Mismatch");
                    }
                }
            } catch (Exception e) {
                String msg = "" + e.getMessage();
                System.out.println(e.toString());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/chndPwdFirstTimeDeptAdmin.jsp?msg="+ msg + "&user="+ (String) request.getSession().getAttribute("departmentUsername"));
                }
            }
        }else if (step.equals("getchallandetails")){// Get Challan Details using Challan No.            
            GenericDepartmentBean gdbean =(GenericDepartmentBean)request.getSession().getAttribute("gdbean");
           
            String challanno = request.getParameter("challan");                        
            GenericDepartmentBean gbean = new GenericDepartmentBean();
            String deptid = gdbean.getDepartment_id() != null ?(String)gdbean.getDepartment_id() : "";
            try {
                String status = GenericDepartmentBean.getStatusByChallan(con, deptid, challanno);
                if (status.equals("1")) {
                    gbean.getUserDetailsByChallan(con, deptid, challanno);
                    request.setAttribute("gbean", gbean);
                    request.setAttribute("chalan", challanno);
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?mesg=This Challan is Used!");
                 //   rd = request.getRequestDispatcher("/adminpayment/checkChallanDetails.jsp?mesg=This Challan is Used!");
                } else if (status.equals("0")) {
                    gbean.getUserDetailsByChallan(con, deptid, challanno);//+"&csrfPreventionSalt="+request.getAttribute("csrfPreventionSalt")
                    request.setAttribute("gbean", gbean);
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/verifyPaymentByAdmin.jsp?mssg=This Challan is not Used &status=" +status);
                }else{
                    if (rd == null)
                       // rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?mssg=Please Enter the Correct Challan No!");
                         rd = request.getRequestDispatcher("/adminpayment/checkChallanDetails.jsp?mesg=You Have Wrong Challan Number!  Please Enter The Valid Challan Number.");
                    }
                } catch (Exception e) {
                    System.out.println("SO "+e.getMessage());
                }
        }else if (step.equals("verifypayment")) {
            String action = request.getParameter("actn");
            String chalan = request.getParameter("challan");
            GenericDepartmentBean gdbean =(GenericDepartmentBean)request.getSession().getAttribute("gdbean");
            
            GenericDepartmentBean gbean = new GenericDepartmentBean();            
            try{
                if (action.equals("canc")) {
                    gbean.doCancelStatusByChallan(con, chalan, gdbean.getDepartment_id());
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/verifyPaymentByAdmin.jsp?mssg=cancelled Successfully &status=0");
                } else if (action.equals("veri")) {
                    gbean.doVerifyStatusByChallan(con, gdbean.getDepartment_id(), chalan);
                    gbean.getUserDetailsByChallan(con, gdbean.getDepartment_id(), chalan);
                    request.setAttribute("gbean", gbean);
                    if (rd == null)
                       // rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?mesg=This Challan is not used!");
                        rd = request.getRequestDispatcher("/adminpayment/checkChallanDetails.jsp?mesg=This Challan is not used!");
                        
                    
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            } 
        }catch(Exception exception){
            System.err.println("" +exception.getMessage());
        }
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processRequest(request, response);
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

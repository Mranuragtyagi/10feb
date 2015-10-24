package genericepayadmin;
import exceptions.DataAlreadyExistsException;
import exceptions.DeleteNotAllowedException;
import exceptions.NoDataFoundException;
import exceptions.UnknownException;
import exceptions.UpdateNotAllowedException;
import genericepayment.GenericBean;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import nl.captcha.Captcha;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import vicclas.PasswordService;
import vicclass.User;

public class GenericAdminServlet extends HttpServlet {
    private static final String CONTENT_TYPE = 
        "text/html; charset=windows-1252";
    private static Random rnd = new Random(1234);

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String step = request.getParameter("step") != null ? request.getParameter("step") : "";                                                   
        response.setContentType(CONTENT_TYPE);        
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
        }else{
            doPost(request,response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        User u = new User();
        u.createConnection();
        Connection con = u.getConnection();
        String step = request.getParameter("step");
        RequestDispatcher rd = null;        
        if (step.equals("1")) {//Admin Login
            /* String msg = "Please Fill The Appropriate";
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
                 msg1 = gb.deptValidatioAdmin(con, gb,cain);
                    if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                     
             //  if (captcha.getAnswer().toUpperCase().equals(cain.toUpperCase())) {
                    if (true) {
                    try {
                       boolean f = gd.doFindAdminLogin(con, username, pass);
                        if (f == false) {
                            if (rd == null) {
                                String mesg = "Invalid username or password";
                                rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?mesg=" + mesg);
                            }
                        } else {
                            if (rd == null) {
                                rd = request.getRequestDispatcher("adminpayment/adminContent.jsp");
                            }
                            request.getSession().setAttribute("user", u);
                            request.getSession().setAttribute("adminUserName", username);
                        }
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
                        rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?msg=" + msg1);
                    }}
                
            } catch (Exception e) {
                if (rd == null) {
                    rd = request.getRequestDispatcher("adminpayment/adminLogin.jsp?mesg=" + e.getMessage());
                }
            }*/
        }else if(step.equals("2")){// Add Department
           String department = request.getParameter("department");

            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(department);
            // gb.setMajortax(majortax);
            String msg1 = "";
            GenericAdminServices gs = new GenericAdminServices();
            try {
                msg1 = gb.deptValidation(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gs.doInsertDept(con, gb);

                    if (rd == null) {
                        String msg = "Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/adddepartment.jsp?msg=" + msg);
                    }
                } else {

                    if (rd == null) {
                        //String msg = "msg=Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/adddepartment.jsp?msg=" + msg1);
                    }
                }

            } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    String msg = "Department Already Exists";
                    rd = request.getRequestDispatcher("adminpayment/adddepartment.jsp?msg=" + msg);
                }
            }
        }else if(step.equals("3")){// Add Major Tax
           GenericAdminDao gasd = new GenericAdminDao();
            String fixd = "";
            String majortax = "";
            String department = request.getParameter("department");
            String majortaxid = request.getParameter("majortaxtype");
            try {
                majortax = gasd.getMajorTaxById(con, majortaxid);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            String tax = request.getParameter("taxtype");
            String taxcode = request.getParameter("taxtypecode");
            String treasuryhead = request.getParameter("treasury");
            String description = request.getParameter("desc");
            String fix = request.getParameter("chk") != null ? request.getParameter("chk") : "";
            Double fixamount = request.getParameter("amount") != null ? Double.parseDouble(request.getParameter("amount")) : 0.00;
            if (fix.equals("") || fixamount == null) {
                fixd = "N";
            } else {
                fixd = "Y";
            }
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDeptid(department);
            gb.setTax(tax);
            gb.setTreasury_head_code(treasuryhead);
            gb.setDescription(description);
            gb.setIsfixed(fixd);
            gb.setAmount(fixamount);
            gb.setMajortax(majortax);
            gb.setTaxpurposecode(taxcode);
            gb.setMajortaxid(majortaxid);
            // String msg = "Please Fill The Appropriate";
            String msg1 = "";
            GenericAdminDao gad = new GenericAdminDao();

            GenericAdminServices gs = new GenericAdminServices();
            try {
                msg1 = gb.deptValidationSubTax(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gs.doInsertTax(con, gb);
                    if (rd == null) {
                        String msg = "Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/addtax.jsp?msg=" + msg);
                    }
                } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/addtax.jsp?msg=" + msg1);
                    }
                }
            } catch (Exception e) {
                System.out.println("add tax error : " + e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("adminpayment/addtax.jsp?msg=Data Not Inserted");
                }
            }
        }else if (step.equalsIgnoreCase("adduser")){// Add Department User
            try{
               String username = request.getParameter("username") != null ? request.getParameter("username") : "";
                String fullname = request.getParameter("fullname") != null ? request.getParameter("fullname") : "";                
                String dept = request.getParameter("dept") != null ? request.getParameter("dept") : "";
                String locations = request.getParameter("locations") != null ? request.getParameter("locations") : "";
                String role = request.getParameter("role") != null ? request.getParameter("role") : "";
                GenericAdminBean gb = new GenericAdminBean();                
                gb.setUsername(username);
                gb.setFullname(fullname);
                gb.setUserrole(role);
                gb.setDeptid(dept);
                gb.setLocations(locations);
                gb.setState("34");//jharkhand state code                
                gb.setPassword(username);
              String msg1 = ""; msg1 = gb.deptValidationAdmin(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                 
                GenericAdminServices gs = new GenericAdminServices();
                gs.doInsertNewUser(con, gb);                
                if (rd == null){
                    String msg = "Inserted Successfully";
                    rd = request.getRequestDispatcher("adminpayment/addAdminUser.jsp?msg="+msg);
                }  } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/addAdminUser.jsp?msg=" + msg1);
                    }
                }
            }catch (Exception e){
                try{
                    if(rd == null){
                        String msg = "User already exists!Please Create another one";
                        rd = request.getRequestDispatcher("adminpayment/addAdminUser.jsp?msg="+msg);
                    }
                }catch (Exception e1){
                    System.out.println("UserEntry:" + e1.toString());
                }
            }
        }else if (step.equals("showuser")){// Show Department User
            String page = "";
            try{
                String username = request.getParameter("username");
                String department = request.getParameter("department");
                GenericAdminDao gdao=new GenericAdminDao();
                String deptname=gdao.getDepartmentByDeptid(con,department);
                String deptnameupper=deptname.toUpperCase();
                  GenericAdminBean gb1 = new GenericAdminBean();
                   gb1.setUsername(username);
                  gb1.setDeptid(deptname);
                 String msg1 = "";
                 msg1 = gb1.deptValidationAskAdmin(con, gb1);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                if(deptnameupper.equals("COMMERCIAL TAX")){
                    try {
                        GenericAdminBean gb = new GenericAdminBean();
                        GenericAdminServices gs = new GenericAdminServices();
                        gb = gs.queryByUserName(con, username);
                        request.setAttribute("userdetails", gb);
                        // GenericAdminDao dao=new GenericAdminDao() ;
                        request.setAttribute("circlelist", GenericAdminDao.getCircleList(con));
                        request.setAttribute("divisionlist", GenericAdminDao.getDivisionList(con));
                        request.getSession().setAttribute("dept", department);
                        if (rd == null)
                            rd = request.getRequestDispatcher("adminpayment/viewAdminDetails.jsp");
                    } catch (NoDataFoundException ex) {
                        page = "adminpayment/askAdminUserName.jsp";
                        throw new NoDataFoundException();
                    }
                } else {
                    try {
                        GenericAdminServices gs = new GenericAdminServices();
                        GenericAdminBean gb = new GenericAdminBean();
                        gb = gs.queryByUserNameForOthersDept(con, username, department);
                        ArrayList al = gs.getDistrictList(con);
                        ArrayList a2 = gs.getDivList(con);
                        ArrayList a3 = gs.getDeptList(con);
                        request.setAttribute("districtlist", al);
                        request.setAttribute("divlist", a2);
                        request.setAttribute("deptList", a3);
                        request.setAttribute("userdetails", gb);
                        if (rd == null)
                            rd = request.getRequestDispatcher("adminpayment/viewOtherDepartmentAdminDetails.jsp");
                        rd.forward(request, response);
                    } catch (NoDataFoundException ex) {
                        GenericAdminDao district = new GenericAdminDao();
                        ArrayList a3 = district.getDeptList(con);
                        request.setAttribute("deptList", a3);
                        page = "adminpayment/askAdminUserName.jsp";
                        throw new NoDataFoundException();
                    }
                } } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/viewOtherDepartmentAdminDetails.jsp?msg=" + msg1);
                    }
                }
            } catch (NoDataFoundException e) {
                request.setAttribute("err", "yes");
                request.setAttribute("msg", "Sorry! The Given Username doesn't exist.");
                if (rd == null)
                    rd = request.getRequestDispatcher(page);
            }catch (Exception e) {
                 if (rd == null)
                            rd = request.getRequestDispatcher("adminpayment/askAdminUserName.jsp");
         
                System.out.println(e.toString());
            }
        }else if (step.equals("modify")){// Modify Department User
            try{
                 String department = request.getParameter("department");
                String usr = request.getParameter("username");
                String flnm=request.getParameter("fullname");
                GenericAdminDao gdao=new GenericAdminDao();
                String deptname="";
                try{
                    deptname=gdao.getDepartmentByDeptid(con,department);
                }catch(Exception e){
                    System.out.println("error in fetching dept name :"+e);
                }
                String deptnameupper=deptname.toUpperCase();
               
                if (deptnameupper.equals("COMMERCIAL TAX")) {
                    GenericAdminBean grb = new GenericAdminBean();
                    GenericAdminDao gad = new GenericAdminDao();
                    if (request.getParameter("modify") != null) {
                        String urname = request.getParameter("username");
                        grb.setFullname(request.getParameter("fullname"));
                        grb.setCirncode(Integer.parseInt(request.getParameter("cirncode")));
                        grb.setUserrole(request.getParameter("userrole"));
                        grb.setDivisioncode(request.getParameter("div_code"));
                        grb.setScope(request.getParameter("scope"));
                        if (grb.getScope().equals("C")) {
                            grb.setCirncode(Integer.parseInt(request.getParameter("cirncode")));
                            grb.setDivisioncode(GenericAdminDao.getDivCode(con, grb.getCirncode()));
                        } else {
                            grb.setCirncode(0);
                        }
                        gad.doUpdate(con, grb, urname);
                    } else if (request.getParameter("delete") != null) {
                        gad.doDelete(con, grb);
                    } else if (request.getParameter("resetpw") != null) {
                        gad.resetPassword(con, request.getParameter("username"));
                    } else if (request.getParameter("unlockAcct") != null) {
                        gad.unLockAccount(con, request.getParameter("username"));
                    }
                    request.setAttribute("err", "yes");
                    request.setAttribute("msg", "Successfully done.");
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/askAdminUserName.jsp");
                } else {
                    GenericAdminBean grb = new GenericAdminBean();
                    GenericAdminDao gad = new GenericAdminDao();
                    if (request.getParameter("modify") != null) {
                        String dept = request.getParameter("dept");
                        grb.setUsername(request.getParameter("username"));
                        grb.setFullname(request.getParameter("fullname"));
                        grb.setUserrole(request.getParameter("userrole"));
                        grb.setState("34");
                        if (grb.getUserrole().equalsIgnoreCase("adm")) {
                            grb.setScope("state");
                            grb.setDivisioncode("0");
                            grb.setDistrictcode("0");
                            grb.setDepartment("0");
                        } else if (grb.getUserrole().equalsIgnoreCase("sta")) {
                            grb.setScope("state");
                            grb.setDivisioncode("0");
                            grb.setDistrictcode("0");
                            grb.setDepartment(request.getParameter("dept"));
                        } else if (grb.getUserrole().equalsIgnoreCase("div")) {
                            grb.setScope("division");
                            grb.setDivisioncode(request.getParameter("div_code"));
                            grb.setDistrictcode("0");
                            grb.setDepartment(request.getParameter("dept"));
                        } else if (grb.getUserrole().equalsIgnoreCase("dis")) {
                            grb.setScope("district");
                            grb.setDivisioncode("0");
                            grb.setDistrictcode(request.getParameter("district"));
                            grb.setDepartment(request.getParameter("dept"));
                        }
                        gad.doUpdateOfOtherDeptUsers(con, grb, department);
                    } else if (request.getParameter("delete") != null) {
                        gad.doDeleteOtherDeptUSers(con, department, 
                                                   request.getParameter("username"));
                    } else if (request.getParameter("resetpw") != null) {
                        gad.resetPasswordOfOtherDept(con, request.getParameter("username"), department);
                    } else if (request.getParameter("unlockAcct") != null) {
                        gad.unLockAccountOfOtherDept(con,request.getParameter("username"),department);
                    }
                    ArrayList a3 = gad.getDeptList(con);
                    request.setAttribute("deptList", a3);
                    request.setAttribute("err", "yes");
                    request.setAttribute("msg", "Successfully done.");
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/askOtherDeptAdminUserName.jsp");
                   }

            } catch (DataAlreadyExistsException e) {
                System.out.println(e.toString());
            } catch (UpdateNotAllowedException e) {
                System.out.println(e.toString());
            } catch (DeleteNotAllowedException e) {
                System.out.println(e.toString());
            } catch (UnknownException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GenericAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (step.equals("changepass2")) {// Change Password
            try {
                String oldpwd = request.getParameter("oldpassword");
                String user = request.getParameter("user");
                String newpasswrd = request.getParameter("password");
                PasswordService ps = new PasswordService();
                ps.setPwd(request.getParameter("password"));
                boolean fg = true;
                String msg = "";
                if (fg) {
                    GenericAdminDao gd = new GenericAdminDao();
                    gd.changeAdmPaswrd(oldpwd, con, user, newpasswrd);
                    if(rd==null)
                        rd =request.getRequestDispatcher("/adminpayment/adminRelogin.jsp");
                } else {
                    if(rd==null)
                        rd =request.getRequestDispatcher("/adminpayment/changeAdminPassword.jsp?msg=" +msg + "&user="+(String)request.getSession().getAttribute("adminUserName"));
                }
            } catch (Exception e) {
                String msg = "" + e.getMessage();
                System.out.println(e.toString());
                if(rd==null)
                    rd =request.getRequestDispatcher("/adminpayment/changeAdminPassword.jsp?msg=" +msg + "&user=" +(String)request.getSession().getAttribute("adminUserName"));
            }
        } else if (step.equals("5")) {
              GenericAdminBean gb = new GenericAdminBean();
            String dep = request.getParameter("department");
            String action = request.getParameter("actn");
             String msg1 = "";
               gb.setDepartment(dep);
            gb.setDeptid(action);
            GenericAdminDao gda = new GenericAdminDao();
            try {
                String deprtmentname = gda.getDepartmentByDeptid(con, dep);
                 msg1 = gb.deptValidation(con, gb);
      if (msg1.startsWith("Please Fill The Appropriate")) {
                   
                if (action.equalsIgnoreCase("edit")) {
                    request.setAttribute("dep", dep);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/modifyAdminDepartment.jsp?action=edit&deprtmnt=" + deprtmentname);
                    }
                } else if (action.equalsIgnoreCase("del")) {
                    gda.doDeleteDepartmentByDeptid(con, dep);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/modifyAdminDepartment.jsp?action=deletSuccess");
                    }
                }}
      
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
                
               
        } else if (step.equals("6")) {
             GenericAdminBean gb = new GenericAdminBean();
             String department = request.getParameter("department");
            String deptid = request.getParameter("deid");
               gb.setDepartment(department);
            gb.setDeptid(deptid);
                String msg1 = "";
            GenericAdminDao gda = new GenericAdminDao();
            try {
                    msg1 = gb.deptValidation(con, gb);
            if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                gda.doUpdateDepartment(con, department, deptid);
                if (rd == null)
                    rd = request.getRequestDispatcher("/adminpayment/modifyAdminDepartment.jsp?action=editSuccess");
            }else{
            if (rd == null)
                    rd = request.getRequestDispatcher("/adminpayment/modifyAdminDepartment.jsp?action=ValidationError");
            }
            
            
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else if (step.equals("7")) {  String action = request.getParameter("actn");
            String department = request.getParameter("department");
            int deptid = Integer.parseInt(request.getParameter("department"));
            String taxtyp = request.getParameter("taxtype");
            String treasury = request.getParameter("treasury");
            String majortax = request.getParameter("majortaxtype");
             GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(department);
           gb.setTax(taxtyp);
            gb.setTreasury_head_code(treasury);
            gb.setMajortaxid(majortax);
           String msg = "Please Fill The Appropriate";
            String msg1 = "";
            GenericAdminDao gda = new GenericAdminDao();
            try {
                
                String deprtmentname = gda.getDepartmentByDeptid(con, department);
                String taxpurposeid = gda.getTaxPurposeIdByTreasuryCode(con, taxtyp, treasury, deptid, majortax);
                if (action.equalsIgnoreCase("edit")) {
                     
                   // msg1 = gb.deptValidationmax(con, gb);
                msg1 = gb.deptValidationSubTax(con, gb);
                         if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                 
                    request.setAttribute("dep", deprtmentname);
                    request.setAttribute("taxtyp", taxtyp);
                    request.setAttribute("treasury", treasury);
                    request.setAttribute("department", department);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/editTaxType.jsp?action=edit&taxid=" + taxpurposeid);
                    }}else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/modifyTax.jsp?msg=" + msg1);
                    }
            } 
                } else if (action.equalsIgnoreCase("del")) {
                    gda.doDeleteTaxByDeptid(con, department, taxpurposeid);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/modifyTax.jsp?action=deletSuccess");
                    }
                
                
            }} catch (Exception e) {
                System.out.println(e.getMessage());
               if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/modifyTax.jsp?msg=Data Not Updated");
                } 
            }
        } else if (step.equals("8")) {
            String departmentname = request.getParameter("department");
            String taxtyp = request.getParameter("taxtype");
            String treasury = request.getParameter("treasury");
            String taxpurposeid = request.getParameter("taxpurid");
            String departmentid = request.getParameter("deptid");
            GenericAdminDao gda = new GenericAdminDao();
             GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(departmentid);
           gb.setTax(taxtyp);
            gb.setTreasury_head_code(treasury);
            //gb.setMajortaxid(majortax);
              String msg = "Please Fill The Appropriate";
            String msg1 = "";
            try { msg1 = gb.deptValidationEditSubTax(con, gb);
                         if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                 gda.doUpdateTaxtypeByTaxid(con, departmentid, taxtyp, treasury, taxpurposeid);
                if (rd == null)
                    rd = request.getRequestDispatcher("/adminpayment/editTaxType.jsp?mesg=Updated Successfully");
            }else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/editTaxType.jsp?msg=" + msg1);
                    }
            } } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/editTaxType.jsp?msg=Data Not Updated");
                }
            }
        } else if (step.equals("9")) {
            String challanno = request.getParameter("challan");
            GenericAdminDao gdstatus = new GenericAdminDao();
            GenericAdminBean gb = new GenericAdminBean();
            String deptid = request.getSession().getAttribute("deptid") != null ?(String)request.getSession().getAttribute("deptid") : "";
            try {
                String status = gdstatus.getStatusByChallan(con, deptid, challanno);
                if (status.equals("1")) {
                    gb = gdstatus.getUserDetailsByChallan(con, deptid, challanno);
                    request.setAttribute("gbean", gb);
                    request.setAttribute("chalan", challanno);
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?mesg=This Challan is Used!");
                } else if (status.equals("0")) {
                    gb = gdstatus.getUserDetailsByChallan(con, deptid, challanno);
                    request.setAttribute("gbean", gb);
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/verifyPaymentByAdmin.jsp?mssg=This Challan is not Used &status=" +status);
                }else{
                 if (rd == null)
                    rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?err=Please Enter the Correct Challan No!");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else if (step.equals("10")) {
            String action = request.getParameter("actn");
            String chalan = request.getParameter("chalan");
            String deptid = request.getParameter("departmentid");
            GenericAdminDao gdao = new GenericAdminDao();
            GenericAdminBean gb = new GenericAdminBean();
            try {
                if (action.equals("canc")) {
                    gdao.doCancelStatusByChallan(con, chalan, deptid);
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/verifyPaymentByAdmin.jsp?mssg=cancelled Successfully &status=0");
                } else if (action.equals("veri")) {
                    gdao.doVerifyStatusByChallan(con, chalan, deptid);
                    gb = gdao.getUserDetailsByChallan(con, deptid, chalan);
                    request.setAttribute("gbean", gb);
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/afterVerifyClick.jsp?mesg=This Challan is not used!");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else if (step.equals("11")) {
            try {
                String oldpwd = request.getParameter("oldpassword");
                String user = request.getParameter("user");
                String newpasswrd = request.getParameter("password");
                String deptid = request.getParameter("department");
                PasswordService ps = new PasswordService();
                ps.setPwd(request.getParameter("password"));
                boolean fg = true;
                String msg = "";
                if (fg) {
                    GenericAdminDao gd = new GenericAdminDao();                   
                    gd.changeDeptPaswrd(oldpwd, con, user, newpasswrd,deptid);
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/departmentRelogin.jsp");
                } else {
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/changeDepartmentPassword.jsp?msg=" +
                        msg + "&user=" + (String)request.getSession().getAttribute("departmentUsername"));
                }
            } catch (Exception e) {
                String msg = "" + e.getMessage();
                System.out.println(e.toString());
                if (rd == null)
                    rd =request.getRequestDispatcher("/adminpayment/changeDepartmentPassword.jsp?msg=" +msg + "&user=" +(String)request.getSession().getAttribute("departmentUsername"));
            }
        } else if (step.equals("12")) {
            String chalan = request.getParameter("chid");
            String deptid = request.getParameter("departmentid");
            GenericAdminDao gdao = new GenericAdminDao();
            try {
                gdao.doVerifyStatusByChallan(con, chalan, deptid);
                if (rd == null)
                    rd = request.getRequestDispatcher("/adminpayment/verifyPaymentByAdmin.jsp?mssg=Verified Successfully &status=0");
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }else if (step.equals("14")){
            String type=request.getParameter("reportType");
            if(type.equalsIgnoreCase("DD")){
            request.setAttribute("Reporttype", type);
                if (rd == null)
                    rd =request.getRequestDispatcher("/adminpayment/masterReport.jsp");
            }else if(type.equalsIgnoreCase("DWPD")){
                if (rd == null)
                    rd =request.getRequestDispatcher("/adminpayment/departmentReportForAdmin.jsp");
            }else if(type.equalsIgnoreCase("CD")){
                if (rd == null)
                    rd =request.getRequestDispatcher("/adminpayment/viewChallanDetails.jsp");
            }else if(type.equalsIgnoreCase("PTRI")){
                if (rd == null)
                    rd =request.getRequestDispatcher("/adminpayment/instandAndRegisteredDetails.jsp");
            }
        }else if (step.equals("15")) {
            String dept=request.getParameter("department") ;
            request.setAttribute("dept" ,dept);
            GenericAdminDao gda=new GenericAdminDao();
            try{
                String departname=gda.getDepartmentByDeptid(con,dept);
                request.setAttribute("departname" ,departname);
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
            if (rd == null)
                rd =request.getRequestDispatcher("/adminpayment/departmentWiseTaxDetails.jsp");
        }else if (step.equals("16")) {
            GenericAdminDao gdao = new GenericAdminDao();
            String chalan = request.getParameter("chid") != null ? request.getParameter("chid") : "";
            String dept = request.getParameter("dept");
            if (!chalan.equals("")){
                try {
                    gdao.doVerifyStatusByChallan(con, chalan, dept);
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/verifyPaymentByAdmin.jsp?mssg=Verified Successfully &status=0");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            } else {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");                
                try {
                    java.sql.Date period_from = new java.sql.Date(sdf.parse(request.getParameter("periodfrom")).getTime());
                    java.sql.Date period_to = new java.sql.Date(sdf.parse(request.getParameter("periodto")).getTime());
                    String type = request.getParameter("type");                    
                    int pg = 1;
                    pg =request.getParameter("pg") != null ? Integer.parseInt(request.getParameter("pg")) :1;
                    ArrayList getuserlist = gdao.getDepartmentDetailsByPeriodAdminEnd(con, period_from, period_to, type, dept);
                    request.setAttribute("departmentdetails", getuserlist);
                    request.setAttribute("typ", type);
                    request.setAttribute("period_from", request.getParameter("periodfrom"));
                    request.setAttribute("period_to", request.getParameter("periodto"));
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/departmentReportForAdmin.jsp");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }else if (step.equals("17")) {
            String challanno = request.getParameter("challan");
            GenericAdminDao gdstatus = new GenericAdminDao();
            GenericAdminBean gb = new GenericAdminBean();
            try {
                String status = gdstatus.getStatusByChallanForAdmin(con, challanno);
                if (status.equals("1")) {
                    gb = gdstatus.getUserDetailsByChallanForAdmin(con,challanno);
                    request.setAttribute("gbean", gb);
                    request.setAttribute("chalan", challanno);
                    if (rd == null)
                        rd = request.getRequestDispatcher("/adminpayment/viewChallanDetails.jsp?mesg=This Challan is Used!");
                } else if (status.equals("0")) {
                    gb = gdstatus.getUserDetailsByChallanForAdmin(con, challanno);
                    request.setAttribute("gbean", gb);
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/viewChallanDetails.jsp?mesg=This Challan is Used &status=" +status);
                }else{
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/viewChallanDetails.jsp?mssg=Please Enter the valid Challan Number");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }else if(step.equals("18")){
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String ty=request.getParameter("typ") ;
            String department=request.getParameter("dept");
            GenericAdminDao gad=new GenericAdminDao();
            ArrayList arr=new ArrayList();
            String msg="No Data Found" ;
            try{
                java.sql.Date period_from =new java.sql.Date(sdf.parse(request.getParameter("periodfrom")).getTime());
                java.sql.Date period_to = new java.sql.Date(sdf.parse(request.getParameter("periodto")).getTime());
                arr=gad.getInstantAndRegisteredDetails(con,ty,department,period_from,period_to);
                if(!arr.isEmpty()){
                    request.setAttribute("arr",arr);
                }else{
                    request.setAttribute("msg",msg);
                }
                if(rd==null)
                    rd =request.getRequestDispatcher("/adminpayment/instandAndRegisteredDetails.jsp");
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
        }else if(step.equals("19")){
             String dept = request.getParameter("department");
            String majortax = request.getParameter("majortax");
            String majortaxcode = request.getParameter("short");
            String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(dept);
            gb.setMajortax(majortax);
            gb.setMajortaxcode(majortaxcode);
            String msg1 = "";
            GenericAdminDao gad = new GenericAdminDao();
            try {
                msg1 = gb.deptValidationmax(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gad.doInsertMajorTax(con, gb);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/addMajorTax.jsp?msg=inserted successfully");
                    }
                } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/addMajorTax.jsp?msg=" + msg1);
                    }
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/addMajorTax.jsp?msg=Data Not Inserted");
                }
            }
        }else if(step.equals("20")){
            String dept = request.getParameter("department");
            String majortax = request.getParameter("majortaxtype");
            String majortaxcode = request.getParameter("majortaxtypecode");
            String action = request.getParameter("actn");
            String mdept = request.getParameter("dep");
            String mmajortax = request.getParameter("mtax");
            String mmajortaxcode = request.getParameter("mtaxcode");
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(mdept);
            gb.setMajortax(mmajortax);
            gb.setMajortaxcode(mmajortaxcode); 
            
            String msg = "Please Fill The Appropriate";
            String msg1 = "";
            
            GenericAdminDao gad = new GenericAdminDao();
            try {
           
               
                String majorid = gad.getMajorTaxId(con, majortax, majortaxcode, dept);
                if (majorid != null) {
                    if (action.equals("edit")) {
                             msg1 = gb.deptValidationmax(con, gb);
                         if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                 
                        gad.doEditMajorTax(con, gb, majorid);
                    } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/modifyMajorTax.jsp?msg=" + msg1);
                    }
            }   }else if (action.equals("del")) {
                        gad.doUpdateMajorTax(con, majorid);
                    }
                } else {
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/modifyMajorTax.jsp?msg=majorid not found");
                    }
                }
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/modifyMajorTax.jsp?msg=Updated Successfully");
                }
          }catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/modifyMajorTax.jsp?msg=Data Not Updated");
                }
            }
        }else if(step.equals("21")){
            SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdff =new SimpleDateFormat("ddMMyyyyhhmmss");
            java.util.Iterator it3 ;
            try{
                java.util.ArrayList arr1=(java.util.ArrayList)request.getSession().getAttribute("departmentdetails");                  
                if(arr1!=null){                    
                    HSSFWorkbook hwb=new HSSFWorkbook();
                    HSSFSheet sheet =  hwb.createSheet("Report");
                    HSSFRow rowhead=   sheet.createRow((short)0);                    
                    rowhead.createCell((short) 0).setCellValue("Challan No");
                    rowhead.createCell((short) 1).setCellValue("Dealer Name");
                    rowhead.createCell((short) 2).setCellValue("Address");
                    rowhead.createCell((short) 3).setCellValue("Period From");
                    rowhead.createCell((short) 4).setCellValue("Period To");
                    rowhead.createCell((short) 5).setCellValue("Amount");
                    rowhead.createCell((short) 6).setCellValue("Payment Date");
                    rowhead.createCell((short) 7).setCellValue("Status");
                    int i1=1;
                    it3=arr1.iterator();
                    String usd="Used" ;
                    String unuse="Unused" ;
                    while(it3.hasNext()){
                        GenericAdminBean waybillmastermis1=(GenericAdminBean)it3.next();
                        HSSFRow row=sheet.createRow((short)i1);                        
                        row.createCell((short) 0).setCellValue(waybillmastermis1.getChallanno());
                        row.createCell((short) 1).setCellValue(waybillmastermis1.getDlrname());
                        row.createCell((short) 2).setCellValue(waybillmastermis1.getAddress());
                        row.createCell((short) 3).setCellValue(waybillmastermis1.getPeriodfrom()!=null?sdf.format(waybillmastermis1.getPeriodfrom()):"");
                        row.createCell((short) 4).setCellValue(waybillmastermis1.getPeriodto()!=null?sdf.format(waybillmastermis1.getPeriodto()):"");
                        row.createCell((short) 5).setCellValue(waybillmastermis1.getAmount());
                        row.createCell((short) 6).setCellValue(waybillmastermis1.getPaymentdate()!=null?sdf.format(waybillmastermis1.getPaymentdate()):"");
                        if(waybillmastermis1.getChallanstatus().equalsIgnoreCase("0")){
                            row.createCell((short) 7).setCellValue(unuse);
                        }else if(waybillmastermis1.getChallanstatus().equalsIgnoreCase("1")){
                            row.createCell((short) 7).setCellValue(usd);
                        }
                        i1++;
                    }               
                    java.util.Date date=new java.util.Date();
                    String date1=sdff.format(date);                
                    String filenam="paymentDetails_"+date1+".xls" ;
                    String paths="/opt/genericxml";
                    String path1=paths+"/paymentDetails_"+date1+".xls";
                    request.setAttribute("path",path1);
                    request.setAttribute("filename",filenam);
                    System.out.println("excel path is : " + path1);
                    FileOutputStream fileOut =  new FileOutputStream(path1);
                    hwb.write(fileOut);
                    fileOut.close();
                    if(rd==null) 
                        rd=request.getRequestDispatcher("/adminpayment/departmentReportByPeriod.jsp?msg=Excel Sheet Generated..");
                }else{
                    if(rd==null) 
                        rd=request.getRequestDispatcher("/adminpayment/departmentReportByPeriod.jsp?msg=Search the Data First");
                }
            }catch(Exception e){
                if(rd==null) 
                    rd=request.getRequestDispatcher("/adminpayment/departmentReportByPeriod.jsp?msg=Search the Data First");
            }finally{
            }
        }else if (step.equals("22")) {
            try {
                String oldpwd = request.getParameter("oldpassword");
                String user = request.getParameter("user");
                String newpasswrd = request.getParameter("password");
                String deptid = request.getParameter("department");
                PasswordService ps = new PasswordService();
                ps.setPwd(request.getParameter("password"));
                boolean fg = true;                
                if(fg){                    
                    GenericAdminDao.changeDeptPaswrdFirstTime(oldpwd, con, user, newpasswrd,deptid);
                    if(rd==null)
                        rd=request.getRequestDispatcher("/adminpayment/departmentRelogin.jsp");
                } else {
                    if(rd==null){
                        String msg = "Old Password is Wrong";
                        rd =request.getRequestDispatcher("adminpayment/changePwdFirstTime.jsp?msg="+msg);
                    }
                }
            } catch (Exception e) {
                if(rd==null)            
                rd =request.getRequestDispatcher("adminpayment/changePwdFirstTime.jsp?msg=Old Password is Wrong");
                System.out.println("error in step 22 in GenericAdminServlet : "+e.toString());
            }
        }else if(step.equals("23")){
           String dept = request.getParameter("department");
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(dept);
            String msg1 = "";
            try {
                GenericAdminDao gd = new GenericAdminDao();
              //  msg1 = gb.deptValidation(con, gb);
                //if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gd.doUnlockDept(con, dept);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/unlockDept.jsp?msg=Unlocked Successfully");
                    }
                
            } catch (Exception e) {
                System.out.println("error in step 23" + e.getMessage());
            }
        }else if(step.equals("24")){// Unlock Major Tax
            String dept = request.getParameter("department");
            String majortax = request.getParameter("majortaxtype");
            String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(dept);
            gb.setMajortax(majortax);
            String msg1 = "";
            GenericAdminDao gad = new GenericAdminDao();

            try {
                msg1 = gb.deptValidationmaxunlock(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    String majorid = gad.getMajorTaxIdByDept(con, majortax, dept);
                    if (majorid != null) {
                        gad.doUnlockMajorTax(con, majorid);
                    } else {
                        if (rd == null) {
                            rd = request.getRequestDispatcher("/adminpayment/unlockMajorTax.jsp?msg=majorid not found");
                        }
                    }
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/unlockMajorTax.jsp?msg=Updated Successfully");
                    }
                } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/unlockMajorTax.jsp?msg=" + msg1);
                    }
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/unlockMajorTax.jsp?msg=Data Not Updated");
                }
            }
        }else if(step.equals("25")){
            String department = request.getParameter("department");
            int deptid = Integer.parseInt(request.getParameter("department"));
            String taxtyp = request.getParameter("taxtype");
            String treasury = request.getParameter("treasury");
            String majortax = request.getParameter("majortaxtype");
            //String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(department);
            gb.setTax(taxtyp);
            gb.setMajortax(majortax);
            gb.setTreasury_head_code(treasury);
     String msg1 = "";
            GenericAdminDao gda = new GenericAdminDao();
            try {
             msg1 = gb.deptValidationSubTax(con, gb);
          if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    String taxpurposeid = gda.getTaxPurposeIdByTreasuryCode(con, taxtyp, treasury, deptid, majortax);
                    gda.doUnlockTaxByDeptid(con, department, taxpurposeid);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/unlockTax.jsp?msg=Unlock Successfully");
                    }       }else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/unlockTax.jsp?msg=" + msg1);
                    }
            }
           
            } catch (Exception e) {
                System.out.println(e.getMessage());
                  if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/unlockTax.jsp?msg=Data Not Updated");
                }
            }
        }else if(step.equals("26")){
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            try {
                String email=request.getParameter("xmlemail");
                String dept=request.getParameter("dept");
                java.sql.Date enterdate =new java.sql.Date(sdf.parse(request.getParameter("entrydate")).getTime());
                ComtaxXmlGeneration ctx=new ComtaxXmlGeneration();
                ctx.xmlGenerateAndMailAttach(enterdate,dept,con,email);
                    if (rd == null)
                        rd =request.getRequestDispatcher("/adminpayment/comtaxXml.jsp?msg=Generated Successfully");
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }else if(step.equals("27")){
            String dept = request.getParameter("department");
            String idproof = request.getParameter("idproof");
            String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(dept);
            gb.setIdproof(idproof);
            String msg1 = "";

            GenericAdminDao gdao = new GenericAdminDao();
            try {
                msg1 = gb.deptValidationIdProve(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gdao.doInsertIdProof(con, dept, idproof);
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/addIdProof.jsp?msg=Inserted Successfully");
                    }
                } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/addIdProof.jsp?msg=" + msg1);
                    }
                }
            } catch (Exception e) {
                System.out.println("error in step 27 of GenericAdminServlet : " + e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/addIdProof.jsp?msg=Not Inserted");
                }
            }
        }else if(step.equals("28")){
            String dept = request.getParameter("department");
            String idproof = request.getParameter("idproof");
            String action = request.getParameter("actn");
            String idprof = request.getParameter("idprf");
              //String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(dept);
            gb.setIdproof(idproof); 
            //String msg1 = "";
            GenericAdminDao gdao = new GenericAdminDao();
            try {
                     String uniqu = gdao.getUniquIdByDept(con, idproof, dept);
                if (uniqu != null) {
                    if (action.equals("edit")) {
                        gdao.doEditIdProofByDept(con, dept, idprof, uniqu);
                        if (rd == null) {
                            rd = request.getRequestDispatcher("/adminpayment/modifyIdProof.jsp?msg=Edit Successfully");
                        }
                    } else if (action.equals("del")) {
                        gdao.doUpdateIdProofByDept(con, dept, idproof, uniqu);
                        if (rd == null) {
                            rd = request.getRequestDispatcher("/adminpayment/modifyIdProof.jsp?msg=Delete Successfully");
                        }
                    }
                }
            } catch (Exception e) {
                System.out.println("error in step 28 of GenericAdminServlet : " + e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/modifyIdProof.jsp?msg=" + e.getMessage());
                }
            }
        }else if(step.equals("29")){
            String dept = request.getParameter("department");
            String idproof = request.getParameter("idproof");
           // String msg = "Please Fill The Appropriate";
            GenericAdminBean gb = new GenericAdminBean();
            gb.setDepartment(dept);
            gb.setIdproof(idproof);
            //String msg1 = "";
            try {
               // msg1 = gb.deptValidationIdProve(con, gb);
               // if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    GenericAdminDao gad = new GenericAdminDao();
                    String uniqu = gad.getLockUniquIdByDept(con, idproof, dept);
                    if (uniqu != null) {
                        gad.doUnlockIdProof(con, uniqu);
                    } else {
                        if (rd == null) {
                            rd = request.getRequestDispatcher("/adminpayment/unlockIdProof.jsp?msg=majorid not found");
                        }
                    }
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/unlockIdProof.jsp?msg=Updated Successfully");
                    }
               
            } catch (Exception e) {
                System.out.println("error in step 29 of GenericAdminServlet : " + e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/unlockIdProof.jsp?msg=" + e.getMessage());
                }

            }
        }else if(step.equals("32")){
                String department=request.getParameter("department");
                String address=request.getParameter("address");
                String statecode=request.getParameter("state");
                String citycode=request.getParameter("city");
                String pincode=request.getParameter("pincode");
                String mobile=request.getParameter("mobile");
                String email=request.getParameter("email");
                String statename="" ;
                String cityname="" ;
                try {
                    GenericBean gbe = new GenericBean();
                    statename = gbe.getState(con, statecode);
                    cityname = gbe.getCity(con, citycode);
                } catch (Exception e) {
                    System.out.println("error in converting state or district name : " +e.getMessage());
                }
                GenericAdminDao gdao=new GenericAdminDao();
                try{
                    gdao.doInsertDepartmentLocation(con,Integer.parseInt(department),address,Integer.parseInt(statecode),Integer.parseInt(citycode),statename,cityname,pincode,mobile,email);
                    if(rd==null)
                        rd =request.getRequestDispatcher("/adminpayment/departmentLocation.jsp?msg=Added Successfully");
                }catch(Exception e){
                    System.out.println("error in step 32 of GenericAdminServlet : "+e.getMessage());
                    if(rd==null)
                        rd =request.getRequestDispatcher("/adminpayment/departmentLocation.jsp?msg=Some Problem in Addition of Department Location");
                }
        }else if(step.equals("33")){
            String department=request.getParameter("department");
            String address=request.getParameter("address");
            String statecode=request.getParameter("state");
            String citycode=request.getParameter("city");
            String pincode=request.getParameter("pincode");
            String mobile=request.getParameter("mobile");
            String email=request.getParameter("email");
            String statename="" ;
            String cityname="" ;
            try {
                GenericBean gbe = new GenericBean();
                statename = gbe.getState(con, statecode);
                cityname = gbe.getCity(con, citycode);
            }catch (Exception e) {
                System.out.println("error in converting state or district name : " +e.getMessage());
            }
            GenericAdminDao gdao=new GenericAdminDao();
            try{
                gdao.doInsertDepartmentLocation(con,Integer.parseInt(department),address,Integer.parseInt(statecode),Integer.parseInt(citycode),statename,cityname,pincode,mobile,email);
                if(rd==null)
                    rd =request.getRequestDispatcher("/adminpayment/departmentLocation.jsp?msg=Added Successfully");
            }catch(Exception e){
                System.out.println("error in step 32 of GenericAdminServlet : "+e.getMessage());
                if(rd==null)
                    rd =request.getRequestDispatcher("/adminpayment/departmentLocation.jsp?msg=Some Problem in Addition of Department Location");    
            }
        }else if (step.equals("34")) {
            GenericAdminDao gdao = new GenericAdminDao();
            String dept = request.getParameter("department");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            try {
                java.sql.Date period_from =new java.sql.Date(sdf.parse(request.getParameter("periodfrom")).getTime());
                java.sql.Date period_to =new java.sql.Date(sdf.parse(request.getParameter("periodto")).getTime());
                ArrayList departmentdetails = gdao.getFailedOrIntiatedTransactionList(con, period_from, period_to, dept);
                request.setAttribute("failtransactionreport", departmentdetails);
                request.setAttribute("period_from", request.getParameter("periodfrom"));
                request.setAttribute("period_to", request.getParameter("periodto"));
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/failTransaction.jsp");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else if (step.equals("35")) {
            try {
                String oldpwd = request.getParameter("oldpassword");
                String user = request.getParameter("user");
                String newpasswrd = request.getParameter("password");
                String repassword = request.getParameter("repassword");
                String deptid = request.getParameter("department");
                PasswordService ps = new PasswordService();
                ps.setPwd(request.getParameter("password"));
                boolean fg = true;
                String msg = "";
                if (newpasswrd.equalsIgnoreCase(repassword)) {
                    GenericAdminDao.changeDeptPaswrdFirstTime(oldpwd, con, user, newpasswrd, deptid);
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
        }  else if(step.equals("36")){
            String dept = request.getParameter("department");
            String blocasn = request.getParameter("branchlocsn");
            String adrs = request.getParameter("address");
            String action = request.getParameter("actn");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String pincode = request.getParameter("pincode");
            GenericBean gb = new GenericBean();
            gb.setDepartmentid(dept);
            gb.setBranchlocation(blocasn);
            gb.setBranchaddress(adrs);
            gb.setBranchstate(state);
            gb.setBranchdistrict(city);
            gb.setBranchpincode(pincode);
             String msg = "Please Fill The Appropriate";
            String msg1 = "";
            GenericAdminDao gad = new GenericAdminDao();
            try { 
                String branchid = gad.getBranchId(con, blocasn, dept);
                if (branchid != null) {
                    if (action.equals("edit")) {
                             msg1 = gb.deptValidationBranch(con, gb);
                         if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                         gad.doEditBranchLocasn(con, gb, branchid);
                    } else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("adminpayment/modifyDepartmentLocation.jsp?msg=" + msg1);
                    }
            }  
                 }else if (action.equals("del")) {
                        gad.doUpdateBranchLocsn(con, branchid);
                    }
                } else {
                    if (rd == null) {
                        rd = request.getRequestDispatcher("/adminpayment/modifyDepartmentLocation.jsp?msg=majorid not found");
                    }
                }
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/modifyDepartmentLocation.jsp?msg=Updated Successfully");
                }
          }catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    rd = request.getRequestDispatcher("/adminpayment/modifyDepartmentLocation.jsp?msg=Data Not Updated");
                }
            }
        }
        
         else if(step.equals("anualStep")){// mnthStep
           String anualyr = request.getParameter("anuyr");

            GenericAdminBean gb = new GenericAdminBean();
            gb.setAnual_yr(anualyr);
            // gb.setMajortax(majortax);
            String msg1 = "";
            GenericAdminServices gs = new GenericAdminServices();
            try {
                msg1 = gb.anualyr(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gs.doInsertAnual(con, gb);

                    if (rd == null) {
                        String msg = "Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/addAnnualYear.jsp?msg=" + msg);
                    }
                } else {

                    if (rd == null) {
                        //String msg = "msg=Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/addAnnualYear.jsp?msg=" + msg1);
                    }
                }

            } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    String msg = "Financial Year Already Exists";
                    rd = request.getRequestDispatcher("adminpayment/addAnnualYear.jsp?msg=" + msg);
                }
            }
        }
          else if(step.equals("mnthStep")){// mnthStep
           String mnthyr = request.getParameter("mnthyr");

            GenericAdminBean gb = new GenericAdminBean();
            gb.setQrtrmnth_yer(mnthyr);
            // gb.setMajortax(majortax);
            String msg1 = "";
            GenericAdminServices gs = new GenericAdminServices();
            try {
                msg1 = gb.qrtmnthyr(con, gb);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gs.doInsertqurtmnth(con, gb);

                    if (rd == null) {
                        String msg = "Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/addMonthYear.jsp?msg=" + msg);
                    }
                } else {

                    if (rd == null) {
                        //String msg = "msg=Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/addMonthYear.jsp?msg=" + msg1);
                    }
                }

            } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                    String msg = "Data Already Exists";
                    rd = request.getRequestDispatcher("adminpayment/addMonthYear.jsp?msg=" + msg);
                }
            }
        }else if(step.equals("37")){
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dept=request.getParameter("dept");
            try{
            java.sql.Date period_from = new java.sql.Date(sdf.parse(request.getParameter("periodfrom")).getTime());
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
        }
        
    try{
        con.close();
    }catch(Exception e){
        System.out.println("Exception in closing connection in GenericAdminServlet : "+e.getMessage());
    }

        rd.forward(request, response);
    }
}

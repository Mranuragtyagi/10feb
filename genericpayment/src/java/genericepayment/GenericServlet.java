package genericepayment;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import nl.captcha.Captcha;
import sms.*;
import vicclas.MD5;
import vicclass.Period;
import vicclass.User;
import vicclass.Utility;

public class GenericServlet extends HttpServlet {
    private static final String CONTENT_TYPE = 
        "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, 
                                                           IOException {
        //doPost(request, response);`
        response.setContentType(CONTENT_TYPE);
        RequestDispatcher rd = null;
        Connection conn = null;
        //  User u=new User();
        User u =request.getSession().getAttribute("user") != null ? (User)request.getSession().getAttribute("user") :new User();
        conn = u.getConnection();
        ArrayList al = null;
        String email = (String)request.getSession().getAttribute("email");
        GenericBean eclhistory = new GenericBean();
        try {
            al=eclhistory.doQueryForTransactionHistoryWithPagination(conn,email);
            if (al.size() != 0) {
                request.getSession().setAttribute("user", u);
                request.getSession().setAttribute("eclhistory",  al);
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/genericPaymentHistory.jsp");
            } else {
                request.getSession().setAttribute("user", u);
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/genericPaymentHistory.jsp");
            }

        } catch (Exception e) {
            if (rd == null)
                rd =request.getRequestDispatcher("genericpayment/genericPaymentHistory.jsp?msg=No Data Found");
            System.out.println("epayment error in dogetMethod" + 
                               e.getMessage());
        }
        rd.forward(request, response);
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, 
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        User u = new User();
        Connection con = null;
        u.createConnection();
        con = u.getConnection();
        RequestDispatcher rd = null;
        String step = request.getParameter("step");

        if (step.equals("1")) 
         {
            String statename = "";
            String cityname = "";
            String department =request.getParameter("department") != null ? request.getParameter("department") :"";
            String reponseParts[] = department.split("@");
            String departmentid = reponseParts[0];
            String departmentname = reponseParts[1];
            String treasuryhead = 
                request.getParameter("treasuryhead") != null ?request.getParameter("treasuryhead") : "";
            String purpose = 
                request.getParameter("purpose") != null ? request.getParameter("purpose") : 
                "";
            String description = 
                request.getParameter("description") != null ? request.getParameter("description") : 
                "";
            String finalyear = 
                request.getParameter("finalyear") != null ? request.getParameter("finalyear") : 
                "";
            String periodtype = 
                request.getParameter("taxperiod") != null ? request.getParameter("taxperiod") : 
                "";
            String qarter = request.getParameter("quarter");
            String fomdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String mth = request.getParameter("month");
            double amount = 
                request.getParameter("amount") != null ? Double.parseDouble(request.getParameter("amount")) : 
                0.00;
            String remarks = 
                request.getParameter("remarks") != null ? request.getParameter("remarks") : 
                "";
            String dlrname = 
                request.getParameter("name") != null ? request.getParameter("name") : 
                "";
            String address = 
                request.getParameter("address") != null ? request.getParameter("address") : 
                "";
            String city = 
                request.getParameter("city") != null ? request.getParameter("city") : 
                "";
            String state = 
                request.getParameter("state") != null ? request.getParameter("state") : 
                "";
            String pincode = 
                request.getParameter("pincode") != null ? request.getParameter("pincode") : 
                "";
            String mobile = 
                request.getParameter("mobile") != null ? request.getParameter("mobile") : 
                "";
            String email = 
                request.getParameter("email") != null ? request.getParameter("email") : 
                "";
            try {
                GenericBean gbe = new GenericBean();
                statename = gbe.getState(con, state);
                cityname = gbe.getCity(con, city);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            java.sql.Date period_from = null;
            java.sql.Date period_to = null;
            int year = 0;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            if (periodtype.equals("m")) {
                int month = Integer.parseInt(request.getParameter("month"));
                year = Integer.parseInt(request.getParameter("finalyear"));
                Period p = Utility.getPeriodMonth(con, month, year);
                period_from = p.period_from;
                period_to = p.period_to;
            } else if (periodtype.equals("q")) {
                int quarter = 
                    Integer.parseInt(request.getParameter("quarter"));
                int qtr_year = 
                    Integer.parseInt(request.getParameter("finalyear"));
                Period p = 
                    Utility.getPeriodQuarter(con, quarter - 1, qtr_year);
                period_from = p.period_from;
                period_to = p.period_to;
            } else if (periodtype.equals("a")) {
                int temp = 
                    Integer.parseInt(request.getParameter("finalayear"));
                temp = temp + 1;
                String yf = "01/04/" + request.getParameter("finalayear");
                String yt = "31/03/" + temp;
                try {
                    period_from = new java.sql.Date(sdf.parse(yf).getTime());
                    period_to = new java.sql.Date(sdf.parse(yt).getTime());
                } catch (Exception e) {
                    System.out.print(e.getMessage());
                }
            } else if (periodtype.equals("s")) {
                try {
                    period_from = 
                            new java.sql.Date(sdf.parse(request.getParameter("fromdate")).getTime());
                    period_to = 
                            new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            } else if (periodtype.equals("o")) {
                try {
                    period_from = 
                            new java.sql.Date(sdf.parse(request.getParameter("finalyear")).getTime());
                    //period_to=new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            GenericBean genericbean = new GenericBean();
            genericbean.setDepartmentname(departmentname);
            genericbean.setDepartmentid(departmentid);
            genericbean.setTreasuryhead(treasuryhead);
            genericbean.setPurpose(purpose);
            genericbean.setDescription(description);
            genericbean.setAmount(amount);
            genericbean.setRemarks(remarks);
            genericbean.setDlrname(dlrname);
            genericbean.setAddress(address);
            genericbean.setMobile(mobile);
            genericbean.setEmail(email);
            genericbean.setPeriod_from(period_from);
            genericbean.setPeriod_to(period_to);
            genericbean.setPeriodtype(periodtype);
            genericbean.setFinalyear(finalyear);
            genericbean.setQuarter(qarter);
            genericbean.setFromdate(fomdate);
            genericbean.setTodate(todate);
            genericbean.setMonth(mth);
            genericbean.setCity(cityname);
            genericbean.setCitycode(city);
            genericbean.setState(statename);
            genericbean.setStatecode(state);
            genericbean.setPincode(pincode);
            try{
                request.setAttribute("genericbean", genericbean);
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/verifydetails.jsp");
            }catch (Exception e){
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/unregistered.jsp?err=" +e.getMessage());
                    System.out.println("epayment error in step 1" +e.getMessage());
            }
        } else if (step.equals("2")) {
            String trans = "";
            String treasuryhead = request.getParameter("treasuryhead")!=null?request.getParameter("treasuryhead"):"";
            if(!treasuryhead.equals("")){
            try {
                String departmentid = "";
            int year=0;
                java.sql.Date period_from = null;
                java.sql.Date period_to = null;
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                GenericBean genericbean = new GenericBean();
                String department = request.getParameter("department") != null ? request.getParameter("department") :"";
                if (department.equalsIgnoreCase("depart")) {
                } else {
                    GenericBean gb=new GenericBean();
                    String deptid=gb.getDeptIdByDeptName(con,department);
                     departmentid=deptid;
                }
                String purpose = request.getParameter("purpose");
                String description = request.getParameter("description")!=null?request.getParameter("description"):"";                
                String periodtype = request.getParameter("taxperiod") != null ? request.getParameter("taxperiod") : "";
                if (periodtype.equals("m")) {
                    int month = Integer.parseInt(request.getParameter("month"));
                    year = Integer.parseInt(request.getParameter("finalmyear"));
                    Period p = Utility.getPeriodMonth(con, month, year);
                    period_from = p.period_from;
                    period_to = p.period_to;
                } else if (periodtype.equals("q")){
                    int quarter = 
                        Integer.parseInt(request.getParameter("quarter"));
                    int qtr_year = 
                        Integer.parseInt(request.getParameter("finalqyear"));
                    Period p = 
                    Utility.getPeriodQuarter(con, quarter - 1, qtr_year);
                    period_from = p.period_from;
                    period_to = p.period_to;
                }else if (periodtype.equals("a")) {
                    String finayearvalue=request.getParameter("finalayear");
                String finl[]=finayearvalue.split("\\-");
                String finalayear=finl[0];
                    int temp = 
                        Integer.parseInt(finalayear);
                    temp = temp + 1;
                    String yf = "01/04/" + finalayear;
                    String yt = "31/03/" + temp;
                    try {
                        period_from = new java.sql.Date(sdf.parse(yf).getTime());
                        period_to = new java.sql.Date(sdf.parse(yt).getTime());
                    } catch (Exception e) {
                        System.out.print("annual year problem : "+e.getMessage());
                    }
                } else if (periodtype.equals("s")) {
                    try {
                        period_from = 
                                new java.sql.Date(sdf.parse(request.getParameter("fromdate")).getTime());
                        period_to = 
                                new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                    } catch (Exception e) {
                        System.out.println("specific period problem : "+e.getMessage());
                    }
                } else if (periodtype.equals("n")) {
                    try {
                        java.util.Date notrequire = new java.util.Date();
                        String formattedDate = sdf.format(notrequire);
                        period_from =new java.sql.Date(sdf.parse(formattedDate).getTime());
                        period_to=new java.sql.Date(sdf.parse(formattedDate).getTime());
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
                String remarks = request.getParameter("remarks");
                double grandtotal =request.getParameter("grandtotal") != null ? Double.parseDouble(request.getParameter("grandtotal")) :0.00;
                String dlrname = request.getParameter("name");
                String address = request.getParameter("address");
                String mobile = request.getParameter("mobile");
                String email = request.getParameter("emailed");
                String ptyp = request.getParameter("taxperiod");
                String fyer = request.getParameter("fyer");
                String qrtr = request.getParameter("qrtr");
                String frmdt = request.getParameter("frmdt");
                String todt = request.getParameter("todt");
                String mnth = request.getParameter("mnth");
                String pincode = request.getParameter("pincode");
                String citycode = request.getParameter("city");
                String statecode = request.getParameter("state");
                String id=request.getParameter("taxid");
                String idno=request.getParameter("taxidval");
                String branchlocation=request.getParameter("location");
                String subtax=request.getParameter("subtax");
                String amont=request.getParameter("amount");
                String pen=request.getParameter("penalty");
                String mic=request.getParameter("misc");
                String ints=request.getParameter("interest")!=null?request.getParameter("interest"):"" ;
               // String circname=request.getParameter("circle");
                // String circleno=genericbean.getCircleNoByCirName(con,circname);
                 double amount=0; double interest=0;  double penalty=0; double misc=0;
                 if(amont=="" || amont.equalsIgnoreCase("")){
                     amount=0;
                 }else{
                     amount=Double.parseDouble(request.getParameter("amount")!=null?request.getParameter("amount"): "0"); 
                 }
                if(ints=="" || ints.equalsIgnoreCase("")){
                    interest=0;
                }else{
                    interest=Double.parseDouble(request.getParameter("interest")!=null?request.getParameter("interest"): "0"); 
                }
                 if((pen.equalsIgnoreCase("0")) || (pen.equals(""))){
                     penalty=0;
                 }else{
                 penalty=Double.parseDouble(request.getParameter("penalty")!=null?request.getParameter("penalty"): "0");
                 }
                if((mic.equalsIgnoreCase("0")) || (mic.equals(""))){
                    misc=0;
                }else {
                 misc=Double.parseDouble(request.getParameter("misc")!=null?request.getParameter("misc"): "0");
                }
                String city = "";
                String state = "";
                try {
                    GenericBean gbe = new GenericBean();
                    state = gbe.getState(con, statecode);
                    city = gbe.getCity(con, citycode);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                genericbean.setSubtax(subtax);
                genericbean.setAmount(amount);
                genericbean.setInterest(interest);;
                genericbean.setPenalty(penalty);
                genericbean.setMisc(misc);
                genericbean.setGrandtotal(grandtotal);
                genericbean.setDepartmentid(departmentid);
                genericbean.setDepartmentname(department);
                genericbean.setTreasuryhead(treasuryhead);
                genericbean.setPurpose(purpose);
                genericbean.setDescription(description);
                genericbean.setRemarks(remarks);
                genericbean.setDlrname(dlrname);
                genericbean.setAddress(address);
                genericbean.setMobile(mobile);
                genericbean.setEmail(email);
                genericbean.setPeriod_from(period_from);
                genericbean.setPeriod_to(period_to);
                genericbean.setMonth(request.getParameter("month"));
                genericbean.setFinalyear(fyer);
                genericbean.setPeriodtype(ptyp);
                genericbean.setQuarter(qrtr);
                genericbean.setFromdate(frmdt);
                genericbean.setTodate(todt);
                genericbean.setMonth(mnth);
                genericbean.setCity(city);
                genericbean.setState(state);
                genericbean.setPincode(pincode);
                genericbean.setCitycode(citycode);
                genericbean.setStatecode(statecode);
                genericbean.setIdproof(id);
                genericbean.setIdproofval(idno);
              //  genericbean.setCircle(circleno);
               // genericbean.setCir_name(circname);
                genericbean.setBranchaddress(branchlocation);
                // regex validation
                
                UserValidation uv=new UserValidation();
                String errmsg=uv.taxInfoMatching(genericbean);
                String usermesg=uv.instantUserDetailsMatching(genericbean);
                if((errmsg!="Please fill the appropriate") ||(usermesg!="Please fill the appropriate")){
                    request.setAttribute("errmsg" ,errmsg);
                    request.setAttribute("usermesg" ,usermesg);
                    if (rd == null)rd =request.getRequestDispatcher("genericpayment/unregisteredUserDetail.jsp");
                }else{
                    SimpleDateFormat sdff = 
                    new SimpleDateFormat("ddMMyyyyhhmmss");
                    java.util.Date currentdate = null;
                    currentdate = new java.util.Date();
                    String formattedDate = sdff.format(currentdate);
                    double randomInt = (Math.floor((Math.random() * 89) + 10));
                    int rndnumber = (int)randomInt;
                    trans = formattedDate + rndnumber;
                    genericbean.setChallanno(trans);
                    genericbean.doInsertUnregisteredDetails(con, genericbean);
                    //sms
                    SMS_Sender1 sn=new SMS_Sender1();
                    String mesg="You have initiated the payment of Rs" +amount+ ".Your Challan Id is  "+trans+ " .Please check Your email for additional details.Thank You! Government of Jharkhand";
                     sn.doSendDND(mobile,mesg) ;
                    //email
                     String mssg="You have initiated the payment of Rs" +amount+ ".Your Challan Id is  "+trans+ " .Thank You! Government of Jharkhand" ;
                     NICMailer nic=new NICMailer();
                     String subject="Payment Initiated" ;
                     NICMailer.doSendMail( mssg, email,subject );
                     
                    request.getSession().setAttribute("genericbean", genericbean);
                    request.getSession().setAttribute("chid", trans);
                    
               // out.println('success');
                if (rd == null)rd =request.getRequestDispatcher("genericpayment/verifyMsg.jsp?msg="+trans);
                }
                
                } catch (Exception e) {
                System.out.println("finally exception in unregistered insertion : "+e.getMessage());
                if (rd == null)rd =request.getRequestDispatcher("genericpayment/verifyMsg.jsp?msg=error" );
            }
            }else{
                if (rd == null)rd =request.getRequestDispatcher("genericpayment/unregisteredUserDetail.jsp?treasurymsg=Treasury Head Code is Null! Please Delete The Cookies to Avoid This Problem");
            }
        } else if (step.equals("3")){
            GenericFastBean beanvalue=request.getSession().getAttribute("fastbean")!=null?(GenericFastBean)request.getSession().getAttribute("fastbean") : new GenericFastBean();
            String fullname = beanvalue.getName();
            String email = beanvalue.getEmail();
            String mobile = beanvalue.getPhone();
            String paswd=beanvalue.getPwd();
            String repassword = beanvalue.getConfirmpwd();  
            request.getSession().removeAttribute("fastbean");        
            String a = "login";
            String statename = "";
            String cityname = "";
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String question = request.getParameter("question");
            String answer = request.getParameter("eanswer");
            String idproof=request.getParameter("taxid");
            String idvalue=request.getParameter("taxidval");
            try{
                GenericBean gb = new GenericBean();
                statename = gb.getState(con, state);
                cityname = gb.getCity(con, city);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            GenericBean signupbean = new GenericBean();
            signupbean.setDlrname(fullname);
            signupbean.setEmail(email);
            signupbean.setMobile(mobile);
            signupbean.setAddress(address);
            signupbean.setCity(cityname);
            signupbean.setCitycode(city);
            signupbean.setState(statename);
            signupbean.setStatecode(state);
            signupbean.setPincode(pincode);
            signupbean.setQuestion(question);
            signupbean.setAnswer(answer);
            signupbean.setRepassword(repassword);
            signupbean.setIdproof(idproof);
            signupbean.setIdproofval(idvalue);
            signupbean.setPassword(paswd);
            // signupbean.setRepassword(repassword);
            try {
            UserValidation uv=new UserValidation();
           // String msg=uv
             String errormsg=uv.userDetailsMatching(signupbean);              
             System.out.println("user details message :" +errormsg);
             if(errormsg.equalsIgnoreCase("Please fill the appropriate") || errormsg=="Please fill the appropriate"){
                signupbean.doInsertSignUpDetails(con, signupbean);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("signupbean", signupbean);
                request.getSession().setAttribute("userloggedin", a);
                if (rd == null)
                rd =request.getRequestDispatcher("genericpayment/userContent.jsp");
             }else{
              if (rd == null)
                rd =request.getRequestDispatcher("landing.jsp?validationmsg="+errormsg);
             }
                //    if(rd==null) rd=request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp");
            } catch (Exception e) {
                if (rd == null)
                    rd =request.getRequestDispatcher("landing.jsp?validationmsg=This Email-Id already Exists!");
                System.out.println(e.getMessage());
            }
        } else if (step.equals("4")) {
            String department =request.getParameter("department") != null ? request.getParameter("department") : 
                "";
            String reponseParts[] = department.split("@");
            String departmentid = reponseParts[0];
            String departmentname = reponseParts[1];
            String treasuryhead =request.getParameter("treasuryhead") != null ?request.getParameter("treasuryhead") : "";
            String purpose =request.getParameter("purpose") != null ? request.getParameter("purpose") :"";
            String description = 
                request.getParameter("description") != null ? request.getParameter("description") : 
                "";
            String finalyear = 
                request.getParameter("finalyear") != null ? request.getParameter("finalyear") : 
                "";
            String periodtype = 
                request.getParameter("taxperiod") != null ? request.getParameter("taxperiod") : 
                "";
            String qarter = request.getParameter("quarter");
            String fomdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String mth = request.getParameter("month");
            double amount = 
                request.getParameter("amount") != null ? Double.parseDouble(request.getParameter("amount")) : 
                0.00;
            String remarks = 
                request.getParameter("remarks") != null ? request.getParameter("remarks") : 
                "";
            String dlrname = 
                request.getParameter("name") != null ? request.getParameter("name") : 
                "";
            String address = 
                request.getParameter("address") != null ? request.getParameter("address") : 
                "";
            String mobile = 
                request.getParameter("mobile") != null ? request.getParameter("mobile") : 
                "";
            String email = 
                request.getParameter("email") != null ? request.getParameter("email") : 
                "";
            String city = 
                request.getParameter("city") != null ? request.getParameter("city") : 
                "";
            String state = 
                request.getParameter("state") != null ? request.getParameter("state") : 
                "";
            String pincode = 
                request.getParameter("pincode") != null ? request.getParameter("pincode") : 
                "";
            String statecode = 
                request.getParameter("statecode") != null ? request.getParameter("statecode") : 
                "";
            String citycode = 
                request.getParameter("citycode") != null ? request.getParameter("citycode") : 
                "";

            java.sql.Date period_from = null;
            java.sql.Date period_to = null;
            int year = 0;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            if (periodtype.equals("m")) {
                int month = Integer.parseInt(request.getParameter("month"));
                year = Integer.parseInt(request.getParameter("finalyear"));
                Period p = Utility.getPeriodMonth(con, month, year);
                period_from = p.period_from;
                period_to = p.period_to;
            } else if (periodtype.equals("q")) {
                int quarter = 
                    Integer.parseInt(request.getParameter("quarter"));
                int qtr_year = 
                    Integer.parseInt(request.getParameter("finalyear"));
                Period p = 
                    Utility.getPeriodQuarter(con, quarter - 1, qtr_year);
                period_from = p.period_from;
                period_to = p.period_to;
            } else if (periodtype.equals("a")) {
                int temp = 
                    Integer.parseInt(request.getParameter("finalayear"));
                temp = temp + 1;
                String yf = "01/04/" + request.getParameter("finalayear");
                String yt = "31/03/" + temp;
                try {
                    period_from = new java.sql.Date(sdf.parse(yf).getTime());
                    period_to = new java.sql.Date(sdf.parse(yt).getTime());
                } catch (Exception e) {
                    System.out.print(e.getMessage());
                }
            } else if (periodtype.equals("s")) {
                try {
                    period_from = 
                            new java.sql.Date(sdf.parse(request.getParameter("fromdate")).getTime());
                    period_to = 
                            new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            } else if (periodtype.equals("o")) {
                try {
                    period_from = 
                            new java.sql.Date(sdf.parse(request.getParameter("finalyear")).getTime());
                    //period_to=new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            GenericBean genericbean = new GenericBean();
            genericbean.setDepartmentname(departmentname);
            genericbean.setDepartmentid(departmentid);
            genericbean.setTreasuryhead(treasuryhead);
            genericbean.setPurpose(purpose);
            genericbean.setDescription(description);
            genericbean.setAmount(amount);
            genericbean.setRemarks(remarks);
            genericbean.setDlrname(dlrname);
            genericbean.setAddress(address);
            genericbean.setMobile(mobile);
            genericbean.setEmail(email);
            genericbean.setPeriod_from(period_from);
            genericbean.setPeriod_to(period_to);
            genericbean.setPeriodtype(periodtype);
            genericbean.setFinalyear(finalyear);
            genericbean.setQuarter(qarter);
            genericbean.setFromdate(fomdate);
            genericbean.setTodate(todate);
            genericbean.setMonth(mth);
            genericbean.setCity(city);
            genericbean.setState(state);
            genericbean.setPincode(pincode);
            genericbean.setCitycode(citycode);
            genericbean.setStatecode(statecode);
            try {
                request.setAttribute("genericbean", genericbean);
                if (rd == null)
                    rd = 
 request.getRequestDispatcher("genericpayment/verifyRegisteredDetails.jsp");
            } catch (Exception e) {
                if (rd == null)
                    rd = 
 request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp?err=" + 
                              e.getMessage());
                System.out.println("epayment error in step 4" + 
                                   e.getMessage());
            }

        }
        
        
        
        
        else if (step.equals("5")) {
            String treasuryhead = request.getParameter("treasuryhead")!=null?request.getParameter("treasuryhead"):"";
        if(!treasuryhead.equals("")){
            String trans = "";
            try {
                String periodtype =request.getParameter("taxperiod") != null ? request.getParameter("taxperiod") :"";
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                GenericBean genericbean = new GenericBean();
                String department = request.getParameter("department") != null ? request.getParameter("department") :"";
                
                GenericBean gb=new GenericBean();
                String deptid=gb.getDeptIdByDeptName(con,department);
                String departmentid=deptid;
                
                
                String purpose = request.getParameter("purpose");
                String description = request.getParameter("description");
    
                java.sql.Date period_from = null;
                java.sql.Date period_to = null;
                int year = 0;
                if (periodtype.equals("m")) {
                    int month = Integer.parseInt(request.getParameter("month"));
                    year = Integer.parseInt(request.getParameter("finalmyear"));
                    Period p = Utility.getPeriodMonth(con, month, year);
                    period_from = p.period_from;
                    period_to = p.period_to;
                } else if (periodtype.equals("q")) {
                    int quarter = 
                        Integer.parseInt(request.getParameter("quarter"));
                    int qtr_year = 
                        Integer.parseInt(request.getParameter("finalqyear"));
                    Period p = 
                        Utility.getPeriodQuarter(con, quarter - 1, qtr_year);
                    period_from = p.period_from;
                    period_to = p.period_to;
                } else if (periodtype.equals("a")) {
                    String finayearvalue=request.getParameter("finalayear");
                String finl[]=finayearvalue.split("\\-");
                String finalayear=finl[0];
                    int temp = 
                        Integer.parseInt(finalayear);
                    temp = temp + 1;
                    String yf = "01/04/" + finalayear;
                    String yt = "31/03/" + temp;
                    try {
                        period_from = new java.sql.Date(sdf.parse(yf).getTime());
                        period_to = new java.sql.Date(sdf.parse(yt).getTime());
                    } catch (Exception e) {
                        System.out.print(e.getMessage());
                    }
                } else if (periodtype.equals("s")) {
                    try {
                        period_from = 
                                new java.sql.Date(sdf.parse(request.getParameter("fromdate")).getTime());
                        period_to = 
                                new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                } else if (periodtype.equals("n")) {
                    try {
                        java.util.Date notrequire = new java.util.Date();
                        String formattedDate = sdf.format(notrequire);
                        period_from =new java.sql.Date(sdf.parse(formattedDate).getTime());
                        period_to=new java.sql.Date(sdf.parse(formattedDate).getTime());
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
               
                String remarks = request.getParameter("remarks");
                double amount = request.getParameter("amount") != null ? Double.parseDouble(request.getParameter("amount")) :0.00;
                double grandtotal =request.getParameter("grandtotal") != null ? Double.parseDouble(request.getParameter("grandtotal")) :0.00;
                String dlrname = request.getParameter("name");
                String address = request.getParameter("address");
                String mobile = request.getParameter("mobile");
                String email = request.getParameter("email");
                String ptyp = request.getParameter("taxperiod");
                String fyer = request.getParameter("fyer");
                String qrtr = request.getParameter("qrtr");
                String frmdt = request.getParameter("frmdt");
                String todt = request.getParameter("todt");
                String mnth = request.getParameter("mnth");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String pincode = request.getParameter("pincode");
                String citycode = request.getParameter("citycode");
                String statecode = request.getParameter("statecode");
                String id=request.getParameter("taxid");
                String idno=request.getParameter("taxidval");
                String branchlocation=request.getParameter("location");
                String pen=request.getParameter("penalty");
                String mic=request.getParameter("misc");
                String intrst=request.getParameter("interest");
                String circname=request.getParameter("circle");
                //String circleno=genericbean.getCircleNoByCirName(con,circname);
                double interest=0;  double penalty=0; double misc=0;
                String subtax=request.getParameter("subtax");
                 //interest=Double.parseDouble(request.getParameter("interest")!=null?request.getParameter("interest"): "0");
                 
                    if((intrst.equalsIgnoreCase("0")) || (intrst.equals(""))){
                        interest=0;
                    }else{
                        interest=Double.parseDouble(request.getParameter("interest")!=null?request.getParameter("interest"): "0");
                    }
                    
                 if((pen.equalsIgnoreCase("0")) || (pen.equals(""))){
                     penalty=0;
                 }else{
                 penalty=Double.parseDouble(request.getParameter("penalty")!=null?request.getParameter("penalty"): "0");
                 }
                 
                if((mic.equalsIgnoreCase("0")) || (mic.equals(""))){
                    misc=0;
                }else{
                    misc=Double.parseDouble(request.getParameter("misc")!=null?request.getParameter("misc"): "0");
                }
            
                genericbean.setSubtax(subtax);
                genericbean.setAmount(amount);
                genericbean.setInterest(interest);
                genericbean.setPenalty(penalty);
                genericbean.setMisc(misc);
                genericbean.setGrandtotal(grandtotal);
                genericbean.setDepartmentid(departmentid);
                genericbean.setDepartmentname(department);
                genericbean.setTreasuryhead(treasuryhead);
                genericbean.setPurpose(purpose);
                genericbean.setDescription(description);
                genericbean.setRemarks(remarks);
                genericbean.setDlrname(dlrname);
                genericbean.setAddress(address);
                genericbean.setMobile(mobile);
                genericbean.setEmail(email);
                genericbean.setPeriod_from(period_from);
                genericbean.setPeriod_to(period_to);
                genericbean.setMonth(request.getParameter("month"));
                genericbean.setFinalyear(fyer);
                genericbean.setPeriodtype(ptyp);
                genericbean.setQuarter(qrtr);
                genericbean.setFromdate(frmdt);
                genericbean.setTodate(todt);
                genericbean.setMonth(mnth);
                genericbean.setCity(city);
                genericbean.setState(state);
                genericbean.setPincode(pincode);
                genericbean.setCitycode(citycode);
                genericbean.setStatecode(statecode);
                genericbean.setIdproof(id);
                genericbean.setIdproofval(idno);
               // genericbean.setCircle(circleno);
                genericbean.setCir_name(circname);
                genericbean.setBranchaddress(branchlocation);
                
                UserValidation uv=new UserValidation();
                String regusermesg=uv.registeredDealerMatching(genericbean);
                if(regusermesg!="Please fill the appropriate"){
                    request.setAttribute("regusermesg" ,regusermesg);
                    if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp");
                }else{
                    SimpleDateFormat sdff =new SimpleDateFormat("ddMMyyyyhhmmss");
                        java.util.Date currentdate = null;
                        currentdate = new java.util.Date();
                        String formattedDate = sdff.format(currentdate);
                        double randomInt = (Math.floor((Math.random() * 89) + 10));
                        int rndnumber = (int)randomInt;
                        trans = formattedDate + rndnumber;
                        genericbean.setChallanno(trans);
                        genericbean.doInsertRegisteredDetails(con, genericbean);
                        //sms
                    SMS_Sender1 sn=new SMS_Sender1();
                    String mesg="You have initiated the payment of Rs" +amount+ ".Your Challan Id is  "+trans+ " .Please check Your email for additional details.Thank You! Government of Jharkhand";
                     sn.doSendDND(mobile,mesg) ;
                    //email
                     String mssg="You have initiated the payment of Rs" +amount+ ".Your Challan Id is  "+trans+ " .Thank You! Government of Jharkhand" ;
                     NICMailer nic=new NICMailer();
                     String subject="Payment Initiated" ;
                     NICMailer.doSendMail( mssg, email,subject );
                        request.getSession().setAttribute("genericbean", genericbean);
                if (rd == null)
                    rd = 
      // request.getRequestDispatcher("genericpayment/confirmpayment.jsp");
               // request.getRequestDispatcher("genericpayment/verifyMsg.jsp?msg=success" );
                request.getRequestDispatcher("genericpayment/verifyMsg.jsp?msg="+trans);
                }} catch (Exception e) {
                System.out.println("error in step 5 of Generic Servlet"+e.getMessage());
                if (rd == null)
                    rd = 
     // request.getRequestDispatcher("genericpayment/verifyRegisteredDetails.jsp?err=" + e.getMessage());
                request.getRequestDispatcher("genericpayment/verifyMsg.jsp?msg=error" );
                System.out.println(e.getMessage());
            }
        }else{
            if (rd == null)
                rd =request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp?treasurymsg=Treasury Head Code is Null! Please Delete The Cookies to Avoid This Problem");
        }
        }

        else if (step.equals("6")) {
            String c = "";
            Captcha captcha = null;
            boolean flag = false;
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String a = "login";
            try {
                c = request.getSession().getAttribute("rnd").toString();
                captcha = (Captcha)request.getSession().getAttribute("Acaptcha");
               // if (captcha.getAnswer().toUpperCase().equals(cain.toUpperCase())) {
               if(true){
                    try {
                        GenericBean gb = new GenericBean();
                        flag = gb.doFindByUser(con, email, password, c);
                        if (flag == false) {
                            if (rd == null) rd =request.getRequestDispatcher("Home.jsp?msg=Invalid username or password");
                        } else {
                            GenericBean signupbean = new GenericBean();
                            signupbean = gb.getDetailsByEmail(con, email);
                            // if(rd==null)   rd=request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp");
                            if (rd == null) rd =request.getRequestDispatcher("genericpayment/userContent.jsp");
                            request.getSession().setAttribute("signupbean",signupbean);
                            request.getSession().setAttribute("loggedin", a);
                            request.getSession().setAttribute("email", email);
                            request.getSession().setAttribute("user", u);
                        }
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                } else {
                    if (rd == null) rd = request.getRequestDispatcher("Home.jsp?msg=Invalid captcha input");
                }
            }catch (Exception e) {
                if (rd == null) rd = request.getRequestDispatcher("Home.jsp?msg="+e.getMessage());
            }
        }


        else if (step.equals("7")) {
            String email = request.getParameter("lemail");
            String answer = request.getParameter("eanswer");
            GenericBean bg = new GenericBean();
              bg.setEmail(email);
              bg.setAnswer(answer);
            String msg = "Please Fill The Appropriate";
            String msg1 = "";
            try {
                 msg1 = bg.deptForget(con,bg);
                    if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                String answr = bg.getSecurityAnswerByEmail(con, email);
                if (answer.equalsIgnoreCase(answr)) {
                    if (rd == null)
                        rd =request.getRequestDispatcher("genericpayment/createNewDlrPwd.jsp");
                        request.getSession().setAttribute("email", email);
                } else {
                    if (rd == null)
                        rd =request.getRequestDispatcher("landing.jsp?mssg=Invalid Answer!");
                }
                    }
                     else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("landing.jsp?msg=Invalid Input! Please Try Again.");
                    }}
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        else if (step.equals("8")) {
            String oldpwd = request.getParameter("oldpassword");
            String password = request.getParameter("password");
            String confirmpassword = request.getParameter("confirmpassword");
            String username = request.getParameter("username");
           
            if (password.equalsIgnoreCase(confirmpassword)) {
                GenericBean gbb = new GenericBean();
                try {
                    gbb.doUpdatePassword(oldpwd, con, username,confirmpassword);
                    if (rd == null)
                        rd =request.getRequestDispatcher("genericpayment/chngPassword.jsp?msg=Password Changed Successfully!");
                }catch (Exception e) {
                    System.out.println(e.getMessage());
                    if (rd == null)
                        rd = request.getRequestDispatcher("genericpayment/chngPassword.jsp?msg="+e.getMessage());
                }
            } else {
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/chngPassword.jsp?msg=Password Mismatch");
            }
        }
        
        else if (step.equals("9")) {
            String fullname = request.getParameter("firstname");
            String email = request.getParameter("email");
            String mobile = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String question = request.getParameter("question");
            String answer = request.getParameter("eanswer");
            String statename="";
            String cityname="" ;
            try {
                GenericBean gbe = new GenericBean();
                statename = gbe.getState(con, state);
                cityname = gbe.getCity(con, city);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            GenericBean signupbean = new GenericBean();
            signupbean.setDlrname(fullname);
            signupbean.setEmail(email);
            signupbean.setMobile(mobile);
            signupbean.setAddress(address);
            signupbean.setCity(cityname);
            signupbean.setState(statename);
            signupbean.setPincode(pincode);
            signupbean.setQuestion(question);
            signupbean.setAnswer(answer);
            signupbean.setCitycode(city);
            signupbean.setStatecode(state);
            
            

            try {
                //validation check
                UserValidation uv=new UserValidation();
                String editProfileErrorMsg=uv.editProfileValidation(signupbean);
                if(editProfileErrorMsg!="Please fill the appropriate"){
                    request.setAttribute("editProfileErrorMsg" ,editProfileErrorMsg);
                    if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/editProfileDetails.jsp");
                }//validation finish
                
                else{
                signupbean.getUpdateUserDetails(con, signupbean);
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/editProfileDetails.jsp?msg=Updated Successfully!");
                    request.getSession().setAttribute("signupbean", signupbean);
                } 
                }catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/editProfileDetails.jsp?msg=Error in Updation");
            }
        } 
        else if (step.equals("10")) {
            String challan = 
                request.getParameter("challan") != null ? request.getParameter("challan") : 
                "";
            String email = request.getParameter("email");
            GenericBean challandetails = new GenericBean();
            try {
                if (challan.equals("") || challan == "") {
                    if (rd == null)
                        rd = 
 request.getRequestDispatcher("genericpayment/challanDetails.jsp?msg=Please Enter Challan No!");
                } else {
                    GenericBean info = new GenericBean();
                    if ((request.getSession().getAttribute("loggedin")) != 
                        null & email != "") {
                        info = 
challandetails.getDetailsByChallanNoAndEmail(con, challan, email);
                    } else {
                        info = 
challandetails.getDetailsByChallanNo(con, challan);
                    }
                    if (info != null) {
                        if (rd == null)
                            rd = 
 request.getRequestDispatcher("genericpayment/challanDetails.jsp");
                        request.setAttribute("challandetails", info);
                    } else {
                        if (rd == null)
                            rd =request.getRequestDispatcher("genericpayment/challanDetails.jsp?msg=No Data Found");
                            request.setAttribute("challandetails", info);
                    }
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else if (step.equals("11")) {
            String statename = "";
            String cityname = "";
            String dlrname = 
                request.getParameter("name") != null ? request.getParameter("name") : 
                "";
            String address = 
                request.getParameter("address") != null ? request.getParameter("address") : 
                "";
            String city = 
                request.getParameter("city") != null ? request.getParameter("city") : 
                "";
            String state = 
                request.getParameter("state") != null ? request.getParameter("state") : 
                "";
            String pincode = 
                request.getParameter("pincode") != null ? request.getParameter("pincode") : 
                "";
            String mobile = 
                request.getParameter("mobile") != null ? request.getParameter("mobile") : 
                "";
            String email = 
                request.getParameter("email") != null ? request.getParameter("email") : 
                "";
            try {
                GenericBean gbe = new GenericBean();
                statename = gbe.getState(con, state);
                cityname = gbe.getCity(con, city);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            GenericBean genericbean = new GenericBean();
            genericbean.setDlrname(dlrname);
            genericbean.setAddress(address);
            genericbean.setMobile(mobile);
            genericbean.setEmail(email);
            genericbean.setCity(cityname);
            genericbean.setCitycode(city);
            genericbean.setState(statename);
            genericbean.setStatecode(state);
            genericbean.setPincode(pincode);

            try {
                request.setAttribute("genericbeannew", genericbean);
                if (rd == null)
                    rd = 
 request.getRequestDispatcher("genericpayment/unregisteredTaxInfo.jsp");
            } catch (Exception e) {
                if (rd == null)
                    rd = 
 request.getRequestDispatcher("genericpayment/unregisteredUserDetail.jsp?err=" + 
                              e.getMessage());
                System.out.println("epayment error in step 11" + 
                                   e.getMessage());
            }

        } else if (step.equals("12")) {
            String departmentid = "";
            String departmentname = "";
            double amount = 0.00;
            String department = request.getParameter("department") != null ? request.getParameter("department") : "";
            if (department.equalsIgnoreCase("depart")) {
            } else {
                String reponseParts[] = department.split("@");
                departmentid = reponseParts[0];
                departmentname = reponseParts[1];
            }
            String treasuryhead = 
                request.getParameter("treasuryhead") != null ? 
                request.getParameter("treasuryhead") : "";
            String purpose = 
                request.getParameter("purpose") != null ? request.getParameter("purpose") : 
                "";
            String description = 
                request.getParameter("description") != null ? request.getParameter("description") : 
                "";
            String finalyear = 
                request.getParameter("finalyear") != null ? request.getParameter("finalyear") : 
                "";
            String periodtype = 
                request.getParameter("taxperiod") != null ? request.getParameter("taxperiod") : 
                "";
            String qarter = 
                request.getParameter("quarter") != null ? request.getParameter("quarter") : 
                "";
            String fomdate = 
                request.getParameter("fromdate") != null ? request.getParameter("fromdate") : 
                "";
            String todate = 
                request.getParameter("todate") != null ? request.getParameter("todate") : 
                "";
            String mth = 
                request.getParameter("month") != null ? request.getParameter("month") : 
                "";
    
            if (request.getParameter("amount").equalsIgnoreCase("")) {
          
            } else {
                amount = 
                        request.getParameter("amount") != null ? Double.parseDouble(request.getParameter("amount")) : 
                        0.00;
            }
            String remarks = 
                request.getParameter("remarks") != null ? request.getParameter("remarks") : 
                "";
            String dlrname = 
                request.getParameter("name") != null ? request.getParameter("name") : 
                "";
            String address = 
                request.getParameter("address") != null ? request.getParameter("address") : 
                "";
            String city = 
                request.getParameter("city") != null ? request.getParameter("city") : 
                "";
            String state = 
                request.getParameter("state") != null ? request.getParameter("state") : 
                "";
            String pincode = 
                request.getParameter("pincode") != null ? request.getParameter("pincode") : 
                "";
            String mobile = 
                request.getParameter("mobile") != null ? request.getParameter("mobile") : 
                "";
            String email = 
                request.getParameter("email") != null ? request.getParameter("email") : 
                "";
            String statecode = 
                request.getParameter("statecode") != null ? request.getParameter("statecode") : 
                "";
            String citycode = 
                request.getParameter("citycode") != null ? request.getParameter("citycode") : 
                "";
            String op = 
                request.getParameter("operation") != null ? request.getParameter("operation") : 
                "";
            java.sql.Date period_from = null;
            java.sql.Date period_to = null;
            int year = 0;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            if (periodtype.equals("m")) {
                int month = Integer.parseInt(request.getParameter("month"));
                year = Integer.parseInt(request.getParameter("finalyear"));
                Period p = Utility.getPeriodMonth(con, month, year);
                period_from = p.period_from;
                period_to = p.period_to;
            } else if (periodtype.equals("q")) {
                int quarter = 
                    Integer.parseInt(request.getParameter("quarter"));
                int qtr_year = 
                    Integer.parseInt(request.getParameter("finalyear"));
                Period p = 
                    Utility.getPeriodQuarter(con, quarter - 1, qtr_year);
                period_from = p.period_from;
                period_to = p.period_to;
            } else if (periodtype.equals("a")) {
                int temp = 
                    Integer.parseInt(request.getParameter("finalayear"));
                temp = temp + 1;
                String yf = "01/04/" + request.getParameter("finalayear");
                String yt = "31/03/" + temp;
                try {
                    period_from = new java.sql.Date(sdf.parse(yf).getTime());
                    period_to = new java.sql.Date(sdf.parse(yt).getTime());
                } catch (Exception e) {
                    System.out.print(e.getMessage());
                }
            } else if (periodtype.equals("s")) {
                try {
                    period_from = 
                            new java.sql.Date(sdf.parse(request.getParameter("fromdate")).getTime());
                    period_to = 
                            new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            } else if (periodtype.equals("o")) {
                try {
                    period_from = 
                            new java.sql.Date(sdf.parse(request.getParameter("finalyear")).getTime());
                    //period_to=new java.sql.Date(sdf.parse(request.getParameter("todate")).getTime());
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            GenericBean genericbean = new GenericBean();
            genericbean.setDepartmentname(departmentname);
            genericbean.setDepartmentid(departmentid);
            genericbean.setTreasuryhead(treasuryhead);
            genericbean.setPurpose(purpose);
            genericbean.setDescription(description);
            genericbean.setAmount(amount);
            genericbean.setRemarks(remarks);
            genericbean.setPeriod_from(period_from);
            genericbean.setPeriod_to(period_to);
            genericbean.setPeriodtype(periodtype);
            genericbean.setFinalyear(finalyear);
            genericbean.setQuarter(qarter);
            genericbean.setFromdate(fomdate);
            genericbean.setTodate(todate);
            genericbean.setMonth(mth);
            genericbean.setDlrname(dlrname);
            genericbean.setAddress(address);
            genericbean.setMobile(mobile);
            genericbean.setEmail(email);
            genericbean.setCity(city);
            genericbean.setCitycode(citycode);
            genericbean.setState(state);
            genericbean.setStatecode(statecode);
            genericbean.setPincode(pincode);
            if (op.equalsIgnoreCase("Back")) {
                request.setAttribute("genericbean", genericbean);
                request.setAttribute("genericbeannew", genericbean);
                // if (rd==null) rd=request.getRequestDispatcher("genericpayment/unregistered.jsp");
                if (rd == null)
                    rd = 
 request.getRequestDispatcher("genericpayment/unregisteredUserDetail.jsp");
            } else {
                try {
                    request.getSession().setAttribute("genericbean", 
                                                      genericbean);
                    if (rd == null)
                        rd =request.getRequestDispatcher("genericpayment/verifydetails.jsp");
                } catch (Exception e) {
                    if (rd == null)
                        rd = 
 request.getRequestDispatcher("genericpayment/verifydetails.jsp?err=" + 
                              e.getMessage());
                    System.out.println("epayment error in step 12" + 
                                       e.getMessage());
                }
            }
        }
        else if (step.equals("header_login")) {  boolean flag = false;
                    String email = request.getParameter("email");
                    String pswrd=request.getParameter("password");
                     GenericBean bg = new GenericBean();
                     bg.setEmail(email);
                    bg.setPassword(pswrd);
                    String rnd=request.getSession().getAttribute("rnd")==null?"":request.getSession().getAttribute("rnd").toString();
                      String msg = "Please Fill The Appropriate";
                    String msg1 = "";
                      MD5 m = new MD5();
                    try {
                         msg1 = bg.headerLog(con,bg);
                        if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                        String password = m.calcMD5(pswrd);
                        //captcha = (Captcha)request.getSession().getAttribute("Acaptcha");
                       // if (captcha.getAnswer().toUpperCase().equals(cain.toUpperCase())) {
                       if(true){
                            try {
                                GenericBean gb = new GenericBean();
                                flag = gb.doFindByUserHeader(con, email, pswrd,rnd);
                                if (flag == false) {
                                    if (rd == null) rd =request.getRequestDispatcher("landing.jsp?msg=Invalid username or password");
                                } else {
                                  
                                   auth.Session.create(request);
                                   
                                    GenericBean signupbean = new GenericBean();
                                    signupbean = gb.getDetailsByEmail(con, email);
                                    // if(rd==null)   rd=request.getRequestDispatcher("genericpayment/registeredtaxpayee.jsp");
                                    if (rd == null) rd =request.getRequestDispatcher("genericpayment/userContent.jsp");
                                        request.getSession().setAttribute("signupbean",signupbean);
                                       // request.getSession().setAttribute("userloggedin", a);
                                        request.getSession().setAttribute("email", email);
                                        request.getSession().setAttribute("userloggedin", u);
                                }
                            } catch (Exception e) {
                                System.out.println(e.getMessage());
                            }
                        }
                       
                        }else {
                            if (rd == null) {
                                //String msg = "msg Added Successfully";
                                System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                                rd = request.getRequestDispatcher("landing.jsp?msg=Invalid username or password");
                            }
                        }
                    }catch (Exception e) {
                        System.out.println(e.getMessage());
                        if (rd == null) rd = request.getRequestDispatcher("landing.jsp?msg=Invalid username or password");
                    }
                }
        
      else if (step.equals("searchbox")) {
            String searc = request.getParameter("tsearch");
            GenericBean bg = new GenericBean();
            bg.setSearch(searc);
            String msg = "Please Fill The Appropriate";
            String msg1 = "";
            try {
                    msg1 = bg.searchvalid(con,bg);
                    if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    rd = request.getRequestDispatcher("genericpayment/genericReceipt.jsp?er=" + searc);
             }
                     else {
                    if (rd == null) {
                        //String msg = "msg Added Successfully";
                        System.err.println("wrong input");//action=edit&deprtmnt=" +deprtmentname
                        rd = request.getRequestDispatcher("landing.jsp?msg1=Invalid Input.Please Try Again.");
                    }}
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        else if(step.equals("14")){
            String password = request.getParameter("password");
            String confirmpassword = request.getParameter("confirmpassword");
            String username = request.getParameter("username");
            if (password.equalsIgnoreCase(confirmpassword)) {
                GenericBean gbb = new GenericBean();
                try {
                    gbb.doUpdateForgotPassword(con,username,confirmpassword);
                    if (rd == null)
                        rd =request.getRequestDispatcher("genericpayment/createNewDlrPwd.jsp?msg=Password Changed Successfully!");
                }catch (Exception e) {
                    System.out.println(e.getMessage());
                    if (rd == null)
                        rd = request.getRequestDispatcher("genericpayment/createNewDlrPwd.jsp?msg="+e.getMessage());
                }
            } else {
                if (rd == null)
                    rd =request.getRequestDispatcher("genericpayment/createNewDlrPwd.jsp?msg=Password Mismatch");
            }
        }else if(step.equals("15")){
            
            String firstname = request.getParameter("firstname");
            String emaill = request.getParameter("email");
            String mobile = request.getParameter("phonenumber");
            String password = request.getParameter("password1");
            String confirmpass = request.getParameter("confirmpassword");

            GenericFastBean fastbean = new GenericFastBean();
            fastbean.setName(firstname);
            fastbean.setEmail(emaill);
            fastbean.setPhone(mobile);
            fastbean.setPwd(password);
            fastbean.setConfirmpwd(confirmpass);
            String errormsg="" ;
try{
             UserValidation uv=new UserValidation();
              errormsg=uv.preRegistrationValidation(fastbean);  
}catch(Exception e){
    System.err.println(e.getMessage());
}
             if(errormsg.equalsIgnoreCase("Please fill the appropriate") || errormsg=="Please fill the appropriate"){
            
            request.getSession().setAttribute("fastbean", fastbean);
            if(rd==null)
                rd =request.getRequestDispatcher("genericpayment/remainingUnregisteredDetails.jsp");
             }else{
              if (rd == null)
                rd =request.getRequestDispatcher("landing.jsp?validationmsg="+errormsg);
             }
        }
        
         else if(step.equals("16"))
        {
              String snm = request.getParameter("sname")!=null?request.getParameter("sname"):"";
              System.out.println(snm);
              String isuedt = request.getParameter("isuesubjct");
              String eml = request.getParameter("email");
              String msg = request.getParameter("mesg");
              String depart = request.getParameter("department");
              

            GenericBean gb = new GenericBean();
            gb.setContnam(snm);
            gb.setContissue(isuedt);
            gb.setContmail(eml);
            gb.setConmsg(msg);
            gb.setDepartmentid(depart);
         
            String msg1 = "";
           GenericBean gs = new GenericBean();
            try {
              //  msg1 = gb.deptValidation(con, gb);
               // if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {
                    gs.doInsertContact(con, gb);

                    if (rd == null) {
                         msg = "Added Successfully";
                        rd = request.getRequestDispatcher("Contact_us.jsp?msgcontact=" + msg);
                    }
               /* } else {

                    if (rd == null) {
                        //String msg = "msg=Added Successfully";
                        rd = request.getRequestDispatcher("adminpayment/adddepartment.jsp?msg=" + msg1);
                    }
                }*/

            } catch (Exception e) {
                System.out.println(e.getMessage());
                if (rd == null) {
                     msg = "data Not Inserted";
                    rd = request.getRequestDispatcher("Contact_us.jsp?msgcontact=" + msg);
                }
            }
        }
        
        
        
        
        
        try{
        con.close();
    }catch(Exception e){
        System.out.println("Exception in closing connection in GenericServlet : "+e.getMessage());
    }
        rd.forward(request, response);
    }
}


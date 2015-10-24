<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*,java.sql.*,java.text.*, genericepayment.*" %>
<%
    String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    GenericBean gbh=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
    String dlrnameh=gbh.getDlrname()!=null?gbh.getDlrname(): "";
    String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    java.sql.Statement stdasbord=null; java.sql.ResultSet rsdasbord=null ;java.sql.Connection con=null;
    /* **************************************************  Connection  ************************************************************* */
    vicclass.User u=new vicclass.User();
    u.createConnection();
    con=u.getConnection();    
    /* ************************************************** Count number of User ************************************************************* */
    java.sql.Statement stdasbord3=null; java.sql.ResultSet rsdasbord3=null ;  genericepayment.GenericBean gbmis3=null;
    String sql4=null ; java.util.ArrayList arrdasbord3=null ;
    sql4=" select count(decode(DEPARTMENT, 1,DEPARTMENT)) as Exciseusers,count(decode(DEPARTMENT, 2,DEPARTMENT)) as Miningusers, count(decode(DEPARTMENT, 4,DEPARTMENT)) as Comtaxusers from generic_epayment where  PAYMENT_DATE between '09-JAN-2014' and '01-FEB-2014' and cin is not null" ;
    try{
        stdasbord3 = con.createStatement();
        rsdasbord3 = stdasbord3.executeQuery(sql4);
        arrdasbord3=new ArrayList();
        while (rsdasbord3.next()){
            gbmis3=new genericepayment.GenericBean();
            gbmis3.setExcisetotal(rsdasbord3.getString("Exciseusers"));
            gbmis3.setMiningtotal(rsdasbord3.getString("Miningusers"));
            gbmis3.setComtaxtotal(rsdasbord3.getString("Comtaxusers"));
            arrdasbord3.add(gbmis3);
        }
    }catch(Exception ee){
        System.out.println(ee.getMessage());
    }finally{
        try{
            if(stdasbord3 !=null)stdasbord3.close();
            if(rsdasbord3!=null)rsdasbord3.close();
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
    /* ************************************************** Today User and Total Count ************************************************************* */
    java.sql.Statement stdasbord4=null; java.sql.ResultSet rsdasbord4=null ;
    String sql5=null ;  String todayuser="" ; String todaytotal="" ;
    sql5="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  TRUNC(PAYMENT_DATE) = TRUNC(SYSDATE) and cin is not null " ;
    try{
        stdasbord4 = con.createStatement();
        rsdasbord4 = stdasbord4.executeQuery(sql5);
        if (rsdasbord4.next()){
            todayuser=rsdasbord4.getString("totaluser");
            todaytotal=rsdasbord4.getString("total");
        }
    }catch(Exception ee){
        System.out.println(ee.getMessage());
    }finally{
        try{
            if(stdasbord4 !=null)stdasbord4.close();
            if(rsdasbord4!=null)rsdasbord4.close();
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
    /* ************************************************** Weekly User and Total Count ************************************************************* */
    java.sql.Statement stdasbord5=null; java.sql.ResultSet rsdasbord5=null ;
    String sql6="" ;  String weeklyuser="" ; String weeklytotal="" ;
    sql6="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between SYSDATE-8 and sysdate and cin is not null  " ;
    try{
        stdasbord5 = con.createStatement();
        rsdasbord5 = stdasbord5.executeQuery(sql6);
        if (rsdasbord5.next()){
            weeklyuser=rsdasbord5.getString("totaluser");
            weeklytotal=rsdasbord5.getString("total");
        }
    }catch(Exception ee){
        System.out.println(ee.getMessage());
    }finally{
        try{
            if(rsdasbord5!=null)rsdasbord5.close();
            if(stdasbord5 !=null)stdasbord5.close();            
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
    /* ************************************************** Monthly User and Total Count ************************************************************* */
    java.sql.Statement stdasbord6=null; java.sql.ResultSet rsdasbord6=null ;
    String sql7="" ;  String monthlyuser="" ; String monthlytotal="" ;
    sql7="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where trunc(PAYMENT_DATE) between trunc(trunc(sysdate,'MM')-1,'MM') and trunc(sysdate,'MM')-1 and cin is not null " ;
    try{
        stdasbord6 = con.createStatement();
        rsdasbord6 = stdasbord6.executeQuery(sql7);
        if (rsdasbord6.next()){
            monthlyuser=rsdasbord6.getString("totaluser");
            monthlytotal=rsdasbord6.getString("total");
        }
    }catch(Exception ee){
        System.out.println(ee.getMessage());
    }finally{
        try{
            if(rsdasbord6!=null)rsdasbord6.close();
            if(stdasbord6 !=null)stdasbord6.close();
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
    /* ************************************************** Till Now  User and Total Count ************************************************************* */
    java.sql.Statement stdasbord7=null; java.sql.ResultSet rsdasbord7=null ;
    String sql8="" ;  String tillnowuser="" ; String tillnowtotal="" ;
    sql8="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between '01-JAN-2014' and sysdate and cin is not null" ;
    try{
        stdasbord7 = con.createStatement();
        rsdasbord7 = stdasbord7.executeQuery(sql8);
        if (rsdasbord7.next()){
            tillnowuser=rsdasbord7.getString("totaluser");
            tillnowtotal=rsdasbord7.getString("total");
        }
    }catch(Exception ee){
        System.out.println(ee.getMessage());
    }finally{
        try{
            if(rsdasbord7!=null)rsdasbord7.close();
            if(stdasbord7 !=null)stdasbord7.close();
            if(con!=null)con.close();
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">   
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>        
        <link rel="shortcut icon" href="<%=ccp%>/images/favicon.ico" />
        <link href="<%=ccp%>/font-awesome/css/font-awesome.min.css" rel="stylesheet" media="screen">
        <link href="<%=ccp%>/assets/panel.css" rel="stylesheet" media="screen">        
        <link href="<%=ccp%>/bootstrap/css/dashboard.css" rel="stylesheet" media="screen">
        <title>Dashboard | Government of Jharkhand Electronic Revenue Receipt Portal</title>
    </head>
    <body>
        <div class="container">
            <div class="row-fluid">
                <div class="navbar navbar-fixed-top">
                    <div class="navbar-inner">
                        <div class="container-fluid">
                            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </a>
                            <!--<a class="brand" href="#">-->
                            <div class="leftheader">
                                <a href="#">
                                    <h2>Pay<span>Online</span></h2>
                                    <h5>Government of Jharkhand</h5>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container maincontainer" >
                    <div class="row-fluid">
                        <div class="span12" id="content">
                            <div class="row-fluid">
                                <div class="navbar innerbreadcrumb">
                                    <div class="navbar-inner">
                                        <div class="container-fluid">
                                            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                                            </a>                                            
                                            <%if(request.getSession().getAttribute("loggedin")!=null){%>                                                
                                                <ul class="nav">
                                                    <li><a href="<%=ccph%>/Reghome.jsp"><i class="fa fa-home font18 lb1"></i> Home</a></li>
                                                    <li><a href="<%=ccph%>/genericpayment/registeredtaxpayee.jsp"><i class="icon-tasks"></i>Pay Tax</a></li>
                                                </ul>
                                                <div class="pull-right">
                                                    <ul class="nav"><li><a href="#" data-toggle="dropdown">Welcome, <%=dlrnameh%> </a> </li></ul>
                                                    <!--<div class="btn-group">
                                                        <a class="btn dropdown-toggle btn-info" data-toggle="dropdown" href="#">
                                                            <span class="icon-cog icon-white"></span><span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu right0">
                                                            <li><a href="<%=ccph%>/genericpayment/editProfileDetails.jsp"><i class="icon-edit"></i>Edit Profile</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="<%=ccph%>/GenericServlet" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account"><i class="icon-tasks"></i>Payment History</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="<%=ccph%>/genericpayment/chngPassword.jsp" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account">&nbsp;<i class=" icon-random"></i>Change Password</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="<%=ccph%>/GenericLogin?step=logout"><i class="icon-off"></i>Log Out</a></li>
                                                        </ul>
                                                    </div>-->
                                                </div>
                                            <%}else{%>
                                                <ul class="nav">
                                                    <li><a href="<%=ccph%>/GenericLogin"><i class="fa fa-home font18 lb1"></i> Home</a></li>
                                                    <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"><i class="fa  fa-credit-card"></i> Instant Pay</a></li>
                                                    <li><a  href="<%=ccph%>/Home.jsp" rel="tooltip" data-placement="bottom" data-original-title=""><i class="fa  fa-sign-in"></i> Sign In</a></li>
                                                    <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title=""><i class="fa fa-dashboard"></i>Dashboard</a></li>
                                                    <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"><i class="fa  fa-user"></i>Official</a></li>
                                                </ul>
                                                <div class="pull-right"></div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="row-fluid">
                                <div class="alok3"> 
                                <!-- block -->
                                    <div  class="panel panel-info">
                                        <div class="navbar navbar-inner block-header">
                                            <div class="muted pull-left"><strong>Today</strong></div>
                                        </div>
                                        <div class="panel-heading">
                                            <div class="text-right">
                                                <p class="announcement-heading"><i class="fa fa-user" ></i> <%=todayuser!=null?todayuser : "0"%></p><br>
                                                <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=todaytotal!=null?todaytotal : "0"%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="alok3"><!-- block -->
                                    <div  class="panel panel-warning">
                                        <div class="navbar navbar-inner block-header">
                                            <div class="muted pull-left"><strong>Last Week</strong></div>
                                        </div>
                                        <div class="panel-heading">
                                            <div class="text-right">
                                                <p class="announcement-heading"><i class="fa fa-user" ></i> <%=weeklyuser!=null?weeklyuser : "0"%></p><br>
                                                <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=weeklytotal!=null?weeklytotal : "0"%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="alok3"><!-- block -->
                                    <div  class="panel panel-danger">
                                        <div class="navbar navbar-inner block-header">
                                            <div class="muted pull-left"><strong>Last Month</strong></div>
                                        </div>
                                        <div class="panel-heading">
                                            <div class="text-right">
                                                <p class="announcement-heading"><i class="fa fa-user" ></i> <%=monthlyuser!=null?monthlyuser : "0"%></p><br>
                                                <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=monthlytotal!=null?monthlytotal : "0"%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="alok3"><!-- block -->
                                    <div  class="panel panel-primary">
                                        <div class="navbar navbar-inner block-header">
                                            <div class="muted pull-left"><strong>Till Now</strong></div>
                                        </div>
                                        <div class="panel-heading">
                                            <div class="text-right">
                                                <p class="announcement-heading"><i class="fa fa-user" ></i> <%=tillnowuser!=null?tillnowuser : "0"%></p><br>
                                                <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=tillnowtotal!=null?tillnowtotal : "0"%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /block --> 
                            </div><!-- /block -->                            
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="" id="lastweekreport">
                                        <div class="block"><!-- block -->
                                            <div class="navbar navbar-inner block-header">
                                                <div class="muted pull-left"><strong>Last Week Transaction Report</strong></div>
                                                <div class="pull-right"><span class="badge badge-info" id="highchart_total"></span></div>
                                            </div>
                                            <div id="lastweek" style="height: 230px; width:95%;"></div>
                                        </div><!--/block --> 
                                    </div>                                
                                    <div class="" id="monthpay">
                                        <div class="block"><!-- block -->
                                            <div class="navbar navbar-inner block-header">
                                                <div class="muted pull-left"><strong>Monthly Payment Generated</strong></div>
                                                <div class="pull-right"><span class="badge badge-info" id="herobar_total"></span> </div>
                                            </div>
                                            <div id="monthly_chart" style="height: 230px; width:95%;"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="span6" id="calreport">
                                    <div class="block"><!-- block -->
                                        <div class="navbar navbar-inner block-header">
                                            <div class="muted pull-left"><strong>Calendar report</strong></div>
                                            <div class="pull-right"><span class="badge badge-info" id="herobar_total"></span> </div>
                                        </div>
                                        <div id="calendar1" style="width:99%;"></div>
                                    </div><!-- /block --> 
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="span6" id="anualpay">
                                        <div class="block"><!-- block -->
                                            <div class="navbar navbar-inner block-header">
                                                <div class="muted pull-left"><strong>Annual Payment Generated</strong></div>
                                                <div class="pull-right"><span class="badge badge-info" id="herodonut_total"></span></div>
                                            </div>
                                            <div id="annual_chart" style="height: 230px;"></div>
                                        </div><!-- /block --> 
                                    </div>
                                    <!--div class="span6" id="anualpay">
                                        <div class="block">
                                            <div class="navbar navbar-inner block-header">
                                                <div class="muted pull-left"><strong>Annual Payment Generated</strong></div>
                                                <div class="pull-right"><span class="badge badge-info" id="herodonut_total"></span></div>
                                            </div>
                                            <div id="annual_chart" style="height: 230px;"></div>
                                        </div>
                                    </div-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>            
            </div>
        </div>  
        <script type="text/javascript" src="<%=ccp%>/bootstrap/js/combine.js"></script>
        <script type="text/javascript" src="<%=ccp%>/bootstrap/js/chartvalue.jsp"></script>
    </body>
</html>

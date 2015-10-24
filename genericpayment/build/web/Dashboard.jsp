<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*,java.sql.*,java.text.*, genericepayment.*" %>
<%
    ArrayList<genericechartreport.RPBean> rp=null;
    String ccphh="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
   // GenericBean gbh=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
   // String dlrnameh=gbh.getDlrname()!=null?gbh.getDlrname(): "";
    String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    java.sql.Statement stdasbord=null; java.sql.ResultSet rsdasbord=null ;java.sql.Connection con=null;
    /* **************************************************  Connection  ************************************************************* */
    vicclass.User u=new vicclass.User();
    u.createConnection();
    con=u.getConnection();    
    /* ************************************************** Count number of User ************************************************************* */
    java.sql.Statement stdasbord3=null; java.sql.ResultSet rsdasbord3=null ;  genericepayment.GenericBean gbmis3=null;
    String sql4=null ; java.util.ArrayList arrdasbord3=null ;
    sql4=" select sum(case when DEPARTMENT=1 THEN 1 ELSE 0 END) as Exciseusers,sum(case when DEPARTMENT=2 THEN 1 ELSE 0 END) as Miningusers, sum(case when DEPARTMENT=3 THEN 1 ELSE 0 END) as Comtaxusers from generic_epayment where  PAYMENT_DATE between '2014-01-01' and '2015-01-01' and cin is not null" ;
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
    sql5="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where PAYMENT_DATE = SYSDATE() and cin is not null " ;
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
    sql6="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between date_sub(SYSDATE(), interval 7 day) and SYSDATE() and cin is not null  " ;
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
    sql7="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where PAYMENT_DATE between CAST(DATE_FORMAT(NOW() ,'%Y-%m-01') as DATE) and SYSDATE() and cin is not null" ;
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
    sql8="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between '01-JAN-2014' and SYSDATE() and cin is not null" ;
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
            //if(con!=null)con.close();
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
    
    /* ************************************************** Recent Payment************************************************************* */
    java.sql.Statement stdasbord9=null; java.sql.ResultSet rsdasbord9=null ;
    String sql9="SELECT DEPT_NAME as DEPARTMENT,DLRNAME as NAME,AMOUNT,if(DATE_FORMAT(TRANS_DATE,'%Y-%m-%d')=DATE_FORMAT(SYSDATE(),'%Y-%m-%d'),"
            +"DATE_FORMAT(TRANS_DATE,'TODAY %H:%i:%s'),DATE_FORMAT(TRANS_DATE,'%d-%m-%Y')) as TIME FROM generic_epayment JOIN  generic_dept on "
            +"DEPARTMENT=DEPT_ID and cin is not null order by TRANS_DATE desc limit 0,6";
        try{
        stdasbord9 = con.createStatement();
        rsdasbord9 = stdasbord9.executeQuery(sql9);
        rp = new ArrayList<genericechartreport.RPBean>();
        while (rsdasbord9.next()){
            genericechartreport.RPBean rpbean = new genericechartreport.RPBean();
            rpbean.setNAME(rsdasbord9.getString("NAME"));
            rpbean.setDEPARTMENT(rsdasbord9.getString("DEPARTMENT"));
            rpbean.setTIME(rsdasbord9.getString("TIME"));
            rpbean.setAMOUNT(rsdasbord9.getString("AMOUNT"));
            rp.add(rpbean);            
        }
    }catch(Exception ee){
        System.out.println(ee.getMessage());
    }finally{
        try{
            if(rsdasbord7!=null)rsdasbord9.close();
            if(stdasbord7 !=null)stdasbord9.close();
            if(con!=null)con.close();
        }catch(Exception er){
            System.out.println(er.getMessage());
        }
    }
%>
<html lang="en">
<head>
<title>Dashboard | Government of Jharkhand Electronic Revenue Receipt Portal</title>
<%@ include file="assets/metro/__inc/base_links.jsp"%>
<link href="<%=ccp%>/assets/metro/css/fullcalendar.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- start: Header -->
<%@ include file="assets/metro/__inc/user_header.jsp"%>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu -->
    <%@ include file="assets/metro/__inc/user_main_menu.jsp"%>
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
      <div class="row-fluid">
        <div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
          <div class="announcement-heading pull-right"><i class="fa fa-user" ></i> <%=todayuser!=null?todayuser : "0"%> </div>
          <br/>
          <br/>
          <div class="announcement-heading pull-right"><i class="fa fa-inr" ></i> <%=todaytotal!=null?todaytotal : "0"%></div>
          <div class="footer"> <span class="value"> Today</span> </div>
        </div>
        <div class="span3 statbox green" onTablet="span6" onDesktop="span3">
          <p class="announcement-heading pull-right"><i class="fa fa-user" ></i> <%=weeklyuser!=null?weeklyuser : "0"%></p>
          <br>
          <br>
          <p class="announcement-heading pull-right"><i class="fa fa-inr" ></i> <%=weeklytotal!=null?weeklytotal : "0"%></p>
          <div class="footer"> <a href="#"> Last Week</a> </div>
        </div>
        <div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
          <p class="announcement-heading pull-right"><i class="fa fa-user" ></i> <%=monthlyuser!=null?monthlyuser : "0"%></p>
          <br>
          <br>
          <p class="announcement-heading pull-right"><i class="fa fa-inr" ></i> <%=monthlytotal!=null?monthlytotal : "0"%></p>
          <div class="footer"> <a href="#"> This Month</a> </div>
        </div>
        <div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
          <p class="announcement-heading pull-right"><i class="fa fa-user" ></i> <%=tillnowuser!=null?tillnowuser : "0"%></p>
          <br>
          <br>
          <p class="announcement-heading pull-right"><i class="fa fa-inr" ></i> <%=tillnowtotal!=null?tillnowtotal : "0"%></p>
          <div class="footer"> <a href="#"> Till Now</a> </div>
        </div>
      </div>
      
      <!-- /block -->
      <div class="row-fluid">
        <div class="box black span6" onTablet="span6" onDesktop="span6">
          <div class="box-header">
            <h2><i class="fa fa-inr"></i><span class="break"></span>Last Week Transaction Report</h2>
            <div class="box-icon"> <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a> <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a> </div>
          </div>
          <div class="box-content">
            <div id="lastweek" style="height: 208px; width:95%;"></div>
          </div>
        </div>
        <div class="box black span6" onTablet="span6" onDesktop="span6">
          <div class="box-header">
            <h2><i class="fa fa-inr"></i><span class="break"></span>Monthly Payment Generated</h2>
            <div class="box-icon"> <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a> <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a> </div>
          </div>
          <div class="box-content">
            <div id="monthly_chart" style="height: 208px; width:95%;"></div>
          </div>
        </div>
      </div>
      
      <div class="row-fluid">
        <div class="box black span4" onTablet="span6" onDesktop="span4">
          <div class="box-header"><!-- block -->
            <h2><i class="fa fa-inr"></i><span class="break"></span>Annual Payment Generated</h2>
            <div class="box-icon"> <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a> <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a> </div>
          </div>
          <div class="box-content">
            <div id="annual_chart" style="height: 208px;"></div>
          </div>
          <!-- /block --> 
        </div>
        <div ondesktop="span4" ontablet="span12" class="box black span4 noMargin">
          <div class="box-header">
            <h2><i class="fa fa-inr"></i><span class="break"></span>Recent Payment</h2>
            <div class="box-icon"><a class="btn-minimize" href="#"><i class="white fa fa-chevron-up"></i></a> <a class="btn-close" href="#"><i class="halflings-icon white remove"></i></a> </div>
          </div>
          <div class="box-content" style="height: 208px;">
              <ul class="dashboard-list metro">
              
                <% Iterator it=rp.iterator();
							String[] colorArray={"green","red","purple","blue"};
							int i=0;
							String dealer_name="";
							String netAmount="";
         while(it.hasNext()){
          genericechartreport.RPBean rpbean=( genericechartreport.RPBean)it.next();
		  %>
                <li><a href="#"><i class="fa <%out.print(rpbean.getDEPARTMENT().substring(0,4));%> gThumb" ><%out.print(rpbean.getDEPARTMENT().substring(0,1));%></i>
                  
                  <% 
				  dealer_name=rpbean.getNAME();
				  if(dealer_name.length()>24){
				  out.print(dealer_name.substring(0,24));%> ...<% }
                  else{out.print(dealer_name);}%>
                  
                <strong>
                  (<% out.print(rpbean.getTIME());%>)
                  </strong>
                  <div class="rightAmount fa fa-inr">
                  <% netAmount=rpbean.getAMOUNT().substring(0,rpbean.getAMOUNT().length()-3); out.print(netAmount );%> </div> </a></li>
                <% i++;
		}
         %>
              </ul>
          </div>
        </div>
        <div class="box black span4" onTablet="span6" onDesktop="span4">
          <div class="box-header">
            <h2><i class="fa fa-inr"></i><span class="break"></span>Last Month Top Paid Department</h2>
            <div class="box-icon"> <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a> <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a> </div>
          </div>
          <div class="box-content" style="height: 208px;">
            <ul class="dashboard-list metro" id="lastMonthData">
            </ul>
          </div>
        </div>
      </div>
      <div class="row-fluid">
        <div class="box black span6" onTablet="span6" onDesktop="span6" id="calreport">
          <div class="box-header"><!-- block -->
            <h2><i class="fa fa-inr"></i><span class="break"></span>Calendar report</h2>
            <div class="box-icon"> <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a> <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a> </div>
          </div>
          <div class="box-content">
            <div id="calendar1" style="width:99%; color:#000"></div>
          </div>
          <!-- /block --> 
        </div>
      </div>
    </div>
    <!--/.fluid-container--> 
    
    <!-- end: Content --> 
  </div>
  <!--/#content.span10--> 
</div>
<!--/fluid-row-->

<div class="clearfix"></div>
<%@ include file="assets/metro/__inc/footer.jsp"%>

<!-- start: JavaScript--> 

<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/fullcalender.min.js"></script> 
<!--<script type="text/javascript" src="<%=ccp%>/bootstrap/js/combine.js"></script>--> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/chartvalue.jsp"></script> 

<!-- end: JavaScript-->

</body>
</html>

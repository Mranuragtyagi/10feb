<!DOCTYPE html>
<%@ page import="genericepayment.*"  %>
<%String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
GenericBean gbh=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
String dlrnameh=gbh.getDlrname()!=null?gbh.getDlrname(): "";
%>
<%@ page import="java.util.*" contentType="text/html;charset=windows-1252"%>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
java.sql.Statement stdasbord=null; java.sql.ResultSet rsdasbord=null ;java.sql.Connection con=null;

// pie chart query  starts 

  vicclass.User u=new vicclass.User();
        u.createConnection();
        con=u.getConnection();
  genericepayment.GenericBean gbmis=null;
String sql1="select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal,sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '09-JAN-2014' and '13-FEB-2014' and cin is not null " ;
try{
     stdasbord = con.createStatement();
     rsdasbord = stdasbord.executeQuery(sql1);
     ArrayList arrdasbord=new ArrayList();
      gbmis=new genericepayment.GenericBean();
     while (rsdasbord.next()) {
               gbmis.setExcisetotal(rsdasbord.getString("ExciseTotal"));
               gbmis.setMiningtotal(rsdasbord.getString("MiningTotal"));
               gbmis.setComtaxtotal(rsdasbord.getString("ComtaxTotal"));
               arrdasbord.add(gbmis);
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord !=null)
                     stdasbord.close();
                 if(rsdasbord!=null)
                     rsdasbord.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         // column chart query starts  
         
     java.sql.Statement stdasbord1=null; java.sql.ResultSet rsdasbord1=null ;  genericepayment.GenericBean gbmis1=null;
     String sql2=null ; java.util.ArrayList arrdasbord1=null ;
     sql2=" select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal ,sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '09-JAN-2014' and '17-JAN-2014' union select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal,sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '18-JAN-2014' and '01-FEB-2014' union select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal, sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '01-FEB-2014' and '15-FEB-2014' " ;
     try{
     stdasbord1 = con.createStatement();
     rsdasbord1 = stdasbord1.executeQuery(sql2);
      arrdasbord1=new ArrayList();
     while (rsdasbord1.next()) {
               gbmis1=new genericepayment.GenericBean();
               gbmis1.setExcisetotal(rsdasbord1.getString("ExciseTotal"));
               gbmis1.setMiningtotal(rsdasbord1.getString("MiningTotal"));
               gbmis1.setComtaxtotal(rsdasbord1.getString("ComtaxTotal"));
               arrdasbord1.add(gbmis1);
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord1 !=null)
                     stdasbord1.close();
                 if(rsdasbord1!=null)
                     rsdasbord1.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         // line chart query start
         
     java.sql.Statement stdasbord2=null; java.sql.ResultSet rsdasbord2=null ;  genericepayment.GenericBean gbmis2=null;
     String sql3=null ; java.util.ArrayList arrdasbord2=null ;
     sql3=" select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal ,sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '09-JAN-2014' and '17-JAN-2014' union select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal,sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '18-JAN-2014' and '01-FEB-2014' union select sum(decode(DEPARTMENT, 1, amount)) as ExciseTotal,sum(decode(DEPARTMENT, 2, amount)) as MiningTotal, sum(decode(DEPARTMENT, 4, amount)) as ComtaxTotal from GENERIC_EPAYMENT where PAYMENT_DATE between '01-FEB-2014' and '15-FEB-2014' " ;
     try{
     stdasbord2 = con.createStatement();
     rsdasbord2 = stdasbord2.executeQuery(sql3);
      arrdasbord2=new ArrayList();
     while (rsdasbord2.next()) {
               gbmis2=new genericepayment.GenericBean();
               gbmis2.setExcisetotal(rsdasbord2.getString("ExciseTotal"));
               gbmis2.setMiningtotal(rsdasbord2.getString("MiningTotal"));
               gbmis2.setComtaxtotal(rsdasbord2.getString("ComtaxTotal"));
               arrdasbord2.add(gbmis2);
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord2 !=null)
                     stdasbord2.close();
                 if(rsdasbord2!=null)
                     rsdasbord2.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         // no of user count 
         
  java.sql.Statement stdasbord3=null; java.sql.ResultSet rsdasbord3=null ;  genericepayment.GenericBean gbmis3=null;
     String sql4=null ; java.util.ArrayList arrdasbord3=null ;
     sql4=" select count(decode(DEPARTMENT, 1,DEPARTMENT)) as Exciseusers,count(decode(DEPARTMENT, 2,DEPARTMENT)) as Miningusers, count(decode(DEPARTMENT, 4,DEPARTMENT)) as Comtaxusers from generic_epayment where  PAYMENT_DATE between '09-JAN-2014' and '01-FEB-2014' and cin is not null" ;
     try{
     stdasbord3 = con.createStatement();
     rsdasbord3 = stdasbord3.executeQuery(sql4);
      arrdasbord3=new ArrayList();
     while (rsdasbord3.next()) {
               gbmis3=new genericepayment.GenericBean();
               gbmis3.setExcisetotal(rsdasbord3.getString("Exciseusers"));
               gbmis3.setMiningtotal(rsdasbord3.getString("Miningusers"));
               gbmis3.setComtaxtotal(rsdasbord3.getString("Comtaxusers"));
               arrdasbord3.add(gbmis3);
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord3 !=null)
                     stdasbord3.close();
                 if(rsdasbord3!=null)
                     rsdasbord3.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         
   // today user and total count 
   
   java.sql.Statement stdasbord4=null; java.sql.ResultSet rsdasbord4=null ;  
     String sql5=null ;  String todayuser="" ; String todaytotal="" ;
     sql5="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  TRUNC(PAYMENT_DATE) = TRUNC(SYSDATE) and cin is not null " ;
     try{
     stdasbord4 = con.createStatement();
     rsdasbord4 = stdasbord4.executeQuery(sql5);
     if (rsdasbord4.next()) {
               todayuser=rsdasbord4.getString("totaluser");
               todaytotal=rsdasbord4.getString("total");
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord4 !=null)
                     stdasbord4.close();
                 if(rsdasbord4!=null)
                     rsdasbord4.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         
         
          // weekly user and total count 
   
   java.sql.Statement stdasbord5=null; java.sql.ResultSet rsdasbord5=null ;  
     String sql6="" ;  String weeklyuser="" ; String weeklytotal="" ;
     sql6="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between SYSDATE-8 and sysdate and cin is not null  " ;
     try{
     stdasbord5 = con.createStatement();
     rsdasbord5 = stdasbord5.executeQuery(sql6);
     if (rsdasbord5.next()) {
               weeklyuser=rsdasbord5.getString("totaluser");
               weeklytotal=rsdasbord5.getString("total");
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord5 !=null)
                     stdasbord5.close();
                 if(rsdasbord5!=null)
                     rsdasbord5.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         
         
         
         // monthly user and total count 
   
   java.sql.Statement stdasbord6=null; java.sql.ResultSet rsdasbord6=null ;  
     String sql7="" ;  String monthlyuser="" ; String monthlytotal="" ;
    // sql7="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between trunc(trunc(sysdate,'MM')-1,'MM') and trunc(sysdate,'MM')-1 and cin is not null" ;
    sql7="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where trunc(PAYMENT_DATE) between trunc(trunc(sysdate,'MM')-1,'MM') and trunc(sysdate,'MM')-1 and cin is not null " ;
     try{
     stdasbord6 = con.createStatement();
     rsdasbord6 = stdasbord6.executeQuery(sql7);
     if (rsdasbord6.next()) {
               monthlyuser=rsdasbord6.getString("totaluser");
               monthlytotal=rsdasbord6.getString("total");
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord6 !=null)
                     stdasbord6.close();
                 if(rsdasbord6!=null)
                     rsdasbord6.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
         
         
          // till now  user and total count 
   
   java.sql.Statement stdasbord7=null; java.sql.ResultSet rsdasbord7=null ;  
     String sql8="" ;  String tillnowuser="" ; String tillnowtotal="" ;
     sql8="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between '01-JAN-2014' and sysdate and cin is not null" ;
     try{
     stdasbord7 = con.createStatement();
     rsdasbord7 = stdasbord7.executeQuery(sql8);
     if (rsdasbord7.next()) {
               tillnowuser=rsdasbord7.getString("totaluser");
               tillnowtotal=rsdasbord7.getString("total");
            }
}catch(Exception ee){
    System.out.println(ee.getMessage());
}
finally{               
             try{
                 if(stdasbord7 !=null)
                     stdasbord7.close();
                 if(rsdasbord7!=null)
                     rsdasbord7.close();
                      if(con!=null)
                     con.close();
                 }catch(Exception er){
                     System.out.println(er.getMessage());
                 }
         }
         
%>
<html class="no-js">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>Dashboard | Government of Jharkhand Electronic Revenue Receipt Portal</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" media="screen">
<link href="assets/panel.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="bootstrap/js/full-calendar/fullcalendar.css">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>
<div class="container">
  <div class="row-fluid">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> 
          
          <!--<a class="brand" href="#">-->
          <div class="leftheader"><a href="#">
            <h2>Pay<span>Online</span></h2>
            <h5>Government of Jharkhand</h5>
            </a></div>
          
         
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row-fluid"> 
        
        <!--/span-->
        <div class="span12" id="content">
          <div class="row-fluid"> 
         
            <div class="navbar innerbreadcrumb">
              <div class="navbar-inner">
                <div class="container-fluid"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
                  <div class="nav-collapse collapse">
                    <ul class="nav">
                      <%if(request.getSession().getAttribute("loggedin")!=null){%>
                      <li><a href="<%=ccph%>/Reghome.jsp"><i class="fa fa-home font18 lb1"></i> Home</a></li>
                      <%}else{%>
                      <li><a href="<%=ccph%>/GenericLogin"><i class="fa fa-home font18 lb1"></i> Home</a></li>
                      <%}%>
                      <%if(request.getSession().getAttribute("loggedin")!=null) {%>
                      <li><a href="<%=ccph%>/genericpayment/registeredtaxpayee.jsp"><i class="icon-tasks"></i>Pay Tax</a></li>
                    </ul>
                    <div class="pull-right" >
                      <ul class="nav">
                        <li><a href="#" data-toggle="dropdown">Welcome, <%=dlrnameh%> </a> </li>
                      </ul>
                      <div class="btn-group"> <a class="btn dropdown-toggle btn-info" data-toggle="dropdown" href="#"> <span class="icon-cog icon-white"></span><span class="caret"></span> </a>
                        <ul class="dropdown-menu right0">
                          <li><a href="<%=ccph%>/genericpayment/editProfileDetails.jsp"><i class="icon-edit"></i>Edit Profile</a></li>
                          <li class="divider"></li>
                          <li><a href="<%=ccph%>/GenericServlet" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account"><i class="icon-tasks"></i>Payment History</a></li>
                          <li class="divider"></li>
                          <li><a href="<%=ccph%>/genericpayment/chngPassword.jsp" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account">&nbsp;<i class=" icon-random"></i>Change Password</a></li>
                          <li class="divider"></li>
                          <li><a href="<%=ccph%>/GenericLogin?step=logout"><i class="icon-off"></i>Log Out</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <%}else{%>
                  <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa  fa-credit-card"></i> Instant Pay</a></li>
                  <li><a  href="<%=ccph%>/Home.jsp" rel="tooltip" data-placement="bottom" data-original-title=""><i class="fa  fa-sign-in"></i> Sign In</a></li>                  <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title=""><i class="fa fa-dashboard"></i> Dashboard</a></li>
                  <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"><i class="fa  fa-user"></i> Official</a></li>
                  </ul>
                </div>
              </div>
              <div class="pull-right"> </div>
              <%}%>
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
                  <p class="announcement-heading"><i class="fa fa-user" ></i> <%=todayuser!=null?todayuser : "0"%></p>
                  <br>
                  <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=todaytotal!=null?todaytotal : "0"%></p>
                </div>
              </div>
            </div>
          </div>
          <div class="alok3"> 
            <!-- block -->
            <div  class="panel panel-warning">
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Last Week</strong></div>
              </div>
           
              <div class="panel-heading">
                <div class="text-right">
                  <p class="announcement-heading"><i class="fa fa-user" ></i> <%=weeklyuser!=null?weeklyuser : "0"%></p>
                  <br>
                  <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=weeklytotal!=null?weeklytotal : "0"%></p>
                </div>
              </div>
            </div>
          </div>
          <div class="alok3"> 
            <!-- block -->
            <div  class="panel panel-danger">
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Last Month</strong></div>
              </div>
              <div class="panel-heading">
                <div class="text-right">
                  <p class="announcement-heading"><i class="fa fa-user" ></i> <%=monthlyuser!=null?monthlyuser : "0"%></p>
                  <br>
                  <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=monthlytotal!=null?monthlytotal : "0"%></p>
                </div>
              </div>
            </div>
          </div>
          <div class="alok3"> 
            <!-- block -->
            <div  class="panel panel-primary">
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Till Now</strong></div>
              </div>
              <div class="panel-heading">
                <div class="text-right">
                  <p class="announcement-heading"><i class="fa fa-user" ></i> <%=tillnowuser!=null?tillnowuser : "0"%></p>
                  <br>
                  <p class="announcement-heading"><i class="fa fa-inr" ></i> <%=tillnowtotal!=null?tillnowtotal : "0"%></p>
                </div>
              </div>
            </div>
          </div>
          <!-- /block --> 
        </div>
        <!-- /block -->
        
        <div class="row-fluid">
        <div class="span6">
          <div class="span12" id="weklyreport"> 
            <!-- block -->
            <div class="block">
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Last Week Transaction Report</strong> </div>
                <div class="pull-right"><span class="badge badge-info" id="highchart_total"></span> </div>
              </div>
              <div id="weekly" style="height: 230px; width:95%;"></div>
            </div>
            <!-- /block --> 
          </div>
          <div class="span12" id="monthpay">
            <div class="block"> 
              <!-- block -->
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Monthly Payment Generated</strong></div>
                <div class="pull-right"><span class="badge badge-info" id="herobar_total"></span> </div>
              </div>
              <div id="monthly_chart" style="height: 230px; width:95%;"></div>
            </div>
          </div>
          </div>
          <div class="span6" id="calreport">
            <div class="block"> 
              <!-- block -->
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Calendar report</strong></div>
                <div class="pull-right"><span class="badge badge-info" id="herobar_total"></span> </div>
              </div>
              <div id="calendar" style="width:99%;"></div>
            </div>
          </div>
          <!-- /block --> 
          
        </div>
        <div class="row-fluid">
          
          <div class="span6" id="anualpay"> 
            <!-- block -->
            <div class="block">
              <div class="navbar navbar-inner block-header">
                <div class="muted pull-left"><strong>Annual Payment Generated</strong></div>
                <div class="pull-right"><span class="badge badge-info" id="herodonut_total"></span> </div>
              </div>
              <div id="annual_chart" style="height: 230px;"></div>
            </div>
            <!-- /block --> 
          </div>
        </div>
      </div>
    </div>
    <hr>
    <footer>
      <p>&copy; Jharkhand Commercial Taxes Department</p>
    </footer>
  </div>
</div>
<script type="text/javascript" src="<%=ccp%>/vendors/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="<%=ccp%>/assets/highcharts.js"></script> 
<script type="text/javascript" src="<%=ccp%>/bootstrap/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=ccp%>/bootstrap/js/full-calendar/fullcalendar.min.js"></script> 
<!--script type="text/javascript" src="assets/scripts.js"></script--> 
<script type="text/javascript" src="<%=ccp%>/script/chartvalue.jsp"></script> 
</body>
</html>
<!DOCTYPE html>

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
     sql7="select count(DEPARTMENT) as totaluser,sum(amount) as total from generic_epayment where  PAYMENT_DATE between trunc(trunc(sysdate,'MM')-1,'MM') and trunc(sysdate,'MM')-1 and cin is not null" ;
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
        <title>Dashboard</title>
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
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                <a class="brand" href="#"><div class="leftheader"><img src="bootstrap/img/leftheader4.png"  alt="Header" /></div></a>
                    <!--<div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Vincent Gabriel <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Profile</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="login.html">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Settings <b class="caret"></b>

                                </a>
                                <ul class="dropdown-menu" id="menu1">
                                    <li>
                                        <a href="#">Tools <i class="icon-arrow-right"></i>

                                        </a>
                                        <ul class="dropdown-menu sub-menu">
                                            <li>
                                                <a href="#">Reports</a>
                                            </li>
                                            <li>
                                                <a href="#">Logs</a>
                                            </li>
                                            <li>
                                                <a href="#">Errors</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">SEO Settings</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Content <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Blog</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">News</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Custom Pages</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Calendar</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="#">FAQ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Users <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">User List</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Search</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Permissions</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>-->
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active">
                            <a href="#"><i class="icon-chevron-right"></i> Dashboard</a>
                           
                        </li>
                        
                        <li>
                            <a href="#"> Easy, convenient & fast</a>
                        </li>
                         <li>
                            <a href="#">Facility is available 24 X 7..</a>
                        </li>
                         <li>
                            <a href="#">Revenue will come earlier in to the Govt. Treasury as compared to old system</a>
                        </li>
                         <li>
                            <a href="#">Facility is available 24 X 7..</a>
                        </li>
                       
                    </ul>
                </div>
                
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <!--<div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Success</h4>
                        	The operation completed successfully</div>-->
               <div class="navbar innerbreadcrumb">
                    <div class="navbar-inner">
	                    <ul class="breadcrumb">
	                        <i class="icon-th hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                        <i class="icon-th show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li class="active">
	                                        Dashboard	
	                                    </li>
	                                   <li class="active">  <a href="<%=ccp%>/GenericLogin"><i class="icon-home"></i> Home</a></li>
	                                    
	                                </ul>
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
                        	<!--<div class="panel-heading">
                            	<div style="float:left;"><i class="fa fa-check fa-5x"></i></div><br/><br/>
                				<div class="text-right" id="week">
                    				<p class="announcement-heading">000</p>
                   				</div>
          					 </div>-->
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
                            </div> </div>
                            <!-- /block -->
                        </div>
                            <!-- /block -->
                      
                    
                    
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left"><strong>Weekly Transaction Report</strong> </div>
                                    <div class="pull-right"><span class="badge badge-info" id="highchart_total"></span>

                                    </div>
                                </div>
                                   <div id="Lcanvas" style="height: 230px; width:95%;"></div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                         <div class="block">
                            <!-- block -->
                            <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left"><strong>Calendar report</strong></div>
                                    <div class="pull-right"><span class="badge badge-info" id="herobar_total"></span>

                                    </div>
                                </div>
                                
                                    <div id="calendar" style="width:99%;"></div>
                              
                            </div>
                            </div>
                            <!-- /block -->
                       
                        
                    </div>
                    <div class="row-fluid">
                   
                        <div class="span6">
                         <div class="block">
                            <!-- block -->
                            <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left"><strong>Monthly Payment Generated</strong></div>
                                    <div class="pull-right"><span class="badge badge-info" id="herobar_total"></span>

                                    </div>
                                </div>
                                
                                    <div id="LLcanvas" style="height: 230px; width:95%;"></div>
                              
                            </div>
                            </div>
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left"><strong>Annual Payment Generated</strong></div>
                                    <div class="pull-right"><span class="badge badge-info" id="herodonut_total"></span>

                                    </div>
                                </div>
                                   <div id="LLLcanvas" style="height: 230px;"></div>
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
         <script type="text/javascript" src="vendors/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="assets/highcharts.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/full-calendar/fullcalendar.min.js"></script>
        <script type="text/javascript" src="assets/scripts.js"></script>
        <script type="text/javascript">

</script>

 <script>
        if(window.XMLHttpRequest){
            xmlhttp = new XMLHttpRequest();
        }else if(window.ActiveXObject){
            try {
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    xmlhttp = false;
                }
            }
        }
        xmlhttp.open("POST", "<%=ccp%>/GenericDataLoader", true);
        xmlhttp.send();
        xmlhttp.onreadystatechange  = function(){
        if(xmlhttp.readyState == 4){
            var jsonObj = JSON.parse(xmlhttp.responseText);                
           // alert(jsonObj.caldata.length);
            if(jsonObj.caldata.length>0){
                //alert(jsonObj.caldata.length);
                var calendar={
                    header:{left:'prev,next',center:'title',right:'today'},
                    selectable:true,selectHelper:true,editable:true,events:[]
                };
                for(var x=0;x<jsonObj.caldata.length;x++){
                    calendar.events.push({
                        title:"E: "+jsonObj.caldata[x].combinetotal, start:new Date(jsonObj.caldata[x].issueddate)
                    });
                }
                $('#calendar').fullCalendar(calendar);
            }
        
    }
}
</script>

 <!--<script type="text/javascript">
  var options;
 $(document).ready(function() {
       
	    options = {
	      chart: {
                renderTo: 'Lcanvas',
                type: 'line'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [],
                labels: {
					align: 'center',
					x: -3,
					y: 20,
					formatter: function() {
						return Highcharts.dateFormat('%l%p', Date.parse(this.value +' UTC'));
					}
				}
            },
            yAxis: {
                title: {
                    text: ''
                }
            },
            tooltip: {
                enabled: false,
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y;
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },

            series: [{
	                type: 'line',
	                name: '',
	                data: []
	       }]
		}

        $.getJSON("data.php", function(json){
        	options.xAxis.categories = json['category'];
        	options.series[0].name = json['name'];
        	options.series[0].data = json['data'];
        	chart = new Highcharts.Chart(options);
		});

    });
	
    
    $(function() {
	    $( "#datepicker" ).datepicker({
		  dateFormat: "yy-mm-dd",
	      showOn: "button",
	      buttonImage: "calendar.gif",
	      buttonImageOnly: true,
	      onSelect: function(dateText, inst) { 
	        $.getJSON("data.php?dateParam="+dateText, function(json){
	        	options.xAxis.categories = json['category'];
        		options.series[0].name = json['name'];
        		options.series[0].data = json['data'];
	        	chart = new Highcharts.Chart(options);
			});
	      }
	    });
  	});
    
	</script>-->

    </body>

</html>
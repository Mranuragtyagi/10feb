<%@page import="java.lang.management.OperatingSystemMXBean"%>
<%@page import="java.lang.management.ManagementFactory"%>
<%@page import="java.lang.reflect.Method"%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="PayOnline Jharkhand">
<meta name="keyword" content="PayOnline, Dashboard, Jharkhand, JHLT, JPT, JED">
<!-- end: Meta -->
<link rel="shortcut icon" href="images/favicon.ico" />
<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<link href="assets/metro/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="assets/metro/css/bootstrap-responsive.min.css" rel="stylesheet">
<link id="install" href="assets/metro/css/install.css" rel="stylesheet">
<link id="style_less" href="assets/metro/css/style_less.css" rel="stylesheet">
<link id="font-awesome.min" href="assets/metro/css/font-awesome.min.css" rel="stylesheet">
<!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	 end: CSS -->

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="assets/metro/css/ie.css" rel="stylesheet">
	<![endif]-->

<!--[if IE 9]>
		<link id="ie9style" href="assets/metro/css/ie9.css" rel="stylesheet">
	<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon" href="assets/metro/img/favicon.ico">
<!-- end: Favicon -->
<title>Payonline Database Configuration | Payonline Jharkhand</title>
</head>

<body>
<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="fa fa-bars"></span>
				</a>
				<a class="brand" href="#">Pay<span class="lb1">Online</span></a>
				
				
			</div>
		</div>
	</div>
<div class="container-fluid-full">
  <div class="row-fluid">
    <div class="span6 container-new" style="margin-left:auto; margin-right:auto;  float:none !important; margin-top:2%;">
      <div class="box">
        <div class="box-header-in" data-original-title>
          <h2></span>Installation</h2>
          <div></div>
        </div>
        <div class="span12 bg" style="margin-left:0px;">
          <div class="span4">
            <ul class="nav feature">
              <li class="list-group-item bg-btn" id="pre_label">Prerequisites</li>
              <li class="list-group-item" id="db_label">Database</li>
              <li class="list-group-item" id="db_install">Installing</li>
              <li class="list-group-item" id="db_success">Success</li>
            </ul>
          </div>
          <div class="span8 text-data" id="install_container">
            <table class="table table-bordered table-striped" width="100%">
            <thead>
              <tr>
                <th></th>
                <th>Requirement</th>
                <th>Your System</th>
                <th>Result</th>
              </tr>
              </thead>
              <tbody>
              <%
    out.println("<tr><td>OS</td><td>Windows/Linux/Mac</td><td>"+System.getProperty("os.name")+"</td><td align='center'><i class='install_success'></i></td></tr>");
OperatingSystemMXBean osBean=ManagementFactory.getOperatingSystemMXBean();
  long totel_mem=-1;
  long min_totel_mem=2048;
  double min_java_version=1.5;
  double min_apache_version=5.0;
  int err=0;
  try {
    Class<?> beanClass=Thread.currentThread().getContextClassLoader().loadClass("com.sun.management.OperatingSystemMXBean");
    totel_mem=(Long)beanClass.getMethod("getTotalPhysicalMemorySize").invoke(osBean);
    totel_mem=totel_mem/1048576;
   // free_mem=(Long)beanClass.getMethod("getFreePhysicalMemorySize").invoke(osBean);
   // free_mem=free_mem/1048576;
    %>
              <tr>
                <td>Total RAM</td>
                <td><%=min_totel_mem%> MB</td>
                <td><%=totel_mem%> MB.</td>
                <td align='center'><% if(min_totel_mem > totel_mem ){out.println("<i class='install_fail'></i>");err++;}else{out.println("<i class='install_success'></i>");} %></td>
              </tr>
              <%
String sVersion = System.getProperty("java.version");
String jre_version_msg="<i class='install_success'></i>";
sVersion = sVersion.substring(0, 3);
double f = Double.valueOf(sVersion);
if (f < min_java_version) {
    jre_version_msg="<i class='install_fail'></i>";
	err++;
    //System.exit(1);
}%>
              <tr>
                <td>JRE Version</td>
                <td><%=min_java_version%></td>
                <td><% out.println(System.getProperty("java.version").substring(0, 3));%></td>
                <td align='center'><%=jre_version_msg%></td>
              </tr>
              <tr>
                <td>MySql</td>
                <td>5.x</td>
                <td></td>
                <td align='center'></td>
              </tr>
              <%
String apacheVersion = application.getServerInfo();
String apache_version_msg="<i class='install_success'></i>";
apacheVersion = apacheVersion.split("/")[1];
double fapache = Double.valueOf(apacheVersion.substring(0, 3));
if (fapache < min_apache_version) {
    apache_version_msg="<i class='install_fail'></i>";
	err++;
    //System.exit(1);
}%>
              <tr>
                <td>Tomcat Version</td>
                <td>5.x</td>
                <td><%= apacheVersion %></td>
                <td align='center'><%=apache_version_msg%></td>
              </tr>
              <%
  }
 catch (  Exception e) {
     System.out.printf("version error" +e.getMessage());
             
  }
catch (  LinkageError e) {
     System.out.printf("version error2" +e.getMessage());
  }
 
%>
              <tr>
                <td>Servlet Version</td>
                <td>1.x</td>
                <td><%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></td>
                <td align='center'><i class="install_success"></i></td>
              </tr>
              <tr>
                <td>JSP Version</td>
                <td>1.x</td>
                <td><%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %></td>
                <td align='center'><i class="install_success"></i></td>
              </tr>
              </tbody>
            </table><% if(err==0){%>
          <div class="pull-right"><a href="#" class="btn btn-primary" onClick="step1()">Next</a></div>
	<%}%>
          </div>
        </div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<div id="database_div">
<form name="DBProp" id="DBProp" action="DBProp" onsubmit="return checkForm(this)" class="form-horizontal" >
                           <table class="table table-striped table-condensed"><tr><th colspan="2">Database Configuration Information</td></tr>

<input type="hidden" name="driver" value="com.mysql.jdbc.Driver">
<tr><td width="50%">Database Host<br>eg. 192.168.10.77</td><td>
                <input type="text" class="span12 required" id="durl" size="50"></td></tr>
               <tr><td nowrap="nowrap">Port</td>
               <td>
                <input type="text" class="span12 required integer" id="port" maxlength="4" value="3306"></td></tr>
               <tr><td nowrap="nowrap">Database name</td><td>
                <input type="text" class="span12 required alphanumeric" id="dbname" size="50"></td></tr>
                <tr><td>Username</td><td>
                <input type="text" class="span12 required alphanumeric" id="username" size="50">
                </td></tr>
                <tr><td>Password</td><td>
                <input class="span12 required" type="password" id="passw" size="50"></td></tr>
                <tr><td>No of Max Active Users</td><td>
                <input class="span12 required" type="text" id="maxactive" name="maxactive" size="10"></td></tr>
                <tr><td>No of Max Idle Users</td><td>
                <input class="span12 required" type="text" id="maxidle" name="maxidle" size="10"></td></tr>
               
                </table>                    
                            </form>
                            <div class="pull-right"><a href="#" class="btn btn-primary" onClick="step2()">Next</a></div>

</div>
<script src="assets/metro/js/jquery-1.9.1.min.js"></script> 
<script src="assets/metro/js/jquery.validate.js"></script> 
<script src="assets/metro/js/additional-methods.min.js"></script> 
<script src="assets/metro/js/install.js"></script>
</body>
</html>
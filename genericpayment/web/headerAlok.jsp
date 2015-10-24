<%@ page import="java.util.*,genericepayment.*,genericepayadmin.* " %>
<%
    String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    GenericBean gbh=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
    String dlrnameh=gbh.getDlrname()!=null?gbh.getDlrname(): "";
	java.util.Random rndmadmin=new java.util.Random(1234);
request.getSession().setAttribute("rnd", "" + rndmadmin.nextLong());
 String rndadmin=request.getSession().getAttribute("rnd")!=null?request.getSession().getAttribute("rnd").toString() : "";

%>
<% 
     String sqladmin="select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmtadmin=null;
     java.sql.Connection conadmin=null;
     vicclass.User uadmin= new vicclass.User();
     uadmin.createConnection();
     conadmin=uadmin.getConnection();
     ArrayList aladmin=new ArrayList();
     java.sql.ResultSet rsadmin=null;
     try{
        stmtadmin=conadmin.prepareStatement(sqladmin);
        stmtadmin.setString(1,"A");
        rsadmin=stmtadmin.executeQuery();
        while(rsadmin.next()){
            GenericAdminBean genericbean=new GenericAdminBean();
            genericbean.setDepartment(rsadmin.getString("DEPT_NAME"));
            genericbean.setDeptid(rsadmin.getString("DEPT_ID"));
            aladmin.add(genericbean);
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
             finally{               
             try{
                 if(stmtadmin !=null)
                     stmtadmin.close();
                 if(rsadmin!=null)
                     rsadmin.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }
%>
<div class="span12">
    <div class="row-fluid">
        <div class="span4">
            <div id="mobilemenu">
                <div class="btn-group">
                    <a data-toggle="dropdown" href="#"> 
                        <i class="fa fa-bars fa-2x "></i>&nbsp;
                    </a>
                    <ul class="dropdown-menu">
                    <%if(request.getSession().getAttribute("loggedin")!=null){%>
                        <li><a href="#" data-toggle="dropdown">Welcome, <%=dlrnameh%> </a> </li>
                        <li><a href="<%=ccph%>/Reghome.jsp"><i class="icon-home font18"></i> Home</a></li>
                        <li><a href="<%=ccph%>/genericpayment/registeredtaxpayee.jsp"><i class="icon-tasks"></i> Pay Tax</a></li>
                        <li><a href="<%=ccph%>/genericpayment/editProfileDetails.jsp"><i class="icon-edit"></i> Edit Profile</a></li>
                        <li><a href="<%=ccph%>/GenericServlet" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account"><i class="icon-tasks"></i> Payment History</a></li>
                        <li><a href="<%=ccph%>/genericpayment/chngPassword.jsp" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account"><i class=" icon-random"></i> Change Password</a></li>
                        <li><a href="<%=ccph%>/GenericLogin?step=logout"><i class="icon-off"></i> Log Out</a></li>
                    <%}else{%>
                        <li><a href="<%=ccph%>/GenericLogin"><i class="icon-home font18"></i> Home</a></li>
                        <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa fa-credit-card"></i> Instant Pay</a></li>
                        <li><a  href="<%=ccph%>/Home.jsp" rel="tooltip" data-placement="bottom" data-original-title=""> <i class="fa  fa-sign-in"></i> Sign In</a></li>	
                        <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> Official</a></li>
                        <li><a href="<%=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>
                    <%}%>
                        <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" > <i class="fa fa-dashboard"></i> Dashboard</a></li>
                    </ul>
                </div>
            </div>
           <div class="leftheader"><!--<a href="#"><h2>Pay<span>Online</span></h2></a><h5>Government of Jharkhand</h5>--></div> 
        </div>
        <div class="span3 pull-right cust-span3">
            <form id="custom-search-form" class="form-search form-horizontal span12" action="<%=ccph%>/genericpayment/genericReceipt.jsp" method="get">
                <input type="hidden" name="step" id="step" value="10">
                <input type="hidden" name="email" id="email" value="">
                <div class="input-append span12">
                    <input type="text" class="search-query span12" name="er" id="challan" placeholder="Enter Receipt No">
                        <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="span12" id="navbarid">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="dropdown" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="nav-collapse collapse">
                <ul class="nav">
                <%if(request.getSession().getAttribute("loggedin")!=null){%>
                    <li><a href="<%=ccph%>/Reghome.jsp">&nbsp;<i class="fa fa-home font18 lb1"></i> Home</a></li>
                <%}else{%>
                    <li><a href="<%=ccph%>/GenericLogin">&nbsp;<i class="fa fa-home font18 lb1"></i> Home</a></li>
                <%}%>
                <%if(request.getSession().getAttribute("loggedin")!=null) {%>
                    <li><a href="<%=ccph%>/genericpayment/registeredtaxpayee.jsp">&nbsp;<i class="icon-tasks"></i>Pay Tax</a></li>
                </ul>
                <div class="pull-right" >
                    <ul class="nav">
                        <li><a href="#" data-toggle="dropdown">Welcome, <%=dlrnameh%> </a> </li>
                    </ul>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-info" data-toggle="dropdown" href="#">
                            <span class="icon-cog icon-white"></span><span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu right0">
                            <li><a href="<%=ccph%>/genericpayment/editProfileDetails.jsp">&nbsp;<i class="icon-edit"></i>Edit Profile</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=ccph%>/GenericServlet" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account">&nbsp;<i class="icon-tasks"></i>Payment History</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=ccph%>/genericpayment/chngPassword.jsp" rel="tooltip" data-placement="bottom" data-original-title="Edit/update your Account">&nbsp;<i class=" icon-random"></i>Change Password</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=ccph%>/GenericLogin?step=logout">&nbsp;<i class="icon-off"></i>Log Out</a></li>
                        </ul>
                    </div>
                </div>
                <%}else{%>                
                    <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa  fa-credit-card"></i> Instant Pay</a></li>
                    <li><a  href="<%=ccph%>/Home.jsp" rel="tooltip" data-placement="bottom" data-original-title=""> <i class="fa  fa-sign-in"></i> Sign In</a></li>	
                    <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" > <i class="fa fa-dashboard"></i> Dashboard</a></li>
                    <%--<li><a href="<%//=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> Official</a></li>
                    <li><a href="<%//=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>--%>
                    <li><a href="#departmentmodel" data-toggle="modal" > <i class="fa  fa-user"></i> Department</a></li>
                    <li><a href="#adminmodel" data-toggle="modal" > <i class="fa  fa-user"></i> Admin</a></li>
                </ul>


<%}%>

</div>
</div>


</div> <!-- navbarid closed -->
</div></div>
<!-- Modal -->
<div id="adminmodel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-header">

<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
<h3 id="myModalLabel">Admin Login</h3>
</div>
<div class="modal-body">
<form  id="adminlogin" name="adminlogin" action="<%=ccph%>/GenericAdminServlet" method="post">
              <input type="hidden" name="step" id="step" value="1">
              <!--input type="hidden" name="step" id="step" value="changepass2"-->
              <table>
              <tr><td>
              <div align="center"><font color="Red"><%=request.getParameter("mesg")!=null?request.getParameter("mesg") : ""%></font></div>
              User Name </td><td><input class="" id="email" name="email"  placeholder="user name" value="" type="text" required></td>
               </tr>
               <tr><td>
               Password </td><td><input class="" id="password1" name="password1" size="10" value="" placeholder="Password" type="password" required></td>
               </tr>
               <tr><td>
               Security Code</td><td><div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;">
                      <input type="text" name="captcha" maxlength="5"   placeholder="Security Code" style="width:100px;"/>
                      <img name="c" id="c" src="<%=ccph%>/CustomizedCaptcha" height="25" width="66"> <a href="#" onclick='document.getElementById("c").src="<%=ccph%>/CustomizedCaptcha?x="+Math.random();adminlogin.captcha.focus();'> <img src="<%=ccph%>/images/refresh1.jpg" alt="" width="20" height="25" onmouseover="this.src='<%=ccph%>/images/refresh.gif'" onmouseout="this.src='<%=ccph%>/images/refresh1.jpg'" style="border: 0px;" /> </a> </div>
                      </td>
               </tr>
               </table>
            </form>
</div>
<div class="modal-footer">
 <button class="btn btn-primary" onclick="encryptADMPassword('<%=rndadmin%>');">Login</button>
 <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>
<div id="departmentmodel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-header">

<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
<h3 id="myModalLabel">Department Login</h3>
</div>
<div class="modal-body">
<form accept-charset="UTF-8"  id="departmentlogin" name="departmentlogin" action="<%=ccph%>/GenericAdminServlet" method="post">
   <input type="hidden" name="step" id="step" value="4">
   <div align="center"><font color="Red"><%=request.getParameter("mesg")!=null?request.getParameter("mesg") : ""%></font></div>
  <table>          
                <tr>
                <th>Department</th>
                <td><%if(aladmin!=null){
                Iterator it=aladmin.iterator();
                %>
                    <select name="department" id="department">
                        <option value="#">-------select------- </option>
                     <%
                        while(it.hasNext()){                          
                            GenericAdminBean cfrbadmin=(GenericAdminBean) it.next();%>                    
                        <option value="<%=cfrbadmin.getDeptid()!=null ? cfrbadmin.getDeptid():null%>"><%=cfrbadmin.getDepartment()!=null?cfrbadmin.getDepartment():""%></option>
                    <%}%>
                    </select>
                    <%}%>
                </td>
                </tr>
                      <tr>
                        <th>User Name </th> 
                        <td><input class="" id="email" name="email"  placeholder="username" value="" type="text" required><br/></td>
                      </tr> 
                      <tr>
                        <th>Password</th> 
                        <td><input class="" id="password1" name="password1" size="10" value="" placeholder="Password" type="password" required><br/></td>
                      </tr> 
                     <tr>
                        <th>Security Code</th> 
                        <td><div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;"><input type="text" name="captcha" maxlength="5"   placeholder="Security Code" style="width:100px;"/>
                        <img name="c" id="c" src="<%=ccph%>/CustomizedCaptcha" height="25" width="66">
                        <a href="#" onclick='document.getElementById("c").src="<%=ccph%>/CustomizedCaptcha?x="+Math.random();adminlogin.captcha.focus();'>  <img src="<%=ccph%>/images/refresh1.jpg" alt="" width="20" height="25" onmouseover="this.src='<%=ccph%>/images/refresh.gif'" onmouseout="this.src='<%=ccph%>/images/refresh1.jpg'" style="border: 0px;" /> </a>
                     </div></td>
                      </tr> 
                     <tr>
                     
                       </table>
                    </form>
</div>
<div class="modal-footer">
 <button class="btn btn-primary" onclick="loginUser();">Login</button>
 <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>
<script type="text/javascript" src="<%=ccph%>/script/md5.js"></script> 
<script type="text/javascript">
            function encryptADMPassword(t){      
                var p = document.getElementById('password1');
                if(p.value=="" || p.length==0){
                    p.value = "";
                }else{
                    p.value = m5(p.value, t);
                }
				document.getElementById("adminlogin").submit();
            }
			   function loginUser(){
    //var username= document.getElementById("email");
    var username=document.departmentlogin.email;
    var password=document.departmentlogin.password1;			
    if(username.value=="" || username.length==0){
        alert("Please!Enter your User Name.");
    }else if(password.value=="" || password.value==0){
        alert("Please! Enter a password.");
    }else { 
        document.departmentlogin.step.value='4';
        document.departmentlogin.method="POST";
        document.departmentlogin.action="<%=ccph%>/GenericAdminServlet";
        document.departmentlogin.submit();		
    }
 } 
        </script> 
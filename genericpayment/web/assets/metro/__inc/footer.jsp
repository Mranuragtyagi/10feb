<%String ccp_foot = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="java.util.*,genericepayment.*,genericepayadmin.*  " %>
<%

    String rndadmins= ""+ Math.round( Math.random()*100000);
    request.getSession().setAttribute("rnds",rndadmins);
    GenericBean gbhfoot = request.getSession().getAttribute("signupbean") != null ? (GenericBean) request.getSession().getAttribute("signupbean") : new GenericBean();
    String dlrnameh = gbhfoot.getDlrname() != null ? gbhfoot.getDlrname() : "";
    String sqladmin = "select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
    java.sql.PreparedStatement stmtadmin = null;
    java.sql.Connection conadmin = null;
    vicclass.User uadmin = new vicclass.User();
    uadmin.createConnection();
    conadmin = uadmin.getConnection();
    ArrayList aladmin = new ArrayList();
    java.sql.ResultSet rsadmin = null;
    try {
        stmtadmin = conadmin.prepareStatement(sqladmin);
        stmtadmin.setString(1, "A");
        rsadmin = stmtadmin.executeQuery();
        while (rsadmin.next()){
            GenericAdminBean genericbean = new GenericAdminBean();
            genericbean.setDepartment(rsadmin.getString("DEPT_NAME"));
            genericbean.setDeptid(rsadmin.getString("DEPT_ID"));
            aladmin.add(genericbean);
        }
    }catch (Exception e){
        System.out.println(e.getMessage());
    }finally{
        try{
            if (stmtadmin != null){stmtadmin.close();}
            if (rsadmin != null){rsadmin.close();}
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    String ac = java.net.InetAddress.getLocalHost().getHostAddress();
    String reponseParts[] = ac.split("\\.");
    String first = reponseParts[0];
    String second = reponseParts[1];
    String third = reponseParts[2];
    String fourth = reponseParts[3];
%>
<!--<footer>
    <!--Copyright@ 2014 Jharkhand Government Incorporated.All rights reserved-->
  




    <!--  <div class="span2">%=utility.SystemGlobals.getCopyright()%></div>
  <div class="span1"><a href="<%=ccp_foot%>/Help.jsp">Help</a></div>
      <div class="span2"><a href="<%=ccp_foot%>/termsOfUse.jsp">Terms & Condition</a></div>
       <div class="span1"><a href="<%=ccp_foot%>/codeConduct.jsp">Copyright</a></div>
        <div class="span1"><a href="<%=ccp_foot%>/privacyPolicy.jsp">Policy</a></div>
        <div class="span1"><a href="<%=ccp_foot%>/Contact_us.jsp">Contact</a></div>
        <div class="span1"><a href="<%=ccp_foot%>/about.jsp">About</a></div>-->
       
    <!--
        Terms of Use&nbsp;|&nbsp;Privacy Policy&nbsp;|&nbsp;Disclaimer&nbsp;|
        &nbsp;Feedback & nbsp;|&nbsp;Sitemap |&nbsp;FAQs
  
    <div class="span1">
        %=utility.SystemGlobals.getTerms()%>
    </div>
    <div class="span1">%=utility.SystemGlobals.getVersion()%><!--Version - 0.83 Release Date - 20-Oct-2014--></div>
   <!-- <div class="span1 pullright" style="text-align:right;">
        %if (fourth.equals("82")||fourth == "82"){%>
            Server : ARUN
        %}else if(fourth.equals("86")||fourth=="86"){%>
            Server : VARUN
        %}else if (fourth.equals("17") || fourth == "17"){%>
            Server : Local
        %}else{%>
            Server:Other
        %}%>
    </div>  
    
    
</div>
   
</footer>-->
    <script type="text/javascript" src="<%=ccp_foot%>/assets/metro/js/md5.js"></script> 
<script>
       function encrytMD5(){  
           var t=document.getElementById('rndm');
                var p = document.getElementById('passwordadmin');
                if(p.value=="" || p.length==0){
                    p.value = "";
                    return false;
                }else{
                    p.value = m5(p.value, t.value);
                    return true;
			//		document.getElementById("adminlogin").submit();
                }
            }
            
             function encrytMD5dept(){  
           var t=document.getElementById('rndmdept');
           alert(t.value);
                var p = document.getElementById('passworddept');
                alert(p.value);
                if(p.value=="" || p.length==0){
                    p.value = "";
                    return false;
                }else{
                    p.value = m5(p.value, t.value);
                    alert(p.value);
                    return true;
                }
            }
    (function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments);
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
        m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m);
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-50085699-1', 'jharkhand.gov.in');
        ga('send', 'pageview');
</script>
<!-- Modal -->

<div class="section bg-dark footer-bar">
<div class="container">
<div class="row">
<div class="logo span5" style="color:#fff;">
version 1
</div>
<div class=" span7 links">
<p>copyright@2014 demo.</p>
<p>
<a href="<%=ccp_foot%>/Help.jsp">Help</a>
</p>
<p>
<a href="<%=ccp_foot%>/termsOfUse.jsp">Terms and Condition</a>
</p>
<p>
<a href="<%=ccp_foot%>/codeConduct.jsp"> Copyright</a>
</p>
<p>
<a href="<%=ccp_foot%>/privacyPolicy.jsp"> Privacy Policy</a>
</p>
<p>
<a href="<%=ccp_foot%>/Contact_us.jsp"> Contact us</a>
</p>
<p>
<a href="<%=ccp_foot%>/about.jsp"> About</a>
</p>
</div>
</div>
</div>
</div>


<div id="adminmodel" class="modal hide fade" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
  <%--  <form  id="adminlogin" name="adminlogin" action="<%=ccp_foot%>/GenericAdServlet" method="post" onsubmit="return encrytMD5()"> --%>
        <form  id="adminlogin" name="adminlogin" action="<%=ccp_foot%>/GenericAdServlet" method="post" >
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h3 id="myModalLabel">Admin Login</h3>
        </div>
        <div class="modal-body">
              <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
            <input type="hidden" name="step" id="step" value="1">
             <input type="hidden" name="rndm" id="rndm" value="<%=rndadmins%>">
            <!--input type="hidden" name="step" id="step" value="changepass2"-->
            <table>
                <tr>
                    <td>User Name </td>
                    <td><input class="" id="useradmin" name="useradmin"  placeholder="user name" 
                               value="" type="text" required>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input class="" id="passwordadmin" name="passwordadmin"  
                               placeholder="Password" type="password" required>
                    </td>
                </tr>
                <!--tr>
                    <td>Security Code</td>
                    <td>
                        <div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; 
                             font-weight:bold; color:#ffa200;">
                            <input type="text" name="captcha" maxlength="5"   placeholder="Security Code" 
                                   style="width:100px;" required/>
                            <img name="c" id="c" src="<%=ccp_foot%>/CustomizedCaptcha" height="25" width="66">
                            <a href="javascript:void(0);" onclick='document.getElementById("c").src ="<%=ccp_foot%>/CustomizedCaptcha?x=" + Math.random();
                                adminlogin.captcha.focus();'>
                                <img src="<%=ccp_foot%>/assets/metro/images/refresh1.jpg" alt="" width="20" 
                                     height="25" onmouseover="this.src ='<%=ccp_foot%>/assets/metro/images/refresh.gif'" 
                                     onmouseout="this.src = '<%=ccp_foot%>/assets/metro/images/refresh1.jpg'" 
                                     style="border: 0px;" />
                            </a>
                        </div>
                    </td>
                </tr-->
            </table>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="button" onclick="adminValid();" >Login</button>
            <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </form>
</div>
<div id="departmentmodel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <%--<form accept-charset="UTF-8"  id="departmentlogin" name="departmentlogin" action="<%=ccp_foot%>/GenericDepartment" method="post" onsubmit="return encrytMD5dept()" > --%>
        <form accept-charset="UTF-8"  id="departmentlogin" name="departmentlogin" action="<%=ccp_foot%>/GenericDepartment" method="post" >
        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
        <input type="hidden" name="rndmdept" id="rndmdept" value="<%=rndadmins%>">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h3 id="myModalLabel">Department Login</h3>
        </div>
        <div class="modal-body">
            <input type="hidden" name="step" id="step" value="login">
            <table>          
                <tr>
                    <th>Department</th>
                    <td>
                        <%
                        if (aladmin != null){
                            Iterator itfoot = aladmin.iterator();
                        %>
                        <select name="department" id="admindepartment">
                            <option value="#">-select-</option>
                            <%
                                while (itfoot.hasNext()) {
                                    GenericAdminBean cfrbadmin = (GenericAdminBean) itfoot.next();
                            %>
                            <option value="<%=cfrbadmin.getDeptid()!=null?cfrbadmin.getDeptid():""%>"><%=cfrbadmin.getDepartment() != null ? cfrbadmin.getDepartment() : ""%></option>
                                <%}%>
                        </select>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <th>User Name </th> 
                    <td><input class="" id="email" name="username"  placeholder="username" value=""size="28" 
                               type="text" required><br/>
                    </td>
                </tr> 
                <tr>
                    <th>Password</th> 
                    <td><input class="" id="passworddept" name="password1" value="" placeholder="Password" size="28"
                               type="password" required><br/>
                    </td>
                </tr> 
                <!--tr>
                    <th>Security Code</th> 
                    <td>
                        <div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; 
                             font-weight:bold; color:#ffa200;">
                            <input type="text" name="captcha" maxlength="5" placeholder="Security Code" 
                                   style="width:100px;" required/>
                            <img name="cc" id="cc" src="<%=ccp_foot%>/CCaptcha" height="25" width="66">
                            <a href="javascript:void(0);" onclick='document.getElementById("cc").src="<%=ccp_foot%>/CCaptcha?x="+Math.random();
                                departmentlogin.cc.focus();'>
                            <img src="<%=ccp_foot%>/assets/metro/images/refresh1.jpg" width="20" height="25" 
                                 onmouseover="this.src = '<%=ccp_foot%>/assets/metro/images/refresh.gif'" 
                                 onmouseout="this.src = '<%=ccp_foot%>/assets/metro/images/refresh1.jpg'" 
                                 style="border: 0px;" />
                            </a>
                        </div>
                    </td>
                </tr--> 
                <tr>
            </table>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="button" onclick="deprtmentValid();">Login</button>
            <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </form>
</div>
<input type="hidden" name="ccp" id="ccp" value="<%=ccp_foot%>">


<script type="text/javascript">
                            function adminValid() {
                                var usradmn = document.adminlogin.useradmin.value;//useradmin,passwordadmin
                               var pwdRegex=/^[0-9a-zA-Z]+$/;
                                var pwdadmn = document.adminlogin.passwordadmin.value;
                                var userregx = /^[a-zA-Z]+$/;

                                if (!usradmn.match(userregx)) {
                                    alert("Please enter the User Name!");
                                    document.adminlogin.useradmin.focus();
                                    return false;
                                } else if (!pwdadmn.match(pwdRegex)) {
                                    alert("Please enter the Password!");
                                    document.adminlogin.pincode.focus();
                                    return false;
                                } else {
                                    document.adminlogin.submit();
                                }
                            }//username,password1,department,departmentlogin
                            
                              function deprtmentValid() {
                                var deprtmnet = document.departmentlogin.department.value;
                                var usradmn = document.departmentlogin.username.value;
                                var pwdRegex=/^[0-9a-zA-Z]+$/;
                                var pwdadmn = document.departmentlogin.password1.value;
                                var userregx = /^[a-zA-Z]+$/;
                                 if (deprtmnet == '#') {
                                    alert("Please select the Department!");
                                    document.departmentlogin.department.focus();
                                    return false;
                                 }else if (!usradmn.match(userregx)) {
                                    alert("Please enter the User Name!");
                                    document.departmentlogin.username.focus();
                                    return false;
                                }else if (!pwdadmn.match(pwdRegex)) {
                                    alert("Please enter the Password!");
                                    document.departmentlogin.password1.focus();
                                    return false;
                                }else {
                                    document.departmentlogin.submit();
                                }
                              }
        </script>
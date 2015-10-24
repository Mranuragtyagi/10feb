<!DOCTYPE html>
<%@page import="java.net.URLEncoder,java.util.*,genericepayment.*,java.sql.*,vicclass.* " errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String errormsg=request.getParameter("validationmsg")!=null?request.getParameter("validationmsg"):"" ;
%>
<% java.text.DecimalFormat df=new java.text.DecimalFormat("################.00");
   String b="" ;
   int depid=0 ;
   String statn="" ;        
   User u= new User();
     Connection con=null;
     u.createConnection();
     con=u.getConnection();
     ArrayList ar = new ArrayList();
     String sql="select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? order by DEPT_NAME " ;
     java.sql.PreparedStatement stmt=null;
   
    
     ArrayList al=new ArrayList();
     java.sql.ResultSet rs=null;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,"A");
        rs=stmt.executeQuery();
        while(rs.next()){
            GenericBean genericbean=new GenericBean();
            genericbean.setDepartmentname(rs.getString("DEPT_NAME"));
            genericbean.setDepartmentid(rs.getString("DEPT_ID"));
            al.add(genericbean);
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
    }finally{  
             try{
                 if(rs!=null)
                     rs.close();
                 if(stmt !=null)
                     stmt.close();
                 if(con!=null)
                    con.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }	 
%>

<html lang="en">
     
<head>
    
<title>Home | Government of Jharkhand Electronic Revenue Receipt Portal</title>
<%@ include file="assets/metro/__inc/base_links_payment_page.jsp"%>
<link id="base-style-responsive" href="assets/metro/css/cmxform.css" rel="stylesheet">
<style>
.paytax {
	display:block;
}
</style>
</head>
<body>
<div id="fb-root"></div>
<!-- start: Header -->
<%@ include file="assets/metro/__inc/user_header.jsp"%>
<!-- start: Header -->
<div class="container-fluid-full" style="height:auto !important;">
  <div class="row-fluid">
    <!-- start: Main Menu -->
    <%@ include file="assets/metro/__inc/landing_main_menu.jsp"%>
    <div id="content" class="span10 nopadd">
      <div class="row-fluid">
        <div class="span12 uproundbox banner" onDesktop="span6">
          <div class="span8 text hide480">
            <div class="span12" align="center">
              <div class="span12" align="left"> <span class="text1">Pay Taxes, Bills &amp; Fees safely and easily.</span>
                <h2 class="text">Pay Taxes, Bills &amp; Fees <br />
                  <span>safely and easily.</span></h2>
              </div>
            </div>
            <div id="cards" class="span12 fc_FFF">
              <div class="span12 bold font20">Easy, Convenient and Fast Tax Payment System.</div>
            </div>
          </div>
          <div class="span3 roundbox signup-form pull-right" align="center">
              <div><font style="color: red"><%=errormsg%></font></div>
            <div class="span12 font18"> <span class="lb1"><strong>Sign up</strong></span></div>
            <%-- <form accept-charset="UTF-8" name="signupForm" id="signupForm" action="genericpayment/remainingUnregisteredDetails.jsp" method="post"> --%>
                <form accept-charset="UTF-8" name="signupForm" id="signupForm" action="<%=ccp%>/GenericServlet" method="post">
               <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
              <input type="hidden" name="step" value="15">
              <input class="span11" id="firstname" name="firstname" placeholder="Full Name" type="text" autocomplete="off" required />
              <input class="span11" id="email" name="email" placeholder="Email" type="text" autocomplete="off" required />
              <input class="span11" id="phonenumber" name="phonenumber" placeholder="Mobile" maxlength="10" autocomplete="off" type="text" required />
              <input class="span11" id="password1" name="password1" placeholder="Password"  type="password" autocomplete="off" required />
              <input class="span11" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" type="password" autocomplete="off" required />
              <div class="span12" align="center" style="margin:0 auto;">
                <button class="btn btn-warning span12" type="button" onClick="createAccountValidation();"> <strong>Create an Account</strong> </button>
                <%--<button class="btn btn-warning span12" type="submit"> <strong>Create an Account</strong> </button>--%>
              </div>
            </form>
          </div>
          <br/>
          <br/>
          <br/>
        </div>
        <div class="span12 slogan downroundbox hide480">
          <div style="background-color: #FC0; margin-top:-10px;">
            <!--<h2>Welcome to Pay Online </h2>-->
            <h1><%=utility.SystemGlobals.getContent1()!=null?utility.SystemGlobals.getContent1() : "<Not Set>"%></h1>
            <!--<h3>Government of Jharkhand Electronic Revenue Receipt Portal</h3>-->
            <h2><%=utility.SystemGlobals.getContent2()!=null?utility.SystemGlobals.getContent2() : "<Not Set>"%></h2>
          </div>
          <!--<div class="span12">&nbsp;</div>
                <div class="span12" id="bodymenu"></div>-->
          <div class="span12 roundbox effect2">
            <div class="spa4_a roundbox" align="center">
              <div class="span12 font18 h200">
                <h3><i class="fa fa-mobile-phone f13A89E"></i><br>
                  <span class="f333">Smart device compliance</span></h3>
                The portal is compatible with smart mobile or tablet. You can pay using your mobile or tablet. </div>
            </div>
            <div class="spa4_a roundbox" align="center">
              <div class="span12 font18 h200">
                <h3><i class="fa fa-desktop f13A89E"></i><br>
                  <span class="f333">67+ Net banking Options</span></h3>
                Tied up with 67+ banks for net banking and debit card payment. </div>
            </div>
            <div class="spa4_a roundbox" align="center">
              <div class="span12 font18 h200">
                <h3><i class="fa fa-lock f13A89E"></i><br>
                  <span class="f333">100% Secure</span></h3>
                Your card or net banking details always remain encrypted and secure with NDML payment gateway. </div>
            </div>
          </div>
          <div class="span12 roundbox " id="footer">
            <div class="copyright">
              <div class="span3 roundbox hide480">
                <div class="fb-like-box" data-href="https://www.facebook.com/payonlinejharkhand" data-width="240" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>
              </div>
              <div class="span9 roundbox" id="footermenu"> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<%@ include file="assets/metro/__inc/footer.jsp"%>
<div id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false"><i class="icon-remove" style="cursor: pointer"></i></div>
</body>
<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<!--script src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script-->
<script src="<%=ccp%>/assets/metro/js/jquery-validate.bootstrap-tooltip.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>
<script type="text/javascript">
function createAccountValidation(){
   // name 
  // if($("#signupForm").valid()){
    var firstname=document.signupForm.firstname.value;
     var nameEx=/^[a-zA-Z ]+$/;
     // email
    var email=document.signupForm.email.value;
    var atpos=email.indexOf("@");
    var dotpos=email.lastIndexOf(".");
   //mobile 
    var phonenumber=document.signupForm.phonenumber.value;
    var mobileEx=/^\d{10}$/;  
   
    //password
    var password1=document.signupForm.password1.value;
    var pwdlength=password1.length;
    var strongRegex = new RegExp("^(?=.{8,})(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$*])");
    var pwdRegex=/^[0-9a-zA-Z]+$/;
    var pwdDigit=/^[0-9]+$/;
    var passwSpecial=/^[#?!@$%^&*-]$/;  
    
    //confirm password
    var confirmpassword=document.signupForm.confirmpassword.value;
    

  if(!firstname.match(nameEx)){
    alert("Please Enter Valid Name!");
    document.signupForm.firstname.focus();
    return false;
  }else if (atpos < 1 || ( dotpos - atpos < 2 )){
        alert("Not a valid e-mail address");
        document.signupForm.email.focus();
        return false;
    }else if(!mobileEx.test(phonenumber)){
        alert("Please Enter Valid Mobile No!");
        document.signupForm.phonenumber.focus();
        return false;
    }else if(pwdlength<8){
        alert("Password length must be greater than 7");
        document.signupForm.password1.focus();
        return false;
    }else if(!strongRegex.test(password1)){
         alert("Please Enter Strong Password");
         document.signupForm.password1.focus();
         return false;
    }else if(password1!=confirmpassword){
         alert("password mismatch!");
         document.signupForm.confirmpassword.focus();
         return false;
    }else if(!strongRegex.test(confirmpassword)){
         alert("Please Enter Strong Password");
         document.signupForm.confirmpassword.focus();
         return false;
    }else{
    document.signupForm.submit();
    }                
}

(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=475654849201699";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<script type="text/javascript"> 
function setCookie(cname,cval)
{
cvalue=cval;
var d = new Date();
d.setTime(d.getTime()+(1*24*60*60*1000));
var expires = "expires="+d.toGMTString();
document.cookie = cname + "=" + cvalue + "; " + expires;

}
 
$(document).ready(function(){

function getmenu(dept,menuid,pagemenuid,footerid){
var options ='';

$.getJSON("<%=ccp%>/genericpayment/getTaxTypeByDept.jsp",{'dept': dept, ajax: 'true'}, function(res){
options += '';
var pageoption='<ul>';
var footeroption='';
var items = res.list;
for(var i = 0; i < items.length; i++){
var aa='<a data-parent="#SubMenu'+i+'" href="<%=ccp%>/genericpayment/unregisteredUserDetail.jsp" tabindex="-1" onclick="javascript:deleteAllCookies();setCookie(\'department\',\''+dept+'\');setCookie(\'purpose\',\''+items[i].val+'\');">'+items[i].val+'</a>';

if(i<5){
	options +=  '<li class="underline">'+aa+'</li>';	
	pageoption+='<li>'+aa+'</li>';}
if(i==5){
	options +=  '<li class="underline"><a data-parent="#SubMenu'+i+'" href="<%=ccp%>/more.jsp">More >></a></li>';
	      
  
pageoption+='<li><a class=" dropdown-toggle" data-toggle="dropdown" style="color:#900; cursor:pointer">More >> </a><ul class="dropdown-menu page_dropdown-menu">';
pageoption+='<li>'+aa+'</li>';
}
if(i>5){pageoption+='<li>'+aa+'</li>';}
if(i==items.length){pageoption+='</ul></li>';}
footeroption+='| '+aa+' ';
}
options+='</ul>';
pageoption+='</ul>';
$("#SubMenu"+menuid).prepend(options);
$("#"+pagemenuid).prepend(pageoption);
$("#"+footerid).prepend(footeroption);
});
}
var depts=[<%if(al!=null){
                Iterator it=al.iterator();
            %>
			<%
                    while(it.hasNext()){                          
                    GenericBean cfrb=(GenericBean) it.next();
               %>
			   '<%=cfrb.getDepartmentname().toUpperCase()%>',
			    <%}%>
            <%}%>
			   ];

             

var sidemenuoptions='';
for(var i = 0; i < depts.length; i++){
sidemenuoptions='<li><a href="#SubMenu'+i+'" class="list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i class="fa fa-caret-down"></i> '+depts[parseInt(i)]+' </a></li><ul class="collapse list-group-submenu" id="SubMenu'+i+'">';
$("#MainMenu").append(sidemenuoptions);
$("#bodymenu").append('<div class="span4"><div class="span12 bold taxhead">'+depts[parseInt(i)]+'</div><div class="span12 headtext"  id="pagemenu'+i+'"></div></div>');
$("#footermenu").append('<span class="lb1 bold">'+depts[parseInt(i)]+' </span><span class="fc_000" id="footer'+i+'"></span>');
getmenu(depts[parseInt(i)],i,'pagemenu'+i,'footer'+i);

}		 

});
function clickIE4(){
if (event.button==2){
return false;
}
}
function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
return false;
}
}
}
if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
} else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}
document.oncontextmenu=new Function("return false")
</script>
</html>

<%String ccp_menu="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayment.*,java.sql.*,vicclass.* " %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<style>
.list-group{ margin-bottom:0px !important;
background: #f2f2f2;
border-top:#ccc solid 1px;
border-bottom:#ccc solid 1px;
padding-left: 10px;}
.list-group.panel > .list-group-item {
  border-bottom-right-radius: 4px;
  border-bottom-left-radius: 4px;
  text-decoration:none;
}
.list-group.panel > .list-group-item strong{
  margin-left:10px !important;}
#MainMenu,.list-group-submenu {
  margin-left:10px !important;

}
ul li .list-group-item{
	line-height:30px !important;
	
}
.list-group-item:hover{
	text-decoration:none;
}
.underline{
	border-bottom:#999 solid 1px !important;
	line-height:25px !important;
	
}
</style>
    
<script type="text/javascript">
            function getvalidate()
            {
            var dept=document.frm.tsearch.value;
            var nameEx2=/^[0-9]+$/;
            if(!dept.match(nameEx2)){
                alert("Please fill only Numeric values");
                document.frm.step.focus();
                return false;
                }else{
                    frm.submit();
                }
            }
</script>
<%String msg1=StringEscapeUtils.escapeHtml(request.getParameter("msg1"));%>
<div id="sidebar-left" class="span2">
  <div class="nav-collapse sidebar-nav">
    <ul class="nav nav-tabs nav-stacked main-menu">
    
<div class="sidebar-widget">
      <%if(msg1!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msg1%></h4>
      </div>
      <%}%>
       
        <form id="custom-search-form" name="frm" class="form-search form-horizontal span12" action="<%=ccp_menu%>/GenericServlet" method="post">
  <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
 <input type="hidden" name="step" id="step" value="searchbox">
 <div class="input-append span11">
<input type="text" class="search-query span12 search-box" placeholder="Enter Challan No." name="tsearch" size="10px">
<button type="button" class="btn" onclick="getvalidate();"><i class="fa fa-search"></i></button>
</div>
        </form>
</div>
<li><a href="<%=ccp_menu%>/Dashboard.jsp"> <i class="fa fa-dashboard"></i> Dashboard</a></li>
      <%if(request.getSession().getAttribute("loggedin")!=null){%>
      <li><a href="<%=ccp_menu%>/genericpayment/registeredtaxpayee.jsp"><i class="fa fa-cc-visa"></i> Pay Tax</a></li>
      <li><a href="<%=ccp_menu%>/GenericServlet"><i class="fa fa-tasks"></i> Payment History</a></li>
      <%}else{%>
      <li><a href="<%=ccp_menu%>/genericpayment/unregisteredUserDetail.jsp"><i class="fa  fa-credit-card"></i> Instant Pay</a></li>
      <%}%>
    </ul>
   
  </div> 
    
  <%--


<div id="MainButton">
  <div class="list-group">
    <a href="#MainMenu" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainButton"><span class="font14"><strong>Pay Tax </strong></span><br />
    <span class="font18"><strong>By Department </strong></span> <i class="fa fa-caret-down"></i></a>
    <ul class="collapse" id="MainMenu">
    </ul>
  </div>
</div>
    --%>
</div>

<noscript>
<div class="alert alert-block span10">
  <h4 class="alert-heading">Warning!</h4>
  <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
</div>
</noscript>

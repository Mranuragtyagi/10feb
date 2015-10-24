<%String ccp_menu="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
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
<div id="sidebar-left" class="span2">
  <div class="nav-collapse sidebar-nav">
    <ul class="nav nav-tabs nav-stacked main-menu">
    
<div class="sidebar-widget">
						<form >
							<input type="text" class="search-box span12" placeholder="Search">
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
  <div id="MainButton">
  <div class="list-group">
    <a href="#MainMenu" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainButton"><span class="font14"><strong>Pay Tax </strong></span><br />
    <span class="font18"><strong>By Department </strong></span> <i class="fa fa-caret-down"></i></a>
    <ul class="collapse" id="MainMenu">
      
    </ul>
    
  </div>
</div>
</div>

<noscript>
<div class="alert alert-block span10">
  <h4 class="alert-heading">Warning!</h4>
  <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
</div>
</noscript>

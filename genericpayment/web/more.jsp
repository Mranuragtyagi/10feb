<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html>
<%@ page import="vicclas.*" %>
<head>
<title>Pay Tax by Department | Payonline Jharkhand</title>
<%@ include file="assets/metro/__inc/base_links.jsp"%>
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
      <div class="row-fluid sortable">
        <div class="box span12">
         <div class="box-header">
         Pay Tax            
          </div>
          <div class="box-content" id="pageMenu">
            
          </div>
        </div>
        <!--/span--> 
        
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
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>
<script>
$(document).ready(function(){

function getmenu(dept,menuid,pagemenuid,footerid){
var options ='<div class="span12"><table class="table table-condensed">';

$.getJSON("<%=ccp%>/genericpayment/getTaxTypeByDept.jsp",{'dept': dept, ajax: 'true'}, function(res){

options += '<thead><tr><th colspan="2">'+dept+'</th></tr></thead><tbody>';
var items = res.list;
for(var i = 0; i < items.length; i++){
var aa='<tr><td>'+items[i].val+'</td><td>&nbsp;</td><td><a class="pull-right btn btn-warning" href="<%=ccp%>/genericpayment/unregisteredUserDetail.jsp" onclick="javascript:setCookie(\'department\',\''+dept+'\');setCookie(\'purpose\',\''+items[i].val+'\');"><i class="fa fa-inr"></i> Pay</a></td></tr>';
options +=  aa;

}
options+='</tbody></table></div>';
$("#paypage"+menuid).append(options);
});
}
var depts=['Commercial Tax','Excise And Prohibition','Mines And Geology','Registration','Transport', 'Traffic Police','Finance'];
var sidemenuoptions='';
for(var i = 0; i < depts.length; i++){
sidemenuoptions='<div id="paypage'+i+'">';
$("#pageMenu").append(sidemenuoptions);
getmenu(depts[parseInt(i)],i,'pagemenu'+i,'footer'+i);

}		 

});
</script>
</body>
</html>

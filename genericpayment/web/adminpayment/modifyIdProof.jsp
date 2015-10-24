<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String msg=request.getParameter("msg")!=null?(String)request.getParameter("msg"): "";

 String sql="select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u= (vicclass.User)request.getSession().getAttribute("user");
     java.sql.Connection con=null;
     con=u.getConnection();
     ArrayList al=new ArrayList();
     java.sql.ResultSet rs=null;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,"A");
        rs=stmt.executeQuery();
        while(rs.next()){
            GenericAdminBean genericbean=new GenericAdminBean();
            genericbean.setDepartment(rs.getString("DEPT_NAME"));
            genericbean.setDeptid(rs.getString("DEPT_ID"));
            al.add(genericbean);
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
             finally{               
             try{
                 if(stmt !=null)
                     stmt.close();
                 if(rs!=null)
                     rs.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }


%>


<html>
  <head>
        <!-- start: Meta -->
	<title>Modify Id Proof | Payonline Jharkhand</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
    
      </head>
  <body>
   <!-- start: Header -->
        <%@ include file="../assets/metro/__inc/header.jsp"%>
		<!-- start: Header -->
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<%@ include file="../assets/metro/__inc/main_menu.jsp"%>
			<!-- end: Main Menu -->
			
			
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="<%=ccp%>/adminpayment/adminContent.jsp">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
                		<li>
					<i class="icon-edit"></i>
					<a href="#">Modify Id Proof</a>
				</li>
		
				
			</ul>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Modify Id Proof</h2>
						
					</div>
					<div class="box-content">

  
  
      <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
    <input type="hidden" name="step" id="step" value="28">
       <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
    <input type="hidden" name="actn" value="">
      <legend id="llegend">Modify Id Proof</legend>
    <%if(msg!=""){%>
    <div><font color="Green"><%=msg%></font></div>
    <%}%>
    <div id="one">
  <table class="table table-striped table-bordered bootstrap-datatable datatable">          
            <tr>
                <th>Department</th>
                    <td><%if(al!=null){
                        Iterator it=al.iterator();
                        %>
                        <select name="department" id="department" onchange="getMajor();">
                            <option value="#">-------SELECT------- </option>
                                <%
                                    while(it.hasNext()){                          
                                    GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                                    <option value="<%=cfrb.getDeptid()!=null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                                <%}%>
                            </select>
                        <%}%>
                    </td>
            </tr>
            <tr>
                <th>Id proof</th>
                <td>
                    <select id="idproof" name="idproof">
                        <option value="#">-----Select-----</option>
                    </select>
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <input type="button" class="btn-primary"  name="editt" id="editt" value="Edit" onclick="cook()">
                    <input type="button" name="del" class="btn-primary"  value="Delete" onclick="b()"></td>
            </tr>
        </table>
        </div>
        <!-- edit part -->
        
         <div id="two">
        <table class="table table-striped table-bordered bootstrap-datatable datatable">  
            <tr>
                <th>Department</th>
                <td>
                
                <%if(al!=null){
                            Iterator it=al.iterator();
                            %>
                                <select name="dep" id="dep">
                                    <option value="#">-------SELECT------- </option>
                            <%
                                        while(it.hasNext()){                          
                                        GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                                    <option value="<%=cfrb.getDeptid()!=null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                            <%}%>
                                </select>
                        <%}%>
                
               </td>
            </tr>
            <tr>
                <th>Major Tax Code</th>
                <td><input type="text" id="idprf" name="idprf"></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="button" class="btn-primary" name="edit" value="Submit" onclick="a()"></td>
            </tr>
        </table>
    </div>
    </form>
    
					</div>
				</div><!--/span-->

			</div>
    

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	
    	<div class="clearfix"></div>
	<%@ include file="../assets/metro/__inc/footer.jsp"%>
    
		<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>


    
    
     <script>
    $(document).ready(function(){
		$('#two').hide();
		$('#one').show();
                });
	</script>
      <script type="text/javascript" language="javascript">
           /* $(function(){                
                $("#department").change(function(){
                    $.getJSON("getIdProofByDepartment.jsp",{'depart':$("#department").val(), ajax: 'true'}, function(res){   
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#idproof").html(options);
                    })
                })
            });*/
       function getMajor(){
                var departmentval = $("#department").val();
                $.post("<%=ccp%>/JsonService?step=getIdProofByDepartment&depart="+departmentval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#idproof").html(options);
                },"json"); 
            };
        </script>
        
        <script type="text/javascript">
        function setCookie(cname)
	{
	cvalue=$('#'+cname).val();
	var d = new Date();
	d.setTime(d.getTime()+(1*24*60*60*1000));
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
	}
        
        function getCookie(cname)
        {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) 
          {
          var c = ca[i].trim();
          if (c.indexOf(name)==0) return c.substring(name.length,c.length);
          }
        return "";
        }	
        
        
             function cook(){
                 var dept=document.frm.department.value;
var idproof=document.frm.idproof.value;
 if(dept=="#"){
  alert("Please Select the Department Name ");
  document.frm.department.focus();
  return false;
}else if(idproof=="#"){
  alert("Please fill Id Proof");
  document.frm.idproof.focus();
  return false;
} else{
             setCookie('department');
             setCookie('idproof');
            
            $("#dep").val(getCookie('department'));
            $("#idprf").val(getCookie('idproof'));
            
                       $("#one").hide();
                       $("#two").show();
            }
        }
        </script>
        
         <script type="text/javascript">
            function a(){
         var a = document.frm.edit.value;
                if(a=='Submit'){
                    document.frm.actn.value="edit";
                    document.frm.submit();
                }
        }
        
        function b(){
             var dept=document.frm.department.value;
            var idproof=document.frm.idproof.value;
             if(dept=="#"){
              alert("Please Select the Department Name ");
              document.frm.department.focus();
              return false;
            }else if(idproof=="#"){
              alert("Please fill Id Proof");
              document.frm.idproof.focus();
              return false;
            } else{
                var b = document.frm.del.value;
                if(b=='Delete'){
                    document.frm.actn.value="del";
                    document.frm.submit();
                }
        }
    }
        </script>
<%}%>
    
  </body>
</html>
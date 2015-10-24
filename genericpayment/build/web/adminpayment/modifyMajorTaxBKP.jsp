<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>

<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String msg=(String)request.getParameter("msg");

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
	<title>Major Tax | Payonline Jharkhand</title>
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
					<a href="#">Modify Major Tax</a>
				</li>
			</ul>
           
			<div class="row-fluid sortable">
            
				<div class="box span12">
<div class="box-header" data-original-title> <h2><i class="fa fa-edit"></i><span class="break"></span>Modify Major Tax</h2>
						
					</div>
					<div class="box-content">

   
  <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
       <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="actn" value="">
   <input type="hidden" name="step" id="step" value="20">
  <legend id="llegend">Modify Major Tax</legend>
    <div><%if(msg!=null){%>
    <div><font color="Red"><%=msg%></font></div>
    <%}%>
    <div id="one">
 <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                    <tr>
                        <th>Department</th>
                        <td><%if(al!=null){
                            Iterator it=al.iterator();
                            %>
                                <select name="department" id="department" >
                                    <option value="#">-------SELECT------- </option>
                            <%
                                        while(it.hasNext()){                          
                                        GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                                    <option value="<%=cfrb.getDeptid()!= null ?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                            <%}%>
                                </select>
                        <%}%>
                        </td> 
                    </tr>
                   <tr>
                <th>Major Tax</th>
                <div id="myscript"> </div>
               <td> <select id="majortaxtype" name="majortaxtype" onChange="show_purpose();">
                                            	<option value="#">-----Select-----</option>
                                            </select></td>
                <!--input type="text" name="taxtype"  id="taxtype" required-->
            </tr>
                    <tr>
                <th>Short Code</th>
               <td><input type="text" readonly id="majortaxtypecode" name="majortaxtypecode" /></td>
                <!--input type="text" name="taxtype"  id="taxtype" required-->
            </tr>
                    <tr align="center">
                        <td colspan="2"><input type="button" class="btn btn-primary "  value="Edit" onClick="getvalidate();">
                        <input type="button" name="del" class="btn btn-primary " value="Delete" onClick="b()"></td>
                    </tr>

      </table>
    </div>  

    <div id="two">
        <table>
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
                                    <option value="<%=cfrb.getDeptid()!= null ? cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                            <%}%>
                                </select>
                        <%}%>
                
               </td>
            </tr>
            <tr>
                <th>Major Tax</th>
                <td ><input type="text" id="mtax" name="mtax"></td>
            </tr>
            <tr>
                <th>Short Code</th>
                <td><input type="text" id="mtaxcode" name="mtaxcode"></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="button" name="edit" value="Submit" onClick="a()"></td>
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
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>

  
     <script>
    $(document).ready(function(){
		$('#two').hide();
		$('#one').show();
                });
	</script>		
    
    
    <script type="text/javascript" language="javascript">
            $(function(){                
                $("#department").change(function(){    
                    $.getJSON("getMajorTaxTypeAnother.jsp",{'state_code': $(this).val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtype").html(options);
                    })
                })
            });
        </script>
        
         <!--script type="text/javascript" language="javascript">
            $(function(){                
                $("#majortaxtype").change(function(){    
                    $.getJSON("getSingleTaxTypeCode.jsp",{'majortax': $(this).val(),'dept': $("#department").val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#"></option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtypecode").html(options);
                    })
                })
            });
        </script-->
        
        
        <script type="text/javascript">
        function show_purpose(){
            $.ajax({
            type: "POST",
            url: "<%=ccp%>/adminpayment/getSingleTaxTypeCode.jsp",
            data: {dept:$("#department").val(),majortax: $('#majortaxtype').val()}
            }).done(function(msg){
           $("#myscript").html(msg);
            });
        }
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
             setCookie('department');
             setCookie('majortaxtypecode');
             setCookie('majortaxtype');
            
            $("#dep").val(getCookie('department'));
            $("#mtaxcode").val(getCookie('majortaxtypecode'));
            $("#mtax").val(getCookie('majortaxtype'));
            
                       $("#one").hide();
                       $("#two").show();
            }
        </script>
        
        <script type="text/javascript">
            function a(){
         var a = document.frm.edit.value;//dep,mtax,mtaxcode
          var dept = document.getElementById("dep").value//department,majortaxtype,majortaxtypecode
                                var nameEx = /^[a-zA-Z ]+$/;
                                
                                var nameEx2 = /^[a-zA-Z0-9 ]+$/;
                                var mtaxes = document.getElementById("mtax").value;
                                var scods = document.getElementById("mtaxcode").value;
                                
                                if (dept=="#") {
                                    alert("Please Select The Department");
                                    document.getElementById("dep").focus();
                                    return false;
                                }
                                else if (!mtaxes.match(nameEx)) {
                                    alert("Please Fill Alphabet MajorTax");
                                    document.getElementById("mtax").focus();
                                    return false;
                                  }
                               else if (!scods.match(nameEx2)) {
                                    alert("Please Fill Alphabet-Numeric ShortCOde");
                                    document.getElementById("mtaxcode").focus();
                                    return false;
                                  }
                               else if(a=='Submit'){
                                    document.frm.actn.value="edit";
                                    document.frm.submit();
                                }
        }
        
        function b(){
         var b = document.frm.del.value;
            var dept = document.getElementById("department").value//department,majortaxtype,majortaxtypecode
                                var nameEx = /^[a-zA-Z ]+$/;
                                var nameEx2 = /^[a-zA-Z0-9 ]+$/;
                                var mtax = document.getElementById("majortaxtype").value;
                                var scod = document.getElementById("majortaxtypecode").value;
                                
                                if (dept=="#") {
                                    alert("Please Select The Department");
                                    document.frm.department.focus();
                                    return false;
                                }
                               else if (mtax=="#") {
                                    alert("Please Select The  Major Tax");
                                    document.frm.majortaxtype.focus();
                                    return false;
                                } else if (scod==null) {
                                    alert("Please Select The Short Code");
                                    document.frm.majortaxtypecode.focus();
                                    return false;
                                }
                                   else if(b=='Delete'){
                                        document.frm.actn.value="del";
                                        document.frm.submit();
                                    }
        }
        function getvalidate()
                            {

                                var dept = document.getElementById("department").value//department,majortaxtype,majortaxtypecode
                                var nameEx = /^[a-zA-Z ]+$/;
                                var nameEx2 = /^[a-zA-Z0-9 ]+$/;
                                var mtax = document.getElementById("majortaxtype").value;
                                var scod = document.getElementById("majortaxtypecode").value;
                                
                                if (dept=="#") {
                                    alert("Please Select The Department");
                                    document.frm.department.focus();
                                    return false;
                                }
                               else if (mtax=="#") {
                                    alert("Please Select The  Major Tax");
                                    document.frm.majortaxtype.focus();
                                    return false;
                                } else if (scod==null) {
                                    alert("Please Select The Short Code");
                                    document.frm.majortaxtypecode.focus();
                                    return false;
                                }
                                else{
                                    cook();
                                }
                               
                               
                            }
        </script>
<%}%>
  </body>
</html>
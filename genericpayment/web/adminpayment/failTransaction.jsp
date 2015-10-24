<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
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
<%  
    ArrayList failList = request.getAttribute("failtransactionreport") != null ? (ArrayList) request.getAttribute("failtransactionreport") : null;
    genericepayadmin.GenericAdminBean gdb = null;
    java.text.DecimalFormat df = new java.text.DecimalFormat("##############.00");
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
 int slno = 1;
%>
<html>
  <head>
	<title>Add id Proof | Payonline Jharkhand</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
          <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >           
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >
  
  </head>
  <body>
    <%@ include file="../assets/metro/__inc/header.jsp"%>
    <div class="container-fluid-full">
        <div class="row-fluid">
        <%@ include file="../assets/metro/__inc/main_menu.jsp"%>
            <div id="content" class="span10">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
			<a href="<%=ccp%>/adminpayment/adminContent.jsp">Home</a>
			<i class="icon-angle-right"></i> 
                    </li>
                    <li>
                        <i class="icon-edit"></i>
			<a href="#">Failed Transactions</a>
                    </li>
		</ul>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2><i class="fa fa-edit"></i><span class="break"></span>Failed Transactions</h2>
                        </div>
                        <div class="box-content">  
                            <form action="<%=ccp%>/GenericAdminServlet"  method="POST" name="frm" class="form-horizontal" onsubmit="return fieldValidation();">
                                   <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                            <input type="hidden" name="step" id="step" value="34">
                                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <tr>
                                        <th>Department</th>
                                        <td><%if(al!=null){
                                            Iterator it=al.iterator();
                                            %>
                                            <select name="department" id="department">
                                            <option value="#">-------SELECT------- </option>
                                            <%
                                            while(it.hasNext()){                          
                                            GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                                            <option value="<%=cfrb.getDeptid()!=null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                                            <%}%>
                            </select>
                        <%}%>
                    </td>
                    <th>PeriodFrom</th>
                    <td>
                        <input type="text" name="periodfrom" id="periodfrom" class="span12" required placeholder="Period From"/>
                    </td>
                    <th>PeriodTo</th>
                    <td>
                        <input type="text" name="periodto" id="periodto" class="span12" required placeholder="Period To"/>
                    </td>
                <td><input type="submit" class="btn btn-primary" value="Submit"></td>
            </tr>
        </table> 
        
                    </form>
                        </div>
                    </div><!--/span-->
                     </div>
                    <%if (failList!=null){%>
                    <div class="">
                     <div class="span12">
                                    <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
                                            <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="">
                                    <input type="hidden" name="chid" id="chid" value="">
                                    <input type="hidden" name="pg" value=""/ >
                                    <table id="printview" class="display">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Challan No</th>
                                                <th>Dealer Name</th>
                                                <th>Address</th>
                                                <th>Mobile</th>
                                                <th>Period From</th>
                                                <th>Period To</th>
                                                <th>Amount</th>
                                                <th>Payment Date</th>
                                            </tr>
                                        </thead>
                                            <tbody>
                                                <%
                                                    Iterator itr = failList.iterator();
                                                    while(itr.hasNext()){
                                                    gdb =(genericepayadmin.GenericAdminBean)itr.next();
                                                %>
                                                <tr>
                                                    <td><%=slno++%></td>
                                                    <td><%=gdb.getChallanno() != null ? gdb.getChallanno() : ""%></td>
                                                    <td><%=gdb.getDlrname() != null ? gdb.getDlrname() : ""%></td>
                                                    <td><%=gdb.getAddress()%>/<%=gdb.getCity()%>/<%=gdb.getState()%></td>
                                                    <td><%=gdb.getMobile()!=null?gdb.getMobile() : ""%></td>
                                                    <td><%=gdb.getPeriodfrom() != null ? sdf.format(gdb.getPeriodfrom()) : ""%></td>
                                                    <td><%=gdb.getPeriodto() != null ? sdf.format(gdb.getPeriodto()) : ""%></td>
                                                    <td><%=gdb.getAmount() != null ? df.format(gdb.getAmount()) : ""%></td>
                                                    <td><%=gdb.getPaymentdate() != null ? sdf.format(gdb.getPaymentdate()) : ""%></td>
                                                </tr>
                                                    <%}%>
                                            <%if(failList.size()==0){%>
                                                <div></div>
                                            <%}%>
                                            </tbody>
                                    </table>
                                </form>
                                </div>
                                </div>
                                <div class="clearfix"></div>
                                <%}%>
               
            </div><!--/.fluid-container-->
        </div><!--/#content.span10-->
    </div><!--/fluid-row-->
    <div class="clearfix"></div>
    <%@ include file="../assets/metro/__inc/footer.jsp"%>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
    
     <script type="text/javascript">
	  $(".container-fluid-full").css("height",$(window).height());
	  $(window).scroll(function() {
	  resizecontainer();
});
	 function resizecontainer(){
	 $(".container-fluid-full").css("height","auto");
	 }
	// $("select").bind("change",resizecontainer);
        $(document).ready(function() {
  // resetHeight();
            $("#periodfrom").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
            $("#periodto").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
       
      $('#printview').DataTable( {
        dom: 'T<"clear">lfrtip',
        tableTools: {
            "sSwfPath": "<%=ccp%>/assets/metro/swf/copy_csv_xls_pdf.swf",
            "aButtons": [
                "csv",
                "xls",
                {
                    "sExtends": "pdf",
                    "sPdfOrientation": "landscape",
                    "sPdfMessage": " "
                }
            ]
        }
    } );
 

});


    </script> 
              <script>
        function fieldValidation(){
			  var name=document.getElementById("department").value;
            if((name == '#')||(name =="")){
                alert("Plz!Enter the Department");
                document.getElementById('department').focus();
                return false;
            }
	}
        </script>
    <%}%>
    
  </body>
</html>
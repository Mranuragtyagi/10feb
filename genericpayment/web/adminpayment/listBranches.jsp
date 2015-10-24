<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
    if(request.getSession().getAttribute("user") == null){
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    }else{
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
        List getbranchlist =  request.getAttribute("getbranchlist")!=null ? (List)request.getAttribute("getbranchlist"): null ;
%>
<html>
    <head>
        <title>Branch-List</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >
    </head>
    <body onload="getState();">
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
                            <a href="#">Branch List</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12" >
                            <div class="box-header" data-original-title>
                                <h2><i class="icon edit"></i><span class="break"></span>Branch List</h2>
                            </div>
                            <div class="box-content">
                                <form class="form-inline" method="post" action="<%=ccp%>/BranchMaster">
                                     <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="2">
                                    <select id="states" name="states"><option value="">-Select State-</option></select>
                                    <select id="departments" name="departments"><option value="">-Select Department-</option></select>
                                    <input type="submit" value="Submit">
                                </form>
                                <table id="printview" class="display">
                                    <thead>      
                                        <tr>
                                            <th>Sl No</th>
                                            <th>Branch Name</th>
                                            <th>Abbrevation</th>
                                            <%--<th>Parent</th>--%>
                                            <th>State</th>
                                            <th>Department</th>
                                            <th>District</th>
                                            <th>PIN Code</th>
                                        </tr>
                                    </thead>
                                    <%
                                        if(getbranchlist!=null && getbranchlist.size()!=0){
                                            int i = 1;
                                            Iterator itr = getbranchlist.iterator();                                            
                                    %>
                                    <tbody>
                                        <%
                                            while(itr.hasNext()){
                                                BranchBean bean = (BranchBean)itr.next();
                                        %>
                                        
                                        <tr>
                                            <td><%=i++%></td>
                                            <td><%=bean.getBranch_name()!=null?bean.getBranch_name():"N/A" %></td> 
                                            <td><%=bean.getBranch_abbrevation()!=null?bean.getBranch_abbrevation():"N/A" %></td> 
                                            <%--<td><%=bean.getParent_name()!=null?bean.getParent_name():"N/A" %></td> --%>
                                            <td><%=bean.getState_name()!=null?bean.getState_name():"N/A" %></td> 
                                            <td><%=bean.getDepartment_name()!=null?bean.getDepartment_name():"N/A" %></td> 
                                            <td><%=bean.getDist_name()!=null?bean.getDist_name():"N/A" %></td> 
                                            <td><%=bean.getPin()!=0 ? bean.getPin():"N/A" %></td> 
                                        </tr> 
                                        <%}%>
                                    </tbody>
                                    <%}%>
                                </table>
                            </div><!--/span-->
                        </div>
                    </div><!--/.fluid-container-->
                </div><!--/#content.span10-->
            </div><!--/fluid-row-->
        </div>
        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>                            
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#printview').DataTable({
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
                });
              
                $.post("<%=ccp%>/JsonService?step=departList", function(data){ 
                        var items = data.list;
                        for (var i = 0; i < items.length; i++) {
                            $("#departments").append("<option value='"+items[i].val+"'>"+items[i].txt+"</option>");                        
                        }
                    },"json"); 
                    });
                       function getState(){
                $.post("<%=ccp%>/JsonService?step=states", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' +items[i].state_code+ '"' + x + '>' + items[i].state_name + '</option>';
                        }
                        $("#states").html(options);
                },"json"); 
            };
            
        </script>
        <%}%>
    </body>
</html>
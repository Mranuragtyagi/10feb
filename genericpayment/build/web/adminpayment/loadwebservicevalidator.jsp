<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="genericepayadmin.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Connection"%>
<%@page import="vicclass.User"%>
<% vicclass.User u = (vicclass.User) request.getSession().getAttribute("user");
    java.sql.Connection con = null;
    con = u.getConnection();%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >
<script type="text/javascript">
    /*function pagination(a){
     var gpag=a;
     frm.method="post";
     frm.action="<%=ccp%>/adminpayment/addIp.jsp?getpagno="+gpag;
     frm.submit();
     alert(gpag);
     }*/
</script>

<form action="" method="post" name="frm" id="frm">   
        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
       
    <table id="celebs" class="table table-condensed">
        <thead>
            <tr>
                <th>Sl No.</th><th>Status</th>  <th>Department Name</th><th>Ip Address</th><th>CheckSum</th>
            </tr>
        </thead>
        <tbody>
            <%

                // Connection con = null;

                con = u.getConnection();
                ArrayList ar = null;
                    ar = AddIpBean.getTreasury(con);        
                //ArrayList ar = AddIpBean.getTreasury(con, start, last);
                Iterator it = ar.iterator();
                int i = 0;
                while (it.hasNext()) {
                    i++;
                    AddIpBean ds1 = (AddIpBean) it.next();
                    String status = ds1.getStatus().equalsIgnoreCase("Y") ? "Active" : "Inactive";

            %>
            <tr>

                <td>
                    <%=i%><span class="hide"><%=ds1.getId()%></span>
                </td>
                <td><%=status%></td>
                <td><%=ds1.getDept_name()%></td>
                <td><%=ds1.getIpaddress()%></td>
                <td><%=ds1.getChecksum()%></td>

                <%}%>
                <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>                            
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
  <script type="text/javascript">

$(document).ready(function() {
      $('#celebs').DataTable( {
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
 
} );
    </script>
        </tbody>

    </table>
</form>

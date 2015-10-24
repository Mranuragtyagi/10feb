
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
    System.out.println("MSG :" + request.getParameter("msg"));
%>
	
    
                            <table class="table table-striped table-condensed">

                                <tr>
                                    <th>1. Saving Configuration file</th>
                                    <td><div id="db_1"><img src="assets/metro/img/d_process.gif"></div></td>
                                </tr>
                                <tr>
                                    <th>2. Checking Mysql Connection</th>
                                    <td><div id="db_2"><img src="assets/metro/img/d_process.gif" ></div></td>
                                </tr>
                                <tr>
                                    <th>3. Creating New Database</th>
                                    <td><div id="db_3"><img src="assets/metro/img/d_process.gif" ></div></td>
                                </tr>
                                <tr>
                                    <th>4. Creating Tables</th>
                                    <td><div id="db_4"><img src="assets/metro/img/d_process.gif" ></div></td>
                                </tr>
                               
                            </table>
<br><br><br>
                            <div class="pull-right"><div id="d_res"></div></div>

       <div id="d_p" class="hide">
        <img src="assets/metro/img/d_process.gif" width="30" height="30" border="0" >
    </div>
    <div id="d_ok" class="hide">
        <img src="assets/metro/img/ok.png" width="30" height="30" border="0" >
    </div>
    <div id="d_no" class="hide">
        <img src="assets/metro/img/no.png" width="30" height="30" border="0" >
    </div>

    <div id="d_home" class="hide">
        <a href="<%=ccp%>/GenericLogin"><font color="Black" size="5">Home</font></a>
    </div>

    <div id="d_back" style="visibility:hidden">
        <a href="<%=ccp%>/install.jsp"><font class="btn btn-primary" size="5">Back</font></a>
    </div> 
     <div id="d_next" class="hide">
        <a href="#" onClick="step3();"><font class="btn btn-primary" size="5">Next</font></a>
    </div>
     <div id="d_success" class="hide">
     	<div class="alert alert-success">Database Installed Successfully. Click on Home button and Enjoy Payonline.</div>
       <div class="text-center span12"> <a href="<%=ccp%>/GenericLogin" class="btn btn-primary">Home</a></a>
    </div>
<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
jQuery(document).ready(function () {

        setTimeout("testcon();", 3000);

    });
function step3(){
	$("#db_install").removeClass('bg-btn');
    $("#db_install").addClass('install_success');
    $("#db_success").addClass('install_success');
	$('#install_container').html($('#d_success').html());
}
    function testcon()
    {

        var fg = "<%= request.getParameter("msg").equals("OK") ? "d_ok" : "d_no"%>";
        $("#db_1").html($("#<%= request.getParameter("msg").equals("OK") ? "d_ok" : "d_no"%>").html());
        if (fg == 'd_ok')
        {
            $.ajax({
                type: "GET",
                url: "<%=ccp%>/DBProp?step=conn",
            }).done(function (msg) {

                if (msg == 'OK')
                {

                    $("#db_2").delay(3000).html($("#d_ok").html());

                    $.ajax({
                        type: "GET",
                        url: "<%=ccp%>/DBProp?step=dbs",
                    }).done(function (msg) {

                        if (msg == 'OK')
                        {
                            $("#db_3").delay(3000).html($("#d_ok").html());

                            $.ajax({
                                type: "GET",
                                url: "<%=ccp%>/DBProp?step=tabs"
                            }).done(function (msg) {

                                if (msg == 'OK')
                                {
                                    $("#db_4").delay(3000).html($("#d_ok").html());
                                    $("#d_res").delay(3000).html($("#d_next").html());
                                }
                                else
                                {
                                    $("#d_error").delay(1000).html(msg);
                                    $("#d_res").delay(3000).html($("#d_back").html());
                                    $("#db_4").delay(3000).html($("#d_no").html());
                                }


                            });

                        }
                        else
                        {
                            $("#d_error").delay(1000).html(msg);
                            $("#db_3").delay(3000).html($("#d_no").html());
                            $("#db_4").delay(1000).html($("#d_no").html());
                            $("#d_res").delay(3000).html($("#d_back").html());
                        }

                    });



                }
                else
                {
                    $("#db_2").delay(3000).html($("#d_no").html());
                    $("#d_error").delay(1000).html(msg);
                    $("#db_3").delay(1000).html($("#d_no").html());
                    $("#db_4").delay(1000).html($("#d_no").html());
                    $("#d_res").delay(3000).html($("#d_back").html());
                }

            });


        }
        else
        {

            $("#db_2").delay(3000).html($("#d_no").html());
            $("#db_3").delay(1000).html($("#d_no").html());
            $("#db_4").delay(1000).html($("#d_no").html());
            $("#d_res").delay(3000).html($("#d_back").html());
        }
    }
</script>
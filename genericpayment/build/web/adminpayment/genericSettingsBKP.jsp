<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<% String msg = request.getParameter("msg");%>
<html lang="en">
    <%@ page import="java.util.*,genericepayadmin.* " %>
    <%
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
        } else {
            String msg1 = StringEscapeUtils.escapeHtml(request.getParameter("msg"));
            //String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
            GenericSettingBean sbean = request.getAttribute("sbean") != null ? (GenericSettingBean) request.getAttribute("sbean") : new GenericSettingBean();
            GenericSettingBean mailbean = request.getAttribute("mailbean") != null ? (GenericSettingBean) request.getAttribute("mailbean") : new GenericSettingBean();
            GenericSettingBean bannerbean = request.getAttribute("bannerbean") != null ? (GenericSettingBean) request.getAttribute("bannerbean") : new GenericSettingBean();
            GenericSettingBean gb = request.getAttribute("billdeskbean") != null ? (GenericSettingBean) request.getAttribute("billdeskbean") : new GenericSettingBean();
             GenericSettingBean msgtmplte = request.getAttribute("msgtemplt") != null ? (GenericSettingBean) request.getAttribute("msgtemplt") : new GenericSettingBean();
            String update = "Update";
            String save = "Save";
    %>
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
            <%@ include file="../assets/metro/__inc/base_links.jsp"%>
            <title>Setting Page | Payonline Jharkhand</title>        

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
                                <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a>
                                <i class="icon-angle-right"></i> 
                            </li>
                            <li>
                                <i class="icon-edit"></i>
                                <a href="#">Settings</a>
                            </li>
                        </ul>
                        <div class="row-fluid sortable">

                            <div class="box span12">
                                <div class="box-header" data-original-title>
                                    <h2><i class="icon-edit"></i><span class="break"></span>General Settings</h2>

                                </div>

                                <div class="box-content">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#sectionA"><i class="icon-edit"></i><span class="break"></span>General</a></li>
                                        <li>
                                            <a data-toggle="tab" href="#sectionC"><i class="fa fa-picture-o"></i>
                                                <span class="break"></span>Banner</a></li>
                                        <li>
                                            <a data-toggle="tab" href="#sectionB"><i class="fa fa-mobile"></i>
                                                <span class="break"></span>SMS</a></li>
                                        <li><a data-toggle="tab" href="#sectionD"><i class="fa fa-at"></i>
                                                <span class="break"></span>Email</a></li>   
                                        <li><a data-toggle="tab" href="#sectionE"><i class=""></i>
                                                <span class="break"></span>Billdesk</a></li>
                                        <li><a data-toggle="tab" href="#sectionF"><i class=""></i>
                                                <span class="break"></span>Message</a></li>
                                    </ul>
                                    <div class="tab-content span11">
                                        <div id="sectionA" class="row-fluid tab-pane fade in active">
                                            <form id="generalsetting" name="generalsetting" method="post" action="" class="form-horizontal">     
                                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                <input type="hidden" name="step" id="step" />
                                                <fieldset>
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th align="left" colspan="2" style="background-color:#E0E0E0;">
                                                                    Settings are mainly for general from and to the application.
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Logo:</th>
                                                                <td>
                                                                    <input type="file" id="logo" name="logo" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Banner:</th>
                                                                <td>
                                                                    <input type="file" id="banner" name="banner" />
                                                                </td>
                                                            </tr>    
                                                            <tr>
                                                                <th align="left" colspan="2"><br></br>
                                                                    <input type="button" class="btn btn-primary"  id="save" name="save" value="Upload" onclick="submitSetting('upload');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                 
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form>
                                        </div>

                                        <div id="sectionB" class="row-fluid tab-pane fade">                                
                                            <form id="smssetting" name="smssetting" method="" action="" class="form-horizontal"> 
                                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                <input type="hidden" name="step" id="step" />
                                                <fieldset>                                
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th align="left" colspan="2" style="background-color:#E0E0E0;">
                                                                    Settings are mainly for sms from the application.
                                                                </th>
                                                            </tr>                                        
                                                            <tr>
                                                                <th align="left">SMS Provider Name:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Provider Name" id="smsprovidername" name="smsprovidername" value="<%= sbean.getPROVIDER_NAME() != null ? sbean.getPROVIDER_NAME() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">SMS Sender Id:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Sender Id" id="smssenderid" name="smssenderid" value="<%= sbean.getSENDER_ID() != null ? sbean.getSENDER_ID() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Host Url:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Host Url" id="smshosturl" name="smshosturl" value="<%= sbean.getHOST_URL() != null ? sbean.getHOST_URL() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">SMS Port:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="SMS Port" id="smsport" name="smsport" value="<%= sbean.getHOST_PORT() != 0 ? sbean.getHOST_PORT() : 0%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Username:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Username" id="smsusername" name="smsusername" value="<%= sbean.getSMS_USERNAME() != null ? sbean.getSMS_USERNAME() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Password:</th>
                                                                <td>
                                                                    <input type="password" class="form-control" placeholder="Password" id="smspassword" name="smspassword" value="<%= sbean.getSMS_PASSWORD() != null ? sbean.getSMS_PASSWORD() : ""%>" />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <th align="left" colspan="2"><br></br>                                            
                                                                    <input type="button" class="btn btn-primary"  id="save" name="save" value="<%= sbean.getSMS_ID() != 0 ? update : save%> " onclick="submitSetting('sms');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                    <input type="reset" class="btn btn-default"  id="reset" name="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>                        
                                            </form>
                                        </div>


                                        <div id="sectionC" class="row-fluid tab-pane fade">
                                            <form id="bannersetting" name="bannersetting" method="post" action="" class="form-horizontal">   
                                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                <input type="hidden" name="step" id="step" />
                                                <fieldset>                                
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th align="left" colspan="2" style="background-color:#E0E0E0;">
                                                                    Settings are mainly for banner in application.
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Banner Content1</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Banner Content 1" id="banner1" name="banner1" value="<%=bannerbean.getContent1() != null ? bannerbean.getContent1() : ""%>"/>
                                                                </td>
                                                            </tr>  
                                                            <tr>
                                                                <th align="left">Banner Content2</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Banner Content 2" id="banner2" name="banner2" value="<%=bannerbean.getContent2() != null ? bannerbean.getContent2() : ""%>" />
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <th align="left">Copyright</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Copyright" id="copyright" name="copyright" value="<%=bannerbean.getCopyright() != null ? bannerbean.getCopyright() : ""%>" />
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <th align="left">Version</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Version" id="version" name="version" value="<%=bannerbean.getVersion() != null ? bannerbean.getVersion() : ""%>" />
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <th align="left">Terms</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Terms" id="terms" name="terms" value="<%=bannerbean.getTerms() != null ? bannerbean.getTerms() : ""%>" />
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <th align="left">Contact us</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Contact us" id="contact" name="contact" value="<%=bannerbean.getContactus() != null ? bannerbean.getContactus() : ""%>" />
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <th align="left" colspan="2"><br></br>
                                                                    <input type="button" class="btn btn-primary"  id="save" name="save" value="<%= bannerbean.getContent_id() != 0 ? update : save%> " onclick="submitSetting('banner');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                    <input type="reset" class="btn btn-default"  id="reset" name="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                    
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form>
                                        </div>
                                        <!--   Billdesk Setting-->
                                        <div id="sectionE" class="row-fluid tab-pane fade">
                                            <form id="billdesksetting" name="billdesksetting" method="post" action="" class="form-horizontal">    
                                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                <input type="hidden" name="step" id="step" />
                                                <fieldset>                                
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th>Checksum</th>
                                                                <td><input type="text" name="chksum" value="<%=gb.getBilldeskchksum() != null ? gb.getBilldeskchksum() : ""%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Billdesk Url</th>
                                                                <td><input type="text" name="url" value="<%=gb.getBilldeskurl() != null ? gb.getBilldeskurl() : ""%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Merchant ID</th>
                                                                <td><input type="text" name="merchantid" value="<%=gb.getMerchantid() != null ? gb.getMerchantid() : ""%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Security ID</th>
                                                                <td><input type="text" name="securityid" value="<%=gb.getSecurityid() != null ? gb.getSecurityid() : ""%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Response Url</th>
                                                                <td><input type="text" name="responseurl" value="<%=gb.getResponseurl() != null ? gb.getResponseurl() : ""%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left" colspan="2"><br></br>
                                                                    <input type="button" class="btn btn-primary"  id="save" name="save" value="<%= gb.getGeneric_id() != 0 ? update : save%> " onclick="submitSetting('billdesk');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                    <input type="reset" class="btn btn-default"  id="reset" name="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                    
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form>
                                        </div>

                                        <!--   Messages Setting-->
                                        <div id="sectionF" class="row-fluid tab-pane fade">
                                            <form id="mesageSeting" name="mesageSeting" method="post" action="" class="form-horizontal">     
                                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                <input type="hidden" name="step" id="step" />
                                                <fieldset>                                
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                             <tr>
                                                                <th>Sms Template</th>
                                                                <td><input name="mesages" value="<%=msgtmplte.getTempmsg() !=null?msgtmplte.getTempmsg():""%>"></input></td>
                                                            </tr>
                                                             <tr>
                                                                <th>Email Template</th>
                                                                <td><input name="emlmesages" value="<%=msgtmplte.getTempmail() !=null?msgtmplte.getTempmail():""%>"></input></td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <th align="left" colspan="2"><br></br>
                                                                     <input type="button" class="btn btn-primary"  id="save" name="save" value="<%= msgtmplte.getTempid() != "" ? update : save%> " onclick="submitSetting('mesages');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                    <input type="reset" class="btn btn-default"  id="reset" name="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                    
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form>
                                        </div>

                                        <div id="sectionD" class="row-fluid tab-pane fade">                    
                                            <form name="mailsetting" id="mailsetting" method="post" action="" class="form-horizontal">
                                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                <input type="hidden" name="step" id="step" />
                                                <fieldset>
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th align="left" colspan="2" style="background-color:#E0E0E0;">
                                                                    Settings are mainly to send email.
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Email Address:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Email Address" id="emailadds" name="emailadds" value="<%=mailbean.getEMAIL_ADDRESS() != null ? mailbean.getEMAIL_ADDRESS() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Mail Server:</th>
                                                                <td>
                                                                    <input type="text" class="form-control" placeholder="Mail Server" id="mailserver" name="mailserver" value="<%=mailbean.getMAIL_SERVER() != null ? mailbean.getMAIL_SERVER() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Username:</th>
                                                                <td>
                                                                    <input id="emailusername" class="form-control" placeholder="Username" name="emailusername" type="text" value="<%=mailbean.getEMAIL_USERNAME() != null ? mailbean.getEMAIL_USERNAME() : ""%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left">Password:</th>
                                                                <td>
                                                                    <input id="emailpassword" class="form-control" placeholder="Password" name="emailpassword" type="password" value="<%=mailbean.getEMAIL_PASSWORD() != null ? mailbean.getEMAIL_PASSWORD() : ""%>" />
                                                                </td>
                                                            </tr>                                            
                                                            <tr>
                                                                <th align="left">SMTP Port:</th>
                                                                <td>
                                                                    <input id="mailsmtpportt" class="form-control" placeholder="SMTP Port" name="mailsmtpport" type="text" value="<%=mailbean.getSMTP_PORT() != 0 ? mailbean.getSMTP_PORT() : 0%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th align="left" colspan="2"><br></br>
                                                                    <input type="button" class="btn btn-primary"  id="save" name="save" value="<%= mailbean.getEMAIL_ID() != 0 ? update : save%> " onclick="submitSetting('email');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                    <input type="reset" class="btn btn-default"  id="reset" name="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                    
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form>
                                        </div>                            
                                    </div>

                                </div>










                            </div>
                        </div><!--/span-->

                    </div>


                </div><!--/.fluid-container-->

                <!-- end: Content -->
            </div><!--/#content.span10-->
        </div><!--/fluid-row-->



        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>
        <!-- start: JavaScript-->
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>

        <script type="text/javascript">
                                                    function submitSetting(step) {
                                                        if (step == "sms") {
                                                            document.smssetting.step.value = step;
                                                            document.smssetting.method = 'POST';
                                                            document.smssetting.action = '<%=ccp%>/genericsettings';
                                                            document.smssetting.submit();
                                                        } else if (step == "email") {
                                                            document.mailsetting.step.value = step;
                                                            document.mailsetting.method = 'POST';
                                                            document.mailsetting.action = '<%=ccp%>/genericsettings';
                                                            document.mailsetting.submit();
                                                        } else if (step == "upload") {
                                                            document.generalsetting.step.value = step;
                                                            document.generalsetting.method = 'POST';
                                                            document.generalsetting.enctype = "multipart/form-data",
                                                                    document.generalsetting.action = '<%=ccp%>/genericsettings';
                                                            document.generalsetting.submit();
                                                        } else if (step == "banner") {
                                                            document.bannersetting.step.value = step;
                                                            document.bannersetting.method = 'POST';
                                                            document.bannersetting.action = '<%=ccp%>/genericsettings';
                                                            document.bannersetting.submit();
                                                        } else if (step == "billdesk") {
                                                            document.billdesksetting.step.value = step;
                                                            document.billdesksetting.method = 'POST';
                                                            document.billdesksetting.action = '<%=ccp%>/genericsettings';
                                                            document.billdesksetting.submit();
                                                        }else if (step == "mesages") {
                                                            var mesages = document.mesageSeting.mesages;
                                                            var emlmesages = document.mesageSeting.emlmesages;
                                                            if (mesages.value == "") {
                                                                 document.mesageSeting.mesages.focus();
                                                                alert("Please!Enter your Sms Template.");
                                                            } else if (emlmesages.value == "") {
                                                                alert("Please! Enter a Mail Template.");
                                                                document.mesageSeting.emlmesages.focus();
                                                            } else {
                                                               
                                                            document.mesageSeting.step.value = step;
                                                            document.mesageSeting.method = 'POST';
                                                            document.mesageSeting.action = '<%=ccp%>/genericsettings';
                                                            document.mesageSeting.submit();
                                                        }
                                                           //end of loginUser
                                                        }

                                                    }
        </script>

        <!-- end: JavaScript-->
        <%}%>
    </body> 
</html> 
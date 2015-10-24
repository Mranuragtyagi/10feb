<!DOCTYPE html>
<%
    String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="java.util.*,genericepayment.*,java.sql.*,vicclass.* " errorPage="/error.jsp"%>

<%if (request.getSession().getAttribute("userloggedin") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {%>

<%
    String regusermesg = request.getAttribute("regusermesg") != null ? (String) request.getAttribute("regusermesg") : "";
    String treasurymsg = request.getParameter("treasurymsg") != null ? request.getParameter("treasurymsg") : "";

    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
    GenericBean cfrb = new GenericBean();
    GenericBean signupbean = (GenericBean) request.getSession().getAttribute("signupbean");
    java.text.DecimalFormat df = new java.text.DecimalFormat("################.00");
    String b = "";
    String depid = "";
    String statn = "";
    GenericBean gbean = request.getAttribute("genericbean") != null ? (GenericBean) request.getAttribute("genericbean") : new GenericBean();
    if (gbean != null) {
        String addr = gbean.getAddress();
        b = gbean.getPeriodtype().equals("") ? "" : gbean.getPeriodtype();
        depid = gbean.getDepartmentid() == null ? "" : gbean.getDepartmentid();
        statn = gbean.getStatecode() != null ? gbean.getStatecode() : "";
    }
    User u = new User();
    Connection con = null;
    // department sql query
    String sql = "select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
    java.sql.PreparedStatement stmt = null;
    u.createConnection();
    con = u.getConnection();
    ArrayList al = new ArrayList();
    java.sql.ResultSet rs = null;
    try {
        stmt = con.prepareStatement(sql);
        stmt.setString(1, "A");
        rs = stmt.executeQuery();
        while (rs.next()) {
            GenericBean genericbean = new GenericBean();
            genericbean.setDepartmentname(rs.getString("DEPT_NAME"));
            genericbean.setDepartmentid(rs.getString("DEPT_ID"));
            al.add(genericbean);
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

%>
<%GenericBean gbdept = new GenericBean();%>
<html lang="en">
    <head>
        <%@ include file="../assets/metro/__inc/base_links_payment_page.jsp"%>
        <link rel="stylesheet" type="text/css" href="../assets/metro/css/jquery-ui.css" > 
        <link id="base-style-responsive" href="../assets/metro/css/cmxform.css" rel="stylesheet">
    </head>
    <body>

        <!-- start: Header -->
        <%@ include file="../assets/metro/__inc/user_header.jsp"%>
        <!-- start: Header -->

        <div class="container-fluid-alok">
            <div class="row-fluid"> 

                <!-- start: Main Menu -->
                <%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
                <!-- end: Main Menu --> 

                <!-- start: Content -->
                <div id="content" class="span10">
                    <div class="row-fluid sortable">

                        <!-- USER DETAILS END-->
                        <form  action="confirmpayment.jsp " method="post" name="frm" id="frm">
                            <div class="Buy-cont-wrap" id="tax_info" style=" min-height:657px !important;">
                                <div class="span12 hide480">
                                    <div class="tabs-outer" >
                                        <div class="tabs-cont delivery-modes-tab tab-active" >
                                            <div class="tabs-payment"></div>
                                            <div align="center"> Tax Info</div>
                                        </div>
                                        <div class="tabs-cont order-summary-tab tab-disabled" style="">
                                            <div class="tabs-confirm"></div>
                                            <div align="center">Verify</div>
                                        </div>
                                        <div class="tabs-cont payment-tab tab-disabled" >
                                            <div class="tabs-complete"></div>
                                            <div align="center">Payment</div>
                                        </div>
                                    </div>
                                </div>
                                <div><font color="Red"><%=regusermesg%></font></div>
                                <div><font color="Red"><%=treasurymsg%></font></div>
                                <div class="span12">

                                    <br />
                                    <div class="span12" style="margin-top:1%;" >
                                        <div class="row-fluid">
                                            <div class="span3 span6-pa" >
                                                <ul class="nav nav-list bs-docs-sidenav">
                                                    <input type="hidden" name="step" id="step" value="5">
                                                    <input type="hidden" name="name" id="name" readonly value="<%=signupbean.getDlrname() != null ? signupbean.getDlrname() : ""%>">
                                                    <input type="hidden" name="address" id="address" readonly value="<%=signupbean.getAddress() != null ? signupbean.getAddress() : ""%>">
                                                    <input type="hidden" name="city" id="city" readonly  value="<%=signupbean.getCity() != null ? signupbean.getCity() : ""%>">
                                                    <input type="hidden" name="state" id="state" readonly value="<%=signupbean.getState() != null ? signupbean.getState() : ""%>">
                                                    <input type="hidden" name="pincode" id="pincode"  readonly="readonly" value="<%=signupbean.getPincode() != null ? signupbean.getPincode() : ""%>">
                                                    <input type="hidden" name="mobile" id="mobile" readonly value="<%=signupbean.getMobile() != null ? signupbean.getMobile() : ""%>">
                                                    <input type="hidden" name="email" id="email" readonly value="<%=signupbean.getEmail() != null ? signupbean.getEmail() : ""%>">
                                                    <input type="hidden" name="citycode" id="citycode" readonly value="<%=signupbean.getCitycode() != null ? signupbean.getCitycode() : ""%>">
                                                    <input type="hidden" name="statecode" id="statecode" readonly value="<%=signupbean.getStatecode() != null ? signupbean.getStatecode() : ""%>">
                                                    <li style="padding:10px;"><strong><%=signupbean.getDlrname() != null ? signupbean.getDlrname() : ""%></strong><br />
                                                            <%=signupbean.getAddress() != null ? signupbean.getAddress() : ""%><br />
                                                            <%=signupbean.getCity() != null ? signupbean.getCity() : ""%><br />
                                                            <%=signupbean.getState() != null ? signupbean.getState() : ""%><br />
                                                            Pin : <%=signupbean.getPincode() != null ? signupbean.getPincode() : ""%><br />
                                                            Mo. : <%=signupbean.getMobile() != null ? signupbean.getMobile() : ""%><br />
                                                            E-mail : <%=signupbean.getEmail() != null ? signupbean.getEmail() : ""%></li>
                                                </ul>
                                            </div>
                                            <div class="span4 span6-pa"> 
                                                <label class="lb1">Department<span style="color:#F00;">* </span></label>
                                                <%if (al != null) {
                                                        Iterator it = al.iterator();
                                                %>
                                                <select name="department" id="department" class="span12" onchange="getPurpose();getTaxtype();getLocation();" >
                                                    <option selected="selected" value="depart">-----SELECT-----</option>
                                                    <%
                                                        while (it.hasNext()) {
                                                            cfrb = (GenericBean) it.next();
                                                    %>
                                                    <option value="<%=cfrb.getDepartmentname()%>"> <%=cfrb.getDepartmentname() != null ? cfrb.getDepartmentname() : ""%> </option>
                                                    <%}%>
                                                </select>
                                                <%}%>
                                                <label class="lb1">Identity Proof:<span style="color:#F00;">* </span></label>
                                                <div id="myscript"> </div>
                                                <select name="taxid"  id="taxid" class="span12">
                                                    <option value="#">-------SELECT------- </option>
                                                </select>
                                                <div id="taxshow">
                                                    <input type="text" name="taxidval" class="span12" id="taxidval" />
                                                </div>
                                                <label class="lb1">Tax Type/Purpose <span style="color:#F00;">* </span></label>
                                                <div id="myscript"> </div>
                                                <select name="purpose"  id="purpose" class="span12" onchange="getSubTax();">
                                                    <option value="#">-------SELECT------- </option>
                                                </select>
                                                <label class="lb1">Sub Tax Type <span style="color:#F00;">* </span></label>
                                                <div id="myscript"></div>
                                                <select name="subtax"  id="subtax" class="span12" onChange="show_purpose();divShow();">
                                                    <option value="#">-------SELECT------- </option>
                                                </select>
                                                <input class="span6" type="hidden" readonly name="treasuryhead" id="treasuryhead" />
                                                <label class="lb1">Branch Location <span style="color:#F00;">* </span></label>
                                                <div id="myscript"> </div>
                                                <select name="location"  id="location" class="span12" >
                                                    <option value="#">-------SELECT------- </option>
                                                </select>
                                                <label class="lb1">Type of Period <span style="color:#F00;">* </span></label>
                                                <select name="taxperiod" id="taxperiod" class="span12">
                                                    <option selected="selected" value="tax_period">-Select Period-</option>
                                                    <option value="a">Annual</option>
                                                    <option value="q">Quarterly</option>
                                                    <option value="m">Monthly</option>
                                                    <option value="s">Specific Period</option>
                                                    <option value="n">Not Required</option>
                                                </select>
                                                <label class="lb1">Description:<span style="color:#F00;">* </span></label>
                                                <textarea style="resize:none; " cols="15" rows="3"  name="description" class="span12"  id="description"></textarea>
                                            </div>
                                            <div class="span5 span6-pa">
                                                <div id="annual_form">
                                                    <label class="lb1">Period (year)<span style="color:#F00;">* </span></label>
                                                   <%-- <select name="finalayear" id="finalayear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="2010">2010-2011</option>
                                                        <option value="2011">2011-2012</option>
                                                        <option value="2012">2012-2013</option>
                                                        <option value="2013">2013-2014</option>
                                                        <option value="2014">2014-2015</option>
                                                        <option value="2015">2015-2016</option>
                                                    </select>--%>
                                                    <select name="finalayear" id="finalayear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                           <option value="#">-select-</option> 
                                                    </select>
                                                </div>
                                                <div id="quarter_form">
                                                    <label class="lb1">Period (year)<span style="color:#F00;">* </span></label>
                                                    <%--<select name="finalqyear" id="finalqyear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="2010">2010</option>
                                                        <option value="2011">2011</option>
                                                        <option value="2012">2012</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2015">2015</option>
                                                    </select>--%>
                                                     <select name="finalqyear" id="finalqyear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                           <option value="#">-select-</option> 
                                                    </select>
                                                    <label class="lb1">Quarter<span style="color:#F00;">* </span></label>
                                                    <select name="quarter" class="span10" id="quarter">
                                                        <option value="2">April - June</option>
                                                        <option value="3">July - September</option>
                                                        <option value="4">October - December</option>
                                                        <option value="1">January - March</option>
                                                    </select>
                                                </div>
                                                <div id="monthly_form">
                                                    <label class="lb1">Period (year)<span style="color:#F00;">* </span></label>
                                                    <%--<select name="finalmyear" id="finalmyear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="2010">2010</option>
                                                        <option value="2011">2011</option>
                                                        <option value="2012">2012</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2015">2015</option>
                                                    </select>--%>
                                                    <select name="finalmyear" id="finalmyear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                          <option value="#">-select-</option> 
                                                    </select>
                                                    <label class="lb1">Month<span style="color:#F00;">* </span></label>
                                                    <select name="month" class="span10" id="month">
                                                        <option value="1">January</option>
                                                        <option value="2">February</option>
                                                        <option value="3">March</option>
                                                        <option value="4">April</option>
                                                        <option value="5">May</option>
                                                        <option value="6">June</option>
                                                        <option value="7">July</option>
                                                        <option value="8">August</option>
                                                        <option value="9">September</option>
                                                        <option value="10">October</option>
                                                        <option value="11">November</option>
                                                        <option value="12">December</option>
                                                    </select>
                                                </div>
                                                <div id="specific_form">
                                                    <label class="lb1"> From Date <span style="color:#F00;">* </span></label>
                                                    <input type="text" class="span10" name="fromdate" id="fromdate" maxlength="10"/>
                                                    <label class="lb1">To Date<span style="color:#F00;">* </span></label>
                                                    <input type="text" name="todate" class="span10" id="todate" onBlur="CompareDates();" maxlength="10"/>
                                                </div>
                                                <label class="lb1">Amount<span style="color:#F00;">* </span></label>
                                                <input type="text" class="span10" name="amount" id="amount" maxlength="20" onblur="totalTest();"/>
                                                <label class="lb1"> Interest <span style="color:#F00;"> </span></label>
                                                <input type="text" class="span10"  name="interest" id="interest" maxlength="20" onblur="totalTest();"/>
                                                <label class="lb1"> Penalty <span style="color:#F00;"></span></label>
                                                <input type="text" class="span10"  name="penalty" id="penalty" maxlength="20" onblur="totalTest();"/>
                                                <label class="lb1"> Others Fee <span style="color:#F00;"></span></label>
                                                <input type="text" class="span10" name="misc" id="misc" maxlength="20" onblur="totalTest();"/>
                                                <% java.util.Date date = new java.util.Date();%>
                                                <input type="hidden" name="currentdate" id="currentdate" value="<%=sdf.format(date)%>" />
                                                <label class="lb1">Grand Total<span style="color:#F00;"> </span></label>
                                                <input type="text" class="span10" name="grandtotal" id="grandtotal" readonly/>
                                            </div>
                                        </div>
                                        <div align="center">
                                            <button type="button" class="btn btn-warning" value="Next" onClick="fieldValidation_tax_info();" > &nbsp;&nbsp;Next&nbsp;&nbsp; </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="Buy-cont-wrap" id="verify">
                                <div class="span12 hide480">
                                    <div class="tabs-outer" >
                                        <div class="tabs-cont delivery-modes-tab tab-disabled" >
                                            <div class="tabs-payment"></div>
                                            <div align="center"> Tax Info</div>
                                        </div>
                                        <div class="tabs-cont order-summary-tab tab-active" id="step3"
                                             style="">
                                            <div class="tabs-confirm"></div>
                                            <div align="center">Verify</div>
                                        </div>
                                        <div class="tabs-cont payment-tab tab-disabled" id="step4">
                                            <div class="tabs-complete"></div>
                                            <div align="center">Payment</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="span12">
                                    <br />
                                    <div class="span12" style="margin-top:1%;" >
                                        <div class="row-fluid">
                                            <div class="span12" id="verify_page_data">
                                                <div class="span4 font14">&nbsp;&nbsp;&nbsp;Tax Type/Purpose : <span id="purpose_data"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="span4 font14 text-right">Department : <span id="department_data"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="span4 font14 text-right" id="challan_id"> </div>
                                                <table class="tableform table-striped table-hover" width="90%" style="margin-left:10px;">
                                                    <tr>
                                                        <td class="lb1"><strong>Payment Detail</strong></td>
                                                        <td class="lb1"><strong>Amount</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="60px"><div class="lb1"><span id="purpose_data1"></span> Payable For Period <span id="quarter_month_data" style="color:#666; font-weight:bold;"></span> <span id="period_data" style="color:#666; font-weight:bold;"></span> </div>
                                                            <span class="font12 lb1">Description : </span><span id="desc_data"></span></td>
                                                        <td colspan="2">Rs. <span id="amount_data1" style="color:#666; font-weight:bold;"></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lb1">Payable Amount</td>
                                                        <td style="font-weight:bolder;">Rs. <span id="amount_data2" class="font16"></span></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="span12" id="sending_img" align="center"><img src="../assets/metro/images/sending.gif"  /></div>
                                            <div class="span12"></div>
                                            <div class="span12">
                                                <div class="span3">
                                                    <ul class="nav nav-list bs-docs-sidenav BG_F5" style="margin-top:0px;">
                                                        <li> <a href="#"><Strong><span id="taxid1"></span></strong> <span id="taxidval1"></span> <br/>
                                                                <strong><%=signupbean.getDlrname() != null ? signupbean.getDlrname() : ""%></strong><br />
                                                                <%=signupbean.getAddress() != null ? signupbean.getAddress() : ""%><br />
                                                                <%=signupbean.getCity() != null ? signupbean.getCity() : ""%><br />
                                                                <%=signupbean.getState() != null ? signupbean.getState() : ""%><br />
                                                                Pin : <%=signupbean.getPincode() != null ? signupbean.getPincode() : ""%><br />
                                                                Mo. : <%=signupbean.getMobile() != null ? signupbean.getMobile() : ""%><br />
                                                                E-mail : <%=signupbean.getEmail() != null ? signupbean.getEmail() : ""%> </a> </li>
                                                    </ul>
                                                     <div id="chalnmsg"><font style="color: red">Note:- Please Note Down The Challan Id Properly For Further Refrence.If Amount is Debited From Your a/c While Payment,Please Do Not Make The Same Payment Again As The Status Will be Updated Within 48 Hours.
                                                        </font></div>
                                                </div>
              
                                                <div class="span5"> </div>
                                                <div class="span3"> <br />
                                                    <br />
                                                    <br />
                                                    <div align="center" id="verifybutton">
                                                        <button type="button" class="btn  btn-info" value="Back" onClick="tax_info();" > &nbsp;&nbsp;Back&nbsp;&nbsp; </button>
                                                        <button type="button" class="btn  btn-warning" value="Next" onClick="postdata();" > &nbsp;&nbsp;Verify&nbsp;&nbsp; </button>
                                                    </div>
                                                    <div align="center" id="processtopay">
                                                        <input type="submit" class="btn btn-warning bold" value="Proceed to Pay" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- span12 closed -->

        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>

        <!-- start: JavaScript--> 

        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 

        <!--container div closed--> 


        <script type="text/javascript">
                                function totalTest() {
                                    var frm = document.frm;
                                    var a = 0, b = 0, c = 0, d = 0, e = 0;

                                    if (frm.amount.value != 0) {
                                        a = parseFloat(frm.amount.value);
                                    }

                                    if (frm.interest.value != 0) {
                                        b = parseFloat(frm.interest.value);
                                    }
                                    if (frm.penalty.value != 0) {
                                        c = parseFloat(frm.penalty.value);
                                    }

                                    if (frm.misc.value != 0) {
                                        d = parseFloat(frm.misc.value);
                                    }
                                    var total = a + b + c + d;
                                    var totalfix = total.toFixed(2);
                                    frm.grandtotal.value = totalfix;

                                }






                                function clickIE4() {
                                    if (event.button == 2) {
                                        return false;
                                    }
                                }
                                function clickNS4(e) {
                                    if (document.layers || document.getElementById && !document.all) {
                                        if (e.which == 2 || e.which == 3) {
                                            return false;
                                        }
                                    }
                                }
                                if (document.layers) {
                                    document.captureEvents(Event.MOUSEDOWN);
                                    document.onmousedown = clickNS4;
                                } else if (document.all && !document.getElementById) {
                                    document.onmousedown = clickIE4;
                                }
                                document.oncontextmenu = new Function("return false")
                                function CompareDates() {
                                    var str1 = document.getElementById("fromdate").value;
                                    var str2 = document.getElementById("todate").value;
                                    var dt1 = parseInt(str1.substring(0, 2), 10);
                                    var mon1 = parseInt(str1.substring(3, 5), 10);
                                    var yr1 = parseInt(str1.substring(6, 10), 10);
                                    var dt2 = parseInt(str2.substring(0, 2), 10);
                                    var mon2 = parseInt(str2.substring(3, 5), 10);
                                    var yr2 = parseInt(str2.substring(6, 10), 10);
                                    var date1 = new Date(yr1, mon1, dt1);
                                    var date2 = new Date(yr2, mon2, dt2);
                                    if (date2 < date1) {
                                        alert("To date must greater than from date");
                                        document.getElementById('todate').focus();
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }

                                       function getPurpose(){
                                     var departmentval = $("#department").val();
                                   $.post("<%=ccp%>/JsonService?step=getPurpose&dept="+departmentval, function(data){ 
                                   var items = data.list;
                                     var options = '<option value="#">-------Select------</option>';                                             
                                       var x = '';
                                 
                                          for (var i = 0; i < items.length; i++) {
                                                options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                                            }
                                      
                                       $("#purpose").html(options);
                               },"json"); 
                           };
           function getTaxtype(){
                var departmentval = $("#department").val();
                $.post("<%=ccp%>/JsonService?step=getTaxId&dept="+departmentval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) 
                        {
                    options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                        }
                        $("#taxid").html(options);
                },"json"); 
            };
            
                 function getLocation(){
                         var departmentval = $("#department").val();
                $.post("<%=ccp%>/JsonService?step=getLocation&dept="+departmentval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                         for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                        }
                        $("#location").html(options);
                },"json"); 
            };

                        function getSubTax(){
                         var departmentval = $("#department").val();
                         var purposeval = $("#purpose").val();
                         $.post("<%=ccp%>/JsonService?step=getSubTax&dept="+departmentval+"&taxtype="+purposeval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                         for (var i = 0; i < items.length; i++) {
                                                options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                                            }
                        $("#subtax").html(options);
                },"json"); 
            };

function getAnualYear(){
                         $.post("<%=ccp%>/JsonService?step=getAnualyear", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                         for (var i = 0; i < items.length; i++) {
                                                options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                                            }
                        $("#finalayear").html(options);
                },"json"); 
            };//
             function getMnthqrtYr(){
                         $.post("<%=ccp%>/JsonService?step=getqrteyear", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                         for (var i = 0; i < items.length; i++) {
                                                options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                                            }
                        $("#finalqyear").html(options);
                },"json"); 
            };
            
             function getMnthYr(){
                         $.post("<%=ccp%>/JsonService?step=getqrteyear", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                         for (var i = 0; i < items.length; i++) {
                                                options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                                            }
                        $("#finalmyear").html(options);
                },"json"); 
            };
                           
                                function show_purpose() {
                                    $.ajax({
                                        type: "POST",
                                        url: "<%=ccp%>/genericpayment/treasuryheadcode.jsp",
                                        data: {department: $("#department").val(), taxtype: $('#purpose').val(), subtax: $('#subtax').val()}
                                    }).done(function(msg) {
                                        $("#myscript").html(msg);
                                    });
                                }



                                $(function() {

                                    $("#taxperiod").change(function() {
                                        if ($("#taxperiod").val() == 'a') {
                                             getAnualYear();
                                            $("#annual_form").show();
                                            $("#quarter_form").hide();
                                            $("#monthly_form").hide();
                                            $("#specific_form").hide();
                                        }
                                        if ($("#taxperiod").val() == 'q') {
                                            getMnthqrtYr();
                                            $("#annual_form").hide();
                                            $("#quarter_form").show();
                                            $("#monthly_form").hide();
                                            $("#specific_form").hide();
                                        }
                                        if ($("#taxperiod").val() == 'm') {
                                            getMnthYr();
                                            $("#annual_form").hide();
                                            $("#quarter_form").hide();
                                            $("#specific_form").hide();
                                            $("#monthly_form").show();
                                        }
                                        if ($("#taxperiod").val() == 'n') {
                                            $("#annual_form").hide();
                                            $("#quarter_form").hide();
                                            $("#monthly_form").hide();
                                            $("#specific_form").hide();
                                        }
                                        if ($("#taxperiod").val() == 's') {
                                            $("#annual_form").hide();
                                            $("#quarter_form").hide();
                                            $("#monthly_form").hide();
                                            $("#specific_form").show();
                                            $("#fromdate").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
                                            $("#todate").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
                                        }
                                    })
                                });
                              
                                $(document).ready(function() {
                                    $('#sending_img').hide();
                                    $('#processtopay').hide();
                                    $('#tax_info').show();
                                    get_tax_info_details();
                                });

                                function get_tax_info_details() {	/* Code For Geting Details from cookies */
                                    /*$("#department_data").html(getCookie('department').substr(2));*/
                                    $("#taxid1").html(getCookie('taxid'));
                                    $("#taxidval1").html(getCookie('taxidval'));
                                    $("#department_data").html(getCookie('department'));
                                    $("#purpose_data").html(getCookie('purpose'));
                                    $("#purpose_datal").html(getCookie('purpose'));
                                    $("#amount_data1").html(getCookie('grandtotal'));
                                    $("#amount_data2").html(getCookie('grandtotal'));
                                    $("#desc_data").html(getCookie('description'));
                                    $("#remarks_data").html(getCookie('remarks'));
                                    if (getCookie('taxperiod') == 'a')
                                    {
                                        var inc_annual = parseInt(getCookie('finalayear')) + 1;
                                        //$("#period_data").html(getCookie('finalayear') + " - " + inc_annual);
                                        $("#period_data").html(getCookie('finalayear'));
                                        $("#quarter_month").html('');
                                        $("#quarter_month_data").html('');
                                    } else if (getCookie('taxperiod') == 'q')
                                    {
                                        $("#period_data").html(getCookie('finalqyear'));
                                        $("#quarter_month").html('Quarter');
                                        var qtrNames = ["", "January - March", "April - June", "July - September", "October - December"];
                                        $("#quarter_month_data").html(qtrNames[parseInt(getCookie('quarter'))]);
                                    } else if (getCookie('taxperiod') == 'm')
                                    {
                                        $("#period_data").html(getCookie('finalmyear'));
                                        $("#quarter_month").html('Month');
                                        var monthNames = ["January", "February", "March", "April", "May", "June",
                                            "July", "August", "September", "October", "November", "December"];

                                        $("#quarter_month_data").html(monthNames[parseInt(getCookie('month')) - 1]);
                                    } else if (getCookie('taxperiod') == 's')
                                    {
                                        $("#period_data").html(getCookie('fromdate') + " <span class='lb1'>To</span> " + getCookie('todate'));
                                        $("#quarter_month").html('');
                                        $("#quarter_month_data").html('');
                                    }
                                    else if (getCookie('taxperiod') == 'n')
                                    {
                                        $("#period_data").html("NOT REQUIRED");
                                        $("#quarter_month").html('');
                                        $("#quarter_month_data").html('');
                                    }
                                }
                                function setCookie(cname)
                                {
                                    cvalue = $('#' + cname).val();
                                    var d = new Date();
                                    d.setTime(d.getTime() + (1 * 24 * 60 * 60 * 1000));
                                    var expires = "expires=" + d.toGMTString();
                                    document.cookie = cname + "=" + cvalue + "; " + expires;

                                }
                                function getCookie(cname)
                                {
                                    var name = cname + "=";
                                    var ca = document.cookie.split(';');
                                    for (var i = 0; i < ca.length; i++)
                                    {
                                        var c = ca[i].trim();
                                        if (c.indexOf(name) == 0)
                                            return c.substring(name.length, c.length);
                                    }
                                    return "";
                                }
                                function postdata() {
                                    var data = $('#frm').serialize();

                                    $('#verifybutton').hide();
                                    $('#verify_page_data').hide();
                                    $('#sending_img').show();
                                    $.post("<%=ccp%>/GenericServlet",data,function(data, status) {
                                                if(data == 'error'){
                                                     $('#chalnmsg').hide();
                                                    $('#verifybutton').show();
                                                    $('#verify_page_data').show();
                                                    $('#sending_img').hide();
                                                }else{ 
                                                    $('#chalnmsg').show();
                                                    $('#sending_img').hide();
                                                    $('#verify_page_data').show();
                                                    $('#processtopay').show();
                                                     document.getElementById('challan_id').innerHTML='Challan Id :- ' +data;
                                                    $('#step4').removeClass('tab-disabled').addClass('tab-active');
                                                    $('#step3').removeClass('tab-active').addClass('tab-disabled');
                                                }
                           
                       
                   
                                                
                                                
                                                
                                            });



                                }

                                function fieldValidation_tax_info() {

                                    var idvalRegex = /^[0-9A-Za-z-/ ]+$/;
                                    descriptionRegex = /^[a-zA-Z0-9 ]+$/;
                                    dateRegex = /^[0-9/]+$/;
                                    var description = document.frm.description.value;
                                    var taxperiod = document.frm.taxperiod.value;
                                    var fromdate = document.frm.fromdate.value;
                                    var todate = document.frm.todate.value;


                                    if ((document.frm.department.value == "") || (document.frm.department.value == 'depart')) {
                                        alert("Select the Department");
                                        document.getElementById('department').focus();
                                        return false;
                                    }
                                    if ((document.frm.taxid.value == '#') || (document.frm.taxid.value == null)) {
                                        alert("Select the Identity Proof");
                                        document.getElementById('taxid').focus();
                                        return false;
                                    }
                                    if ((!document.frm.taxidval.value.match(idvalRegex))) {
                                        alert("Enter the Identity Proof");
                                        document.getElementById('taxidval').focus();
                                        return false;
                                    }
                                    if ((document.frm.purpose.value == "") || (document.frm.purpose.value == '#')) {
                                        alert("Select the Purpose");
                                        document.getElementById('purpose').focus();
                                        return false;
                                    }
                                    if ((document.frm.subtax.value == "") || (document.frm.subtax.value == '#')) {
                                        alert("Select the Sub Tax");
                                        document.getElementById('subtax').focus();
                                        return false;
                                    }
                                    if ((document.frm.location.value == "") || (document.frm.location.value == '#')) {
                                        alert("Please Select Branch Location");
                                        document.getElementById('location').focus();
                                        return false;
                                    }
                                    if (document.frm.taxperiod.value == "tax_period") {
                                        alert("Please Select Tax Period");
                                        document.getElementById('taxperiod').focus();
                                        return false;
                                    }

                                    if (!description.match(descriptionRegex)) {
                                        alert("Please enter the description");
                                        document.getElementById('description').focus();
                                        return false;

                                    }
                                    if ((taxperiod == "s") && (fromdate.length != "10")) {
                                        alert("Please enter the date!");
                                        document.getElementById('fromdate').focus();
                                        return false;
                                    }

                                    if ((taxperiod == "s") && (!fromdate.match(dateRegex))) {
                                        alert("Please enter the appropriate date!");
                                        document.getElementById('fromdate').focus();
                                        return false;
                                    }

                                    if ((taxperiod == "s") && (todate.length != "10")) {
                                        alert("Please enter the date!");
                                        document.getElementById('todate').focus();
                                        return false;
                                    }
                                    if ((taxperiod == "s") && (!todate.match(dateRegex))) {
                                        alert("Please enter the appropriate date!");
                                        document.getElementById('todate').focus();
                                        return false;
                                    }
                                    if (document.frm.taxperiod.value == 'm' && document.frm.finalmyear.value == "fayear") {
                                        alert("Please Select Year");
                                        document.getElementById('finalmyear').focus();
                                        return false;
                                    }
                                    if (document.frm.taxperiod.value == 'q' && document.frm.finalqyear.value == "fayear") {
                                        alert("Please Select Year");
                                        document.getElementById('finalqyear').focus();
                                        return false;
                                    }
                                    if (document.frm.taxperiod.value == 'a' && document.frm.finalayear.value == "fayear") {
                                        alert("Please Select Year");
                                        document.getElementById('finalayear').focus();
                                        return false;
                                    }


                                    curRegExp = /^[.0-9]+$/;
                                    var amount = document.frm.amount.value;
                                    var grandtotal = document.frm.grandtotal.value;
                                    var interest = document.frm.interest.value;
                                    var penalty = document.frm.penalty.value;
                                    var misc = document.frm.misc.value;
                                    var amountZeroIndex = amount.indexOf("0");
                                    var amountDecimalIndex = amount.indexOf(".");

                                    var interestZeroIndex = interest.indexOf("0");
                                    var interestDecimalIndex = interest.indexOf(".");

                                    var penaltyZeroIndex = penalty.indexOf("0");
                                    var penaltyDecimalIndex = penalty.indexOf(".");

                                    var miscZeroIndex = misc.indexOf("0");
                                    var miscDecimalIndex = misc.indexOf(".");

                                    if ((!amount.match(curRegExp)) || (amountZeroIndex == "0") || (amountDecimalIndex == "0")) {
                                        alert("Enter the Valid amount");
                                        document.getElementById('amount').focus();
                                        return false;
                                    }
                                    if (interest != "" || interest.length != 0) {
                                        if ((!interest.match(curRegExp))) {
                                            alert("Enter the interest");
                                            document.getElementById('interest').focus();
                                            return false;
                                        }
                                    }
                                    if (penalty != "" || penalty.length != 0) {
                                        if ((!penalty.match(curRegExp))) {
                                            alert("Enter the penalty");
                                            document.getElementById('penalty').focus();
                                            return false;
                                        }
                                    }

                                    if (misc != "" || misc.length != 0) {

                                        if ((!misc.match(curRegExp))) {
                                            alert("Enter the Others Fee");
                                            document.getElementById('misc').focus();
                                            return false;
                                        }
                                    }

                                    setCookie('department');
                                    setCookie('purpose');
                                    setCookie('taxperiod');
                                    setCookie('description');
                                    setCookie('finalayear');
                                    setCookie('finalqyear');
                                    setCookie('finalmyear');
                                    setCookie('quarter');
                                    setCookie('month');
                                    setCookie('fromdate');
                                    setCookie('todate');
                                    setCookie('grandtotal');
                                    setCookie('taxid');
                                    setCookie('taxidval');
                                    verifypage();

                                }

                                function tax_info() {
                                    $("#tax_info").show();
                                    $("#verify").hide();
                                }
                                function verifypage() {
                                    $('#chalnmsg').hide();
                                    $("#tax_info").hide();
                                    $("#verify").show();
                                    get_tax_info_details();
                                }

        </script>
        <%}%>
    </body>
</html>
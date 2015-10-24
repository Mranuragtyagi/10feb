<!DOCTYPE html>
<%@ page import="java.util.*,genericepayment.*,java.sql.*,vicclass.* " errorPage="/error.jsp"%>
<%
    String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
    String fbfirstname = request.getAttribute("fbfirstname") != null ? (String) request.getAttribute("fbfirstname") : "";
    String fbemail = request.getAttribute("fbemail") != null ? (String) request.getAttribute("fbemail") : "";
    String fblocation = request.getAttribute("fblocation") != null ? (String) request.getAttribute("fblocation") : "";
    String fbfullname = request.getAttribute("fbfullname") != null ? (String) request.getAttribute("fbfullname") : "";
    String fblastname = request.getAttribute("fblastname") != null ? (String) request.getAttribute("fblastname") : "";
    String fbm = request.getParameter("fbem") != null ? (String) request.getParameter("fbem") : "";
    String usermesg = request.getAttribute("usermesg") != null ? (String) request.getAttribute("usermesg") : "";
    String errormsg = request.getAttribute("errmsg") != null ? (String) request.getAttribute("errmsg") : "";
    String treasurymsg = request.getParameter("treasurymsg") != null ? request.getParameter("treasurymsg") : "";
    String chid = request.getSession().getAttribute("chid") != null ? (String)request.getSession().getAttribute("chid") : "";
    System.out.println("chid  in user : "+chid);
%>
<% java.text.DecimalFormat df = new java.text.DecimalFormat("################.00");
    String b = "";
    int depid = 0;
    String statn = "";
    User u = new User();
    Connection con = null;
    u.createConnection();
    con = u.getConnection();
    ArrayList ar = new ArrayList();
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
<html lang="en">
    <head>
        <title>Instant Payment | Government of Jharkhand Electronic Revenue Receipt Portal</title>
        <%@ include file="../assets/metro/__inc/base_links_payment_page.jsp"%>
        <link id="base-style-responsive" href="../assets/metro/css/cmxform.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../assets/metro/css/jquery-ui.css" > 
        <link rel="stylesheet" type="text/css" href="../assets/metro/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="../assets/metro/css/dataTables.tableTools.css" >
        <style>
            .container-fluid-full { overflow: auto !important;}
        </style>
    </head>
    <body onLoad="trimSpaces1();" >
        <!-- start: Header -->
        <%@ include file="../assets/metro/__inc/user_header.jsp"%>
        <!-- start: Header -->

        <div class="container-fluid-full">
            <div class="row-fluid">

                <!-- start: Main Menu -->
                <%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
                <!-- end: Main Menu -->
                <div id="content" class="span10">
                    <div class="row-fluid sortable">
                        <form  action="confirmpayment.jsp " method="post" name="frm" id="frm" >
                            <input type="hidden" name="step" id="step" value="2">

                            <!-- tax info tag beginsa-->
                            <div class="Buy-cont-wrap" id="tax_info">
                                <div class="span12 hide480">
                                    <div class="tabs-outer">
                                        <div class="tabs-cont delivery-modes-tab tab-active" >
                                            <div class="tabs-payment"></div>
                                            <div align="center"> Tax Info</div>
                                        </div>
                                        <div class="tabs-cont customer-info-tab tab-disabled" >
                                            <div class="tabs-order"></div>
                                            <div align="center">User Details</div>
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
                                <div><font color="Red"><%=errormsg%></font></div>
                                <div><font color="Red"><%=treasurymsg%></font></div>
                                <div class="span12"> <br />
                                    <div class="span12" style="margin-top:1%;" >
                                        <div class="row-fluid">
                                            <div class="span6 span6-pa">
                                                <label class="lb1">Department<span style="color:#F00;">* </span></label>

                                                <%if (al != null) {
                                                        Iterator it = al.iterator();
                                                %>
                                                <select name="department" id="department" class="span12" onchange="getPurpose();getTaxtype();getLocation();" >
                                                    <option selected="selected" value="depart">-----SELECT-----</option>
                                                    <%
                                                        while (it.hasNext()) {
                                                            GenericBean cfrb = (GenericBean) it.next();
                                                    %>
                                                    <option value="<%=cfrb.getDepartmentname().toUpperCase()%>"> <%=cfrb.getDepartmentname() != null ? cfrb.getDepartmentname().toUpperCase() : ""%> </option>
                                                    <%}%>
                                                </select>
                                                <%}%>
                                                <label class="lb1">Tax Type/Purpose <span style="color:#F00;">* </span></label>
                                                <div id="myscript"> </div>
                                                <div id="purposeselect">
                                                    <select name="purpose"  id="purpose" class="span12" onchange="getSubTax();" >
                                                        <option value="#">-select-</option>
                                                    </select>
                                                </div>
                                                <label class="lb1">Sub Tax Type <span style="color:#F00;">* </span></label>
                                                <div id="myscript"> </div>
                                                <select name="subtax"  id="subtax" class="span12" onChange="show_purpose();">
                                                    <option value="#">-select-</option>
                                                </select>
                                                <label class="lb1">Branch Location <span style="color:#F00;">* </span></label>
                                                <div id="myscript"> </div>
                                                <select name="location"  id="location" class="span12"  onChange="javascript:setCookie('location');">
                                                    <option value="#">-select-</option>
                                                </select>
                                                <input class="span6 span6-pa" type="hidden" readonly name="treasuryhead" id="treasuryhead" />
                                                <label class="lb1"></label>
                                                <label class="lb1">Type of Period <span style="color:#F00;">* </span></label>
                                                <select name="taxperiod" id="taxperiod"  class="span12">
                                                    <!--onChange="tax_period(this.value)"-->
                                                    <option selected="selected" value="#">-Select Period-</option>
                                                    <option value="a">Annual</option>
                                                    <option value="q">Quarterly</option>
                                                    <option value="m">Monthly</option>
                                                    <option value="s">Specific Period</option>
                                                    <option value="n">Not Required</option>
                                                </select>
                                                <label class="lb1">Description:<span style="color:#F00;">* </span></label>
                                                <textarea style="resize:none; " cols="15" rows="3"  name="description" class="span12"  id="description" ></textarea>
                                            </div>
                                            <div class="span6 span6-pa">
                                                <div id="annual_form">
                                                    <label class="lb1">Period (year)<span style="color:#F00;">* </span></label>
                                                    <%--<select name="finalayear" id="finalayear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="2010">2010-2011</option>
                                                        <option value="2011">2011-2012</option>
                                                        <option value="2012">2012-2013</option>
                                                        <option value="2013">2013-2014</option>
                                                        <option value="2014">2014-2015</option>
                                                        <option value="2015">2015-2016</option>
                                                    </select>--%>
                                                      <select name="finalayear" id="finalayear" class="span12">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                               <option value="#">-select-</option> 
                                                      </select>
                                                </div>
                                                <div id="quarter_form">
                                                    <label class="lb1">Period (year)<span style="color:#F00;">* </span></label>
                                                   <%-- <select name="finalqyear" id="finalqyear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="2010">2010</option>
                                                        <option value="2011">2011</option>
                                                        <option value="2012">2012</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2015">2015</option>
                                                    </select>--%>
                                                   <select name="finalqyear" id="finalqyear" class="span12">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                      <option value="#">-select-</option>
                                                    </select>
                                                    <label class="lb1">Quarter<span style="color:#F00;">* </span></label>
                                                    <select name="quarter" class="span12" id="quarter">
                                                        <option value="2">April - June</option>
                                                        <option value="3">July - September</option>
                                                        <option value="4">October - December</option>
                                                        <option value="1">January - March</option>
                                                    </select>
                                                </div>
                                                <div id="monthly_form">
                                                    <label class="lb1">Period (year)<span style="color:#F00;">* </span></label>
                                                   <%-- <select name="finalmyear" id="finalmyear" class="span10">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="2010">2010</option>
                                                        <option value="2011">2011</option>
                                                        <option value="2012">2012</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2015">2015</option>
                                                    </select>--%>
                                                     <select name="finalmyear" id="finalmyear" class="span12">
                                                        <option selected="selected" value="fayear">-Year-</option>
                                                        <option value="#">-select-</option>
                                                    </select>
                                                    <label class="lb1">Month<span style="color:#F00;">* </span></label>
                                                    <select name="month" class="span12" id="month">
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
                                                    <input type="text" class="span12" name="fromdate" id="fromdate" maxlength="10"/>
                                                    <label class="lb1">To Date<span style="color:#F00;">* </span></label>
                                                    <input type="text" name="todate"  class="span12" id="todate" maxlength="10"/>
                                                </div>
                                                
                                                <label class="lb1">Amount<span style="color:#F00;">* </span></label>
                                                <input type="text" class="span12" name="amount" id="amount" maxlength="20" onBlur="totalTest();"/>
                                                <label class="lb1"> Interest <span style="color:#F00;"></span></label>
                                                <input type="text" class="span12"  name="interest" id="interest" maxlength="20" onBlur="totalTest();"/>
                                                <label class="lb1"> Penalty <span style="color:#F00;"> </span></label>
                                                <input type="text" class="span12"  name="penalty" id="penalty" maxlength="20" onBlur="totalTest();"/>
                                                <label class="lb1">Others Fee <span style="color:#F00;"> </span></label>
                                                <input type="text" class="span12" name="misc" id="misc" maxlength="20" onBlur="totalTest();"/>
                                                <% java.util.Date date = new java.util.Date();%>
                                                <input type="hidden" name="currentdate" id="currentdate" value="<%=sdf.format(date)%>" />
                                                <label class="lb1">Grand Total<span style="color:#F00;"> </span></label>
                                                <input type="text" class="span12" name="grandtotal" id="grandtotal" readonly/>
                                            </div>
                                        </div>
                                        <div align="center">
                                            <button type="button" class="btn btn-warning" value="Next" onClick="fieldValidation_tax_info();" > &nbsp;&nbsp;<strong>Next</strong>&nbsp;&nbsp; </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- tab userdetails begins  -->
                            <div class="Buy-cont-wrap" id="userdetails">
                                <div class="span12 hide480 cust-span9">
                                    <div class="tabs-outer" >
                                        <div class="tabs-cont delivery-modes-tab tab-disabled" >
                                            <div class="tabs-payment"></div>
                                            <div align="center"> Tax Info</div>
                                        </div>
                                        <div class="tabs-cont customer-info-tab tab-active" >
                                            <div class="tabs-order"></div>
                                            <div align="center">User Details</div>
                                        </div>
                                        <div class="tabs-cont order-summary-tab tab-disabled" style="">
                                            <div class="tabs-confirm"></div>
                                            <div align="center">Verify</div>
                                        </div>
                                        <div class="tabs-cont payment-tab tab-disabled">
                                            <div class="tabs-complete"></div>
                                            <div align="center">Payment</div>
                                        </div>
                                    </div>
                                </div>
                                <div><font color="Red"><%=usermesg%></font></div>
                                <div class="span12"> <br/>
                                    <div class="span12" style="margin-top:1%;">
                                        <div class="row-fluid"> 
                                            <div class="span6">
                                                <div align="center"><%= request.getParameter("err") != null ? request.getParameter("err") : ""%> </div>
                                                <label class="lb1">Identity Proof:<span style="color:#F00;">* </span> </label>
                                                <div id="myscript"> </div>
                                                <select name="taxid"  id="taxid" class="span11" onChange="javascript:setCookie('taxid');">
                                                    <option value="#">-select-</option>
                                                </select>

                                                <div id="taxshow">
                                                    <input type="text" maxlength="15" name="taxidval" class="span11" id="taxidval" onChange="javascript:setCookie('taxidval');" />
                                                </div>
                                                <label class="lb1"> Name/Organization:<span style="color:#F00;">* </span></label>
                                                <input type="text" name="name" class="span11" id="username" onChange="javascript:setCookie('username');" />
                                                <label class="lb1"> Mobile No:<span style="color:#F00;">* </span></label>
                                                <input type="text" name="mobile" class="span11"  id="usermobile" nge="javascript:setCookie('usermobile');"  maxlength="10" />
                                                <label class="lb1">Email-Id:<span style="color:#F00;">* </span></label>
                                                <input type="text" name="emailed" class="span11" id="useremail" onChange="javascript:setCookie('useremail');" />
                                                <label class="lb1">Pin Code<span style="color:#F00;">* </span></label>
                                                <input type="text" name="pincode"  class="span11" id="userpincode" onChange="javascript:setCookie('userpincode');" maxlength="6" />
                                            </div>
                                            <div class="span6 pull-right">
                                                <label class="lb1">State<span style="color:#F00;">* </span></label>
                                                <select name="state" id="userstate" class="span11" onChange="javascript:setCookie('userstate');getOnchangDist();" onfocus="getState();" >
                                                   <option value="34">Loading </option>                                    </select>
                                                <label class="lb1">District/City<span style="color:#F00;">* </span></label>
                                                <select  name="city" id="usercity"  class="span11"  onchange="javascript:setCookie('usercity');">
                                                    <option value="#">-select-</option>
                                                  
                                                </select>
                                                <label class="lb1">Address:<span style="color:#F00;">* </span></label>
                                                <textarea style="resize:none; " cols="15" rows="3"  name="address" class="span11"  id="useraddress" onChange="javascript:setCookie('useraddress');"> </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div align="center">
                                        <button type="button" class="btn btn-info" value="Back" onClick="tax_info();" > &nbsp;&nbsp;<strong>Back</strong>&nbsp;&nbsp; </button>
                                        <button type="button" class="btn btn-warning" onClick="fieldValidation();" > &nbsp;&nbsp;<strong>Next</strong>&nbsp;&nbsp; </button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
                                </div>
                            </div>

                            <!-- new tab verify begins-->
                            <div class="Buy-cont-wrap" id="verify">
                                <div class="span12 hide480">
                                    <div class="tabs-outer" >
                                        <div class="tabs-cont delivery-modes-tab tab-disabled" >
                                            <div class="tabs-payment"></div>
                                            <div align="center"> Tax Info</div>
                                        </div>
                                        <div class="tabs-cont customer-info-tab tab-disabled" >
                                            <div class="tabs-order"></div>
                                            <div align="center">User Details</div>
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
                                <div class="span12"> <br />
                                    <%GenericBean gbn=new GenericBean();%>
                                    <div class="span12" style="margin-top:1%;" >
                                        <div class="row-fluid">
                                            <div class="span12" id="verify_page_data">
                                                <div class="span8 font14">&nbsp;&nbsp;&nbsp;Tax Type/Purpose : <span id="purpose_data"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="span4 font14 ">Department : <span id="department_data"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="span8 font14 " id="challan_id"> </div>
                                                <div class="span4 font14 ">&nbsp;&nbsp;&nbsp;Sub Tax Type : <span id="getsub"></span></div>
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
                                            <div class="span12" id="sending_img" align="center"><img src="../assets/metro/images/sending.gif" width="250" height="50"/></div>
                                            <div class="span12"></div>
                                            <div class="span12">
                                                <div class="span3">
                                                    <ul class="nav nav-list bs-docs-sidenav BG_F5" style="margin-top:0px;">
                                                        <li> <a href="#"><strong>
                                                            <div id="gettaxid2"></div>
                                                                </strong> <strong>
                                                                    <div id="gettaxidval2"></div>
                                                                </strong> <strong>
                                                                    <div id="getname2"></div>
                                                                </strong>
                                                                <div id="getdetails3"></div>
                                                                <div id="getcity2"></div>
                                                                <div id="getstate2"></div>
                                                                <div id="getdetails4"></div>
                                                            </a> </li>
                                                     </ul>
                                                    <div id="chalnmsg"><font style="color: red">Note:- Please Note Down The Challan Id Properly For Further Refrence.If Amount is Debited From Your a/c While Payment,Please Do Not Make The Same Payment Again As The Status Will be Updated Within 48 Hours.
                                                        </font></div>
                                                </div>
                                                <div class="span5"> </div>
                                                <div class="span3"> <br />
                                                    <br />
                                                    <br />
                                                    <div align="center" id="verifybutton">
                                                        <button type="button" class="btn  btn-info" value="Back" onClick="userdetails();" > &nbsp;&nbsp;<strong>Back</strong>&nbsp;&nbsp; </button>
                                                        <button type="button" class="btn  btn-warning" value="Next" onClick="postdata1();" > &nbsp;&nbsp;<strong>Verify</strong>&nbsp;&nbsp; </button>
                                                    </div>
                                                    <div align="center" id="processtopay">
                                                        <input type="submit" class="btn  btn-warning bold" value="Proceed to Pay" />
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
        <script  type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
        <script type="text/javascript" language="javascript">
            resetHeight();
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
                    return false;
                }else{
                    return true;
                }
            }
            
            
            
            function getState(){
                $.post("<%=ccp%>/JsonService?step=states", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            if(items[i]){
                                x=''
                            }
                            
                            options += '<option value="' +items[i].state_code+ '"' + x + '>' + items[i].state_name + '</option>';
                        }
                        $("#userstate").html(options);
                },"json"); 
            };
            
               function getOnchangDist(){
                $.post("<%=ccp%>/JsonService?step=distonchng", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++){
                             if (items[i].state_code === $("#userstate").val()){
                                options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#usercity").html(options);
                },"json"); 
            };
         
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
                        $("#location").val(getCookie('location'));
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

            $(function() {
                $("#taxperiod").change(function() {

                    if ($("#taxperiod").val() === 'a') {
                        getAnualYear();
                    
                        $("#annual_form").show();
                        $("#quarter_form").hide();
                        $("#monthly_form").hide();
                        $("#specific_form").hide();
                    }
                    if ($("#taxperiod").val() === 'q') {
                        getMnthqrtYr();
                    
                        $("#annual_form").hide();
                        $("#quarter_form").show();
                        $("#monthly_form").hide();
                        $("#specific_form").hide();
                    }
                    if ($("#taxperiod").val() === 'm') {
                        getMnthYr();
                   
                        $("#annual_form").hide();
                        $("#quarter_form").hide();
                        $("#specific_form").hide();
                        $("#monthly_form").show();
                    }
                    if ($("#taxperiod").val() === 'n') {
                        $("#annual_form").hide();
                        $("#quarter_form").hide();
                        $("#monthly_form").hide();
                        $("#specific_form").hide();
                    }
                    if ($("#taxperiod").val() === 's') {
                        $("#annual_form").hide();
                        $("#quarter_form").hide();
                        $("#monthly_form").hide();
                        $("#specific_form").show();
                        $("#fromdate").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
                        $("#todate").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
                    }
                });
            });
            function show_purpose() {
                $.ajax({
                    type: "POST",
                    url: "<%=ccp%>/genericpayment/treasuryheadcode.jsp",
                    data: {department: $("#department").val(), taxtype: $('#purpose').val(), subtax: $('#subtax').val()}
                }).done(function(msg) {
                    $("#myscript").html(msg);
                });
            }
            function get_user_details() {
                $.getJSON("<%=ccp%>/json/states.jsp", function(res) {
                    var items = res.list;
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].state_code === getCookie('userstate')) {
                            $("#getstate1").html(items[i].state_name);
                        }
                    }
                });
                
                $.getJSON("<%=ccp%>/json/districts.jsp", function(res) {
                    var items = res.list;
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].district_code === getCookie('usercity')) {
                            $("#getcity1").html(items[i].district_name);
                        }
                    }
                });

                $("#getname1").html(getCookie('username'));
                var getdetails1 = getCookie('useraddress');
                var getdetails2 = 'PIN - ' + getCookie('userpincode') + ',<br>Mo. - ' + getCookie('usermobile') + '<br/>\n\
                    Email - ' + getCookie('useremail');
                $("#getdetails1").html(getdetails1);
                $("#getdetails2").html(getdetails2);
                $("#gettaxid1").html(getCookie('taxid'));
                $("#gettaxidval1").html(getCookie('taxidval'));
                $("#getcircle1").html(getCookie('circle'));
            }
            function get_tax_info_details() {
                $.getJSON("<%=ccp%>/json/states.jsp", function(res) {
                    var items = res.list;
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].state_code === getCookie('userstate')) {
                            $("#getstate2").html(items[i].state_name);
                        }
                    }
                });
                $.getJSON("<%=ccp%>/json/districts.jsp", function(res) {
                    var items = res.list;
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].district_code === getCookie('usercity')) {
                            $("#getcity2").html(items[i].district_name);
                        }
                    }
                });
                $("#getname2").html(getCookie('username'));
                var getdetails2 = getCookie('useraddress');
                var getdetails3 = 'PIN - ' + getCookie('userpincode') + ',<br>Mo. - ' + getCookie('usermobile') + '<br/>Email - ' + getCookie('useremail');
                $("#getdetails3").html(getdetails2);
                $("#getdetails4").html(getdetails3);
                $("#department_data").html(getCookie('department').toUpperCase());
                $("#purpose_data").html(getCookie('purpose'));
                $("#purpose_data1").html(getCookie('purpose'));
                $("#amount_data1").html(getCookie('grandtotal'));
                $("#amount_data2").html(getCookie('grandtotal'));
                $("#desc_data").html(getCookie('description'));
                $("#remarks_data").html(getCookie('remarks'));
                $("#gettaxid2").html(getCookie('taxid'));
                $("#gettaxidval2").html(getCookie('taxidval'));
                $("#getsub").html(getCookie('subtax'));
                if (getCookie('taxperiod') === 'a')
                {
                    var inc_annual = parseInt(getCookie('finalayear')) + 1;
                    //$("#period_data").html(getCookie('finalayear') + " - " + inc_annual);  anu changs
                     $("#period_data").html(getCookie('finalayear'));
                    $("#quarter_month").html('');
                    $("#quarter_month_data").html('');
                } else if (getCookie('taxperiod') === 'q')
                {
                    $("#period_data").html(getCookie('finalqyear'));
                    $("#quarter_month").html('Quarter');
                    var qtrNames = ["", "January - March", "April - June", "July - September", "October - December"];
                    $("#quarter_month_data").html(qtrNames[parseInt(getCookie('quarter'))]);
                } else if (getCookie('taxperiod') === 'm')
                {
                    $("#period_data").html(getCookie('finalmyear'));
                    $("#quarter_month").html('Month');
                    var monthNames = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    $("#quarter_month_data").html(monthNames[parseInt(getCookie('month')) - 1]);
                } else if (getCookie('taxperiod') === 's')
                {
                    $("#period_data").html(getCookie('fromdate') + " <span class='lb1'>To</span> " + getCookie('todate'));
                    $("#quarter_month").html('');
                    $("#quarter_month_data").html('');
                } else if (getCookie('taxperiod') === 'n')
                {
                    $("#period_data").html("NOT REQUIRED");
                    $("#quarter_month").html('');
                    $("#quarter_month_data").html('');
                }
            }

            $(document).ready(function() {
                $("#department").val(getCookie('department').toUpperCase());
                /*if(getCookie('department').toUpperCase() && getCookie('department').toUpperCase()!=null){
                 $('#departmentselect').html("<input type='text' value='"+getCookie('department').toUpperCase()+"' readonly='readonly' name='department' id='department' class='span12'/>");
                 }if(getCookie('purpose').toUpperCase() && getCookie('purpose').toUpperCase()!=null){
                 $('#purposeselect').html("<input type='text' value='"+getCookie('purpose').toUpperCase()+"' readonly='readonly' name='purpose' id='purpose' class='span12'/>");
                 }*/
                //      $('#department').attr("disabled", true); 

                $("#username").val(getCookie('username'));
                $("#usermobile").val(getCookie('usermobile'));
                $("#useremail").val(getCookie('useremail'));
                $("#userpincode").val(getCookie('userpincode'));
                $("#useraddress").val(getCookie('useraddress'));
                if (getCookie('userstate') >= 1) {
                    $("#userstate").val(getCookie('userstate'));
                } else {
                    $("#userstate").val(34);
                }
                $("#usercity").val(getCookie('usercity'));
                $("#taxid").val(getCookie('taxid'));

                $("#taxidval").val(getCookie('taxidval'));
            
                $.getJSON("<%=ccp%>/genericpayment/getIdprofForRegistered.jsp", {'dept': $("#department").val(), ajax: 'true'}, function(res) {
                    var options = '<option value="#">-select-</option>';
                    var items = res.list;
                    var x = '';
                    for (var i = 0; i < items.length; i++) {
                        options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                    }
                    $("#taxid").html(options);
                    $("#taxid").val(getCookie('taxid'));
                });
                
                $.getJSON("<%=ccp%>/genericpayment/getTaxTypeByDept.jsp", {'dept': getCookie('department'), ajax: 'true'}, function(res) {
                    var options = '<option value="#">-select-</option>';
                    var items = res.list;
                    var x = '';
                    for (var i = 0; i < items.length; i++) {
                        options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                    }
                    $("#purpose").html(options);
                    $("#purpose").val(getCookie('purpose'));
                });
        

                $.getJSON("<%=ccp%>/genericpayment/getSubTaxType.jsp", {'taxtype': getCookie('purpose'), 'dept': getCookie('department'), ajax: 'true'}, function(res) {
                    var options = '<option value="#">-----SELECT-----</option>';
                    var items = res.list;
                    var x = '';
                    for (var i = 0; i < items.length; i++) {
                        options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                    }

                    $("#subtax").html(options);
        }        );
              
                $('#sending_img').hide();
                $('#processtopay').hide();


            });
            $(function(){
                $("#userstate").change(function(){
                    $.getJSON("<%=ccp%>/json/districts.jsp", function(res){
                        var options = '<option value="#">-select-</option>';
                        var items = res.list;
                        var x = '';
                        for(var i = 0; i < items.length; i++){
                            if (items[i].state_code === $("#userstate").val()) {
                                options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#usercity").html(options);
                    });
                });
            });

            function setCookie(cname){
                cvalue = $('#' + cname).val();
                var d = new Date();
                d.setTime(d.getTime() + (1 * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toGMTString();
                document.cookie = cname + "=" + cvalue + "; " + expires;
            }
            function getCookie(cname){
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++){
                    var c = ca[i].trim();
                    if (c.indexOf(name) === 0){
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }
            function postdata(){
                var f = document.getElementById("frm");
                f.action = "<%=ccp%>/GenericServlet";
                f.submit();
            }
            function postdata1(){
                var data = $('#frm').serialize();
                $('#verifybutton').hide();
                $('#verify_page_data').hide();
                $('#sending_img').show();
                $.post("<%=ccp%>/GenericServlet", data, function(data, status){
                    if (data == 'error'){
                        $('#verifybutton').show();
                        $('#verify_page_data').show();
                        $('#sending_img').hide(); 
                         $('#chalnmsg').hide();
                    } else {
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
            function processtopay(){
                var data = $('#frm').serialize();
                $.post("<%=ccp%>/genericpayment/confirmpayment.jsp", data, function(data, status){
                    alert("\nStatus: " + status);
                });
            }
            function fieldValidation() {
                get_user_details();
                get_tax_info_details();
                var numbers = /^[0-9]+$/;
                var idvalRegex = /^[0-9A-Za-z-/ ]+$/;
                var nameRegex = /^[a-zA-Z/ ]+$/;
                var emailID = $('#useremail').val();
                atpos = emailID.indexOf("@");
                dotpos = emailID.lastIndexOf(".");
                var pincodeRegex = /^\d{6}$/;
                var addressRegex = /^[0-9a-zA-Z-/, ]+$/;

                if ((document.frm.taxid.value === '#') || (document.frm.taxid.value === null)) {
                    alert("Select the Identity Proof");
                    document.getElementById('taxid').focus();
                    return false;
                }
                if ((!document.frm.taxidval.value.match(idvalRegex))) {
                    alert("Enter the Identity Proof");
                    document.getElementById('taxidval').focus();
                    return false;
                }
                if (!(document.frm.name.value.match(nameRegex))) {
                    alert("Enter the name");
                    document.getElementById('username').focus();
                    return false;
                }
                var phoneno = /^\d{10}$/;
                if ((document.frm.mobile.value === "") || (document.frm.mobile.value === null) || (!document.frm.mobile.value.match(phoneno))) {
                    alert("Enter the 10 digit mobile number");
                    document.getElementById('usermobile').focus();
                    return false;
                }
                if (atpos < 1 || (dotpos - atpos < 2)) {
                    alert("Please enter correct email ID");
                    document.getElementById('useremail').focus();
                    return false;
                }
                if (!document.frm.pincode.value.match(pincodeRegex)) {
                    alert("Please enter the valid pincode!");
                    document.frm.pincode.focus();
                    return false;
                }
                if ((document.frm.state.value === '#') || (document.frm.state.value === null)) {
                    alert("Select the state");
                    document.getElementById('userstate').focus();
                    return false;
                }
                if ((document.frm.city.value === '#') || (document.frm.city.value === null)) {
                    alert("Select the city");
                    document.getElementById('usercity').focus();
                    return false;
                }
                if ((document.frm.address.value === "") || (document.frm.address.value === null) || (document.frm.address.value ===' ') || (!document.frm.address.value.match(addressRegex))) {
                    alert("Enter the address");
                    document.getElementById('useraddress').focus();
                    return false;
                } else {
                    setCookie('username');
                    setCookie('usermobile');
                    setCookie('useremail');
                    setCookie('userpincode');
                    setCookie('useraddress');
                    setCookie('userstate');
                    setCookie('usercity');
                    setCookie('taxid');
                    setCookie('taxidval');
                    setCookie('circle');
                    $("#userdetails").hide();
                    $("#tax_info").hide();
                    $("#chalnmsg").hide();
                    $("#verify").show();
                    get_user_details();
                }
            }
            function fieldValidation_tax_info() {
                totalTest();
                var dept = document.frm.department.value;
                descriptionRegex = /^[a-zA-Z0-9 ]+$/;
                var description = document.frm.description.value;
                var fromdate = document.frm.fromdate.value;
                var todate = document.frm.todate.value;
                dateRegex = /^[0-9/]+$/;
                admitRegex = /^[.0-9]+$/;
                var taxperiod = document.frm.taxperiod.value;
                var subtaxval = document.frm.subtax.value.toUpperCase();
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

                if ((document.frm.department.value === "") || (document.frm.department.value === 'depart')) {
                    alert("Please Select Department");
                    document.getElementById('department').focus();
                    return false;
                }
                if ((document.frm.purpose.value === "") || (document.frm.purpose.value === '#')) {
                    alert("Please Select Purpose");
                    document.getElementById('purpose').focus();
                    return false;
                }
                if ((document.frm.subtax.value === "") || (document.frm.subtax.value === '#')) {
                    alert("Please Select Subtax");
                    document.getElementById('subtax').focus();
                    return false;
                }
                if ((document.frm.location.value === "") || (document.frm.location.value === '#')) {
                    alert("Please Select Branch Location");
                    document.getElementById('location').focus();
                    return false;
                }
                if (document.frm.taxperiod.value === '#') {
                    alert("Please Select Tax Period");
                    document.getElementById('taxperiod').focus();
                    return false;
                }

                if (!description.match(descriptionRegex)) {
                    alert("Please enter the description");
                    document.getElementById('description').focus();
                    return false;

                }

                if ((taxperiod === "s") & (fromdate.length !== "10")) {
                    alert("Please enter the date!");
                    document.getElementById('fromdate').focus();
                    return false;
                }

                if ((taxperiod === "s") && (!fromdate.match(dateRegex))) {
                    alert("Please enter the appropriate date!");
                    document.getElementById('fromdate').focus();
                    return false;
                }

                if ((taxperiod === "s") && (todate.length !== "10")) {
                    alert("Please enter the date!");
                    document.getElementById('todate').focus();
                    return false;
                }
                if ((taxperiod === "s") && (!todate.match(dateRegex))) {
                    alert("Please enter the appropriate date!");
                    document.getElementById('todate').focus();
                    return false;
                }
                curRegExp = /^[.0-9]+$/;
                var amount = document.frm.amount.value;
                var interest = document.frm.interest.value;
                var penalty = document.frm.penalty.value;
                var misc = document.frm.misc.value;
                var amountZeroIndex = amount.indexOf("0");
                var amountDecimalIndex = amount.indexOf(".");
                /*var grandtotal = document.frm.grandtotal.value;
                var interestZeroIndex = interest.indexOf("0");
                var interestDecimalIndex = interest.indexOf(".");
                var penaltyZeroIndex = penalty.indexOf("0");
                var penaltyDecimalIndex = penalty.indexOf(".");
                var miscZeroIndex = misc.indexOf("0");
                var miscDecimalIndex = misc.indexOf(".");*/

                if ((!amount.match(curRegExp)) || (amountZeroIndex === "0") || (amountDecimalIndex === "0")) {
                    alert("Enter the Valid amount");
                    document.getElementById('amount').focus();
                    return false;
                }
                if (interest !== "" || interest.length !== 0) {
                    if ((!interest.match(curRegExp))) {
                        alert("Enter the interest");
                        document.getElementById('interest').focus();
                        return false;
                    }
                }
                if (penalty !== "" || penalty.length !== 0) {
                    if ((!penalty.match(curRegExp))) {
                        alert("Enter the penalty");
                        document.getElementById('penalty').focus();
                        return false;
                    }
                }

                if (misc !== "" || misc.length !== 0) {
                    if ((!misc.match(curRegExp))) {
                        alert("Enter the Others Fee");
                        document.getElementById('misc').focus();
                        return false;
                    }
                }

                if (document.frm.treasuryhead.value === "") {
                    alert("treasury head code is null");
                    document.getElementById('treasuryhead').focus();
                    return false;
                } else if (document.frm.taxperiod.value === 's' && document.frm.fromdate.value.length === 0 && document.frm.todate.value.length === 0) {
                    alert('Please Enter period');
                    document.getElementById('fromdate').focus();
                    return false;
                } else if (document.frm.taxperiod.value === 'm' && document.frm.finalmyear.value === "fayear") {
                    alert("Please Select Year");
                    document.getElementById('finalmyear').focus();
                    return false;
                } else if (document.frm.taxperiod.value === 'q' && document.frm.finalqyear.value === "fayear") {
                    alert("Please Select Year");
                    document.getElementById('finalqyear').focus();
                    return false;
                } else if (document.frm.taxperiod.value === 'a' && document.frm.finalayear.value === "fayear") {
                    alert("Please Select Year");
                    document.getElementById('finalayear').focus();
                    return false;
                }
                else if (date2 < date1) {
                    alert("To date must greater than from date");
                    return false;
                } else {
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
                    setCookie('subtax');
                    userdetails();
                }
            }
            function userdetails() {
                $("#userdetails").show();
                $("#tax_info").hide();
                $("#verify").hide();
            }
            function tax_info() {
                $("#userdetails").hide();
                $("#tax_info").show();
                $("#verify").hide();
                get_user_details();
            }
            function verifypage() {
                $("#userdetails").hide();
                $("#tax_info").hide();
                $("#verify").show();
                get_tax_info_details();
            }


            function trimSpaces() {
                s = document.getElementById("userremarks").value;
                s = s.replace(/(^\s*)|(\s*$)/gi, "");
                s = s.replace(/[ ]{2,}/gi, " ");
                s = s.replace(/\n /, "\n");
                document.getElementById("userremarks").value = s;
            }

            function trimSpaces1() {
                s = document.getElementById("useraddress").value;
                s = s.replace(/(^\s*)|(\s*$)/gi, "");
                s = s.replace(/[ ]{2,}/gi, " ");
                s = s.replace(/\n /, "\n");
                document.getElementById("useraddress").value = s;
            }

            function clickIE4() {
                if (event.button === 2) {

                    return false;
                }
            }
            function clickNS4(e) {
                if (document.layers || document.getElementById && !document.all) {
                    if (e.which === 2 || e.which === 3) {

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
            document.oncontextmenu = new Function("return false");
        </script>
    </body>
</html>

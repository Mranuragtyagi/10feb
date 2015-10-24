<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayment.*,java.sql.*,vicclass.* " %>
<%@ include file="../portalheader.jsp"%> 
<% 
    java.text.DecimalFormat df=new java.text.DecimalFormat("################.00");
     String b="" ;
     String depid="" ;
      String statn="" ;
     String sql="select DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u= new vicclass.User();
     java.sql.Connection con=null;
     con=u.getConnection();
     ArrayList al=new ArrayList();
     java.sql.ResultSet rs=null;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,"A");
        rs=stmt.executeQuery();
        while(rs.next()){
            GenericBean genericbean=new GenericBean();
            genericbean.setDepartmentname(rs.getString("DEPT_NAME"));
            genericbean.setDepartmentid(rs.getString("DEPT_ID"));
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
        Statement st=null; ResultSet rss=null ;
        ArrayList ar = new ArrayList();
        try {
             st = con.createStatement();
            String sqll = "select * from states";
             rss = st.executeQuery(sqll);
            while (rss.next()) {
                State s = new State();
                s.STATE_CODE = rss.getString("STATE_CODE");
                s.STATE_NAME = rss.getString("STATE_NAME");
                ar.add(s);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
     
  finally{               
             try{
                 if(st !=null)
                     st.close();
                 if(rss!=null)
                     rss.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }
        
%>

<% GenericBean gbean=request.getAttribute("genericbean")!=null?(GenericBean)request.getAttribute("genericbean"): new GenericBean() ;
   if(gbean!=null){
   String addr=gbean.getAddress() ;
    b=gbean.getPeriodtype().equals("")?"":gbean.getPeriodtype();
    depid=gbean.getDepartmentid()==null?"":gbean.getDepartmentid();
     statn=gbean.getStatecode()!=null?gbean.getStatecode() : "" ;
   }
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>unregistered</title>
    <script type="text/javascript" src="<%=ccp%>/script/jquery-latest.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=ccp%>/css/jquerycss/jquery-ui.css" >


    <script type="text/javascript" language="javascript" src="<%=ccp%>/script/jquery-1.8.2.js"></script>        
    <script type="text/javascript" language="javascript" src="<%=ccp%>/script/jquery-ui.js"></script>
    <script type="text/javascript">
        function tax_period(t_type){
            var tpmonth=document.getElementById("tpmonth");
            var tpquarter=document.getElementById("tpquarter");
            var tpperiod=document.getElementById("tpperiod");
            var tpperiodd=document.getElementById("tpperiodd");
            var tphalfyearly=document.getElementById("tphalfyearly");
            var periodyear=document.getElementById("periodyear");
            var periodyearanual=document.getElementById("periodyearanual") ;
            if(t_type=="m"){
                periodyearanual.style.display="none" ;
                periodyear.style.display="";
                tpmonth.style.display="";
                tpquarter.style.display="none";
                tpperiod.style.display="none";
                tpperiodd.style.display="none";
                tphalfyearly.style.display="none";
            }else if(t_type=="q"){
                periodyearanual.style.display="none" ;
                periodyear.style.display="";
                tpquarter.style.display="";
                tpmonth.style.display="none";
                tpperiod.style.display="none";
                tphalfyearly.style.display="none";
                tpperiodd.style.display="none";
            }else if(t_type=="s"){
                periodyearanual.style.display="none" ;
                tpperiod.style.display="";
                tpperiodd.style.display="";
                tpmonth.style.display="none";
                tpquarter.style.display="none";
                tphalfyearly.style.display="none";
                periodyear.style.display="none";
            }else if(t_type=="o"){
                periodyearanual.style.display="none" ;
                periodyear.style.display="";
                tpperiod.style.display="none";
                tpmonth.style.display="none";
                tpquarter.style.display="none";
                tphalfyearly.style.display="none";
                tpperiodd.style.display="none";
            }else if(t_type=="h"){
                periodyearanual.style.display="none" ;
                periodyear.style.display="";
                tphalfyearly.style.display="";
                tpperiod.style.display="none";
                tpmonth.style.display="none";
                tpquarter.style.display="none";
                tpperiodd.style.display="none";
            }else if(t_type=="a"){
                periodyearanual.style.display="" ;
                periodyear.style.display="none";
                tphalfyearly.style.display="none";
                tpperiod.style.display="none";
                tpmonth.style.display="none";
                tpquarter.style.display="none";
                tpperiodd.style.display="none";
            }
        }
        
        function fieldValidation(){
            var name=document.getElementById("name").value;
            if((document.frm.name.value == "")||(document.frm.name.value == null)){
                alert("Enter the name");
                document.getElementById('name').focus();
                return false;
            }
            var name=document.getElementById("address").value;
            if((document.frm.address.value =="")||(document.frm.address.value == null)){
                alert("Enter the address");
                document.getElementById('address').focus();
                return false;
            }
             var name=document.getElementById("state").value;
            if((document.frm.state.value == '#')||(document.frm.state.value == null)){
                alert("Select the state");
                document.getElementById('state').focus();
                return false;
            }
            var name=document.getElementById("city").value;
            if((document.frm.city.value == '#')||(document.frm.city.value == null)){
                alert("Select the city");
                document.getElementById('city').focus();
                return false;
            }
            var name=document.getElementById("pincode").value;
            var numbers = /^[0-9]+$/;  
            if((document.frm.pincode.value == "")||(document.frm.pincode.value == null)||(document.frm.pincode.value.length != 6)||(!document.frm.pincode.value.match(numbers))){
                alert("Enter the pincode");
                document.getElementById('pincode').focus();
                return false;
            }
            var mobile=document.getElementById("mobile").value;
            var phoneno = /^\d{10}$/;  
            if((document.frm.mobile.value == "")||(document.frm.mobile.value == null)||(!document.frm.mobile.value.match(phoneno))){
                alert("Enter the 10 digit mobile number");
                document.getElementById('mobile').focus();
                return false;
            }
            var emailID=document.frm.email.value;
            atpos = emailID.indexOf("@");
            dotpos = emailID.lastIndexOf(".");
            if (atpos < 1 || ( dotpos - atpos < 2 )){
                alert("Please enter correct email ID");
                document.frm.email.focus() ;
                return false;
            }
              var department=document.getElementById("department").value;
            if((document.frm.department.value == "")||(document.frm.department.value == 'depart')){
                alert("Select the Department");
                document.getElementById('department').focus();
                return false;
            }
            var purpose=document.getElementById("purpose").value;
            if((document.frm.purpose.value == "")||(document.frm.purpose.value == '#')){
                alert("Select the Purpose");
                document.getElementById('purpose').focus();
                return false;
            }
               var amount=document.getElementById("amount").value;
            if((document.frm.amount.value == "")||(document.frm.amount.value == null)){
                alert("Enter the Amount");
                document.getElementById('amount').focus();
                return false;
            } 
            var finalyear=document.getElementById("finalyear").value;
            var taxperiod=document.getElementById("taxperiod").value;
            if(document.frm.department.value == "depart"){
                alert( "Please select Deapartment" );
                document.getElementById('department').focus();
                return false;
            }else if( document.frm.taxperiod.value == "tax_period"){
                alert( "Please Select Tax Period" );
                document.getElementById('taxperiod').focus();
                return false;
            }else if(document.frm.taxperiod.value=='s' && document.frm.fromdate.value.length==0 && document.frm.todate.value.length==0){
                alert('Please Enter period');
                document.getElementById('fromdate').focus();
                return false;
            }else if(document.frm.taxperiod.value=='m'  && document.frm.finalyear.value == "fyear"){                
                alert("Please Select Year");
                document.getElementById('finalyear').focus();
                return false;
            }else if(document.frm.taxperiod.value=='m'  && document.frm.finalyear.value == "fyear"){                
                alert("Please Select Year");
                document.getElementById('finalyear').focus();
                return false;
            }else if(document.frm.taxperiod.value=='a' && document.frm.finalayear.value == "fayear"){                
                alert("Please Select Year");
                document.getElementById('finalayear').focus();
                return false;
            }else{
                document.frm.submit();
            }
        }
        function CompareDates(){
            var str1 = document.getElementById("fromdate").value; 
            var str2 = document.getElementById("todate").value; 
            var dt1  = parseInt(str1.substring(0,2),10); 
            var mon1 = parseInt(str1.substring(3,5),10); 
            var yr1  = parseInt(str1.substring(6,10),10); 
            var dt2  = parseInt(str2.substring(0,2),10); 
            var mon2 = parseInt(str2.substring(3,5),10);
            var yr2  = parseInt(str2.substring(6,10),10); 
            var date1 = new Date(yr1, mon1, dt1);
            var date2 = new Date(yr2, mon2, dt2); 
            if(date2 < date1){
                alert("To date must greater than from date");
                document.getElementById('todate').focus();
                return false; 
            }else{
                return true;
            } 
        }
    </script>
    <script type="text/javascript">
        $(function() {  
             $( "#fromdate").datepicker({changeMonth: true,changeYear: true,yearRange: '2006:2019',dateFormat : 'dd/mm/yy'});
             $( "#todate").datepicker({changeMonth: true,changeYear: true,yearRange: '2006:2019',dateFormat : 'dd/mm/yy'});
        });
    </script>
    <script type="text/javascript">
        function show(){
            $.ajax({
            type: "POST",
            url: "<%=ccp%>/genericpayment/treasuryheadcode.jsp",
            data: {department:$("#department").val(),taxtype: $('#purpose').val()}
            }).done(function(msg){
            $("#myscript").html(msg);
            });
        }
    </script>
    <script type="text/javascript">
        function trimSpaces(){
            s = document.getElementById("remarks").value;
            s = s.replace(/(^\s*)|(\s*$)/gi,"");
            s = s.replace(/[ ]{2,}/gi," ");
            s = s.replace(/\n /,"\n");
            document.getElementById("remarks").value = s;
        }
    </script>
    <script type="text/javascript">
        function trimSpaces1(){
            s = document.getElementById("address").value;
            s = s.replace(/(^\s*)|(\s*$)/gi,"");
            s = s.replace(/[ ]{2,}/gi," ");
            s = s.replace(/\n /,"\n");
            document.getElementById("address").value = s;
        }
    </script>
    <script type="text/javascript" language="javascript">
        /*$(function(){
            $("#state").change(function(){
                $.getJSON("<%=ccp%>/genericpayment/getDistrictBasedOnState.jsp",{'state_code': $(this).val(), ajax: 'true'}, function(res){     
                    var options = '<option value="#">-----SELECT-----</option>';
                    var items = res.list;                        
                    var x = '';
                    for (var i = 0; i < items.length; i++){
                        options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                    }
                    $("#city").html(options);
                })
            })
        });*/ function getState(){
                                     var stateval = $("#state").val();
                                   $.post("<%=ccp%>/JsonService?step=getState&state_code="+stateval, function(data){ 
                                   var items = data.list;
                                     var options = '<option value="#">-------Select------</option>';                                             
                                       var x = '';
                                 
                                          for (var i = 0; i < items.length; i++) {
                                                options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                                            }
                                      
                                       $("#city").html(options);
                               },"json"); 
                           };
        
    </script>
    <script type="text/javascript" language="javascript">
      /*  $(function(){
            $("#department").change(function(){
                $.getJSON("<%=ccp%>/genericpayment/getTaxTypeByDept.jsp",{'dept': $(this).val(), ajax: 'true'}, function(res){
                    var options = '<option value="#">-----SELECT-----</option>';
                    var items = res.list;
                    var x = '';
                    for(var i = 0; i < items.length; i++){
                        options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                    }
                    $("#purpose").html(options);
                })
            })
        });*/
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
    </script>
    <style type="text/css">	
        legend{
            font-size:16px;
            font-weight:bold;
            color:#FFA200
	}
        th{
        font-align:right;
        }
    </style>
    </head>
  <body onload="tax_period('<%=b%>'); trimSpaces1(); trimSpaces()" >
     <div id="content" style="background-color:#FFF;" >
     <form action="<%=ccp%>/GenericServlet" name="frm" id="frm" method="POST">
     <input type="hidden" name="step" id="step" value="1">
     <div align="center"><%= request.getParameter("err")!=null ? request.getParameter("err") : "" %>  </div>
     
     
   <!--  <div class="span12">
<div class="row-fluid">
  <div class="span3" style="margin-right:0px;"><i class="icon-checkk pull-right  "> </i>
 
  25% 
  <div class="progress progress-striped active">
      <div style="width: 100%;" class="bar"></div>
  </div>
  </div>
   <div class="span3" style="margin-left:0px;"><i class="icon-checkk pull-right  "></i>
 
  50% 
  <div class="progress progress-striped active">
      <div class="bar bar-danger" style="width: 100%;"></div>
  </div>
  </div>
   <div class="span3" style="margin-left:0px;"><i class="icon-checkk pull-right  "></i>
 
  75%
  <div class="progress progress-striped active">
      <div class="bar bar-warning" style="width: 100%;"></div>
  </div>
  </div>
   <div class="span3" style="margin-left:0px;"><i class="icon-ok-circle pull-right  "></i>
 
  100% 
  <div class="progress progress-striped ">
      <div style="width: 100%;" class="bar bar-success"></div>
  </div>
  </div>
   </div>
   </div>-->
   
   
  
  <br/>
  
   <div class="span12">
   <div class="Buy-cont-wrap" style="margin-left: 8%;">
				    <div class="tabs-outer" >
					<div class="tabs-cont customer-info-tab tab-active" id="step1">
                                      
						<div class="tabs-order"></div>
						<div align="center">User Details</div>
					</div>
						<div class="tabs-cont delivery-modes-tab tab-active" id="step2">
							<div class="tabs-payment"></div>
							<div align="center"> Tax Info</div>
						</div>
					<div class="tabs-cont order-summary-tab tab-disabled" id="step3"
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
   </div>
   <br/><br/>
     
     
     <div class="span12">
    <fieldset> <legend>Pay Without Registration </legend></fieldset>
     
     <table  class="table table-bordered table-hover" align="center">
      <tr>
        <td><input type="hidden" name="chalan" id="chalan" value=""></td></tr>
      <tr>
        <th>Department:<span style="color:#F00;">* </span></th>
         <td><%if(al!=null){
                Iterator it=al.iterator();
                %>
                <select name="department" id="department" class="span6" onchange="getPurpose();">
                        <option selected="selected" value="depart">-----SELECT-----</option>
                     <%
                        while(it.hasNext()){                          
                            GenericBean cfrb=(GenericBean) it.next();
                            %>                    
                        <!--option value="<%=cfrb.getDepartmentid()!=null?cfrb.getDepartmentid():null%>"><%=cfrb.getDepartmentname()!=null?cfrb.getDepartmentname():""%></option-->
                        <option value="<%=cfrb.getDepartmentid()%>@<%=cfrb.getDepartmentname()%>">
                                        <%=cfrb.getDepartmentname()!=null?cfrb.getDepartmentname():""%>
                        </option>
                         
                    <%}%>
                    </select>
                    <%}%>
                </td>
      </tr>
       <tr>
                <th>Tax Type/Purpose:<span style="color:#F00;">* </span></th>
               <td>  <select id="purpose" name="purpose" onchange="show()">
                        <option value="#">-----SELECT-----</option>
                    </select>
                </td>
                <!--input type="text" name="taxtype"  id="taxtype" required-->
            </tr>
    <tr> 
    <td><input class="span6" type="hidden" readonly="readonly" name="treasuryhead" id="treasuryhead" value="<%=gbean.getTreasuryhead()!=null?gbean.getTreasuryhead():""%>"></td>
    </tr>
     
      <!--tr>      
        <th>Purpose:<span style="color:#F00;">* </span></th>
        <td><select name="purpose" id="purpose" class="span6">
        <option selected="selected" value="">-Select-</option>
            <option value="License" <%=gbean.getPurpose().equals("License")?"selected":""%> >License</option>
            <option value="Loan" <%=gbean.getPurpose().equals("Loan")?"selected":""%>>Loan</option>
            <option value="Case" <%=gbean.getPurpose().equals("Case")?"selected":""%>>Case</option>
            <option value="Fee" <%=gbean.getPurpose().equals("Fee")?"selected":""%>>Fee</option>
            <option value="Stamp Duty" <%=gbean.getPurpose().equals("Stamp Duty")?"selected":""%>>Stamp Duty</option>
            <option value="Others" <%=gbean.getPurpose().equals("Others")?"selected":""%>>Others</option>
        </select></td>
      </tr-->
      <tr>
        <th>Description:</th>
        <td><input type="text" class="span6" name="description" id="description" value="<%=!gbean.getDescription().equals("")?gbean.getDescription() :""%>"></td>
      </tr>
      <tr id="periodyear" style="display:none;">
        <th>Period (year):<span style="color:#F00;">* </span></th>
        <td><select name="finalyear" id="finalyear" class="span6">
        <option selected="selected" value="fyear">-Year-</option>
        <option value="2010" <%=gbean.getFinalyear().equals("2010")?"selected":""%>>2010</option>
        <option value="2011" <%=gbean.getFinalyear().equals("2011")?"selected":""%>>2011</option>
        <option value="2012" <%=gbean.getFinalyear().equals("2012")?"selected":""%>>2012</option>
        <option value="2013" <%=gbean.getFinalyear().equals("2013")?"selected":""%>>2013</option>
        <option value="2014" <%=gbean.getFinalyear().equals("2014")?"selected":""%>>2014</option>
        <option value="2015" <%=gbean.getFinalyear().equals("2015")?"selected":""%>>2015</option>
        </select></td>
        
      </tr>
      
      <tr id="periodyearanual" style="display:none;">
        <th>Period (year):<span style="color:#F00;">* </span></th>
        <td><select name="finalayear" id="finalayear" class="span6">
        <option selected="selected" value="fayear">-Year-</option>
        <option value="2010" <%=gbean.getFinalyear().equals("2010")?"selected":""%>>2010-2011</option>
        <option value="2011" <%=gbean.getFinalyear().equals("2011")?"selected":""%>>2011-2012</option>
        <option value="2012" <%=gbean.getFinalyear().equals("2012")?"selected":""%>>2012-2013</option>
        <option value="2013" <%=gbean.getFinalyear().equals("2013")?"selected":""%>>2013-2014</option>
        <option value="2014" <%=gbean.getFinalyear().equals("2014")?"selected":""%>>2014-2015</option>
        <option value="2015" <%=gbean.getFinalyear().equals("2015")?"selected":""%>>2015-2016</option>
        </select></td>
        
      </tr>
      <tr>
        <th>Type of Period:<span style="color:#F00;">* </span></th>
      <td><select name="taxperiod" id="taxperiod" onchange="tax_period(this.value)" class="span6">
        <option selected="selected" value="tax_period">-Select Period-</option>
        <option value="a" <%=gbean.getPeriodtype().equals("a")?"selected":""%>>Annual</option>
        <!--<option value="h">Half-Yearly</option-->
        <option value="q" <%=gbean.getPeriodtype().equals("q")?"selected":""%>>Quarterly</option>
        <option value="m" <%=gbean.getPeriodtype().equals("m")?"selected":""%>>Monthly</option>
        <option value="s" <%=gbean.getPeriodtype().equals("s")?"selected":""%>>Specific Period</option>
        <!--<option value="o">One Time/Adhoc</option-->
        </select></td>
      </tr>
    <!--        Half Yearly      -->
          <tr id="tphalfyearly" style="display:none;">
            <th>
              Half Yearly
            </th>
            <td>
              <select name="halfyear" style="" class="span6">
                <option value="1">April - September</option>
                <option value="2">October - March</option>
              </select>
            </td>
          </tr>
          <!--        Quarterly      -->
          <tr id="tpquarter" style="display:none;">
            <th>
             Quarter<span style="color:#F00;">* </span>
            </th>
            <td>
              <select name="quarter" class="span6">
                <option value="2" <%=gbean.getQuarter().equals("2")?"selected":""%> >April - June</option>
                <option value="3" <%=gbean.getQuarter().equals("3")?"selected":""%>>July - September</option>
                <option value="4" <%=gbean.getQuarter().equals("4")?"selected":""%>>October - December</option>
                <option value="1" <%=gbean.getQuarter().equals("1")?"selected":""%>>January - March</option>
              </select>
            </td>
          </tr>
          <!--        Specific Period      -->

           <tr id="tpperiod" style="display:none;">
            <th>
              From Date<span style="color:#F00;">* </span> 
            </th>
            <td >
              <input type="text" class="span6" name="fromdate" id="fromdate" value="<%=gbean.getFromdate()!=null?gbean.getFromdate() : null%>" style="width:100px"   maxlength="10"/>
            </td>
            </tr>
            <tr id="tpperiodd" style="display:none;">
            <th>
               To Date <span style="color:#F00;">* </span>
            </th>
            <td >
              <input type="text" name="todate" class="span6" id="todate" value="<%=gbean.getTodate()!=null?gbean.getTodate() : null%>" style="width:100px" onBlur="CompareDates(); " maxlength="10"/>
              
            </td>
            <!--        Monthly      -->
          </tr>
          <tr id="tpmonth" style="display:none;">
            <th>
              Month<span style="color:#F00;">* </span>
            </th>
            <td>
              <select name="month" class="span6">
                <option value="1" <%=gbean.getMonth().equals("1")?"selected":""%>>January</option>
                <option value="2" <%=gbean.getMonth().equals("2")?"selected":""%>>February</option>
                <option value="3" <%=gbean.getMonth().equals("3")?"selected":""%>>March</option>
                <option value="4" <%=gbean.getMonth().equals("4")?"selected":""%>>April</option>
                <option value="5" <%=gbean.getMonth().equals("5")?"selected":""%>>May</option>
                <option value="6" <%=gbean.getMonth().equals("6")?"selected":""%>>June</option>
                <option value="7" <%=gbean.getMonth().equals("7")?"selected":""%>>July</option>
                <option value="8" <%=gbean.getMonth().equals("8")?"selected":""%>>August</option>
                <option value="9" <%=gbean.getMonth().equals("9")?"selected":""%>>September</option>
                <option value="10" <%=gbean.getMonth().equals("10")?"selected":""%>>October</option>
                <option value="11" <%=gbean.getMonth().equals("11")?"selected":""%>>November</option>
                <option value="12" <%=gbean.getMonth().equals("12")?"selected":""%>>December</option>
              </select>
            </td>
          </tr>
          
          <tr>
                <th>Amount:<span style="color:#F00;">* </span></th>
                <td><input type="text" class="span6" name="amount" id="amount" value="<%=gbean.getAmount()!=0.00?df.format(gbean.getAmount()) : ""%>"></td>
          </tr>
      <tr>
        <th>Remarks:</th>
        <td>
        	<textarea style="resize:none; " cols="32" rows="2" name="remarks" id="remarks">
                    <%=gbean.getRemarks()!=null?gbean.getRemarks().trim():""%>
            </textarea>
        </td>
      </tr>
       </table>
     
     <br/>
     
      <legend>Personal Details</legend>
      <table align="center" class="table table-bordered table-hover">
      <tr>
        <th> Name:<span style="color:#F00;">* </span></th>
        <td><input type="text" name="name" class="span6" id="name" value="<%=gbean.getDlrname()!=null?gbean.getDlrname():""%>"></td>
      </tr>
      <tr>
        <th>Address:<span style="color:#F00;">* </span></th>
        <td><textarea style="resize:none; " cols="15" rows="2"  name="address" class="span6"  id="address" > <%=gbean.getAddress()!=null?gbean.getAddress().trim():""%></textarea></td>
      </tr>
      <tr>
        <th>State<span style="color:#F00;">* </span></th>
        <td>
       <%if(ar!=null){
                Iterator it=ar.iterator();
                %>
                <select name="state" id="state" class="span6" onchange="getState();">
                        <option selected="selected" value="#">-------SELECT------- </option>
                     <% while(it.hasNext()){
                         State s = (State)it.next();
                     %>
                         <option value="<%=s.STATE_CODE%>"  
                         
                           <%=s.STATE_CODE==statn? "SELECTED": null%>>
                                        <%=s.STATE_NAME!=null?s.STATE_NAME:""%>
                          </option>
                     <%}%>
                    </select>
                <%}%>
       <!--input type="text" name="state" class="span6" id="state" value="<%=gbean.getState()!=null?gbean.getState():""%>" -->
        </td>
      </tr>
      <tr>
      <th>City<span style="color:#F00;">* </span></th>
      <td>
                                            <select id="city" name="city"  class="span6" >
                                            	<option value="#">-------SELECT------- </option>
                                            </select>
                                        </td>
        <!--td><input type="text" name="city" class="span6" id="city" value="<%=gbean.getCity()!=null?gbean.getCity():""%>"></td-->
      </tr>
      <tr>
        <th>Pin Code<span style="color:#F00;">* </span></th>
        <td><input type="text" name="pincode" class="span6" id="pincode"  maxlength="6" value="<%=gbean.getPincode()!=null?gbean.getPincode():""%>"></td>
      </tr>
      <tr>
        <th>Mobile No:<span style="color:#F00;">* </span></th>
        <td><input type="text" name="mobile" class="span6"  id="mobile" maxlength="10" value="<%=gbean.getMobile()!=null?gbean.getMobile():""%>"></td>
      </tr>
      <tr>
        <th>Email-Id:<span style="color:#F00;">* </span></th>
        <td><input type="text" name="email" class="span6" id="email" value="<%=!gbean.getEmail().equals("")?gbean.getEmail():""%>"></td>
      </tr>
    </table>
  
    <div align="center">
    <input type="button" value="Submit"  class="btn-success" onclick="fieldValidation();" style="margin:20px;">
    <input type="reset" value="Reset" class="btn-success" style="margin:20px;">
    </div>
    </div>
    <div id="myscript">
    </div>
    <div id="myscript1">
    </div>
    </form>
    </div>
    </body>
     <%@ include file="../portalfooter.jsp" %>
</html>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" errorPage="/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
 String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
%>



<%
String mssg=StringEscapeUtils.escapeHtml(request.getParameter("mssg")!=null?request.getParameter("mssg"):"") ;
 String rnd=request.getSession().getAttribute("rnd").toString();
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
String err=StringEscapeUtils.escapeHtml(request.getParameter("error")!=null ?request.getParameter("error"): "" );

   java.sql.Statement st=null; java.sql.ResultSet rss=null ;
        java.util.ArrayList ar = new java.util.ArrayList();
        java.sql.Connection con=null ;
        try {
        vicclass.User u=new vicclass.User();
        u.createConnection();
         con=u.getConnection();
             st = con.createStatement();
            String sqll = "select * from states";
             rss = st.executeQuery(sqll);
            while (rss.next()) {
                vicclass.State s = new vicclass.State();
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
                 if(con!=null)
                    con.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }


%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>E generic Payment</title>

 
</head>

<body>
                  <div id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">

            <div class="modal-header">
                <a class="pull-right" data-dismiss="modal" aria-hidden="true"><i class="icon-remove" style="cursor: pointer"></i></a>
                <h4><i class="icon-th-large  pull-left" style="margin-right: 10px;margin-top: 2px"></i>Register yourself</h4>
            </div>

            <div class="modal-body">
            <div class="span3 well">
                    <form accept-charset="UTF-8"  id="signupForm" action="<%=ccp%>/GenericServlet?step=3" method="post">
                    <div><font color="Red"><%=err%></font></div>
                       <label>FULL NAME<span style="color:#F00;">* </span></label><input class="span3"  id="firstname" name="firstname" placeholder="Full Name" type="text" required> <br/>
                       <label> EMAIL_ID</label> <input class="span3" id="email" name="email" placeholder="Email_id" type="text" required><br/>
                       <label> PHONE#</label><input class="span3" id="phonenumber" name="phonenumber" placeholder="Phone Number" type="text" required><br/>
                        <label>ADDRESS</label><input class="span3" id="address" name="address" placeholder="Address" type="text" required><br/>
                        <!--label>City</label><input class="span3" id="city" name="city"  placeholder="City" type="text" required--></br>
                       <label> State</label>
                       
                        <%if(ar!=null){
                java.util.Iterator it=ar.iterator();
                %>
                  <select name="state" id="state" class="">
                        <option selected="selected" value="#">-------SELECT------- </option>
                     <% while(it.hasNext()){
                         vicclass.State s = (vicclass.State)it.next();
                     %>
                         <option value="<%=s.STATE_CODE%>" ><%=s.STATE_NAME%> </option>
                     <%}%>
                    </select>
                <%}%>
                       
                       <label>City</label>
                                <select id="city" name="city"  class="" >
                                    <option value="#">-----SELECT-----</option>
                        </select>
        
                       <!--input class="span3" id="state" name="state" placeholder="State" type="text" required--><br/>
                       <label> Pin-Code</label><input class="span3" id="pincode" name="pincode" placeholder="Pincode" type="text" required><br/>
                       <label> Select Question</label><select  id="question" name="question">
                             <option value="Your Hoobies"selected>Your Hoobies</option>
                             <option value="Your Place Of Birth">Your Place Of Birth</option>
                             <option value="Your First School Name">Your First School Name</option>
                             <option value="Your First Cell Phone Company Name" >Your First Cell Phone Company Name</option>
                        </select>  <br/>
                        <label> Enter Answer</label><input class="span3" id="eanswer" name="eanswer" placeholder="Enter Answer" type="text" required><br/>
                      <label> PASSWORD</label> <input class="span3" id="password1" name="password1" placeholder="Password" type="password" required><br/>
                      <label> CONFIRM_PASSWORD</label> <input class="span3" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" type="password" required><br/>

                       <button class="btn btn-warning" type="submit"> Sign up </button> 
                       <button class="btn btn-warning" id="Sresets" type="reset" > Reset </button>
                       
                    </form>
                </div>
            </div>
            
               </div>
</body>
</html>
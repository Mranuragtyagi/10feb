<%String ccp_menu = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
  <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;Department</span></a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/listDept.jsp?x=<%=Math.random()%>"><i class="fa fa-list"></i>&nbsp;List</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/adddepartment.jsp?x=<%=Math.random()%>"><i class="fa fa-plus-square-o -sign "></i>&nbsp;Add</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/modifyAdminDepartment.jsp?x=<%=Math.random()%>"><i class="fa fa-edit"></i>&nbsp;Modify</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/unlockDept.jsp?x=<%=Math.random()%>"><i class="fa fa-unlock"></i>&nbsp;Trash</a></li>
                </ul>	
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;Branch Office</span></a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/listBranches.jsp?x=<%=Math.random()%>"><i class="fa fa-list"></i>&nbsp;List</a></li>                                                        
                    <li><a href="<%=ccp_menu%>/adminpayment/branchlocation.jsp?x=<%=Math.random()%>"><i class="fa fa-plus-square-o -sign "></i>&nbsp;Add</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/modifyDepartmentLocation.jsp?x=<%=Math.random()%>"><i class="fa fa-edit"></i>&nbsp;Modify</a></li>
                    <%--<li><a href="<%=ccp_menu%>/adminpayment/unlockDepartmentLocation.jsp"><i class="fa fa-unlock"></i>&nbsp;Trash</a></li> --%>
                </ul>	
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;Major Tax</span></a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/listMajorTax.jsp?x=<%=Math.random()%>"><i class="fa fa-list"></i>&nbsp;List</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/addMajorTax.jsp?x=<%=Math.random()%>" class="submenu"><i class="fa fa-plus-square-o -sign"></i>&nbsp;Add</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/modifyMajorTax.jsp?x=<%=Math.random()%>" class="submenu"><i class=" fa fa-edit "></i>&nbsp;Modify</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/unlockMajorTax.jsp?x=<%=Math.random()%>"><i class=" fa fa-unlock "></i>&nbsp;Trash</a></li>
                </ul>	
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;SubTax or Fee Type</span></a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/listTaxPurposes.jsp?x=<%=Math.random()%>"><i class="fa fa-list"></i>&nbsp;List</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/addtax.jsp?x=<%=Math.random()%>"><i class="fa fa-plus-square-o -sign "></i>&nbsp;Add</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/modifyTax.jsp?x=<%=Math.random()%>"><i class=" fa fa-edit "></i>&nbsp;Modify</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/unlockTax.jsp?x=<%=Math.random()%>"><i class=" fa fa-unlock "></i>&nbsp;Trash</a></li>
                </ul>	
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;ID Proof</span></a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/listIdProof.jsp?x=<%=Math.random()%>"><i class="fa fa-list"></i>&nbsp;List</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/addIdProof.jsp?x=<%=Math.random()%>"><i class="fa fa-plus-square-o -sign "></i>&nbsp;Add</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/modifyIdProof.jsp?x=<%=Math.random()%>"><i class=" fa fa-edit "></i>&nbsp;Modify</a></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/unlockIdProof.jsp?x=<%=Math.random()%>"><i class=" fa fa-unlock "></i>&nbsp;Trash</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="dropmenu"><i class="fa fa-th fa fa-white"></i>&nbsp;Reports</a>
                <ul>
                    <li class="bg"> <a href="<%=ccp_menu%>/GenericAdminServlet?step=14&reportType=DD&csrfPreventionSalt=<%= request.getAttribute("csrfPreventionSalt")%>" >&nbsp;Department Details</a> </li>
                    <li class="bg"> <a href="<%=ccp_menu%>/GenericAdminServlet?step=14&reportType=DWPD&csrfPreventionSalt=<%= request.getAttribute("csrfPreventionSalt")%>">&nbsp;Date Wise Payment Details </a> </li>
                    <li class="bg"> <a href="<%=ccp_menu%>/GenericAdminServlet?step=14&reportType=CD&csrfPreventionSalt=<%= request.getAttribute("csrfPreventionSalt")%>" >&nbsp;Challan Details</a>  </li>
                    <li class="bg" > <a href="<%=ccp_menu%>/GenericAdminServlet?step=14&reportType=PTRI&csrfPreventionSalt=<%= request.getAttribute("csrfPreventionSalt")%>">&nbsp;Payment Through Registered and Instant</a></li>
                    <li class="bg" > <a href="<%=ccp_menu%>/adminpayment/failTransaction.jsp?x=<%=Math.random()%>">&nbsp;Failed Transactions</a></li>
                </ul>
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;User Management</span> </a>
                <ul>
                    <li><a href="<%=ccp_menu%>/GenericAdminServlet?step=1&csrfPreventionSalt=<%= request.getAttribute("csrfPreventionSalt")%>"><i class="fa fa-plus-square-o -sign"></i>&nbsp;Add User</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/askAdminUserName.jsp?x=<%=Math.random()%>"><i class="fa fa-edit"></i>&nbsp;Modify User</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;Reconciliation</span> </a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/uploadSettleTxt.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;Payment Settlement</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=ccp_menu%>/adminpayment/settleList.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;History</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;Department Integration</span> </a>
                <ul>
                    <li><a href="<%=ccp_menu%>/dept_integration/department_info.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;Integrate User Dept</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=ccp_menu%>/dept_integration/department_view.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;View User Dept</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
            <li>
                <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">&nbsp;WebServices Integration</span> </a>
                <ul>
                    <li><a href="<%=ccp_menu%>/adminpayment/addIp.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;Add client details</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
             <li>
               <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet"> Master year</span> </a>
               <ul>
                   <li><a href="<%=ccp_menu%>/adminpayment/addAnnualYear.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;Annual</a></li>
                   <li><a href="<%=ccp_menu%>/adminpayment/addMonthYear.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;Quarterly/Monthly</a></li>
                   <li class="divider"></li>
               </ul>
           </li>
           <li>
               <a class="dropmenu" href="#"><i class="fa fa-plus-square-o "></i><span class="hidden-tablet">XML Generation</span> </a>
               <ul>
                   <li><a href="<%=ccp_menu%>/adminpayment/xmlGeneration.jsp?x=<%=Math.random()%>"><i class="fa fa-th fa fa-white"></i>&nbsp;XML</a></li>
                   <li class="divider"></li>
               </ul>
           </li>
            <%--li><a href="<%=ccp_menu%>/adminpayment/comtaxXml.jsp"><i class="fa fa-th fa fa-white"></i>&nbsp;Comtax Xml</a></li--%>
            <%--<li><a href="#"><i class="fa fa-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>--%>		
        </ul>
    </div>
</div>
<noscript>
<div class="alert alert-block span10">
    <h4 class="alert-heading">Warning!</h4>
    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
</div>
</noscript>
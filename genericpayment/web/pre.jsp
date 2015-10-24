Java 1.6.0 or later <%=System.getProperty("java.version")%><br> 
			   Server Version: <%= application.getServerInfo() %><br> 
               Servlet Version: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %><br>
               JSP Version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %> <br>
		
           <%    
               
             
String sVersion = System.getProperty("java.version");
sVersion = sVersion.substring(0, 3);
Float f = Float.valueOf(sVersion);
if (f.floatValue() < (float) 1.4) {
    System.out.println("Java version too low ....");
    System.exit(1);
}
%>
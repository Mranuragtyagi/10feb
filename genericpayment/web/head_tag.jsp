<%
String ccp1="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Government of Jharkhand Electronic Revenue Receipt Portal</title>
<link rel="shortcut icon" href="<%=ccp1%>/images/favicon.ico" />
<link rel="stylesheet" href="<%=ccp1%>/Bootstrap2.2/css/bootstrap_s.css" type="text/css"> 
<link rel="stylesheet" href="<%=ccp1%>/Bootstrap2.2/css/bootstrap-responsive.css" type="text/css">
<link rel="stylesheet" href="<%=ccp1%>/font-awesome/css/font-awesome.min.css" type="text/css">
        <script type="text/javascript" src="<%=ccp1%>/jquery/jquery1.8.3.js"></script>
        <script type="text/javascript" src="<%=ccp1%>/Bootstrap2.2/js/bootstrap.js"></script>
    <script type="text/javascript">
var message="Right Click Disabled!";
   function clickIE4(){
       if (event.button==2){
       alert(message);
       return false;
       }
   }
function clickNS4(e){
   if (document.layers||document.getElementById&&!document.all){
       if (e.which==2||e.which==3){
           alert(message);
           return false;
       }
   }
}
if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
} else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}
document.oncontextmenu=new Function("alert(message);return false")
</script>    


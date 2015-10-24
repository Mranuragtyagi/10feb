<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ include file="head_tag.jsp"%> 
<%@ page import="genericepayment.*"  %>
<%
GenericBean gb=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
String dlrname=gb.getDlrname()!=null?gb.getDlrname(): "";
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
%>
</head>
<body>
<div class="container">
 <div class="content">
  <div class="wrapper">
   <div class="row">
     <div class="span12">
      <div class="row-fluid roundbox">
     
    <%@ include file="header.jsp"%>  
                                     
 <div class="span12">

   <div class="span12">
  <div class="row-fluid">    
  
    
    
     <div class="span12"> 
     
     
     
     
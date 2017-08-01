<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css">
<title>학생관리</title>
</head>
<body>
<div  id="wrapper">
<header>
	<h3 id="title">학생관리</h3>
	<% String now=new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss").format(new Date()); %>
	<div id=clock><%=now %></div>
	</header>
	<div id="href_div">
	<a href="<%=request.getContextPath() %>/login.jsp">LOGOUT</a><a href="<%=request.getContextPath() %>/member/member.jsp">MAIN</a>	
	</div>S
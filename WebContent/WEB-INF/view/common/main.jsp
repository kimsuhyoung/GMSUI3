<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="sun.security.util.DerValue"%>
<%@ page import="java.text.SimpleDateFormat" import="java.util.Date" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/member.css">
<body>
	<jsp:include page="main_head.jsp"/>
		<div id="container">
		<table id="index-tab">
			<tr id="index-tab-tr">
				<th><i class="glyphicon glyphicon-user">학생관리</i></th>
				<th><i class="glyphicon glyphicon-cloud">성적관리</i></th>
				<th><i class="glyphicon glyphicon-thumbs-up">게시판</i></th>
				
			</tr>

			<tr>
				<td>
					<ul class="index-ul">
						
						<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_list">학생 목록</a></li>
						<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_add">학생정보 추가</a></li>
						<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_detail">학생 상세정보</a></li>
						<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_update">학생정보 수정</a></li>
						<li><a href="<%=request.getContextPath() %>/member.do?action=move&page=member_delete">탈퇴</a></li>
					</ul>
					
				</td>
				<td>
					<ul class="index-ul">
						<li><a href="<%=request.getContextPath() %>/grade/grade_add.jsp">성적입력</a></li>
						<li><a href="<%=request.getContextPath() %>/grade/grade_list.jsp">성적목록</a></li>
						<li><a href="<%=request.getContextPath() %>/grade/grade_detail.jsp">성적상세</a></li>
						<li><a href="<%=request.getContextPath() %>/grade/grade_update.jsp">성적수정</a></li>
						<li><a href="<%=request.getContextPath() %>/grade/grade_delete.jsp">성적삭제</a></li>
					</ul>
				</td>
				<td>
					<ul class="index-ul">
						<li><a href="<%=request.getContextPath() %>/board/board_write.jsp">게시글 쓰기</a></li>
						<li><a href="<%=request.getContextPath() %>/board/board_list.jsp">게시글 목록</a></li>
						<li><a href="<%=request.getContextPath() %>/board/board_update.jsp">게시글 수정</a></li>
						<li><a href="<%=request.getContextPath() %>/board/board_delete.jsp">게시글 삭제</a></li>
					</ul>
				</td>
			</tr>

		</table>
		</div>
		
		
		<div id="footer">
		
		<jsp:include page="footer.jsp"/>
		
		</div>

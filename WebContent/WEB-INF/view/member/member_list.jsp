<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/common/main_head.jsp" %>


		<div id="container">
		<!-- id,pw,ssn,name,regdate,email,major,subject,phone -->
		<table border="1" id="member-list-tab">
			<tr>
				<th>N0.</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>학점</th>
				<th>학과</th>
				<th>기타</th>
			</tr>

			<tr>
				<td></td>	
				<td><a href="<%=request.getContextPath()%>/member/member_detail.jsp?id="></a></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="<%=request.getContextPath() %>/member/member_update.jsp?id=">수정</a>
					
					<a href="<%=request.getContextPath() %>/member/service_delete.jsp?id=">삭제</a>
				</td>
				
			</tr>

		</table>
	</div>
	<div id="footer">
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
		</div>
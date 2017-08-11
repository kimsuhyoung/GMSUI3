<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/common_head.jsp"/>
<div class="jumbotron text-center">
	<h1>상세정보</h1>
</div>

	<div id="container">
	<table id="member_detail_tab">
		<tr >
			<td colspan="2" rowspan="3" width="10%">  </td>
			<td width="20%">이름</td>
			<td width="70%"></td>
			
		</tr>
		<tr>
			<td>아이디</td>
			<td></td>
		</tr>
		<tr>
			
			<td>생년월일</td>
			<td></td>
		</tr>
		<tr>
			<td width="10%">전화</td>
			<td colspan="3" width="90%"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td  colspan="3"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td  colspan="3"></td>
		</tr>
		<tr>
			<td>전공</td>
			<td  colspan="3"></td>
		</tr>
		<tr>
			<td>과목</td>
			<td  colspan="3"></td>
			
		</tr>

	</table>
		
	<button id="list_btn" onclick="javascript:golist()">목록</button>
	<button id="update_btn" onclick="javascript:goupdate()">수정</button>


</div>
	<script type="text/javascript">
	function golist(){
		location.href="${ctx}/member_list.jsp";
	}
	function goupdate(){
		location.href="${ctx}/member_update.jsp?id=&name=&birth=&email=&phone=&addr=&major=&subject=";
	}
	
	</script>
	
	<div id="footer">
		<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
		</div>
	
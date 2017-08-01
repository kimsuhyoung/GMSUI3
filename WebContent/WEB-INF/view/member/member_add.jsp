<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/view/common/main_head.jsp" %>
		

	<div id="div-style">
	<form action="<%=request.getContextPath() %>/member/service_add.jsp" id="joinform" method="get">
	<fieldset>
		<legend>Join information</legend>
		<span id="span-form">ID</span>
			<input name="id" type="text" placeholder="아이디">&nbsp;<button>중복확인</button><br>
		<span id="span-form">Password</span>
			<input name="password" type="password" placeholder="비밀번호"><br>
		<span id="span-form">NAME</span>
			<input name="name" type="text" placeholder="이름"><br>
		<span id="span-form">주소</span>
			<input name="addr" type="text" placeholder="주소"><br>
		<span id="span-form">전화번호</span>
			<input name="phone" type="text" placeholder="전화번호"><br>
		
		<span id="span-form">생년월일</span>
			<input name="birthday" type="text" placeholder="생년월일">
			<br>
		<span >성별</span>
			<input name="gender" type="radio" value="남자" checked="checked">남성
			<input name="gender" type="radio" value="여자">여성<br>
			<span id="span-form">E-Mail</span>
		<input type="text" name="email"><br>
			<h4>전공</h4>
		<select name="major">
			<option value="computer" selected>컴퓨터공학</option>
			<option value="economics">경제학</option>
			<option value="tourism">관광학</option>
			<option value="art">미술학</option>
		</select>
		<br>
		<h4>수강과목</h4>	
		<input type="checkbox" name="subject" value="자바" checked>자바	<br>	
		<input type="checkbox" name="subject" value="HTML">HTML<br>
		<input type="checkbox" name="subject" value="SQL">SQL<br>
		<input type="checkbox" name="subject" value="CSS">CSS<br>
		<input type="checkbox" name="subject" value="자바스크립스">자바스크립스<br>
		<input type="checkbox" name="subject" value="C언어" checked>C언어<br>
		<input type="checkbox" name="subject" value="파이썬">파이썬<br><br>
			
		<input type="submit" value="등록" id="sub-btn">
		<input type="reset" value="다시입력" id="reset-btn">
	
	</fieldset>
	</form>
	</div><div id="footer">
		<%@ include file="/WEB-INF/view/common/footer.jsp" %>
		</div>
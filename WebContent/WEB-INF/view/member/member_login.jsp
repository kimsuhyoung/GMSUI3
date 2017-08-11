<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/view/common/main_head.jsp"/>

	
		<!-- 로그인화면  -->
		<div id="container-login">
			<a href="../index.jsp" id="google"><img src="../img/google.jpg" /></a><br>
			<div id="contatiner-form">
				<form action="">
					<fieldset>
						<legend>Login</legend>
						<span id="span-form">ID</span> 
						<input type="text" name="id" placeholder="ID는 숫자 포함 8자 이내"><br> 
						<span id="span-form">PASSWORD</span>
						<input name="pw" type="password" placeholder="비밀번호"><br><br>
						<button onclick="window.location.href='member/member_detail.html'" id="ok-btn">로그인</button>
					
					</fieldset>
				</form>
					<button onclick="window.location.href='../index.html'" id="cancle-btn">취소</button>
					<button onclick="location.href='member_add.html'" id="log-btn">회원가입</button>
			</div>
		</div>
	<div id="footer">
		<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
		</div>

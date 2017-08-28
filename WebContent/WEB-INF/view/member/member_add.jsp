<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/common_head.jsp"/>
<div class="jumbotron text-center">
	<h1>학생추가</h1>
</div>
	<div id="div-style">
	<form id="join_form" onsubmit="gomember()"><!--포스트 방식을 사용할 때 이렇게 하면 된다.  -->
	<fieldset>
		<legend>Join information</legend>
		<span id="span-form">ID</span>
			<input id="id" name="id" type="text" placeholder="아이디">&nbsp;<button>중복확인</button><br>
		<span id="span-form">Password</span>
			<input id="password" name="password" type="password" placeholder="비밀번호" value="1"><br>
		<span id="span-form">NAME</span>
			<input id="name" name="name" type="text" placeholder="이름" value="이길동"><br>
		<span id="span-form">주소</span>
			<input id="addr" name="addr" type="text" placeholder="주소"><br>
		<span id="span-form">전화번호</span>
			<input id="phone" name="phone" type="text" placeholder="전화번호"><br>
		
		<span id="span-form">생년월일</span>
			<input id="birthday" name="birthday" type="text" value="2000-05-05" placeholder="생년월일">
			<br>
		<span >성별</span>
			<input name="gender" type="radio" value="남자" checked>남성
			<input name="gender" type="radio" value="여자">여성<br>
			<span id="span-form">E-Mail</span>
		<input type="text" name="email" value="leegd@test.com"><br>
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
		<input type="checkbox" name="subject" value="HTML" checked>HTML<br>
		<input type="checkbox" name="subject" value="SQL">SQL<br>
		<input type="checkbox" name="subject" value="CSS">CSS<br>
		<input type="checkbox" name="subject" value="자바스크립스">자바스크립스<br>
		<input type="checkbox" name="subject" value="C언어" checked>C언어<br>
		<input type="checkbox" name="subject" value="파이썬">파이썬<br><br>
			
		<input type="submit"  value="등록" id="sub-btn" onclick="gomember()">
		<input type="reset" value="다시입력" id="reset-btn">
		<input type="hidden" name="page" value="main"/> 
        <input type="hidden" name="action" value="add"/> 
	
	</fieldset>
	</form>
	</div><div id="footer">
		<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
		</div>
		
		<script>
		function gomember () {
			
			var form=document.getElementById("join_form");/*첫번째로 폼 태그를 DOM객체로 만들어야 한다  */
			/* form.action="${ctx}/member.do"; *//*set Attribute를 하지 않는 이유는 action은 변하면 안되는 값이기 때문에 스태틱값으로 지정을 해줘야한다. (사실 어트리뷰트도 가능하다.)*/
			/* form.method="get"; *//*이유는 위와 같다.*/
			form.setAttribute('action','${ctx}/member.do');
			form.setAttribute('method','post');               /*post 방식 사용할때  get방식은 location.href로 처리하는게 훨 씬 좋다. */
			var input_id = document.getElementById('id').value;
			var input_password = document.getElementById('password').value;
			var input_name = document.getElementById('name').value;
			var input_addr = document.getElementById('addr').value;
			var input_phone = document.getElementById('phone').value;
			var input_birthday = document.getElementById('birthday').value;
			
			if(input_id===""){
				alert('id를 입력하세요')
				return false;
			}
			if(input_password===""){
				alert('비밀번호를 입력하세요')
				return false;
			}
			if(input_name===""){
				alert('이름을 입력하세요')
				return false;
			}
			
			if(input_addr===""){
				alert('주소를 입력하세요')
				return false;
			}
			if(input_phone===""){
				alert('전화번호를 입력하세요')
				return false;
			}
			if(input_birthday===""){
				alert('생년월일을 입력하세요')
				return false;
			}
			
			var form = document.getElementById('joinform');
				form.action="${ctx}/member.do";
				form.method="post";
				return true;
		}
		return true;
		</script>
		
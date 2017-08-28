<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common_head.jsp"/>
<div class="jumbotron text-center">

	<h1>Grade Management System</h1>
</div>
<link rel="stylesheet" href="resources/css/member.css">
<body>	
	 <div class="container">
	 	<div class="row">
	 		<div class="col-sm-4">
	 			<h3>학생관리</h3>
	 				<ul id="main_ul_stu">
						<li><a>학생 목록</a></li>
						<li><a>학생정보 추가</a></li>
						<li><a>학생 상세정보</a></li>
						<li><a>학생정보 수정</a></li>
						<li><a>탈퇴</a></li>
					</ul> 
			
		
		 </div>
	 		<div class="col-sm-4">
	 			<h3>성적관리</h3>
	 				<ul id="main_ul_grade">
						<li><a>성적입력</a></li>
						<li><a>성적목록</a></li>
						<li><a>성적상세</a></li>
						<li><a>성적수정</a></li>
						<li><a>성적삭제</a></li>
					</ul>
			
			 </div>
		 
	 		<div class="col-sm-4">
	 			<h3>게시글 관리</h3>
	 				<ul id="main_ul_board">
						<li><a>게시글 쓰기</a></li>
						<li><a>게시글 목록</a></li>
						<li><a>게시글 수정</a></li>
						<li><a>게시글 삭제</a></li>
					</ul>
					
	 		</div>
		 </div> 
	 </div>
	
		<div id="footer">
		
		<jsp:include page="footer.jsp"/>
		
		</div>
		
<script>
window.onload=mainLoad();/*브라우져가 실행되면 mainLoad가 실행되게 해라  */
</script>

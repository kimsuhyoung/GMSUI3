<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common_head.jsp"/>
<div class="jumbotron text-center">

	<h1>Grade Management System</h1>
</div>
<link rel="stylesheet" href="${css}/resources/css/member.css">
<body>	
	 <div class="container">
	 	<div class="row">
	 		<div class="col-sm-4">
	 			<h3>학생관리</h3>
	 				<ul class="list-group">
						<li class="list-group-item"><a onclick="moveTo('member','move','member_list')" >학생 목록</a></li>
						<li class="list-group-item"><a onclick="moveTo('member','move','member_add')" >학생정보 추가</a></li>
						<li class="list-group-item"><a onclick="moveTo('member','move','member_detail')" >학생 상세정보</a></li>
						<li class="list-group-item"><a onclick="moveTo('member','move','member_update')" >학생정보 수정</a></li>
						<li class="list-group-item"><a onclick="deleteTarget('아이디를')">탈퇴</a></li>
					</ul> 
			
		
		 </div>
	 		<div class="col-sm-4">
	 			<h3>성적관리</h3>
	 				<ul class="list-group">
						<li class="list-group-item"><a onclick="moveTo('grade','move','grade_add')">성적입력</a></li>
						<li class="list-group-item"><a onclick="moveTo('grade','move','grade_list')">성적목록</a></li>
						<li class="list-group-item"><a onclick="moveTo('grade','move','grade_detail')">성적상세</a></li>
						<li class="list-group-item"><a onclick="moveTo('grade','move','grade_update')">성적수정</a></li>
						<li class="list-group-item"><a onclick="deleteTarget('성적을 가진 사람의 이름을')">성적삭제</a></li>
					</ul>
			
			 </div>
		 
	 		<div class="col-sm-4">
	 			<h3>게시글 관리</h3>
	 				<ul class="list-group">
						<li class="list-group-item"><a onclick="moveTo('board','move','board_write')">게시글 쓰기</a></li>
						<li class="list-group-item"><a onclick="moveTo('board','move','board_list')">게시글 목록</a></li>
						<li class="list-group-item"><a onclick="moveTo('board','move','board_update')">게시글 수정</a></li>
						<li class="list-group-item"><a onclick="deleteTarget('게시글의 제목을')">게시글 삭제</a></li>
					</ul>
					
	 		</div>
		 </div> 
	 </div>
	
		<div id="footer">
		
		<jsp:include page="footer.jsp"/>
		
		</div>
		

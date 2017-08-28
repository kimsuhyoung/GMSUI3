<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a onclick="moveTo('common','main')"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
      <li class="dropdown">
      <a href="#" class="dropdown-toggle" 
      data-toggle="dropdown" role="button" 
      aria-haspopup="true" 
      aria-expanded="false">화원관리<span class="caret">
      </span></a>
      <ul id="navbar_ul_stu">
      <li><a>학생추가</a></li>
      <li><a>학생목록</a></li>
      <li><a>학생조회</a></li>
      <li></li>
      <li><a>학생삭제</a></li>
      </ul>
      
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" 
      data-toggle="dropdown" role="button" 
      aria-haspopup="true" 
      aria-expanded="false">성적관리<span class="caret">
      </span></a>
      <ul id="navbar_ul_grade">
      <li><a>성적추가</a></li>
      <li><a>성적목록</a></li>
      <li><a>성적조회</a></li>
      <li></li>
      <li><a>성적삭제</a></li>
      </ul>
      </li>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" 
      data-toggle="dropdown" role="button" 
      aria-haspopup="true" 
      aria-expanded="false">게시글관리<span class="caret">
      </span></a>
      <ul id="navbar_ul_board">
      <li><a>게시글쓰기</a></li>
      <li><a>게시글목록</a></li>
      <li><a>게시글조회</a></li>
      <li></li>
      <li><a>게시글삭제</a></li>
      </ul>
      </li>      
    </ul>
    <span class="float-right">${sessionScope.user.name} &nbsp; <a id="logout">로그아웃</a> </span>
  </div>
</nav>   

<script>
window.onload=navbarLoad();

function logout(dir,page){
	 location.href="${ctx}/"+dir+".do?action=logout&page="+page;		
	}

	function moveTo(dir,page){
		 location.href="${ctx}/"+dir+".do?action=move&page="+page;		
		}

	function deleteTarget(target){
	 prompt("삭제할 "+target+" 입력하세요")
	} 

	function list(dir,page,pageNumber){
		location.href="${ctx}/"+dir+".do?action=list&page="+page+"&pageNumber="+pageNumber;
	}
	
	
	/* 함수를 맨 위에 올려놓아도 실행하는것에 이상이 없는 것은 자바스크립트의 hoisty 특징 때문이다.  */

/* function logoutAlert (){
alert("로그아웃");
location.href="${ctx}/common.do?action=logout&page=index"
} */
/* a태그는 바로 location.href=""로 어디로 넘겨줄지만 정하면 된다. */

function mainLoad(){
	
	var main_stu=document.getElementById("main_ul_stu");
	var main_grade=document.getElementById("main_ul_grade");
	var main_board=document.getElementById("main_ul_board");
	main_stu.setAttribute("class","list-group");
	main_grade.setAttribute("class","list-group");
	main_board.setAttribute("class","list-group");
	var main_stu_c=main_stu.children;
	var main_grade_c=main_grade.children;
	var main_board_c=main_board.children;

	var i;
	for(i=0;i<main_stu_c.length;i++){
		main_stu_c[i].setAttribute("class","list-group-item");
	}
	for(i=0;i<main_grade_c.length;i++){
		main_grade_c[i].setAttribute("class","list-group-item");
	}
	for(i=0;i<main_board_c.length;i++){
		main_board_c[i].setAttribute("class","list-group-item");
	}

	main_stu_c[0].setAttribute("onclick","list('member','member_list','1')");
	main_stu_c[1].setAttribute("onclick","moveTo('member','member_add')");
	main_stu_c[2].setAttribute("onclick","moveTo('member','member_detail')");
	main_stu_c[3].setAttribute("onclick","moveTo('member','member_update')");
	main_stu_c[4].setAttribute("onclick","deleteTarget('아이디를')");

	main_grade_c[0].setAttribute("onclick","moveTo('grade','grade_add')");
	main_grade_c[1].setAttribute("onclick","moveTo('grade','grade_list','1')");
	main_grade_c[2].setAttribute("onclick","moveTo('grade','grade_detail')");
	main_grade_c[3].setAttribute("onclick","moveTo('grade','grade_update')");
	main_grade_c[4].setAttribute("onclick","deleteTarget('성적을 가진 사람의 이름을')");

	main_board_c[0].setAttribute("onclick","moveTo('board','board_wirte')");
	main_board_c[1].setAttribute("onclick","moveTo('board','board_list','1')");
	main_board_c[2].setAttribute("onclick","moveTo('board','board_update')");
	main_board_c[3].setAttribute("onclick","deleteTarget('게시글의 제목을')");
	
}

function navbarLoad(){
	/* 	var l1=document.getElementById("li_active")
	l1.setAttribute("class","active");
	var li_active=l1.children;
	li_active.setAttribute("onclick","moveTo('common','move','main')");
 */
 
 	var logout=document.getElementById("logout");
 	logout.setAttribute("onclick","logout('common','index')");	
 
	var nav_stu=document.getElementById("navbar_ul_stu");
	var nav_grade=document.getElementById("navbar_ul_grade");
	var nav_board=document.getElementById("navbar_ul_board");
	
	nav_stu.setAttribute("class","dropdown-menu");
	nav_grade.setAttribute("class","dropdown-menu");
	nav_board.setAttribute("class","dropdown-menu");
	
	var nav_stu_c=nav_stu.children;
	var nav_grade_c=nav_grade.children;
	var nav_board_c=nav_board.children;
	
	nav_stu_c[0].setAttribute("onclick","moveTo('member','member_add')");
	nav_stu_c[1].setAttribute("onclick","list('member','member_list','1')");
	nav_stu_c[2].setAttribute("onclick","moveTo('member','member_detail')");
	nav_stu_c[3].setAttribute("role","separator");
	nav_stu_c[3].setAttribute("class","divider");
	nav_stu_c[4].setAttribute("onclick","deleteTarget('아이디를')");

	nav_grade_c[0].setAttribute("onclick","moveTo('grade','move','grade_add')");
	nav_grade_c[1].setAttribute("onclick","moveTo('grade','move','grade_list','1')");
	nav_grade_c[2].setAttribute("onclick","moveTo('grade','move','grade_detail')");
	nav_grade_c[3].setAttribute("role","separator");
	nav_grade_c[3].setAttribute("class","divider");
	nav_grade_c[4].setAttribute("onclick","deleteTarget('성적을 가진 사람의 이름을')");

	nav_board_c[0].setAttribute("onclick","moveTo('board','board_wirte')");
	nav_board_c[1].setAttribute("onclick","moveTo('board','board_list','1')");
	nav_board_c[2].setAttribute("onclick","moveTo('board','board_detail')");
	nav_board_c[3].setAttribute("role","separator");
	nav_board_c[3].setAttribute("class","divider");
	nav_board_c[4].setAttribute("onclick","deleteTarget('게시글의 제목을')");
}



/* function logoutAlert (){
	alert("로그아웃");
location.href="${ctx}/common.do?action=logout&page=index"
}*/
/* a태그는 바로 location.href=""로 어디로 넘겨줄지만 정하면 된다. */

/* function moveTo(dir,action,page){
 location.href="${ctx}/"+dir+".do?action="+action+"&page="+page;		
}
		 			
function deleteTarget(dir){
 prompt("삭제할 "+dir+" 입력하세요")
} 
  */
  
</script>


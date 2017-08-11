<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a onclick="moveTo('common','move','main')"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
      <li class="dropdown">
      <a href="#" class="dropdown-toggle" 
      data-toggle="dropdown" role="button" 
      aria-haspopup="true" 
      aria-expanded="false">화원관리<spqn class="caret">
      </spqn></a>
      <ul class="dropdown-menu">
      <li><a onclick="">학생추가</a></li>
      <li><a onclick="">학생목록</a></li>
      <li><a onclick="">학생조회</a></li>
      <li role="separator" class="divider"></li>
      <li><a onclick="">학생삭제</a></li>
      </ul>
      </li>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" 
      data-toggle="dropdown" role="button" 
      aria-haspopup="true" 
      aria-expanded="false">성적관리<spqn class="caret">
      </spqn></a>
      <ul class="dropdown-menu">
      <li><a onclick="">성적추가</a></li>
      <li><a onclick="">성적목록</a></li>
      <li><a onclick="">성적조회</a></li>
      <li role="separator" class="divider"></li>
      <li><a onclick="">성적삭제</a></li>
      </ul>
      </li>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" 
      data-toggle="dropdown" role="button" 
      aria-haspopup="true" 
      aria-expanded="false">게시글관리<spqn class="caret">
      </spqn></a>
      <ul class="dropdown-menu">
      <li><a onclick="">게시글쓰기</a></li>
      <li><a onclick="">게시글목록</a></li>
      <li><a onclick="">게시글조회</a></li>
      <li role="separator" class="divider"></li>
      <li><a onclick="">게시글삭제</a></li>
      </ul>
      </li>      
    </ul>
    <span class="float-right">${sessionScope.user.name} &nbsp; <a id="logout" onclick="logoutAlert()">로그아웃</a> </span>
  </div>
</nav>   

<script>
function logoutAlert (){
	alert("로그아웃");
location.href="${ctx}/common.do?action=logout&page=index"
}
/* a태그는 바로 location.href=""로 어디로 넘겨줄지만 정하면 된다. */

function moveTo(dir,action,page){
 location.href="${ctx}/"+dir+".do?action="+action+"&page="+page;		
}
		 			
function deleteTarget(dir){
 prompt("삭제할 "+dir+" 입력하세요")
} 

</script>
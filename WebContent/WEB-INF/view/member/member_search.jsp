<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<jsp:include page="/WEB-INF/view/common/common_head.jsp"/>
	<div class="jumbotron text-center">

	<h1>학생 목록:  검색결과</h1>
</div>

		<div id="container">
		<div class="row">
  <div class="col-lg-6">
    <div class="input-group">
      <input id="search" name="search" type="text" class="form-control" placeholder="Search for..." >
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" onclick="search()">Go!</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
<div style="height:40px; width:300px;"></div>
		<!-- id,pw,ssn,name,regdate,email,major,subject,phone -->
		<table border="1" id="member-list-tab">
			<tr>
				<th>N0.</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>수강과목</th>
				<th>등록일</th>
				<th>수정/삭제</th>
			</tr>
			<c:forEach var="i" items="${requestScope.list}">
			<tr>
				<td>${i.num }</td>
				<td>${i.id}</td>
				<td><a onclick="detailStudent('${i.id}')">${i.name}</a></td>
				<td>${i.ssn}</td>
				<td>${i.phone}</td>
				<td>${i.email}</td>
				<td>${i.title }</td>
				<td>${i.regdate}</td>
				<td><a onclick="updateStudent('${i.id}')">수정</a><a onclick="deleteStudent('${i.id}')">삭제</a></td>
			</tr>
			</c:forEach>
		</table>
			<nav aria-label="Page navigation" style="margin:0 auto; width: 400px;">
			  <ul class="pagination">
			  	<c:if test="${requestScope.pageNumber ne 1 }">
			    <li>
			    <a href="#">
			    <span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>			
				</a>
				</li>
			    <li>
			      <a onclick="prev()" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			    <c:forEach varStatus="i" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1"> <!-- varstatus는 인트값(인덱스 값) var=오브젝트  -->	
					<c:choose>
						<c:when test="${i.index eq requestScope.pageNumber}"> 
							<li class="active"><a >${i.index}</a></li>
						</c:when>
						<c:otherwise>
							<li><a onclick="list('member','member_list','${i.index}')">${i.index}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${requestScope.nextBlock le requestScope.theNumberOfPages}">
			    <li>
			      <a onclick="next()" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    <li>
			    <a href="#">
				<span class="glyphicon glyphicon-step-forward" aria-hidden="true"></span>
				</a>
				</li>
				</c:if>
			  </ul>
			</nav>
	</div>
	
	<div id="footer">
	<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
		</div>
		
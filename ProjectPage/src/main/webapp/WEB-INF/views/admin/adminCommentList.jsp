<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>

<script type="text/javascript">
   function delete_check(c_num){
      if(confirm('해당 댓글을 삭제하시겠습니까?') == true){
         location.href='commentDeleteAdmin.do?c_num='+c_num;
      }else{
         return;
      }
   }
</script>

<div class="page-main-style">
<h2>댓글관리</h2>
	<form id="search_form" action="adminCommentList.do" method="get">
		<ul class="search">
			<li><select name="keyfield">
					<option selected>==전체==</option>
					<!-- 아이디를 입력받지만 회원번호를 검색하도록 처리 -->
					<option value="mem_num">아이디</option>
					<option value="comments">댓글내용</option>
					<option value="reg_date">작성일</option>
			</select></li>
			<li><input type="search" size="16" name="keyword" id="keyword">
			</li>
			<li><input type="submit" value="찾기"></li>
		</ul>
	</form>

	<!-- 작성된 댓글이 존재하는 경우 -->	
	<c:if test="${count > 0}">
	<table id="comment_table">
		<tr>
			<th>아이디</th>
			<th class="comment_content">댓글내용</th>
			<th>작성일</th>
			<th>처리</th>
		</tr>
		
		<c:forEach var="comment" items="${commentList}">
			<tr>
				<td>${comment.id}</td>
				<td>${comment.comments}</td>
				<td>${comment.reg_date}</td>
				<td><input type="button" value="삭제" onclick="delete_check(${comment.c_num});"></td>
			</tr>
		</c:forEach>
		
		</table>
		<div class="align-center pagenum">${pagingHtml}</div>
	</c:if>


	<!-- 작성된 댓글이 존재하지 않는 경우 -->	
	<c:if test="${count == 0}">
		<table>
			<tr>
				<th>아이디</th>
				<th>댓글내용</th>
				<th>작성일</th>
				<th>처리</th>
			</tr>
			<tr>
				<td colspan="4">작성된 댓글이 없습니다.</td>
			</tr>
		</table>
	</c:if>

</div>




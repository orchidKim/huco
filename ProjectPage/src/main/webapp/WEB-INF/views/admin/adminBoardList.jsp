<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>
<div class="page-main-style">
	<script type="text/javascript">
	$(function(){
		$('.delete-btn').click(function(){
			var delete1 = confirm("삭제 하시겠습니까?");
			 if(delete1){
				 location.href='${pageContext.request.contextPath}/admin/adminBoardDelete.do?num='+$(this).attr('data-num');
			 }
		});
	});
	</script>
	<%-- 
	<input type="button" value="회원관리" onclick="location.href='${pageContext.request.contextPath}/admin/memberList.do'">
	<input type="button" value="공지사항 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardList.do'">
	<input type="button" value="Q&A관리" onclick="location.href='${pageContext.request.contextPath}/adminQna/adminQuestAnswerList.do'">
	<input type="button" value="댓글관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminCommentList.do'">
	<input type="button" value="휴양림 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminForestList.do'"> --%>

<div class="page-main-style">

	<h2>공지사항</h2>

	<c:if test="${count == 0 }">
		<div class="result-display">등록된 공지사항이 없습니다.</div>
	</c:if>
	
	<c:if test="${count > 0 }">
	<table>
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th></th>
			<th></th>
		</tr>
		
		<c:forEach var="notice" items="${list}">
		<tr>
			<td>${notice.n_num}</td>
			<td>${notice.n_title}</td>
			<td>${notice.id}</td>
			<td>${notice.reg_date}</td>
			<td>${notice.n_hit}</td>
			<td>
				<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardModify.do?n_num=${notice.n_num}'">
			</td>
			<td><input type="button" value="삭제" class="delete-btn" data-num="${notice.n_num}"></td>
		</tr>
		</c:forEach>
		
		</table>
		</c:if>
		<div class="align-center">
		<input type="button" value="공지사항 등록" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardWrite.do'">
	</div><br>
		<%-- <div class="align-center">${pagingHtml}</div> --%>
	</div>
</div>
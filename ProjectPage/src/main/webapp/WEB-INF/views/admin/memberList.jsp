<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>

	<input type="button" value="회원관리" onclick="location.href='${pageContext.request.contextPath}/admin/memberList.do'">
	<input type="button" value="공지사항 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardList.do'">
	<input type="button" value="Q&A관리" onclick="location.href='${pageContext.request.contextPath}/adminQna/adminQuestAnswerList.do'">
	<input type="button" value="댓글관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminCommentList.do'">
	<input type="button" value="휴양림 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminForestList.do'">
	
<div class="page-main-style">
	<h2>회원관리</h2>
	<form id="search_form" action="memberList.do" method="get">
		<ul class="search">
			<li><select name="keyfield">
					<option selected>==전체==</option>
					<option value="mem_num">회원번호</option>
					<option value="mem_id">회원아이디</option>
					<option value="mem_auth">회원상태</option>
			</select></li>
			<li><input type="search" size="16" name="keyword" id="keyword">
			</li>
			<li><input type="submit" value="찾기"></li>
		</ul>
	</form>
	<c:if test="${count==0}">
		<div class="result-display">가입되어 있는 회원이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원아이디</th>
				<th>회원상태</th>
				<th>처리</th>
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.mem_num}</td>
					<td>${member.id}</td>
						
						<c:if test="${member.auth==0}">
							<td>탈퇴회원 (0)</td>
							<td></td>
						</c:if> 
						
						<c:if test="${member.auth==1}">
							<td>정지회원 (1)</td>			
							<td><input type="button" value="일반회원 전환" onclick="location.href='authToTwo.do?mem_num=${member.mem_num}'" /></td>
						</c:if> 
						
						<c:if test="${member.auth==2}">
							<td>일반회원 (2)</td>
							<td><input type="button" value="회원정지" onclick="location.href='authToOne.do?mem_num=${member.mem_num}'" /></td>
						</c:if> 
						
						<c:if test="${member.auth==3}">
							<td>관리자 (3)</td>
							<td></td>
						</c:if>
				</tr>
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>












</div>
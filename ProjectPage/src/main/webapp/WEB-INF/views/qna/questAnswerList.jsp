<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-main-style">
	<h2>Q&A</h2>
	<c:if test="${count == 0}">
		<div class="result-display">등록된 문의글이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
			<table border="1" class="qna-table">
			<tr>
				<th>번호</th>
				<th width="500">제목</th>
				<th>작성자</th>
				<th>답변여부</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="qna" items="${list}">
				<tr>
					<td>${qna.q_num}</td>
					<td><a href="questAnswerDetail.do?num=${qna.q_num}">${qna.q_title}</a></td>
					<td>${qna.id}</td>
					<c:choose>
						<c:when test="${qna.answer eq 'no answer'}">
							<td>처리중</td>
						</c:when>
						<c:otherwise>
							<td>처리완료</td>
						</c:otherwise>
					</c:choose>
					<td>${qna.q_reg_date}</td>
				</tr>
			</c:forEach>
			</table>
			<div class="align-center">${pagingHtml}</div>
		</c:if>
		<div class="align-right">	
		<c:if test="${!empty user_id}">
			<input type="button" value="등록" onclick="location.href='questAnswerWrite.do'">
		</c:if>
		</div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="page-main-style">
	<h2>${questAnswerVO.q_title}</h2>
	<ul>
		<li>번호 : ${questAnswerVO.q_num}</li>
		<li>작성자 : ${questAnswerVO.id}</li>
		<li>작성일 : ${questAnswerVO.q_reg_date}</li>
		<li>최근 수정일 : ${questAnswerVO.q_modify_date}</li>
	</ul>
	<!-- size=두께 -->
	<hr size="1" width="100%">
	<p>
		${questAnswerVO.question}
	</p>
	<hr size="1" width="100%">
	
	<div class="align-right">
		<%-- 글 수정 및 삭제를 하려면 로그인 후 로그인 아이디와 작성자 아이디가 일치해야하고, 관리자 답변이 수정이나 삭제가 안되어 있어야함. --%>
		<c:if test="${!empty user_id && user_id == questAnswerVO.id &&
					fn:contains(questAnswerVO.answer, 'no answer')}">
			<input type=button value="수정" onclick="location.href='update.do?num=${questAnswerVO.q_num}'">
			<input type=button value="삭제" onclick="location.href='delete.do?num=${questAnswerVO.q_num}'">
		</c:if>
			<input type=button value="목록" onclick="location.href='questAnswerList.do'">						
	</div>
	<br>
	<br>
	<br>
	<h2>Q&A관리자 답변</h2>	
		<table border="1">
			<tr>
			<td>관리자</td>
			<c:choose>
				<c:when test="${fn:contains(questAnswerVO.answer, 'no answer')}">
					<td>관리자님이 답변을 작성 중입니다. 조금만 기다려주세요.</td>
				</c:when>
				<c:otherwise>
					<td>${questAnswerVO.answer}</td>
				</c:otherwise>
			</c:choose>
			<td>${questAnswerVO.a_reg_date}</td>
			<td>${questAnswerVO.a_modify_date}</td>
		</tr>
		</table>
	
</div>
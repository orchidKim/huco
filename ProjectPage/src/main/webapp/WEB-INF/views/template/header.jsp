<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${user_auth != 3}">
	<h1><a href="${pageContext.request.contextPath}/main/main.do">코상휴가</a></h1>
</c:if>

<c:if test="${user_auth == 3}">
	<h1><a href="${pageContext.request.contextPath}/admin/adminList.do">코상휴가 관리자 페이지</a></h1>
</c:if>

<div class="align-right">
	<!-- 로그인, 비로그인 상관없이 항상 존재하는 상단바 메뉴, 관리자 페이지에서는 노출x -->
	<c:if test="${user_auth != 3}">
		<span><a href="${pageContext.request.contextPath}/board/boardList.do">공지사항</a></span>
		<span><a href="${pageContext.request.contextPath}/qna/questAnswerList.do">Q&A</a></span>
		<span><a href="${pageContext.request.contextPath}/forest/forestList.do">전국 휴양림</a></span>
	</c:if>

	<!-- 로그인한 상태라면, 유저의 아이디를 띄워줌 -->
	<c:if test="${!empty user_id}">
		<span><b>[${user_id}]</b></span>
	</c:if>
	
	<!-- 로그인한 상태고, 일반유저라면 -->
	<c:if test="${!empty user_id && user_auth == 2}">
		<select onchange="location.href=this.value">
		     <option selected >==전체==</option>
		     <option value="${pageContext.request.contextPath}/member/detail.do">회원정보</option>
		     <option value="${pageContext.request.contextPath}/pickPlace/myPickList.do">나의 찜</option>
		     <option value="${pageContext.request.contextPath}/visit/myBookList.do">나의 예약</option>
		</select>
	</c:if>
	
	<!-- 로그인한 상태라면, 로그아웃 버튼을 생성 -->
	<c:if test="${!empty user_id}">
		<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	</c:if>
	
	<!-- 로그인 안한 상태라면, 회원가입과 로그인 버튼을 생성 -->
	<c:if test="${empty user_id}">
		<a href="${pageContext.request.contextPath}/member/register.do">회원가입</a>
		<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	</c:if>
	
</div>









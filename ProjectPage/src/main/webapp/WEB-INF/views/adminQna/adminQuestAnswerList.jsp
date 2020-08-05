<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<%-- <input type="button" value="회원관리" onclick="location.href='${pageContext.request.contextPath}/admin/memberList.do'">
	<input type="button" value="공지사항 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardList.do'">
	<input type="button" value="Q&A관리" onclick="location.href='${pageContext.request.contextPath}/adminQna/adminQuestAnswerList.do'">
	<input type="button" value="댓글관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminCommentList.do'">
	<input type="button" value="휴양림 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminForestList.do'"> --%>

<div class="page-main-style">
	<h2>Q&amp;A</h2>
	<form:form action="delete.do" commandName="questAnswerVO" id="delete_form">
		<c:if test="${count == 0}">
			<div class="result-display">등록된 문의가 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
			<table>
				<tr>
					<th>번호</th>
					<th width="200">제목</th>
					<th>작성자</th>
					<th>답변여부</th>
					<th>작성일</th>
					<th><input type="checkbox" id="allchecked"></th>
				</tr>
				<c:forEach var="qna" items="${list}">
					<tr>
						<td>${qna.q_num}</td>
						<td><a href="adminQuestAnswerDetail.do?num=${qna.q_num}">${qna.q_title}</a></td>
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
						<td><input type="checkbox" class="checkbox" name="q_num" value="${qna.q_num}"></td>
					</tr>
				</c:forEach>
			</table>
			<div class="align-center">${pagingHtml}</div>
		</c:if>
		<div class="align-right">
			<c:if test="${!empty user_id}">
				<input type="submit" id="delete" value="삭제" onclick="location.href='delete.do'">
			</c:if>
		</div>
		</form:form>
</div>
<script type="text/javascript">
	$('#delete').hide();
	$('#allchecked').focus();
	
	/* 선택되면 삭제버튼 나오게 하기  */
	$('.checkbox').click(function(){
		if($(this).prop("checked")){
			$('#delete').show();
		}
	});
	/* 전체선택  */
	$('#allchecked').click(function(){
	    if($(this).prop('checked')){
	       $('.checkbox').prop('checked',true);
	       $('#delete').show();
	   }else{
	       $('.checkbox').prop('checked',false); 
	       $('#delete').hide();
	   } 
	});
	/*유효성 체크*/
		$('#delete_form').submit(function() {
			if (!$('.checkbox').is(":checked")) {
				alert("최소한 1개는 선택해야합니다.");
				return false;
			}
		});
</script>

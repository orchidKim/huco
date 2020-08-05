<%@ page language="java" contentType="text/html;  charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>



<!-- 휴양림 데이터 삭제 전 confirm -->
<script type="text/javascript">
	function delete_check(p_num){
		if(confirm('해당 휴양림의 데이터를 삭제하시겠습니까?') == true){
			location.href='forestDelete.do?p_num='+p_num;
		}else{
			return;
		}//end else
	}//end function delete_check
</script>
<%-- 
	<input type="button" value="회원관리" onclick="location.href='${pageContext.request.contextPath}/admin/memberList.do'">
	<input type="button" value="공지사항 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardList.do'">
	<input type="button" value="Q&A관리" onclick="location.href='${pageContext.request.contextPath}/adminQna/adminQuestAnswerList.do'">
	<input type="button" value="댓글관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminCommentList.do'">
	<input type="button" value="휴양림 관리" onclick="location.href='${pageContext.request.contextPath}/admin/adminForestList.do'"> --%>
<div class="page-main-style">
<h2>휴양림 관리</h2>	
<input type="button" value="새 휴양림 등록" onclick="location.href='forestInsert.do'">

<c:if test="${count>0}">
	<table>
		<tr>
			<th>이미지</th>
			<th>휴양림명</th>
			<th>시도명</th>
			<th>구분</th>
			<th>면적</th>
			<th>수용가능인원</th>
			<th>입장료</th>
			<th>숙박가능여부</th>
			<th>주요시설</th>
			<th>소재지도로명주소</th>
			<th>관리기관명</th>
			<th>전화번호</th>
			<th>홈페이지 주소</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="forest" items="${forestList}">
			<tr>
				<c:if test="${forest.p_img == null}">
					<td><img src="${pageContext.request.contextPath}/upload/sample.PNG" style="max-width:200px"></td>
				</c:if>

				<c:if test="${forest.p_img != null}">
					<td><img src="${pageContext.request.contextPath}/upload/${forest.p_img}" style="max-width:200px"></td>
				</c:if>
				<td>${forest.p_name}</td>
				<td>${forest.p_city}</td>
				<td>${forest.p_div}</td>
				<td>${forest.p_size}</td>
				<td>${forest.p_count}</td>
				<td>${forest.p_cost}</td>
				<td>${forest.p_stay}</td>
				<td>${forest.p_facility}</td>
				<td>${forest.p_load}</td>
				<td>${forest.p_pubnum}</td>
				<td>${forest.p_phone}</td>
				<td><a href="${forest.p_web}">${forest.p_web}</a></td>
				<td><input type="button" value="수정" onclick="location.href='forestUpdate.do?p_num=${forest.p_num}'"></td>
				<td><input type="button" value="삭제" onclick="delete_check(${forest.p_num});"></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</div>
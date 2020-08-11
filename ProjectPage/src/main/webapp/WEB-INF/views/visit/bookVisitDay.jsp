<%@ page language="java" contentType="text/html;  charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>

<div class="page-main-style">
<h2>[${p_name}] [20${year}년 ${month}월] 방문예약 현황</h2>

<form action="insertVisit.do" method="post" id="insertVisitForm">
	<!-- 세션의 로그인된 회원의 고유번호로 예약 처리 -->
	<input type="hidden" name="mem_num" value="${mem_num}">
	<input type="hidden" name="p_num" value="${visit.p_num}">
	<input type="hidden" name="v_day" id="v_day">
	<span>방문인원</span> <input type="number" min="0" name="v_cnt" id="v_cnt" placeholder="방문인원 수 입력">
	<span>방문일자</span> <input type="number" min="1" max="31" name="date" id="date" placeholder="방문일 숫자 입력"><p>
	<input type="submit" value="예약하기" id="submit-btn">
</form>
	<!-- 	 
	visitVO
	private int v_num;//방문예약 고유번호
	private int mem_num;//방문예정자 회원고유번호
	private int p_num;//방문예정 휴양림 고유번호
	private String v_date;//방문날짜
	private int v_cnt;//방문인원
 	-->
<p/>
<table border="1" class="bookVisitDay-table">
	<tr style="font-weight:bold">
		<td style="width:200px;">방문일자</td>
		<td>방문예정인원</td>
	</tr>
	
	<c:if test="${empty visitCountList}">
		<tr>
			<td colspan="2">해당 휴양림의 방문예약 내역이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty visitCountList}">
		<c:forEach var="visitCount" items="${visitCountList}">
			<tr>
				<td>${visitCount.v_day}</td>
				<td>${visitCount.sum_cnt}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<script type="text/javascript">
$(document).ready(function(){
	 $('#insertVisitForm').submit(function(){
		 if($('#v_cnt').val()==''){
			 alert('방문인원을 입력하세요.');
			 return false;
		 }
		 
		 if($('#date').val()==''){
			 alert('방문날짜를 입력하세요.');
			 return false;
		 }
		 
		 if($('#v_cnt').val()!='' && $('#date').val()!=''){
			 var v_day = '';
			 var month = ${month};
			 
			 if(month<10){
				 month = '/0'+month;
			 }else{
				 month = '/'+month;
			 }
			 
			 if($('#date').val()<10){
				 v_day = '/0'+$('#date').val();
			 }else{
				 v_day = '/'+$('#date').val();
			 }
			 
			 v_day = ${year}+month+v_day;
			 
			 alert('['+v_day+'] 날짜로 예약합니다.');
			 
			 $('#v_day').val(v_day);
		 }//end if
	 
		 });//$('#insertVisitForm').submit
});//$(document).ready
</script>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>

<script type="text/javascript">
   function delete_check(p_num){
      if(confirm('해당 휴양림을 찜목록에서 삭제하시겠습니까?') == true){
         location.href='myPickListDelete.do?p_num='+p_num;
      }else{
         return;
      }
   }//function delete_check
</script>

<h2>나의 찜 리스트</h2>

<table>
	<tr>
		<th>휴양림명</th>
		<th>처리</th>
	</tr>

	<c:if test="${!empty list}">	
		<c:forEach var="myPick" items="${list}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/forest/forestDetail.do?p_num=${myPick.p_num}">${myPick.p_name}</a></td>
				<td><input type="button" value="삭제" onclick="delete_check(${myPick.p_num})"></td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
		<tr>
			<td colspan="2">찜 내역이 존재하지 않습니다.</td>
		<tr>
	</c:if>
</table>	




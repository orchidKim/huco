<%@ page language="java" contentType="text/html;  charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>

<!-- 수정 데이터 입력 여부 확인 -->
<script type="text/javascript">
 $(document).ready(function(){
	 $('#updateForestForm').submit(function(){
		 //17개의 데이터 확인
		 if($('#p_name').val()==''){
				alert('휴양림명을 입력하세요');	$('#p_name').focus();return false;
			}
		 if($('#p_city').val()==''){
				alert('시도명을 입력하세요');$('#p_city').focus();	return false;
			}
		 if($('#p_size').val()==''){
			 alert('면적을 입력하세요');$('#p_size').focus();return false;
			}
		 if($('#p_count').val()==''){
				alert('수용가능인원을 입력하세요');$('#p_count').focus();return false;
			}
		 if($('#p_cost').val()==''){
				alert('입장료를 입력하세요');$('#p_cost').focus();	return false;
			}
		 if($('#p_stay').val()==''){
				alert('숙박가능여부 입력하세요');$('#p_stay').focus();return false;
			}
		 if($('#p_facility').val()==''){
				alert('주요시설을 입력하세요');	$('#p_facility').focus();return false;
			}
		 if($('#p_load').val()==''){
				alert('소재지 도로명을 입력하세요');$('#p_load').focus();return false;
			}
		 if($('#p_pubnum').val()==''){
				alert('관리기관명을 입력하세요');$('#p_pubnum').focus();return false;
			}
		 if($('#p_div').val()==''){
				alert('구분을 입력하세요');$('#p_div').focus();return false;
			}
		 if($('#p_phone').val()==''){
				alert('전화번호를 입력하세요');	$('#p_phone').focus();return false;
			}
		 if($('#p_web').val()==''){
				alert('홈페이지 주소를 입력하세요');$('#p_web').focus();return false;
			}
		 if($('#p_latitude').val()==''){
				alert('위도를 입력하세요');$('#p_latitude').focus();return false;
			}
		 if($('#p_longitude').val()==''){
				alert('경도를 입력하세요');$('#p_longitude').focus();	return false;
			}
		 if($('#p_regdate').val()==''){
				alert('데이터 기준일자를 입력하세요');$('#p_regdate').focus();return false;
			}
		 if($('#p_code').val()==''){
				alert('제공기관 코드를 입력하세요');$('#p_code').focus();return false;
			}
		 if($('#p_pubname').val()==''){
				alert('제공기관명을 입력하세요');$('#p_pubname').focus();return false;
			}
		 
	 });// $('#insertForestForm').submit
 });//$(document).ready
</script>
<div class="page-main-style">
<h2>[${forest.p_name}] 휴양림 정보 수정</h2>

	<form:form action="forestUpdate.do" enctype="multipart/form-data" commandName="forestVO" method="post" id="updateForestForm">
		<ul>
			<li>
				<input type="hidden" name="p_num" value="${forest.p_num}">
			</li>
			<li>
				휴양림명<input type="text" name="p_name" id="p_name" value="${forest.p_name}">
			</li>
			<li>
				시도명<input type="text" name="p_city" id="p_city" value="${forest.p_city}">
			</li>
			<li>
				구분<input type="text" name="p_div" id="p_div" value="${forest.p_div}">
			</li>
			<li>
				면적<input type="number" name="p_size" id="p_size" value="${forest.p_size}">
			</li>
			<li>
				수용가능인원<input type="number" name="p_count" id="p_count" value="${forest.p_count}">
			</li>
			<li>
				입장료<input type="text" name="p_cost" id="p_cost" value="${forest.p_cost}">
			</li>
			<li>
				숙박가능여부[Y/N]<input type="text" name="p_stay" id="p_stay" value="${forest.p_stay}">
			</li>
			<li>
				주요시설<input type="text" name="p_facility" id="p_facility" value="${forest.p_facility}">
			</li>
			<li>
				소재지도로명주소<input type="text" name="p_load" id="p_load" value="${forest.p_load}">
			</li>
			<li>
				관리기관명<input type="text" name="p_pubnum" id="p_pubnum" value="${forest.p_pubnum}">
			</li>
			<li>
				전화번호<input type="text" name="p_phone" id="p_phone" value="${forest.p_phone}"> 
			</li>
			<li>
				홈페이지 주소<input type="text" name="p_web" id="p_web" value="${forest.p_web}">
			</li>
			<li>
				위도<input type="number" name="p_latitude" id="p_latitude" value="${forest.p_latitude}">
			</li>
			<li>
				경도<input type="number" name="p_longitude" id="p_longitude" value="${forest.p_longitude}">
			</li>
			<li>
				데이터 기준일자<input type="text" name="p_regdate" id="p_regdate" value="${forest.p_regdate}">
			</li>
			<li>
				제공기관 코드<input type="text" name="p_code" id="p_code" value="${forest.p_code}">
			</li>
			<li>
				제공기관명<input type="text" name="p_pubname" id="p_pubname" value="${forest.p_pubname}">
			</li>
			<li>
				휴양림 이미지<input type="file" name="img_path">
			</li>
		</ul>
			<input type="submit" value="수정">
	</form:form> 
</div>
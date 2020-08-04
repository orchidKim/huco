<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-main-style">
	<h2>회원상세정보</h2>
	<ul>
		<li>ID : ${member.id}</li>
		<li>이름 : ${member.name}</li>
		<li>전화번호 : ${member.phone}</li>
		<li>이메일 : ${member.email}</li>
		<li>주소 : ${member.address}</li>
	</ul>
	<hr size="1" width="100%">
	<p class="align-right">
		<input type="button" value="회원정보수정" onclick="location.href='update.do'">
		<input type="button" value="회원탈퇴" onclick="location.href='delete.do'"> 
	</p>
</div>








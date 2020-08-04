<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<h3>공지사항 상세</h3>
     
<div class="page-main-style">
	<table border="1" class="boardView-table">
				<colgroup>
       		   	  <col width="15%" class=""/>
           	      <col width="85%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<td>${board.n_num}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${board.id}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${board.reg_date}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${board.n_title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id="table-notice">${board.notice}</td>
				</tr>
	</table>
</div>
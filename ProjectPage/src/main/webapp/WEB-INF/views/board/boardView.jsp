<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<div class="page-main-style">
	<ul>
		<li>번호: ${board.n_num}</li>
		<li>작성자: ${board.id}</li>
		<li>작성일: ${board.reg_date}</li>
		<li>제목: ${board.n_title}</li>
	</ul>	
	${board.notice}
	<hr size="1" width="100%">
</div>
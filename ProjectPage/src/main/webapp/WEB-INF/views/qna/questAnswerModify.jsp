<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<h2>Q&A수정</h2>
	<form:form action="update.do" commandName="questAnswerVO" id="modify_form">
		<form:hidden path="q_num"/>
		<ul>
			<li>
				<label for="q_title">제목</label>
				<form:input path="q_title" id="q_title"/>
			</li>
			<li>
				<label for="question">내용</label>
				<form:textarea path="question" id="question"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록"
			       onclick="location.href='questAnswerList.do'">
		</div>	   
	</form:form>
</div>               
<script type="text/javascript">
		//글 등록 유효성 체크
		$('#modify_form').submit(function(){
			if($('#q_title').val()==''){
				alert('제목을 입력하세요');
				$('#q_title').focus();
				return false;
			}
			if($('#question').val()==''){
				alert('내용을 입력하세요');
				$('#question').focus();
				return false;
			}
		});		
</script>






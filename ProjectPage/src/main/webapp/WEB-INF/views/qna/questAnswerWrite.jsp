<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
   <h2>Q&amp;A등록</h2>
   <form:form action="questAnswerWrite.do" commandName="questAnswerVO" id="register_form">
      <table class="qna-write-mainTable">
         <colgroup>
            <col width="15%" />
            <col width="85%" />
         </colgroup>
         <tr>
            <th style="border-bottom:1px solid lightgray;"><label for="q_id">작성자</label></th>
            <td style="border-bottom:1px solid lightgray;"><%= session.getAttribute("user_id") %></td>
         </tr>
         <tr>
            <th><label for="q_title">제목</label></th>
            <td><form:input path="q_title" id="q_title" /></td>
      </table>
      
     <p class="qna-p">
         <form:textarea path="question" id="qna-write-question" style="resize: none;" />
      </p>

      <div class="align-center">
         <input type="submit" value="등록"> <input type="button"
            value="목록" onclick="location.href='questAnswerList.do'">
      </div>
   </form:form>
</div>

<script type="text/javascript">
$(document).ready(function(){
      //글 등록 유효성 체크
      $('#register_form').submit(function(){
         if($('#q_title').val()==''){
            alert('제목을 입력하세요');
            $('#q_title').focus();
            return false;
         }
         if($('#qna-write-question').val()==''){
            alert('내용을 입력하세요');
            $('#question').focus();
            return false;
         }
      });
});//$(document).ready
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style" >
   <h2>Q&A수정</h2>
   <form:form action="update.do" commandName="questAnswerVO" id="modify_form" >
      <form:hidden path="q_num"/>
   <table border="1" class="qna-detail-mainTable">
            <colgroup>
                     <col width="15%" class="s"/>
                    <col width="85%" />
            </colgroup>
            <tr>
               <th>번호</th>
               <td>${questAnswerVO.q_num}</td>
            </tr>
            <tr>
               <th>작성일</th>
               <td>${questAnswerVO.q_reg_date}</td>
            </tr>
            <tr>
               <th>최근 수정일</th>
               <td>${questAnswerVO.q_modify_date}</td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>${questAnswerVO.id}</td>
            </tr>
            <tr>
               <th><label for="q_title">제목</label></th>
               <td><form:input path="q_title" id="q_title"/></td>
            </tr>
   </table>
    <p class="qna-p">
          <label for="question"></label>
            <form:textarea path="question" id="qna-write-question"  style="resize: none;"/>
        </p>
      <div class="align-center">
         <input type="submit" value="수정">
         <input type="button" value="목록" onclick="location.href='questAnswerList.do'">
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
         if($('#qna-write-question').val()==''){
            alert('내용을 입력하세요');
            $('#question').focus();
            return false;
         }
      });      
</script>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../inc/header.jsp" %>    
    
<section>
	<div class="container">
		
		<div class="reply_wrap input_style" style="max-width: 400px;border: 1px solid #ddd;padding: 20px;width: 100%;margin-left: auto;margin-right: auto;">
			<h3 style="font-size: 22px; padding: 10px 0 10px; font-weight: bold; ">댓글 수정</h3>
			<form action="updatereply.cmu" method="post" enctype="multipart/form-data">
				<input type="text" hidden="hidden" value="${replyBean.num}" name="num">  
				<input type="text" hidden="hidden" value="${replenum}" name="replenum">
				
				<input type="file" name="upload" id="ifile" style="background-color: #fff;"><br>
				<textarea  name ="content" style="background-color: #fff;margin: 5px 0;height: 100px;">${replyBean.content}</textarea><br>
				<input type="submit" value="수정하기" onclick="filecheck()" style="background: #eee;color: #121212;cursor:pointer;">
			</form>
		</div>
		
	</div>
</section>


<%@ include file="../inc/footer.jsp" %>
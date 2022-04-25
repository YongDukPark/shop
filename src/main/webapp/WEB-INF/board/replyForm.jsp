<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>



    
    
<style>
	@media(min-width: 992px){
		.bbs_cont_wrap .info_left{width: 50% !important;float: left;padding-right: 15px !important;vertical-align: top;}
		.bbs_cont_wrap .info_right{width: 50% !important;float: left;padding-left: 15px !important;vertical-align: top;}
		.bbs_insert_cont_wrap .info_left{width: 50% !important;float: left;padding-right: 15px !important;vertical-align: top;}
		.bbs_insert_cont_wrap .info_right{width: 50% !important;float: left;padding-left: 15px !important;vertical-align: top;}
	}
</style> 
    
<section>
	<div class="container">

		<div class="bbs_insert_cont_wrap">
			<form method="post" action="reply.bd">
				<input type="hidden" name="pageNumber" value=${pageNumber }>
				
				<div class="prd_list_top">
					<div class="row">
						<div class="col-md-6">
							<h3>Q&A 답글 <%-- <span style="font-size: 13px;font-weight: 400;">(레코드 갯수:${totalCount})</span> --%></h3>
						</div>
						<div class="col-md-6">
							<!-- searchbox S -->
							<div class="input_style prd_searchbox min_4depth" style="margin-bottom: 5px;">
								
								<input type="submit" class="bgc_fff" value="수정완료">
								<input type="reset" class="bgc_fff"  value="다시쓰기">
								<input type="button" value="글목록" onclick="location.href='list.bd?pageNumber=${pageNumber }'">
								
								<%-- <a href="list.nt?pageNumber=${pageNumber}"><input type="button" value="목록보기"></a>
								<a href="javascript:history.go(-1)"><input type="button" value="되돌아가기"></a> --%>
							</div>
							
							<!-- searchbox E -->
						</div>
					</div>
				</div>
				<input type="hidden" name="ref" value=${ref }>
				<input type="hidden" name="re_step" value=${re_step }>
				<input type="hidden" name="re_level" value=${re_level }>
				
				<div class="bbs_insert_cont_wrap">
					<div class="bbs_title">
						<span class="title_bold input_style" style="margin-left: 0;">
							<p style="margin-bottom: 5px;"><i class="xi-pen"></i> 제목</p>				
							<input type="text" name="subject" value="[답글]" style="width:100%;">
							<form:errors path="subject" cssClass="err"></form:errors>
						</span>
					</div>
					
					<div style="width: 100%;">
						<div class="info_left" style="padding: 0;padding-bottom: 10px;">
							<span class="input_style" style="text-align: left;">
								<p style="margin-bottom: 5px;"><i class="xi-user"></i> 작성자</p>
								<input type="text" name="writer" value="홍길동">
								<form:errors path="writer" cssClass="err"></form:errors>
							</span>
							<form:errors cssClass="err" path="writer"/>
						</div>
						<div class="info_right" style="padding: 0;padding-bottom: 10px;">
							<span class="input_style" style="text-align: left;">
								<p style="margin-bottom: 5px;color: #555;"><i class="xi-mail-o"></i> 이메일</p>
								<input type="text" name="email" value="abc@xx.com">
							</span>
						</div>
					</div>
					
					
					
					<div class="bbs_cont">
						<textarea cols="50" rows="20" name="content">호호호</textarea>
						<form:errors path="content" cssClass="err"></form:errors>
					</div>
					<div class="bbs_cont" style="padding: 15px;border-bottom: none;">
						<span class="input_style" style="text-align: left;">
							<p style="margin-bottom: 5px;color: #555;"><i class="xi-key"></i> 비밀번호</p>
							<input type="password" name="passwd" value="1234">
							<form:errors path="passwd" cssClass="err"/>
						</span>
					</div>
					<div class="input_style prd_searchbox min_4depth" style="margin-bottom: 5px;text-align: center;">
						<input type="submit" class="bgc_fff" value="작성완료">
					</div>
					<!-- <div class="bbs_btn_wrap">
						<input type="submit" value="글쓰기"> 
						<input type="reset" value="다시작성">
						<input type="button" value="목록보기" onClick="location.href='../bbs/list.jsp'">
						
					</div> -->
					
				</div>
				
			</form>
		</div>
	</div>
</section>
<%@ include file="../inc/footer.jsp" %>
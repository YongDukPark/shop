<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
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
			<form:form commandName="bean" method="post" action="update.bd">
				<input type="hidden" name="num" value=${bean.num }>
				<input type="hidden" name="pageNumber" value=${pageNumber }>
				<div class="prd_list_top">
					<div class="row">
						<div class="col-md-6">
							<h3>Q&A 수정 <%-- <span style="font-size: 13px;font-weight: 400;">(레코드 갯수:${totalCount})</span> --%></h3>
						</div>
						<div class="col-md-6">
							<!-- searchbox S -->
							<div class="input_style prd_searchbox min_4depth" style="margin-bottom: 5px;">
								
								<input type="submit" class="bgc_fff" value="작성완료">
								<input type="reset" class="bgc_fff"  value="다시쓰기">
								<input type="button" value="목록보기" onclick="location.href='list.bd?pageNumber=${pageNumber}'">
								
								<%-- <a href="list.nt?pageNumber=${pageNumber}"><input type="button" value="목록보기"></a>
								<a href="javascript:history.go(-1)"><input type="button" value="되돌아가기"></a> --%>
							</div>
							
							<!-- searchbox E -->
						</div>
					</div>
				</div>
				<input type="hidden" name="num" value="${noticeBean.num }" />
				<input type="hidden" name="pageNumber" value="${pageNumber }">
				<div class="bbs_cont_wrap">
					<div class="bbs_title">
						<span class="title_bold input_style" style="margin-left: 0;">
							<p style="margin-bottom: 5px;"><i class="xi-pen"></i> 제목</p>
							<input type="text" name="subject" value="${bean.subject }">
							<form:errors path="subject" cssClass="err"/>
						</span>
						<form:errors cssClass="err" path="subject"/>
					</div>
					<div style="width: 100%;">
						<div class="info_left" style="padding: 0;padding-bottom: 10px;">
							<span class="input_style" style="text-align: left;">
								<p style="margin-bottom: 5px;"><i class="xi-user"></i> 작성자</p>
								<input type="text" name="writer" value="${bean.writer }">
								<form:errors path="writer" cssClass="err"/>
							</span>
							<form:errors cssClass="err" path="writer"/>
						</div>
						<div class="info_right" style="padding: 0;padding-bottom: 10px;">
							<span class="input_style" style="text-align: left;">
								<p style="margin-bottom: 5px;color: #555;"><i class="xi-mail-o"></i> 이메일</p>
								<input type="text" name="email" value="${bean.email }">
								<form:errors path="email" cssClass="err"/>
							</span>
						</div>
					</div>
					<div class="bbs_cont" style="padding: 15px;border-bottom: none;">
						<textarea cols="50" rows="20" name="content" placeholder="내용을 입력해주세요.">${bean.content }</textarea>
						<form:errors path="content" cssClass="err"/>
					</div>
					<div class="bbs_cont" style="padding: 15px;border-bottom: none;">
						<span class="input_style" style="text-align: left;">
							<p style="margin-bottom: 5px;color: #555;"><i class="xi-key"></i> 비밀번호</p>
							<input type="password" name="passwd" value="${bean.passwd}">
							<form:errors path="passwd" cssClass="err"/>
						</span>
					</div>
					<div class="input_style prd_searchbox min_4depth" style="margin-bottom: 5px;text-align: center;">
						<input type="submit" class="bgc_fff" value="수정완료">
						
					</div>
				</div>
				
			</form:form>
		</div>
	</div>
</section>

<%@ include file="../inc/footer.jsp" %>
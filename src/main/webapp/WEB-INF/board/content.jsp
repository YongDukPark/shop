<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/header.jsp" %>



<section>
	<div class="container">
		<form method="post" action="view.nt">
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>Q&A 상세보기 <%-- <span style="font-size: 13px;font-weight: 400;">(레코드 갯수:${totalCount})</span> --%></h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<div class="input_style prd_searchbox min_4depth">
						<!-- <a href="javascript:history.go(-1)"><input type="button" value="되돌아가기"></a> -->
						<c:if test="${id==bean.writer||id=='admin'}">
							<input type="button" class="bgc_fff" value="글수정" onclick="location.href='update.bd?num=${bean.num }&pageNumber=${pageNumber }'">
							<input type="button" class="bgc_fff" value="글삭제" onclick="location.href='delete.bd?num=${bean.num }&pageNumber=${pageNumber }'">
						</c:if>
						<input type="button" class="bgc_fff" value="답글쓰기" onclick="location.href='reply.bd?num=${bean.num }&ref=${bean.ref }&re_step=${bean.re_step }&re_level=${bean.re_level }&pageNumber=${pageNumber }'">
						<input type="button" value="글목록" onclick="location.href='list.bd?pageNumber=${pageNumber }'">
					</div>
					
					<!-- searchbox E -->
				</div>
			</div>
		</div>
		
		<div class="notice_list_wrap">
			
			<div class="bbs_cont_wrap">
				<div class="bbs_title">
					<span class="title_no">No. ${bean.num }</span>
					<span class="title_bold">${bean.subject }</span>
				</div>
				<div class="bbs_info">
					<div class="info_left">
						<span><i class="xi-user"></i> ${bean.writer }</span>
						<span><i class="xi-calendar"></i> ${bean.reg_date }</span>
					</div>
					<div class="info_right">
						<span><i class="xi-eye-o"></i>${bean.readcount }</span>
					</div>
				</div>
				<div class="bbs_cont">
					<!-- content -->
					${bean.content }
					
				</div>			
			</div>
			
		</div>
		<div class="pager_wrap">
			<!-- 페이지 번호 설정 -->
			${pageInfo.pagingHtml}
		</div>
		</form>
	</div>
</section>	
	
<%@ include file="../inc/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>
<!--  noticeView.jsp -->

<script type="text/javascript">
	function goUpdatenv() {
		location.href="update.nt?num="+${nvbean.num }+"&pageNumber="+${pageNumber };
	}
	function goDeletenv(){
		location.href="delete.nt?num="+${nvbean.num }+"&pageNumber="+${pageNumber };
	}
	function goReplynv(){
		//alert(3);
		location.href="reply.nt?ref="+${nvbean.ref }+"&restep="+${nvbean.restep }+"&relevel="+${nvbean.relevel };
	}			
</script>




<section>
	<div class="container">
		<form method="post" action="view.nt">
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>공지사항 <%-- <span style="font-size: 13px;font-weight: 400;">(레코드 갯수:${totalCount})</span> --%></h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<div class="input_style prd_searchbox min_4depth">
						<c:if test="${id == 'admin' }">
							<input class="bgc_fff" type="button" value="수정" 	onclick="goUpdatenv()">
							<input class="bgc_fff" type="button" value="삭제" 	onclick="goDeletenv()">
							<input class="bgc_fff" type="button" value="답글"		onclick="goReplynv()">
						</c:if>
						<!-- <a href="javascript:history.go(-1)"><input type="button" value="되돌아가기"></a> -->
						<input type="button" value="글 목록" 	onclick="location.href='list.nt?pageNumber=${pageNumber }'">
					</div>
					
					<!-- searchbox E -->
				</div>
			</div>
		</div>
		
		<div class="notice_list_wrap">
			
			<div class="bbs_cont_wrap">
				<div class="bbs_title">
					<span class="title_no">No. ${nvbean.num }</span>
					<span class="title_bold">${nvbean.subject}</span>
				</div>
				<div class="bbs_info">
					<div class="info_left">
						<span><i class="xi-user"></i> ${nvbean.writer}</span>
						<span><i class="xi-calendar"></i> <fmt:formatDate value="${nvbean.regdate}" pattern="yyyy/MM/dd HH:mm" type="both"/></span>
					</div>
					<div class="info_right">
						<span><i class="xi-eye-o"></i>${nvbean.readcount}</span>
					</div>
				</div>
				<div class="bbs_cont">
					<!-- content -->
					${nvbean.content}
					
					<!-- image -->
					<div style="margin-top: 15px;">
						<img src="<%=request.getContextPath() %>/resources/${nvbean.image}" style="max-width: 100%;"/>
					</div>
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
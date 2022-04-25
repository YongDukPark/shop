<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>
	
    
<section>
	<div class="container">
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>커뮤니티</h3>
				</div>
				<div class="col-md-6">					
					<div class="input_style prd_searchbox ">
						<input type="button" value="글쓰기" onclick="location.href='insertForm.cmu'">
						<c:if test="${id=='admin' }">
							
						</c:if>							
					</div>					
				</div>
			</div>
		</div>
		
		<div class="notice_list_wrap">
			<ul class="list_ul">
				
				<c:forEach  var = "i" begin="0" end="${fn:length(lists)-1 }" step="1">
				
					<li class="list_li">
						<div class="list_no">No. ${lists[i].num }</div>
						<div class="list_subject">
							<a href="detail.cmu?num=${lists[i].num }&type=cmu"><font style="color: gray;">[${lists[i].gender }][${lists[i].category }]</font>${lists[i].subject }<font style="color: red;">[${lists[i].likecount }]</font></a>
						</div>
						<div class="list_info">
							<div class="list_top" align="left"><i class="xi-user-o"></i> ${lists[i].id }</div>
							<div class="list_bottom">
								<span class="list_date font_bold">${lists[i].regdate }</span>
								<span class="list_count"><i class="xi-eye-o"></i> ${lists[i].readcount }</span>
							</div>
						</div>
						<%-- 
						<div class="list_edit">
							<input type="button" value="수정" onclick="goUpdate('${ntf.num}','${pageInfo.pageNumber}')">
						</div>
						<div class="list_del">
							<a href="delete.nt?num=${ntf.num }&pageNumber=${pageInfo.pageNumber }">삭제</a>
						</div>
						--%>
					</li>
					
				</c:forEach>
			</ul>
		</div>
		<div class="pager_wrap">
			<!-- 페이지 번호 설정 -->
			${pageInfo.getPagingHtml()}
		</div>
	</div>
</section>	
	
<%@ include file="../inc/footer.jsp" %>    
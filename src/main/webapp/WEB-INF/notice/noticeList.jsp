<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>


<script  type="text/javascript">
 	function insert() {
		 location.href="insert.nt";
 	}
	function goUpdate(num,pageNumber){
		location.href="update.nt?num="+num+"&pageNumber="+pageNumber;
	}
</script>

<!-- WEB-INF/noticeList.jsp -->





<section>
	<div class="container">
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>공지사항 <span style="font-size: 13px;font-weight: 400;">(레코드 갯수:${totalCount})</span></h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<form action="list.nt" method="get">
						<div class="input_style prd_searchbox ">
							<c:if test="${id=='admin' }">
								<input type="button" value="글쓰기" onClick="insert()">
							</c:if>
							<select name="whatColumn">
								<option value="all">전체검색
								<option value="writer">작성자
								<option value="content">내용
							</select>
							<input type="text" name="keyword">
							<input type="submit" value="검색">
						</div>
					</form>
					
					<!-- searchbox E -->
				</div>
			</div>
		</div>
		
		<div class="notice_list_wrap">
			<ul class="list_ul">
				
				<c:forEach var="ntf" items="${list}">
				
					<li class="list_li">
						<div class="list_no">No. ${ntf.num }</div>
						<div class="list_subject">
							<a href="view.nt?num=${ntf.num }&pageNumber=${pageInfo.pageNumber }">${ntf.subject}</a>
						</div>
						<div class="list_info">
							<div class="list_top" align="left"><i class="xi-user-o"></i> ${ntf.writer }</div>
							<div class="list_bottom">
								<span class="list_date font_bold"><fmt:formatDate value="${ntf.regdate }" pattern="yyyy/MM/dd HH:mm" type="both"/></span>
								<span class="list_count"><i class="xi-eye-o"></i> ${ntf.readcount }</span>
							</div>
						</div>
						<div class="list_edit">
							<input type="button" value="수정" onclick="goUpdate('${ntf.num}','${pageInfo.pageNumber}')">
						</div>
						<div class="list_del">
							<a href="delete.nt?num=${ntf.num }&pageNumber=${pageInfo.pageNumber }">삭제</a>
						</div>
					</li>
					
				</c:forEach>
			</ul>
		</div>
		<div class="pager_wrap">
			<!-- 페이지 번호 설정 -->
			${pageInfo.pagingHtml}
		</div>
	</div>
</section>	
	
<%@ include file="../inc/footer.jsp" %>
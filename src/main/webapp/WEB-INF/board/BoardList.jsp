<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>



<section>
	<div class="container">
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>Q&A리스트 <span style="font-size: 13px;font-weight: 400;">(레코드 갯수:${totalCount})</span></h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<form action="list.bd" method="post">
						<div class="input_style prd_searchbox ">
							<!-- <a href="write.bd">글쓰기</a> -->
							<input type="button" value="글쓰기" onClick="location.href='write.bd'">
							
							
							<select name="whatColumn">
								<option value="subject">제목
								<option value="writer">작성자
							</select>
							<input type="text" name="keyword">
							<input type="submit" value="검색">
						
						</div>
					</form>
					
					<!-- searchbox E -->
				</div>
			</div>
		</div>
			<!-- <td align="center">번호</td>
			<td align="center">제목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회</td>
			<td align="center">IP</td> -->
		<div class="notice_list_wrap">
			<ul class="list_ul">
				
				<c:set var="article" value="${list}"/>
				<c:if test="${fn:length(list)-1>=0 }">
				<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
				
					<li class="list_li">
						<div class="list_no">No. ${number-i }</div>
						<div class="list_subject">
							<c:if test="${article[i].re_level>0}">
								<img src="${pageContext.request.contextPath}/resources/level.gif" width="${article[i].getRe_level()*20}" height="15" >
								<img src="${pageContext.request.contextPath}/resources/re.gif" >
							</c:if>
							<a href="content.bd?num=${article[i].getNum()}&pageNumber=${pageNumber}">${article[i].getSubject()}</a>
							<c:if test="${article[i].readcount>10}">
								<img src="${pageContext.request.contextPath}/resources/hot.gif" >
							</c:if>
						</div>
						<div class="list_info">
							<div class="list_top" align="left"><i class="xi-user-o"></i> ${article[i].getWriter()}</div>
							<div class="list_bottom">
								<span class="list_date font_bold">${article[i].reg_date }</span>
								<span class="list_count"><i class="xi-eye-o"></i> ${article[i].getReadcount()}</span>
							</div>
						</div>
						<div class="list_edit">
							<span style="font-size:10px;color:#888;display:inline-block;line-height:1.5;padding:5px 0px;text-align:center;">접속 IP  ${article[i].getIp()}</span>
							
						</div>
						<%-- <div class="list_del">
							<input type="button" value="수정" onclick="goUpdate('${ntf.num}','${pageInfo.pageNumber}')">
							<a href="delete.nt?num=${ntf.num }&pageNumber=${pageInfo.pageNumber }">삭제</a>
						</div> --%>
					</li>
					
				</c:forEach>
				</c:if>
				<c:if test="${fn:length(list)-1<0 }">
					<li><div style="padding:20px 0;text-align:center;" align="center">글없음</div></li>
				</c:if>
			</ul>
		</div>
		<div class="pager_wrap">
			<!-- 페이지 번호 설정 -->
			${pageInfo.pagingHtml}
		</div>
	</div>
</section>	
	
<%@ include file="../inc/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/header.jsp" %>



<!-- bplist\productList.jsp -->
<script type="text/javascript">
	function insert() {
		location.href = "insert.blist";
	}
</script>

   

    
    
    
    
    
<!-- header -->

<section>
	<div class="container">
		
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>상품리스트</h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<form action="list.blist">
						<div class="input_style prd_searchbox ">
							<input class="mgl15" type="button" value="추가하기" onClick="insert()">
							<select name="whatColumn">
					    		<option value="all">전체선택
					    		<option value="pname">상품명
					    		<option value="category">카테고리
					    	</select>
							<input type="text" name="keyword">
    						<input type="submit" value="검색">
						</div>
					</form>
					<!-- searchbox E -->
				</div>
			</div>
		</div>
		
    

		<div class="prd_list_wrap">
			<div class="row">
				<c:forEach var="bplist" items="${list }">	<!-- ListController에서 mav.addObject로 넘겨받은 list를 여기 넣어줌 -->
					<div class="col-lg-3 col-sm-4 col-6">
						<a href="detail.blist?num=${bplist.num }&pageNumber=${pageInfo.pageNumber}">
							<div class="prd_thumbnail">
								<div class="prd_img_frame">
									<img src="<%=request.getContextPath() %>/resources/${bplist.img}" alt="">
								</div>
								<div class="prd_info_wrap">
									<p class="prd_category ellipsis">
										<small>상품번호: ${bplist.num }</small>
										<small>${bplist.gender } ${bplist.category }</small>
										<small>${bplist.poption }</small>
									</p>
									<p class="prd_title ellipsis">${bplist.pname }</p>
									<p class="prd_price ellipsis">${bplist.price }</p>
									<p class="prd_content ellipsis2">${bplist.content }</p>
								</div>
							</div>
						</a>
						<div class="edit_btn_wrap">
							<a class="edit_btn" href="update.blist?num=${bplist.num}&pageNumber=${pageInfo.pageNumber}">수정</a>
							<a class="edit_btn" href="delete.blist?num=${bplist.num}&pageNumber=${pageInfo.pageNumber}">삭제</a>
						</div>
						
					</div>
					
				</c:forEach>
			</div>			
			<div class="pager_wrap">
				${pageInfo.pagingHtml }
			</div>		
		</div>
	
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
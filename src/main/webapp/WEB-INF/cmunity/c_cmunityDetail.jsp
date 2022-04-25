<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>

    <%-- <%
    	String id = (String)session.getAttribute("id");
    %>
    <c:set var="id" value="<%=id %>"></c:set> --%>
    
    <script type="text/javascript">
		function deletePage(){
			var answer = confirm("정말 삭제하시겠습니까?")			
			if(answer == true){
				location.href = "cmuDelete.cmu?num="+${bean.num};
			}			
			else{
				
			}
		}		
		function update(){
			location.href="cmunityUpdate.cmu?num="+${bean.num};
		}		
		function uplikecount(){
			var answer = confirm("추천하시겠습니까?")
			
			if(answer == true){
				location.href = "upLikeCount.cmu?num="+${bean.num};
			}			
			else{				
			}			
		}
	</script>
    


<section>
	<div class="container">
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>커뮤니티</h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<div class="input_style prd_searchbox min_4depth">
						<c:if test="${id == bean.id || id == 'admin'}">
		    				<input type="button" value="삭제" onclick="deletePage()">
		    				<input type="button" value="수정" onclick="update()">
		    			</c:if>
		    			<input type="button" value="글목록" onclick="history.go(-1)">
					</div>
					
					<!-- searchbox E -->
				</div>
			</div>
		</div>
		
		<div class="notice_list_wrap">
			
			<div class="bbs_cont_wrap">
				<div class="bbs_title">
					<span class="title_no">No. ${bean.num }</span>
					<span class="title_bold">[${bean.gender }][${bean.category }]${bean.subject }</span>
				</div>
				<div class="bbs_info">
					<div class="info_left">
						<span><i class="xi-user"></i> ${bean.id }</span>
						<span><i class="xi-calendar"></i> ${bean.regdate }</span>
					</div>
					<div class="info_right">
						<span><i class="xi-eye-o"></i> ${bean.readcount }</span>
						<span class="mgl10"><i class="xi-thumbs-up"></i> ${bean.likecount }</span>
					</div>
				</div>
				<div class="bbs_cont">
					
					
					<!-- image -->
					<div class="row" style="margin-top: 15px;">
						<div class="col-md-6" style="text-align: center;">
							<img src="<%=request.getContextPath() %>/resources/${bean.img}" style="max-width: 100%;cursor:pointer;" onclick="location.href='detail.blist?num=${bean.num}&pageNumber=0'"/>
						</div>
						<div class="col-md-6">
						
						<style>
							
						</style>
							<div class="prdinfo_table_wrap">
								<table>
									<tr>
										<td style="border: none;">
											<p class="prd_title">상품정보</p>
										</td>
									</tr>
									<tr>
										<td><i class="xi-tag"></i> 상품명 : ${bean.pname }</td>
									</tr>
									<tr>
										<td><i class="xi-won"></i> 가격 : ${bean.price }</td>
									</tr>
									<tr>
										<td><i class="xi-box"> </i>잔여수량 : ${bean.stock }</td>
									</tr>
									<tr>
										<td><i class="xi-lightbulb-o"> </i>옵션 : ${bean.poption }</td>
									</tr>
								</table>
								<div class="buy_now input_style">
									<input type="button" value="추천 ${bean.likecount }" onclick="uplikecount()">
									<a href='detail.blist?num=${bean.num}&pageNumber=0'>구매하러가기</a>
								</div>
							</div>
							
						</div>
					</div>
					
					<!-- content -->
					<div class="row content_area">
						<div class="col-md-12">
							<!-- content -->
							${bean.content }
						</div>
					</div>
				</div>		
					
			</div>			
		</div>
		
		<!-- reply S -->
		<div class="prd_detail_wrap">			
			<!-- 댓글리스트 -->				
			<div class="order_wrap row d_reply">
				<div class="col-md-12">
					<h3>댓글 리스트</h3>
				</div>
				<!-- list S -->
				<div class="col-md-12 mgt5">
					<ul class="order_basket_ul">
			            <!-- title S -->
						<li class="order_basket_moblie">
							<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
						</li>
						<li class="order_basket_list_title"></li>
			           	<c:forEach var="replylist" items="${replylist}">
							<!--list_li -->
							<li class="order_basket_list_prd order_bdt">
								<div class="order_table_basket01 basket_chk_area"></div>
								<div class="order_table_basket02 basket_prd_img_wrap">
									<div class="basket_prd_img">
										<img src="<%=request.getContextPath() %>/resources/${replylist.img}" alt="">
									</div>
									<div class="basket_prd_info">
										<span class="brand_name">${replylist.insertdate}</span>
										<a class="product_name" href="">${replylist.id}</a>
										<!--제품명-->
										<!---->
										<div class="product_price">
											<!--제품가격-->
											<span class="product_price_original">${replylist.content}</span>
											<!---->
										</div>
										<!---->
									</div>
								</div>
								
								<div class="order_table_basket04 shop_order_price">
									<c:if test="${id==bean.id || id=='admin' }">
										<%-- <input type="button" value="수정" onclick="location.href='updatereply.cmu?num=${bean.num }&replenum=${replylist.replenum}'" class="order_basket_delete"> --%>
										<input type="button" value="삭제" onclick="location.href='deletereply.cmu?num=${bean.num }&replenum=${replylist.replenum}'" class="order_basket_delete">
									</c:if>
									<input type="button" value="신고" onclick="location.href='benList.ben?id=${replylist.id }&num=${replylist.replenum}'" class="order_basket_delete">
									<!-- 수정해야하지만 그냥한다. -->
								</div>
								
								
							</li>
							<!--list_li -->
						</c:forEach>
						<!-- list E -->
					</ul>
				</div>
				<!-- list E -->
			</div>
			
			<!--댓글 입력  -->
			
			<!-- 댓글폼 -->
			<div class="order_wrap d_reply d_reply_bd ">
				<div class="row">
					<div class="col-md-12">
						<h3>댓글 작성</h3>
					</div>
					<div class="col-md-12 mgt5">
						<form action="insertreply.cmu" enctype="multipart/form-data" method="post">
							<input type="text" hidden="hidden" value=" ${bean.num}" name="num">
							<div class="row">
								<div class="col-3" style="text-align: center;"><label for="" style="margin: 8px 0px;display: inline-block;text-align: center;"><i class="xi-image-o"></i> 이미지 첨부</label></div>
								<div class="col input_style"><input type="file" name="upload" id="ifile" style="border: none;"></div>
							</div>
							<div class="row">
								<div class="col input_style">
								 	<textarea name="content" cols="80" rows="3"></textarea>
								</div>
								<div class="col-12 input_style" style="text-align: center;">
									<input type="submit" class="submit_btn" value="댓글쓰기" style="width: 100px;margin-top: 10px;margin-bottom: 15px;">
								</div>						
							</div>
							
						</form>
					</div>
				</div>
			</div>			
		</div>
		<!-- reply E -->
		
		
		
		
				
	</div>
</section>	
	
<%@ include file="../inc/footer.jsp" %>    
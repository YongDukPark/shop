<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="128kb"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../inc/header.jsp" %>

<!-- bplist\productDetailView.jsp<br><br> -->
<script type="text/javascript">
	
	function singleOrder(){		
		var stock = document.myform.stock.value;		
		if(document.myform.stock.value.length==0){
			alert("수량을 입력하세요");
			return false;
		}		
		
		if(isNaN(document.myform.stock.value)){ //abc => true, 123 => false
			alert('숫자를 입력해주세요.');
			document.myform.stock.select();
			return false;
		}		
		
		location.href="single.sbox?num="+${bb.num}+"&stock="+stock+"&poption="+${bb.poption };		
	}
	
	function goShopBox(){		
		var stock = document.myform.stock.value;		
		if(document.myform.stock.value.length==0){
			alert("수량을 입력하세요");
			return false;
		}		
		
		if(isNaN(document.myform.stock.value)){ //abc => true, 123 => false
			alert('숫자를 입력해주세요.');
			document.myform.stock.select();
			return false;
		}		
		
		location.href="shopboxinsert.sbox?num="+${bb.num}+"&stock="+stock;		
	}
</script>
	


<section>
	<div class="container">
		
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-12">
					<h3>커퓨니티 상세보기</h3>
				</div>
			</div>
		</div>
		
		<div class="prd_detail_wrap">
			<div class="row">
				<div class="col-md-6">
					<div class="prd_thumbnail">
						<div class="prd_img_frame">
							<img src="<%=request.getContextPath() %>/resources/${bb.img}" alt="상품이미지">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<form action="single.sbox" name="myform">	
						<div class="prd_info_wrap">
							<p class="prd_category">${bb.gender } ${bb.category }</p>
							<p class="prd_title">${bb.pname }</p>
							<p class="prd_content">${bb.content }</p>
							<p class="prd_price">${bb.price }</p>
						</div>
						<div class="prd_options input_style">
							
							<div class="row">
								<div class="col-md-12 option_wrap">
									<label class="option_title">옵션</label>
									<!-- <select name="options" id="">
										<option value="">S</option>
										<option value="">M</option>
										<option value="">L</option>
									</select> -->
									<input name="option" type="text" readonly value="${bb.poption }">									
								</div>
							
								<div class="col-md-12 option_wrap">
									<label class="option_title">재고 수량</label>
									<input name="" type="text" readonly value="${bb.stock }">
								</div>
								<div class="col-md-12 option_wrap">
									<label class="option_title">주문 수량</label>
									<input type="text" name="stock" id="stock">
					    			<input type="hidden" name="num" value="${bb.num }">
								</div>
							</div>						
						</div>

						<!-- <p class="prd_total_price">30000</p> -->
						
						<div class="submit_btn_wrap">
							<div class="row">
								<div class="col-sm-6">
									<input type="button" class="cart_btn" value="장바구니" onClick="goShopBox()">
								</div>
								<div class="col-sm-6">
									<!-- <input type="submit" class="buy_btn" value="주문하기" onclick="singleOrder()"> -->
									<input type="button" class="buy_btn" value="주문하기" onclick="singleOrder()">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="prd_detail_wrap edit_btn_wrap">
			<!-- 상세페이지 내용~~~ -->
			<input type="button" value="수정" onclick="location.href='update.blist?num=${bb.num}&pageNumber=${pageNumber}'" class="edit_btn">
    		<input type="button" value="삭제" onclick="location.href='delete.blist?num=${bb.num}&pageNumber=${pageNumber}'" class="edit_btn">
    		
    		<input type="button" value="돌아가기" onclick="location.href='list.blist?pageNumber=${pageNumber }'" class="edit_btn">
		</div>
		
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
								<c:if test="${id==bb.id || id=='admin' }">
									<div class="order_table_basket04 shop_order_price">
										<a href="javascript:void(0);" onclick="location.href='updatereply.blist?num=${bb.num}&replenum=${replylist.replenum}'" class="order_basket_delete">수정</a>
										<a href="javascript:void(0);" onclick="location.href='deletereply.blist?num=${bb.num}&replenum=${replylist.replenum}'" class="order_basket_delete">삭제</a>
										<a href="javascript:void(0);" onclick="location.href='benList.ben?id=${replylist.id }&num=${bb.num}'" class="order_basket_delete">신고</a>
									</div>
								</c:if>
								
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
						<form action="insertreply.blist" enctype="multipart/form-data" method="post">
							<input type="text" hidden="hidden" value=" ${productinfo.num}" name="num">
							<input type="text" hidden="hidden" value=" ${pageNumber}" name="pageNumber">
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
							
							
							<%-- <table>
								<tr>
									<td class="input_style"> 
										이미지 <input type="file" name="upload" id="ifile"> 
										<input type="text" hidden="hidden" value=" ${productinfo.num}" name="num"> 
										<input type="text" hidden="hidden" value="pro" name="type"> 
										<textarea name="content" cols="80" rows="3"></textarea>
										<input type="submit" value="댓글쓰기">
									</td>
								</tr>
							</table> --%>
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
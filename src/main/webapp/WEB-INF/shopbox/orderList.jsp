<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>	

<script type="text/javascript">

	/* function init(){
		window.open ("orderPopup","결제정보","width = 300, height = 350, left=200, top=100");
	} */
	
	
	function cancelOrder(num){
		//alert(num);
		
		var answer = confirm("정말로 삭제하실건가요..?ㅠㅠ");
		
		if(answer == true){
			answer2 = confirm("다시한번 생각해주세요...ㅠ");
				if(answer2 == true){
					alert("잘가요 이쁜옷이여..");
					location.href="cancelOrder.sbox?num="+num	
				}	
				else if (answer2 == false) {
					alert("즐거운 쇼핑되세요 :D");
				}
		}
		else if (answer == false) {
			alert("즐거운 쇼핑되세요 :D");
		}
		
	}
	
	function AdminCancel(id,num){
		
		//alert(num);
		//alert(id);	문자열 넘길때는 소괄호 쳐라 용덕아 ^^ 기본적인것도 못하네
		
		var answer = confirm("삭제할건가요?");
		
		if(answer = true){
			alert("삭제했어요");
			location.href="adminCancel.sbox?num="+num+"&id="+id
		}
		else if(answer = false){
			alert("그래요");
		}
	}
</script>

	
	
	
	
<!-- header -->

<section>
	<div class="container">
		
		<div class="account_list order_wrap">
			
			<!-- 상품이 없을 시 -->
			<c:if test="${fn:length(lists) <1 }">
				<div class="row">
					<div class="col-md-6">
						<h3>결제 리스트</h3>
					</div>
					<div class="col-md-6"></div>	
					<!-- list S -->
					<div class="col-md-12 mgt5">
						<ul class="order_basket_ul">
							<li class="order_basket_moblie">
								<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
							</li>
							<li class="order_basket_list_title">
				                <div class="order_table_basket01 basket_chk_area"></div>
				                <div class="order_table_basket02 basket_prd_img_wrap">상품정보</div>
				                <div class="order_table_basket03 order_basket_ea_area">수량</div>
				                <div class="order_table_basket04 shop_order_price">주문금액</div>
				                <div class="order_table_basket05 shop_order_status">주문 가능상태</div>
				            </li>
				            <li>
				            	<div class="empty_li">
				            		<p>결제한 상품이 없습니다.</p>
				            		<a href="list.blist">상품 주문하러 가기</a>
				            	</div>
				            	
				            </li>
						</ul>
						<div class="pager_wrap">
							${pageInfo.pagingHtml}	
						</div>
					</div>
				</div>
			</c:if>
			
			<!-- 상품이 있을 시 S -->
			<c:if test="${fn:length(lists) >0 }">
				<!-- 일반 회원 접속시 S -->
				<c:if test="${id != 'admin' }">
					<div class="row">
						<div class="col-md-6">
							<h3>결제 리스트</h3>
						</div>
						<div class="col-md-6">
							<form action="Ordlist.sbox" method="get">				
								<!-- searchbox S -->
								<div class="input_style account_searchbox ">
									<select name="whatColumn" >
										<option value="" >선택</option>
										<option value="name" >상품명</option>
									</select>
									<input type="text" name="keyword">
		    						<input type="submit" value="검색">
								</div>
								<!-- searchbox E -->
							</form>
						</div>	
						<!-- list S -->
						<div class="col-md-12 mgt5">
							<ul class="order_basket_ul">
					            <!-- title S -->
								<li class="order_basket_moblie">
									<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
								</li>
								<li class="order_basket_list_title">
					                <div class="order_table_basket01 basket_chk_area"></div>
					                <div class="order_table_basket02 basket_prd_img_wrap">상품정보</div>
					                <div class="order_table_basket03 order_basket_ea_area">수량</div>
					                <div class="order_table_basket04 shop_order_price">주문금액</div>
					                <div class="order_table_basket05 shop_order_status">주문 가능상태</div>
					            </li>
					            <c:forEach var = "i" begin="0" end="${fn:length(lists)-1 }" step="1">
									<!--list_li -->
									<li class="order_basket_list_prd order_bdt">
										<div class="order_table_basket01 basket_chk_area">
											
										</div>
										<div class="order_table_basket02 basket_prd_img_wrap">
											<div class="basket_prd_img">
												<img src="<%=request.getContextPath() %>/resources/${lists[i].img }" alt="">
											</div>
											<div class="basket_prd_info">
												<span class="brand_name">상품번호: ${lists[i].num}</span>
												<span class="brand_name mgl10">주문일자: ${lists[i].regdate }</span>
												<a class="product_name" href="detail.blist?num=${lists[i].num }&pageNumber=0">${lists[i].pname }</a>
												<!--제품명-->
												<!---->
												<div class="product_price">
													<!--제품가격-->
													<span class="product_price_original">${lists[i].price}원</span>
													<!---->
												</div>
												<!---->
												<div class="product_option">
													<div class="option-text">옵션 : ${lists[i].poption}</div>
												</div>
												<!---->
											</div>
										</div>
										<div class="order_table_basket03 order_basket_ea_area">
											<div class="ea_wrap">
												<span>주문 수량 : ${lists[i].stock}</span>
											</div>
											<div class="ea_wrap">
												<span>주문 옵션 : ${lists[i].poption }</span>
											</div>
										</div>
										<div class="order_table_basket04 shop_order_price">
											<div class="shop_price">
												<span>${lists[i].price*lists[i].stock }</span> 원
											</div>
											<a href="javascript:void(0);" onclick="cancelOrder(${lists[i].num })" class="order_basket_delete">주문취소</a>
										</div>
										<div class="order_table_basket05 shop_order_status">
											${lists[i].status }
										</div>
									</li>
									<!--list_li -->
								</c:forEach>
								<!-- list E -->
							</ul>
							<div class="pager_wrap">
								${pageInfo.pagingHtml}	
							</div>
						</div>
						<!-- list E -->
					</div>
				</c:if>		
				<!-- 일반 회원 접속시 E -->
				
				<!-- admin 접속시 S -->
				<c:if test="${id == 'admin' }">
					<div class="row">
						<div class="col-md-6">
							<h3>결제 리스트(admin)</h3>
						</div>
						<div class="col-md-6">
							<form action="Ordlist.sbox" method="get">				
								<!-- searchbox S -->
								<div class="input_style account_searchbox ">
									<select name="whatColumn" >
										<option value="" >선택</option>
										<option value="pname" >상품명</option>
										<option value="id" >id</option>
									</select>
									<input type="text" name="keyword">
		    						<input type="submit" value="검색">
								</div>
								<!-- searchbox E -->
							</form>
						</div>	
						<!-- list S -->
						<div class="col-md-12 mgt5">
							
							<ul class="order_basket_ul">
					            <!-- title S -->
								<li class="order_basket_moblie">
									<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
								</li>
								<li class="order_basket_list_title">
					                <div class="order_table_basket01 basket_chk_area"></div>
					                <div class="order_table_basket02 basket_prd_img_wrap">상품정보</div>
					                <div class="order_table_basket03 order_basket_ea_area">수량</div>
					                <div class="order_table_basket04 shop_order_price">주문금액</div>
					                <div class="order_table_basket05 shop_order_status">주문 가능상태</div>
					            </li>
					            <c:forEach var = "i" begin="0" end="${fn:length(lists)-1 }" step="1">
									<!--list_li -->
									<li class="order_basket_list_prd order_bdt">
										<div class="order_table_basket01 basket_chk_area">
											
										</div>
										<div class="order_table_basket02 basket_prd_img_wrap">
											<div class="basket_prd_img">
												<img src="<%=request.getContextPath() %>/resources/${lists[i].img }" alt="">
											</div>
											<div class="basket_prd_info">
												<span class="brand_name">번호: ${totalCount=totalCount-1 }</span>
												<span class="brand_name mgl10">상품번호: ${lists[i].num}</span>
												<span class="brand_name mgl10">주문일자: ${lists[i].regdate }</span>
												<a class="product_name" href="detail.blist?num=${lists[i].num }&pageNumber=0">${lists[i].pname }</a>
												<!--제품명-->
												<!---->
												<div class="product_price">
													<!--제품가격-->
													<span class="product_price_original">${lists[i].price}원</span>
													<!---->
													<p>구매자 : ${lists[i].id }</p>
												</div>
												<!---->
												<div class="product_option">
													<div class="option-text">옵션 : ${lists[i].poption}</div>
												</div>
												<!---->
											</div>
										</div>
										<div class="order_table_basket03 order_basket_ea_area">
											<div class="ea_wrap">
												<span>주문 수량 : ${lists[i].stock}</span>
											</div>
											<div class="ea_wrap">
												<span>주문 옵션 : ${lists[i].poption }</span>
											</div>
										</div>
										<div class="order_table_basket04 shop_order_price">
											<div class="shop_price">
												<span>${lists[i].price*lists[i].stock }</span> 원
											</div>
											<a href="javascript:void(0);" onclick="AdminCancel('${lists[i].id }',${lists[i].num } )" class="order_basket_delete">주문취소</a>
										</div>
										<div class="order_table_basket05 shop_order_status">
											${lists[i].status }
										</div>
									</li>
									<!--list_li -->
								</c:forEach>
								<!-- list E -->
							</ul>
							<div class="pager_wrap">
								${pageInfo.pagingHtml}	
							</div>
						</div>
					</div>	
				</c:if>
				<!-- admin 접속시 E -->
				
			</c:if>
			<!-- 상품이 있을 시 E -->
			
		</div>
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>	
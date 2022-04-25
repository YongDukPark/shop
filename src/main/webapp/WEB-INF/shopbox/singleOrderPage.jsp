<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/header.jsp" %>

<!-- 단일상품일경우(상세페이지에서 바로 구매시) -->
    
    
<section>
	<div class="container">
		
		<div class="order_wrap">
			<h3>주문하기</h3>
			<form name="myform" action="finalSingleOrder.sbox?price=${bean.price }&num=${bean.num }">
				<input type = "hidden" name = "num" value = "${bean.num}">
				<input type = "hidden" name = "totalprice" value = "${bean.price*bean.stock}">
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
		            <!-- title E -->
					
					<!--list S -->
					<li class="order_basket_list_prd order_bdt">
						<div class="order_table_basket01 basket_chk_area"></div>
						<div class="order_table_basket02 basket_prd_img_wrap">
							<div class="basket_prd_img">
								<img src="<%=request.getContextPath() %>/resources/${bean.img}" alt="">
							</div>
							<div class="basket_prd_info">
								<span class="brand_name">상품번호: ${bean.num}</span>
								<a class="product_name" href="">${bean.pname }</a>
								<!--제품명-->
								<!---->
								<div class="product_price">
									<!--제품가격-->
									<span class="product_price_original">${bean.price}원</span>
									<!---->
								</div>
								<!---->
								<div class="product_option">
									<div class="option-text">옵션 : ${bean.poption}</div>
								</div>
								<!---->
							</div>
						</div>
						<div class="order_table_basket03 order_basket_ea_area">
							<div class="ea_wrap">
								<span>총 재고 수량 : ${stock }</span>
								<span>주문 수량 : ${bean.stock}</span>
							</div>
						</div>
						<div class="order_table_basket04 shop_order_price">
							<div class="shop_price">
								<span>${bean.price*bean.stock }</span> 원
							</div>
							<!-- <a href="javascript:void(0);" onclick="" class="order_basket_buynow">Buy Now</a>  -->
							<!-- <a href="javascript:void(0);" onclick="" class="order_basket_delete">Delete</a> -->
						</div>
						<div class="order_table_basket05 shop_order_status">
							<c:if test="${(stock-bean.stock)<0 }"><font color="red"><b>주문불가</b></font></c:if>
							<c:if test="${(stock-bean.stock)>-1 }"><b>주문가능</b></c:if>
						</div>
					</li>
					<!-- list E -->
		
				</ul>
				
				
				<div class="order_list_footer">
                    <div class="order_shop">
                        <div class="order_footer_btn row">
                            <div class="order_f_btn_wrap offset-sm-2 col-sm-5 col-12">
                                <div class="order_btn_footer order_buy_price">상품 결제 가격 : ${bean.price*bean.stock } 원</div>
                            </div>
                            <div class="order_f_btn_wrap col-sm-3 col-12">
                            	<input type="submit" class="order_btn_footer order_buy_ea" value = "결제" onClick="goOrder()">
                            	<!-- <a href="javascript:void(0);" onclick="multiOrder()" class="order_btn_footer order_buy_ea">선택상품 결제</a> -->
                            </div>
                            <!-- <div class="order_f_btn_wrap col-sm-3 col-6">
                                <a href="javascript:void(0);" onclick="" class="order_btn_footer order_buy_all">전체상품 구매</a>
                            </div> -->
                        </div>
                    </div>                    
                </div>
		
		
			</form>
		</div>
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
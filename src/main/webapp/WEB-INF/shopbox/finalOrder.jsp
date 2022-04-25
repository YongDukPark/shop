<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/header.jsp" %>

<%-- 
<h2>축하드립니다 ${count } 개의 상품이 결제가 완료되었습니다</h2>
총 결제금액 : <h3>${totalPrice }</h3><br>
 --%>
<!-- finalOrder.jsp -->
<section>
	<div class="container">
		<div class="order_wrap">
			<div class="order_success order_ul_bdb">
				<ul class="orderlist_ul">
				    <li class="shop_orderlist_msg">
				        <div class="orderlist_icon_wrap">
				        	<i class="xi-check-circle"></i><!-- <i class="xi-gift-o"></i> --></div>
						<div class="orderlist_text_wrap">
						    <h3>결제완료</h3>
						    <span class="order_access_msg">총 ${count }개의 상품이 정상적으로 결제 되었습니다.</span>
							<span class="order_access_msg_sub">감사합니다.</span>
							<div class="order_access_msg_info">총 결제금액 : <span class="order_access_msg_c">${totalPrice } 원</span></div>
						</div>
			        </li>
			    </ul>
			    <div class="success_btn_wrap">
			    	<div class="row">
			    		<div class="col-md-3 col-6"><a href="Ordlist.sbox">주문내역 확인하기</a></div>
			    		<div class="col-md-3 col-6"><a href="list.blist">다른 주문하러가기</a></div>
			    		<div class="col-md-3 col-6"><a href="">커뮤니티로 돌아가기</a></div>
			    		<div class="col-md-3 col-6"><a href="shopboxlist.sbox">장바구니 보러가기</a></div>
			    	</div>
			    </div>
			</div>
		</div>
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>	

<%-- <h1>회원 상세정보 ${user.num }</h1> --%>



<section>
	<div class="container">
	
		<div class="user_list_wrap order_wrap" style="border-color: #121212;">
			<div class="d_list_item">
				<div class="row d_aic">
			        <div class="col-lg-3 col-md-4">
			            <a>
				            <div class="d_list_cate">
				                <p class="d_item_num">No. ${user.num }</p>
				                <p class="d_item_name">${user.id }</p>
				                <p class="d_item_date">가입일 : ${user.insertdate }</p>
				            </div>
			            </a>
			        </div>
			        <div class="col-lg-7 col-md-6">
			            <div class="d_list_tit">
			                <div class="row">
				                <div class="d_list_info col-lg-7">
				                	<p class="d_item_info"><b class="d_td">ID / PW</b><span class="d_td"><span>${user.id } / ${user.pass }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
				                    <p class="d_item_info"><b class="d_td">Gender / Birth</b><span class="d_td"><span>${user.gender } / ${user.birth }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
				                    <p class="d_item_info"><b class="d_td">Pnum</b><span class="d_td"><span>${user.pnum }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
				                    <p class="d_item_info"><b class="d_td">Address</b><span class="d_td"><span>${user.address1} ${user.address2 }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
				                </div>
				                <div class="d_list_info col-lg-5">
				                	<p class="d_item_ben"><b class="d_td">Ban point</b></p>
				                	<p class="d_item_ben d_point"><span class="d_td"><span>${user.benpoint }</span></span></p>
				               	</div>
			                </div>
			            </div>
			        </div>
			        <div class="col-lg-2 col-md-2">
			            <div class="d_list_btn">
			                <!--스타일작업 필요 a태그-->
			                <%-- <a href="userDelete.ulist?num=${user.num}&pageNumber=${pageInfo.pageNumber}">삭제</a> --%>
			                <a href="userList.ulist?pageNumber=${pageNumber}">회원 리스트</a>
			                <!--스타일작업 필요-->
			            </div>
			        </div>
			    </div>
			</div>					
			
			<div class="d_list_item1">
				
				<!-- 거래 상품이 있을시 -->
				<c:if test="${fn:length(payments)-1>=0}">
					
					
					<div class="row">
						<!-- <div class="col-md-6">
							<h3>결제 리스트(admin)</h3>
						</div> -->
						
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
					            <c:forEach var="i" begin="0" end="${fn:length(payments)-1}">
									<!--list_li -->
									<li class="order_basket_list_prd order_bdt">
										<div class="order_table_basket01 basket_chk_area"></div>
										<div class="order_table_basket02 basket_prd_img_wrap">
											<div class="basket_prd_img">
												<img src="<%=request.getContextPath() %>/resources/${payments[i].img}" alt="">
											</div>
											<div class="basket_prd_info">
												<%-- <span class="brand_name">번호: ${totalCount=totalCount-1 }</span> --%>
												<span class="brand_name">상품번호: ${payments[i].num}</span>
												<span class="brand_name mgl10">주문일자: ${payments[i].regdate }</span>
												<a class="product_name">${payments[i].pname }</a>
												<!--제품명-->
												<!---->
												<div class="product_price">
													<!--제품가격-->
													<span class="product_price_original">${payments[i].price}원</span>
													<!---->
													<p>구매자 : ${payments[i].id}</p>
												</div>
												<!---->
												<%-- <div class="product_option">
													<div class="option-text">옵션 : ${payments[i].poption}</div>
												</div> --%>
												<!---->
											</div>
										</div>
										<div class="order_table_basket03 order_basket_ea_area">
											<div class="ea_wrap">
												<span>주문 수량 : ${payments[i].stock}</span>
											</div>
											<div class="ea_wrap">
												<span>주문 옵션 : ${payments[i].poption }</span>
											</div>
										</div>
										<div class="order_table_basket04 shop_order_price">
											<div class="shop_price">
												<span>${payments[i].price*payments[i].stock }</span> 원
											</div>
										</div>
										<div class="order_table_basket05 shop_order_status">
											${payments[i].status }
										</div>
									</li>
									<!--list_li -->
								</c:forEach>
								<!-- list E -->
							</ul>							
						</div>
					</div>	
				</c:if>	
				
				<!-- 거래 상품이 없을시 -->
				<c:if test="${fn:length(payments)-1<0}">
					<div class="row account_list">
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
					            		<p>주문 내역 없음</p>
					            		<a href="userList.ulist?pageNumber=${pageNumber}">회원 리스트</a>
					            	</div>
					            	
					            </li>
							</ul>
						</div>
					</div>
				</c:if>
				
				
			</div>
		</div>			
		
	
	
	</div>
</section>
	
	
	
<%@ include file="../inc/footer.jsp" %>	
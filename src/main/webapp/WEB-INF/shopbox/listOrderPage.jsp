<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="128kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../inc/header.jsp" %>

<!-- listOrderPage.jsp -->
<script type="text/javascript">
	function allCheck(acheck){
		//alert(1);
		
		var rowcheckArr = document.getElementsByName("rowcheck");	//rowcheck에 체크된애들 가져와라
		var allstock = document.getElementsByName("stock");
		
		//alert(rowcheckArr);
		
		check = acheck.checked;
		
		//alert(check);	true 나온다.  체크되면 true
		
		if(check){ // allcheck 체크했으면
			for(var i=0;i<rowcheckArr.length;i++){
				rowcheckArr[i].checked = true;
			}
		}
		else{ // allcheck 해제 했으면
			for(var i=0;i<rowcheckArr.length;i++){
				rowcheckArr[i].checked = false;
			}
		}
	}
	
	function multiOrder(){
		//alert(5);
		
		var rowcheckArr = document.getElementsByName("rowcheck");
		
		flag = false;
		
		for(var i=0;i<rowcheckArr.length;i++){
			if(rowcheckArr[i].checked==true){
				flag=true;
			}
		}
		if(flag==false){
			alert("최소 하나는 선택해주세요 :D");
			return;
		}
		
		
		document.myform.submit();
	}
</script>










<section>
	<div class="container">
		
		<div class="order_wrap">
			<h3>주문하기</h3>
			<form action="finalListOrder.sbox" name="myform">
				<ul class="order_basket_ul">
		            <!-- title S -->
					<li class="order_basket_moblie">
						<input type="checkbox" name="rowcheck" onClick="allCheck(this)" id="order_allChk">
						<label for="order_allChk">전체선택</label>
						<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
					</li>
					<li class="order_basket_list_title">
		                <div class="order_table_basket01 basket_chk_area">
		                	<input type="checkbox" name="rowcheck" onClick="allCheck(this)">
		                </div>
		                <div class="order_table_basket02 basket_prd_img_wrap">상품정보</div>
		                <div class="order_table_basket03 order_basket_ea_area">수량</div>
		                <div class="order_table_basket04 shop_order_price">주문금액</div>
		                <div class="order_table_basket05 shop_order_status">주문 가능상태</div>
		            </li>
		            <!-- title E -->
					
					<!--list S -->
					<c:forEach var = "i" begin="0" end="${fn:length(lists)-1 }" step="1">
						<!--list_li -->
						<li class="order_basket_list_prd order_bdt">
							<div class="order_table_basket01 basket_chk_area">
								<input type="checkbox" name="rowcheck" value="${lists[i].num}" checked>
								<input type="hidden" name="totalPrice" value="${lists[i].price*lists[i].stock }">
							</div>
							<div class="order_table_basket02 basket_prd_img_wrap">
								<div class="basket_prd_img">
									<img src="<%=request.getContextPath() %>/resources/${lists[i].img}" alt="">
								</div>
								<div class="basket_prd_info">
									<span class="brand_name">상품번호: ${lists[i].num}</span>
									<a class="product_name" href="">${lists[i].pname }</a>
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
									<span>총 재고 수량 : ${stockCheck[i] }</span>
									<span>주문 수량 : ${lists[i].stock}</span>
								</div>
							</div>
							<div class="order_table_basket04 shop_order_price">
								<div class="shop_price">
									<span>${lists[i].price*lists[i].stock }</span> 원
								</div>
								<!-- <a href="javascript:void(0);" onclick="" class="order_basket_buynow">Buy Now</a>  -->
								<!-- <a href="javascript:void(0);" onclick="" class="order_basket_delete">Delete</a> -->
							</div>
							<div class="order_table_basket05 shop_order_status">
								<c:if test="${(stockCheck[i]-lists[i].stock)<0 }"><font color="red"><b>주문불가</b></font></c:if>
								<c:if test="${(stockCheck[i]-lists[i].stock)>-1 }"><b>주문가능</b></c:if>
							</div>
						</li>
						<!--list_li -->
					</c:forEach>
					
					<!-- list E -->
		
				</ul>
				
				
				<div class="order_list_footer">
                    <div class="order_shop">
                        <div class="order_footer_btn row">
                            <div class="order_f_btn_wrap offset-sm-2 col-sm-5 col-12">
                                <div class="order_btn_footer order_buy_price">모든상품 결제 가격 : ${totalPrice } 원</div>
                            </div>
                            <div class="order_f_btn_wrap col-sm-3 col-12">
                            	<input type="button" class="order_btn_footer order_buy_ea" value = "선택상품 결제" onClick = "multiOrder()">
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



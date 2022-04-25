<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="128kb" %>
<%@ include file="./../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>

<!-- a_1_shopbox.jsp(장바구니) <br /> -->
<script type="text/javascript">

	function changeStock(num,pname){
		
		location.href="shopboxupdate.sbox?num="+num+"&pname="+pname;
		
	}
	
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
	
	/* $(function() {
		$('#menu1').click(function(){
			$.ajax({	//load와 같은건데 이게 제일 많이 사용된다고 한다.
						//일부분만 변화할수 있게끔 만들때 이걸 사용한다 시간을 아끼기위해 주로 사용한다.
						
					url : 'menu.html',		//요청 url : 가져올 화일의 이름		이것도 ./../ 이런식으로 움직여도 된다. 
					dataType : 'html',		//응답 결과의 타입   어떤타입으로 갖고싶냐? html 형태로
					success : function(data){	//콜백함수		위에서 호출한 값을 data에 넣는거다. 호출이 성공하면 위에 실패하면 밑에
						$('#message1').append("성공:" + data);
						//위에 append 는 단점이 새로운걸 뽑을때 지워주는 작업을 진행해야한다.
						//$('#message1').html("성공:" + data);	이건 하나의 데이터만 출력한다.
					},
					error : function(data){		//만약 실패했을때 하고싶은일이 없으면 안써도 된다.
						alert('실패' + data);		//data에 [object Object]로 나온다.
					}
			});		//ajax
		}); */
	
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
				            		<p>장바구니에 상품이 없습니다.</p>
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
				<form action="order.sbox" name="myform">
				
				
					<div class="row">
						<div class="col-md-6">
							<h3>장바구니</h3>
						</div>
						<div class="col-md-6"></div>
						<!-- list S -->
						<div class="col-md-12 mgt5">
							<ul class="order_basket_ul">
								<!-- title S -->
								<li class="order_basket_moblie">
									<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
								</li>
								<li class="order_basket_list_title">
									<div class="order_table_basket01 basket_chk_area">
										<input type="checkbox" name="rowcheck" onClick="allCheck(this)">
									</div>
									<div class="order_table_basket02 basket_prd_img_wrap">상품정보</div>
									<div class="order_table_basket03 order_basket_ea_area">수량</div>
									<div class="order_table_basket04 shop_order_price">주문금액</div>
									<div class="order_table_basket05 shop_order_status">주문
										가능상태</div>
								</li>
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
												<span>주문 수량 : ${lists[i].stock} 
													<a class="order_stock_edit" onclick="changeStock('${lists[i].num}','${lists[i].pname }')" <%-- href="detail.blist?num=${lists[i].num }&pageNumber=0" --%>>수정</a>
													<%-- <input type="button" class="order_stock_edit" value="수정" onclick="changeStock('${lists[i].num}','${lists[i].pname }')"> --%>
												</span>
											</div>
											<div class="ea_wrap">
												<span>주문 옵션 : ${lists[i].poption }</span>
											</div>
										</div>
										<div class="order_table_basket04 shop_order_price">
											<div class="shop_price">
												<span id="optPriceTxt6170">${lists[i].price*lists[i].stock }</span>
												원
											</div>
											<a href="javascript:void(0);" onclick="location.href='shopboxdelete.sbox?num=${lists[i].num}'" class="order_basket_delete">주문취소</a>
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
							<div class="pager_wrap">${pageInfo.pagingHtml}</div>
						</div>
					</div>
				</form>
				<div class="order_shop">
                     <div class="order_footer_btn row" style="padding-top: 0;">
                         <div class="order_f_btn_wrap offset-sm-2 col-sm-5 col-12">
                             <div class="order_btn_footer order_buy_price">모든상품 결제 가격 : ${totalPrice } 원</div>
                         </div>
                         <div class="order_f_btn_wrap col-sm-3 col-12">
                         	<input type="button" class="order_btn_footer order_buy_ea" value = "선택상품 결제" onClick = "multiOrder()">
                         	<!-- <a href="javascript:void(0);" onclick="multiOrder()" class="order_btn_footer order_buy_ea">선택상품 결제</a> -->
                         </div>
                     </div>
                 </div> 
			</c:if>
			<!-- 상품이 있을 시 E -->
			
		</div>
	</div>
</section>









<!-- footer -->
<%@ include file="../inc/footer.jsp" %>	    
    
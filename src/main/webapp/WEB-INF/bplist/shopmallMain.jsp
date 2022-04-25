<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/header.jsp" %>  




<style>
	@media all and (max-width: 991px){
		.d_pc_only {display: none;}
	}
	@media all and (min-width: 992px){
		.d_mo_only {display: none;}
	}
</style>


<style>
	@media(min-width: 992px){
		.swiper {
			width: 100%;
			/* height: 600px; */
		}
		.swiper-slide {
			text-align: center;
			font-size: 18px;
			background: #fff;
			
		}
		.swiper-slide img {
			display: inline-block;
			width: 100%;
			/* height: 100%;
			object-fit: cover; */
		}
		.mo_img{display: none !important;}
	}
	@media(max-width: 991px){
		.swiper {
			width: 100%;
		}
		.pc_img {display: none !important;}
	}
</style>
<div class="main_visual">
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				
				<img class="pc_img" src="${pageContext.request.contextPath}/resources/img/main_visual01.jpg" alt="" />
				<img class="mo_img" src="http://placeimg.com/1000/550/arch​" alt="" />
			</div>
			<div class="swiper-slide">
				<img class="pc_img" src="${pageContext.request.contextPath}/resources/img/main_visual02.jpg" alt="" />
				<img class="mo_img" src="http://placeimg.com/1000/550/tech" alt="" />
			</div>
			<div class="swiper-slide">
				<img class="pc_img" src="${pageContext.request.contextPath}/resources/img/main_visual01.jpg" alt="" />
				<img class="mo_img" src="http://placeimg.com/1000/550/people​" alt="" />
			</div>
			<div class="swiper-slide">
				<img class="pc_img" src="${pageContext.request.contextPath}/resources/img/main_visual02.jpg" alt="" />
				<img class="mo_img" src="http://placeimg.com/1000/550/nature​" alt="" />
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div>

	<script>
     	var swiper = new Swiper(".mySwiper", {
			autoHeight : true,
			spaceBetween : 0,
			effect : 'fade',
			loop : true,
			fadeEffect : {
				crossFade : true
			},
			autoplay : {
				delay : 3500,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>
</div>

<style>
.table_style > div {margin-bottom:30px;}
.table_style table{ width:100%;border-collapse:collapse;}
.table_style td {/* border-top:1px solid #ddd;border-bottom:1px solid #ddd; */padding:10px 5px;font-size:13px;text-align:center;}

.table_style tr:first-child td {font-size:20px; font-weight:600;border-bottom:1px solid #ddd;text-align:left;}

</style>

<section style="display:none;">
<div class="container"></div>


<div class="row table_style">
	<div class="col-md-6">
		<table>
			<tr>
				<td colspan="4">특가 상품</td> <!-- price가 10000 이하인 상품 -->
			</tr>
			<tr>
				<td>번호</td>
				<td>상품명</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>${saleProd[0].num }</td>
				<td>
					<a href="detail.blist?num=${saleProd[0].num }">
					${saleProd[0].pname }
					</a>
				</td>
				<td>${saleProd[0].price }</td>
			</tr>
			<tr>
				<td>${saleProd[1].num }</td>
				<td>
					<a href="detail.blist?num=${saleProd[1].num }">
					${saleProd[1].pname }
					</a>
				</td>
				<td>${saleProd[1].price }</td>
			</tr>
		</table>
	</div>
	<div class="col-md-6">
		<table>		
			<tr>
				<td colspan="3">품절임박 상품</td>	 <!-- stock 100 이하 -->
			</tr>
			<tr>
				<td>번호</td>
				<td>상품명</td>
				<td>가격</td>
			</tr>
			<tr>
					<td>${soldoutProd[0].num }</td>
					<td>
					<a href="detail.blist?num=${soldoutProd[0].num }">
					${soldoutProd[0].pname }
					</a>
					</td>
					<td>${soldoutProd[0].price }</td>
			</tr>
			<tr>
					<td>${soldoutProd[1].num }</td>
					<td>
					<a href="detail.blist?num=${soldoutProd[1].num }">
					${soldoutProd[1].pname }
					</a>
					</td>
					<td>${soldoutProd[1].price }</td>
			</tr>
		</table>
	</div>
	<div class="col-md-6">
		<table>		
			<tr>
				<td colspan="3">남성 의류</td>	 <!-- gender=남성 -->
			</tr>
			<tr>
				<td>번호</td>
				<td>상품명</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>${menProd[0].num }</td>
				<td>
					<a href="detail.blist?num=${menProd[0].num }">
					${menProd[0].pname }
					</a>
				</td>
				<td>${menProd[0].price }</td>
			</tr>
			<tr>
				<td>${menProd[1].num }</td>
				<td>
					<a href="detail.blist?num=${menProd[1].num }">
					${menProd[1].pname }
					</a>
				</td>
				<td>${menProd[1].price }</td>
			</tr>
		</table>
	</div>
	<div class="col-md-6">
		<table>		
			<tr>
				<td colspan="3">여성 의류</td>	
			</tr>
			<tr>
				<td>번호</td>
				<td>상품명</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>${wemenProd[0].num }</td>
				<td>
					<a href="detail.blist?num=${wemenProd[0].num }">
					${wemenProd[0].pname }
					</a>
				</td>
				<td>${wemenProd[0].price }</td>
			</tr>
			<tr>
				<td>${wemenProd[1].num }</td>
				<td>
					<a href="detail.blist?num=${wemenProd[1].num }">
					${wemenProd[1].pname }
					</a>
				</td>
				<td>${wemenProd[1].price }</td>
			</tr>
		</table>
	</div>
</div>



<!-- <a href="">전체 상품 보기</a> -->

</div>
</section>
<%@ include file="../inc/footer.jsp" %>  
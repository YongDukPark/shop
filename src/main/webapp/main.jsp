<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./WEB-INF/inc/header.jsp" %>
<!-- =========	header	========= -->
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
				<a href="list.blist">
				<img class="pc_img" src="${pageContext.request.contextPath}/resources/img/main_visual01.jpg" alt="" onclick="location.href='list.blist'"/>
				<img class="mo_img" src="http://placeimg.com/1000/550/arch​" alt="" />
				</a>
			</div>
			<div class="swiper-slide">
			<a href="List.cmu?type=all">
				<img class="pc_img" src="${pageContext.request.contextPath}/resources/img/main_visual02.jpg" alt="" onclick="location.href='List.cmu?type=all'"/>
				<img class="mo_img" src="http://placeimg.com/1000/550/tech" alt="" />
			</a>	
				
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





<section style="display:none;">
	<div class="container">
		
		
		list ~~
		
		
		
		
		<!-- content S -->
		
		
		<!-- content E -->
		
	</div>
</section>

<!-- =========	footer	========= -->
<%@ include file="./WEB-INF/inc/footer.jsp" %>

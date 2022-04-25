<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- userList -->
<%@ include file="../inc/header.jsp" %>


<section>
	<div class="container">
		<div class="userlist_menu">
			<a href="userList.ulist">회원 리스트</a><span> | </span>
			<a href="Ordlist.sbox">주문 목록</a><span> | </span>
			<a href="benLists.ben">신고유저 확인</a><span> | </span>
			<a href="userDelete.ben">신고유저 계정삭제</a>
		</div>
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-6">
					<h3>회원 리스트 <span style="font-size: 13px;font-weight: 400;">(레코드 : ${totalCount})</span></h3>
				</div>
				<div class="col-md-6">
					<!-- searchbox S -->
					<form action="userList.ulist" method="get">				
						<div class="input_style prd_searchbox ">
							<select name="whatColumn">
					    		<option value="name">이름</option>
								<option value="id">아이디</option>
								<option value="gender">성별</option>
					    	</select>
							<input type="text" name="keyword">
							<input type="submit" value="검색">
						</div>
					</form>
					<!-- searchbox E -->
				</div>
			</div>
		</div>
	
		<div class="user_list_wrap" >
			
			 
			<c:forEach var="user" items="${list}">
				<div class="d_list_item">
					<div class="row d_aic">
				        <div class="col-lg-3 col-md-4">
				            <a href="userDetail.ulist?num=${user.num}&pageNumber=${pageInfo.pageNumber}&id=${user.id}">
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
				                <a href="userDelete.ulist?num=${user.num}&pageNumber=${pageInfo.pageNumber}">삭제</a>
				                <!--스타일작업 필요-->
				            </div>
				        </div>
				    </div>
				</div>					
			</c:forEach>
			
			
		</div>			
		<div class="pager_wrap">
			${pageInfo.getPagingHtml()}
		</div>
		
		
		
	</div>
</section>
	
	
	
<%@ include file="../inc/footer.jsp" %>	
	
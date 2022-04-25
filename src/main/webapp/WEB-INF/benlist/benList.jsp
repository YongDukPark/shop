<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="128kb"%>

<%@ include file="../common/common.jsp" %>
<%@ include file="../inc/header.jsp" %>	

<script type="text/javascript">

function allCheck(acheck){
	//alert(1);
	
	var rowcheckArr = document.getElementsByName("rowcheck");	//rowcheck에 체크된애들 가져와라
	
	check = acheck.checked;
	
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

function multiAction(){
	
	var rowcheckArr = document.getElementsByName("rowcheck");
	
	if(document.myform.option.value==""){
		alert("진행이나 삭제를 선택해주세요");
		return false;
	}
	
	flag = false;
	
	for(var i=0;i<rowcheckArr.length;i++){
		if(rowcheckArr[i].checked==true){
			flag=true;
		}
	}
	if(flag==false){
		alert("하나는 선택하세요.");
		return;
	}
	
	document.myform.submit();
}

</script>
	
	














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
					
					<h3><input type="checkbox" name="rowcheck" onClick="allCheck(this)"> 신고유저 확인</h3>
				</div>
				<!-- <div class="col-md-6">
					searchbox S
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
					searchbox E
				</div> -->
			</div>
		</div>
	
		<div class="user_list_wrap" >
			
			<form action="benListsChange.ben" name="myform" method="get">
				<c:if test="${fn:length(lists)<1 }">
					<div class="row account_list">
						<!-- list S -->
						<div class="col-md-12 mgt5">
							<ul class="order_basket_ul">
								<li class="order_basket_moblie">
									<!-- <a href="javascript:void(0);" onclick="">전체삭제</a> -->
								</li>
								<li>
					            	<div class="empty_li">
					            		<p>신고받은 유저가 없습니다.</p>
					            		<a href="userList.ulist?pageNumber=${pageNumber}">회원 리스트</a>
					            		
					            	</div>
					            	
					            </li>
							</ul>
						</div>
					</div>
				</c:if>
				
				<c:if test="${fn:length(lists)>0 }">
					
					<select name="option">
							<option value="">선택</option>
							<option value="report">진행</option>
							<option value="cancel">삭제</option>
						</select>
					<input type="button" value="실행" onclick="multiAction()">
					
					
					
					<c:forEach var = "i" begin="0" end="${fn:length(lists)-1 }" step="1">
						<div class="d_list_item">
							<div class="row d_aic">
						        <div class="col-lg-3 col-md-4">
						            <input type="checkbox" name="rowcheck" value="${lists[i].num}">
									
									
									
						            <%-- <a href="userDetail.ulist?num=${user.num}&pageNumber=${pageInfo.pageNumber}&id=${user.id}">
							            <div class="d_list_cate">
							                <p class="d_item_num">No. ${user.num}</p>
							                <p class="d_item_name">${user.id }</p>
							                <p class="d_item_date">가입일 : ${user.insertdate }</p>
							            </div>
						            </a> --%>
						        </div>
						        <div class="col-lg-7 col-md-6">
						            <div class="d_list_tit">
						                <div class="row">
							                <div class="d_list_info col-lg-7">
							                	<p class="d_item_info"><b class="d_td">댓글번호</b><span class="d_td"><span>${lists[i].num }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
							                	<p class="d_item_info"><b class="d_td">유저 ID</b><span class="d_td"><span>${lists[i].id }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
							                    <p class="d_item_info"><b class="d_td">카테고리</b><span class="d_td"><span>${lists[i].bencategory }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
							                    <%-- <p class="d_item_info"><b class="d_td">타입(몰,커뮤니티)</b><span class="d_td"><span>${lists[i].type }</span>&nbsp;</span></p>	<!-- span으로 구분 --> --%>
							                    <p class="d_item_info"><b class="d_td">신고내용</b><span class="d_td"><span>${lists[i].reason }</span>&nbsp;</span></p>	<!-- span으로 구분 -->
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
				
				</c:if>
			</form>
			 
			
		</div>
		
		
	</div>
</section>
	
	
	
<%@ include file="../inc/footer.jsp" %>	
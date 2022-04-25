<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--  <%@page import="java.io.PrintWriter" %> --%>
     <%@ include file="../common/common.jsp" %>
     <%@ include file="../inc/header.jsp" %>




<!-- header -->
<section>
	<div class="container">
		<!-- content S -->
		
		<div class="shop_member">
			<div class="login_box">
				<form:form commandName="selectuserBean" action="UpdateUser.ulist" method="post">
					<h3>내 정보</h3>
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<p class="label_text">아이디</p>
								<input type="text" name="id" disabled="disabled" value="${loginInfo.id}">
							</div>
						</div>					
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<p class="label_text">이름</p>
								<input type="text" name="name" value="${loginInfo.name}">
								<form:errors cssClass="err" path="name" />
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<p class="label_text">성별</p>
								<select name="gender" id="gender">
									<option value="남자" >남자</option>
									<option value="여자">여자</option>
								</select>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<p class="label_text">생년월일</p>
								<input type="text" name="birth" value="${loginInfo.birth}" placeholder="생년월일 ex)19930405">
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<p class="label_text">주소</p>
								<input type="text" name="address1" value="${loginInfo.address1}" placeholder="주소">
								<form:errors cssClass="err" path="address1" />
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<p class="label_text">상세주소</p>
								<input type="text" name="address2"  value="${loginInfo.address2}" placeholder="상세주소">
								<form:errors cssClass="err" path="address2" />
							</div>
						</div>
	
						<div class="col-md-12">
							<input type="submit" value="수정하기">
						</div>
						<div class="col-md-12">
							<div class="btn_wrap">
								<a href="SelectUser.ulist">내 정보</a>
								<a href="">문의하기</a>
								<a href="Ordlist.sbox">주문조회</a>
								<a href="DeleteUser.ulist">회원탈퇴</a>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>

		<!-- content E -->
	</div>
</section>

<script type="text/javascript">
	var gender = '${loginInfo.gender}';
	if (gender == "남자") {
		$("#gender").val('남자').prop("selected", true);
		//document.gender[1].checked=true;
	} else if (gender == "여자") {
		$("#gender").val('여자').prop("selected", true);
		//document.gender[2].checked=true;
	}
</script>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/common.jsp" %>
 <%@ include file="../inc/header.jsp" %>
 

<!-- header -->
<section>
	<div class="container">
		<!-- content S -->
		
		<div class="shop_member">
			<div class="login_box">
				<form:form commandName="searchpassBean" action="SearchPass.ulist" method="post">
					<h3>비밀번호 찾기</h3>
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="id" value="${id}" placeholder="아이디">
								<form:errors cssClass="err" path="id" />
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="name" value="${name}" placeholder="이름">
								<form:errors cssClass="err" path="name" />
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="birth"  placeholder="생년월일 ex)19930405" value="${birth}">
								<form:errors cssClass="err" path="birth" />
							</div>
						</div>
						<div class="col-md-12">
							<input type="submit" value="비밀번호 찾기">
						</div>
						<div class="col-md-12">
							<div class="btn_wrap">
								<a href="SearchId.ulist">아이디 찾기</a>
								<a href="InsertUser.ulist">회원가입</a>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>

		<!-- content E -->
	</div>
</section>


<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
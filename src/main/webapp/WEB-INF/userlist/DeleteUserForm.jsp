<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/common.jsp" %>
 <%@ include file="../inc/header.jsp" %>



<section>
<form:form commandName="deleteuserBean" action="DeleteUser.ulist" method="post">
	<div class="container">
		<!-- content S -->
		
		<div class="shop_member">
			<div class="login_box">
				<h3>회원탈퇴</h3>
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="shop_input_wrap">
							<input type="password" placeholder="PASSWORD" name="pass">
						    <form:errors cssClass="err" path="pass" /><br>
						</div>
					</div>
					<div class="col-md-12">
						<input type="submit" value="탈퇴하기">
					</div>
					<div class="col-md-12">
						<div class="btn_wrap">
							<a href="SearchId.ulist">아이디 찾기</a>
							<a href="SearchPass.ulist">비밀번호 찾기</a>
							<a href="InsertUser.ulist">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- content E -->
	</div>
</form:form>
</section>


<!-- footer -->
<%@ include file="../inc/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <%-- <%@ include file="../common/loginbar.jsp" %> --%>
	<%@ page import="java.io.PrintWriter" %>
    
<% String jflag=(String)request.getAttribute("flag"); %>

<script type="text/javascript">
    function check(){
    	var id = document.getElementById("id").value;
    	location.href="Idcheck.ulist?id="+id;    	
    }
 	
    var jsflag = '<%=jflag%>';
	if (jsflag == "nomatch") {
		document.getElementById('errpass').innerText = '비밀번호가 일치하지 않습니다.';
	} else {
		document.getElementById('errpass').innerText = '';
	}

	var gender = '${gender}';
	if (gender == "남자") {
		$("#gender").val('남자').prop("selected", true);
		//document.gender[1].checked=true;
	} else if (gender == "여자") {
		$("#gender").val('여자').prop("selected", true);
		//document.gender[2].checked=true;
	}
</script>



<!-- header -->
<section>
	<div class="container">
		<!-- content S -->
		
		<div class="shop_member">
			<div class="login_box">
				<form:form commandName="insertuserBean" action="InsertUser.ulist" method="post" >
					<h3>회원가입</h3>
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<textarea class="privacy" name="" id="" cols="30" rows="10" readonly>개인정보처리방침

[차례]
1. 총칙
2. 개인정보 수집에 대한 동의
3. 개인정보의 수집 및 이용목적
4. 수집하는 개인정보 항목
5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
6. 목적 외 사용 및 제3자에 대한 제공
7. 개인정보의 열람 및 정정
8. 개인정보 수집, 이용, 제공에 대한 동의철회
9. 개인정보의 보유 및 이용기간
10. 개인정보의 파기절차 및 방법
11. 아동의 개인정보 보호
12. 개인정보 보호를 위한 기술적 대책
13. 개인정보의 위탁처리
14. 의겸수렴 및 불만처리
15. 부 칙(시행일) 
...							
								</textarea>
							</div>
						</div>
						
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<input type="checkbox" name="agree" value="${id}" id="agree" checked="checked" placeholder="아이디"><label for="agree" style="vertical-align: text-top;">약관에 동의합니다.</label>
								<%-- <form:errors cssClass="err" path="agree" /> --%>
							</div>
						</div>					
						<div class="col-md-8 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="id" value="${id}" id="id" placeholder="아이디">
								<form:errors cssClass="err" path="id" />
							</div>
						</div>					
						<div class="col-md-4 col-sm-12">
							<div class="shop_input_wrap">
								<input type="button" class="id_check" value="중복확인" onclick="check()">
							</div>
						</div>					
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<input type="password" name="pass" id="pass" value="${pass}" placeholder="비밀번호">
								<form:errors cssClass="err" path="pass" />
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<input type="password" name="repass" id="repass" value="${repass}" placeholder="비밀번호 확인">
								<form:errors cssClass="err" path="repass" />
								<!-- <span id="errpass" class="err"></span> -->
							</div>
						</div>
						<!-- <div class="col-sm-12">
							<div style="margin-top: -10px;margin-bottom: 5px;border-top: 1px dashed #ddd;"></div>
						</div> -->
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="name" value="${name}" placeholder="이름">
								<form:errors cssClass="err" path="name" />
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="shop_input_wrap">
								<select name="gender" id="gender" >
									<option selected disabled hidden >성별 선택</option>
									<option value="남자">남자</option>
									<option value="여자">여자</option>
								</select>
								<form:errors cssClass="err" path="gender" />
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="birth" placeholder="생년월일 ex)19930405" value="${birth}">
								<form:errors cssClass="err" path="birth" />
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="address1" value="${address1}" placeholder="주소">
								<form:errors cssClass="err" path="address1" />
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="shop_input_wrap">
								<input type="text" name="address2" value="${address2}" placeholder="상세주소">
								<form:errors cssClass="err" path="address2" />
							</div>
						</div>
	
						<div class="col-md-12">
							<input type="submit" value="회원가입">
						</div>
						<div class="col-md-12">
							<div class="btn_wrap">
								<a href="SearchId.ulist">아이디 찾기</a>
								<a href="SearchPass.ulist">비밀번호 찾기</a>
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
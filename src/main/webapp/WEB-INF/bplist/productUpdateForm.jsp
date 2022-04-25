<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../inc/header.jsp" %>


<script type="text/javascript">

	// gender
	var f_selbox = new Array('남자', '여자');

	// category	
	var s_selbox = new Array();
		s_selbox[0] = new Array('상의', '하의', '신발');
		s_selbox[1] = new Array('상의', '하의', '신발', '원피스');
	
	// poption
	var t_selbox = new Array();
		t_selbox[0] = new Array('M', 'L', 'XL', '2XL');
		t_selbox[1] = new Array('29', '30', '31');
		t_selbox[2] = new Array('250', '260', '270');
	
		t_selbox[3] = new Array('S', 'M', 'L');
		t_selbox[4] = new Array('26', '27', '28');
		t_selbox[5] = new Array('220', '230', '240');
		t_selbox[6] = new Array('FREE'); 

	////////////////////
	
	function init(f){
		
		genderValue = "${bpBean.gender}"; 

		for(var i=0; i<f_selbox.length; i++) {
 			f.gender.options[i+1] = new Option(f_selbox[i], f_selbox[i]);
 			
 			if(f_selbox[i] == genderValue){ // 넘어온 값(genderValue)과 i번째 방의 값이 같으면 i+1번째 옵션을 selected 하기 
 				document.forms[0].gender.options[i+1].selected = true;
 			}
		}
		firstChange(f);
	} // init
	
	////////////////////
	
	function firstChange(f){

		cateValue = "${bpBean.category}"; 
		
		var index = f.gender.selectedIndex;	
		var text = f.gender.options[index].value;

		for(var i=f.category.length; i>0; i--){
			f.category.options[i] = null;
		}
		
		for(var i=0; i<s_selbox[index-1].length; i++){
			f.category.options[i+1] = new Option(s_selbox[index-1][i]);
			if(s_selbox[index-1][i] == cateValue ){
				f.category.options[i+1].selected = true;
			}
		}
		secondChange(f);
	}//firstChange
	
	////////////////////
	
	function secondChange(f){

		optionValue = "${bpBean.poption}"; 
		
		var index = f.category.selectedIndex;	// 선택한 category의 번호
		var index_gender = f.gender.selectedIndex;	// 선택한 gender의 번호
		var text = f.category.options[index].value;	// 선택한 항목의 이름
		
		for(var i=f.poption.length; i>0; i--){	
			f.poption.options[i] = null;	
		}
		
		for(var i=0; i<t_selbox[index-1].length; i++) {
			
			if(index_gender == 1){
				f.poption.options[i+1] = new Option(t_selbox[index-1][i]); 
				if(t_selbox[index-1][i] == optionValue ){
					f.poption.options[i+1].selected = true;
				}
			}
			else if(index_gender == 2){
				f.poption.options[i+1] = new Option(t_selbox[index+2][i]); 
				if(t_selbox[index+2][i] == optionValue ){
					f.poption.options[i+1].selected = true;
				}
			}
		}
		
	} // firstChange	
	
</script>
	
<%  
	String[] displayArr = {"on", "off"};
%>    

<!-- productUpdateForm.jsp<br><br> -->



<body onLoad="init(myform)"></body>


<section>
	<div class="container">
		
		<div class="prd_list_top">
			<div class="row">
				<div class="col-md-12">
					<h3>상품 등록</h3>
				</div>
			</div>
		</div>
		
		<div class="prd_insert_wrap">
		
			<form:form action="update.blist" method="post" commandName="bpBean" name="myform" enctype="multipart/form-data">
				<input type="hidden" name="num" value="${bpBean.num}">
				<input type="hidden" name="pageNumber" value="${pageNumber }">
				
				<!-- 파일 업로드 시 : 1. 파일 업로드용 dependency 가져다놓기 v
				<!-- 파일 업로드 시 : 2. form에서 enctype="multipart/form-data" 추가 v -->
				<!-- 파일 업로드 시 : 3. post방식으로 요청할 것 v -->
				<div class="prd_insert_box">
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_01" class="col-md-4">상품사진</label>
								<div class="col-md-8">
									<input type="file" name="upload" value="${bpBean.upload}">
								</div>
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_02" class="col-md-4">상품명</label>
								<div class="col-md-8">
									<input type="text" name="pname" value="${bpBean.pname}">
									<form:errors path="pname" cssClass="err"/>
								</div>
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="" class="col-md-4">카테고리</label>
								<div class="col-md-4 col-6">
									<select name="gender" id="first" onChange="firstChange(this.form)">
								    	<option value="">선택</option>
								    </select>
								    <form:errors path="gender" cssClass="err"/>
									
								</div>
								<div class="col-md-4 col-6">
									<select name="category" id="second" onChange="secondChange(this.form)">
								    	<option value="">선택</option>
								    </select>		
								    <form:errors path="category" cssClass="err"/>							
								</div>
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="" class="col-md-4">옵션</label>
								<div class="col-md-8">
									<select name="poption" id="third">
								    	<option value="">선택</option>
								    </select>
								    <form:errors path="poption" cssClass="err"/>
								</div>
								
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_05" class="col-md-4">가격</label>
								<div class="col-md-8">
									<input type="text" name="price" value="${bpBean.price}">
								</div>
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_05" class="col-md-4">재고 수량</label>
								<div class="col-md-8">
									<input type="text" name="stock" value="${bpBean.stock}">
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_02" class="col-md-4">상품 노출 여부</label>
								<div class="col-md-8">
									<input type="radio" name="display" value="on" id="prd_radio01"><label for="prd_radio01" checked>on</label>
									<input type="radio" name="display" value="off" id="prd_radio02"><label for="prd_radio02">off</label>
								</div>
							</div>
						</div>
					</div> -->
					<div class="submit_btn_wrap">
						<div class="row">
							<div class="offset-md-3 col-md-6 offset-sm-2 col-sm-8">
								<input type="submit" class="insert_btn" value="수정하기">
							</div>
						</div>
					</div>
				</div>

			</form:form>
		</div>
		
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
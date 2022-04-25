<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<!-- bplist\productInsertForm.jsp -->

<script type="text/javascript">

	var f_selbox = new Array('남자', '여자');

	var s_selbox = new Array();
	s_selbox[0] = new Array('상의', '하의', '신발');
	s_selbox[1] = new Array('상의', '하의', '신발');
	
	var t_selbox = new Array();
	//남자 상의,하의,신발
	t_selbox[0] = new Array('L', 'XL', '2XL');
	t_selbox[1] = new Array('29', '30', '31');
	t_selbox[2] = new Array('250', '260', '270');
	//여자 상의,하의,신발,원피스
	t_selbox[3] = new Array('S', 'M', 'L');
	t_selbox[4] = new Array('26', '27', '28');
	t_selbox[5] = new Array('220', '230', '240');

	function init(f){
		// body 로드되자마자 호출해서 gender에 옵션 value값이 들어가도록 해야 함(category는 아직 ㄴㄴ)
		for(var i=0; i<f_selbox.length; i++){
			document.forms[0].gender.options[i+1] = 	
						new Option(f_selbox[i], f_selbox[i]);	
			// form의 0번방(여기서 form은 하나뿐이므로 0번방!)에 있는 gender에 0+1, 1+1, 2+1..(i+1)번 방에 옵션을 추가해라(text, value)
				// myform을 f로 받았으므로 f.gender.options[i+1] 해도 됨
		}
	}
	
	function firstChange(f){ 
		
		var index = f.first.selectedIndex;	
		var text = f.first.options[index].value;
		
		for(var i=f.category.length; i>0; i--){	
			f.second.options[i]=null;	
		}
		
		for(var i=0; i<s_selbox[index-1].length; i++) {
			f.second.options[i+1] = new Option(s_selbox[index-1][i]); 
		}
	}
	
	function secondChange(f){ 
		
		var index = f.category.selectedIndex;	// 선택한 category의 번호
		var index_gender = f.gender.selectedIndex;	// 선택한 gender의 번호
		var text = f.category.options[index].value;	// 선택한 항목의 이름
		
		for(var i=f.poption.length; i>0; i--){	
			// 기존에 추가된 옵션 지우기(0번째에는 '선택'이 들어있으므로 0 제외한 나머지만 지우기)
			f.poption.options[i] = null;	
		}
		
		for(var i=0; i<t_selbox[index-1].length; i++) {
			if(index_gender == 1){
				f.poption.options[i+1] = new Option(t_selbox[index-1][i]); 
			}
			else if(index_gender == 2){
				f.poption.options[i+1] = new Option(t_selbox[index+2][i]); 
				if(f.poption.options[i+1] == "undefined"){
					var value_poption = document.getElementById('poption');
					value_poption.options.remove(value_poption.length-1);
				}
			}
			// 해결못한 것 : 옵션에 공백까지 나오는거 어떻게 해결해야 하는지?
		}
	}
</script>
<script>
	init(myform)
</script>

<!-- BplistInsertController에서 처리함 -->


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
		
			<form action="insert.blist" method="post" commandName="bplistBean" enctype="multipart/form-data" name="myform" >
				<!-- 파일 업로드 시 : 1. 파일 업로드용 dependency 가져다놓기 v
				<!-- 파일 업로드 시 : 2. form에서 enctype="multipart/form-data" 추가 v -->
				<!-- 파일 업로드 시 : 3. post방식으로 요청할 것 v -->
				<div class="prd_insert_box">
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_01" class="col-md-4">상품사진</label>
								<div class="col-md-8">
									<input id="prd_insert_01" type="file" name="upload" value="파일 선택">
								</div>
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_02" class="col-md-4">상품명</label>
								<div class="col-md-8">
									<input id="prd_insert_02" type="text" name="pname">
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
										<option selected disabled hidden>성별</option>
									</select>
								</div>
								<div class="col-md-4 col-6">
									<select name="category" id="second" onChange="secondChange(this.form)">
										<option selected disabled hidden>카테고리</option>
									</select>									
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
										<option selected disabled hidden>옵션 선택</option>
									</select>
								</div>
								
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_05" class="col-md-4">가격</label>
								<div class="col-md-8">
									<input id="prd_insert_05" type="text" placeholder="원" name="price">
								</div>
							</div>
						</div>
					</div>
					<div class="insert_li">
						<div class="input_style">
							<div class="row">
								<label for="prd_insert_05" class="col-md-4">재고 수량</label>
								<div class="col-md-8">
									<input id="prd_insert_05" type="text" placeholder="개" name="stock">
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
								<input type="submit" class="insert_btn" value="추가하기">
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>
		
	</div>
</section>

<!-- footer -->
<%@ include file="../inc/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>   


<style>
.input_style table {border-collapse:collapse;width:100%;}
.input_style table td {padding:10px;border:1px solid #ddd;text-align:center;}
.input_style input {margin-top:10px;}

</style>	

<section>
<div class="container input_style">
<div style="max-width:500px;margin: 0 auto;">
<form method="post" action="delete.bd">
<input type="hidden" name="num" value=${num }>
<input type="hidden" name="pageNumber" value=${pageNumber }>
	<table border="1" align="center">
		<tr>
			<td>
				비밀번호를 입력하세요
			</td>
		</tr>
		<tr>
			<td>
				비밀번호:<input type="password" name="passwd">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="글삭제">
				<input type="button" value="글목록" onclick="location.href='list.bd?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>
</div>    
</div>    
</section>   

<%@ include file="../inc/footer.jsp" %>
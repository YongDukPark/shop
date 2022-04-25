<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num");
	String id = request.getParameter("id");
	String pname = request.getParameter("pname");
	
%>
<style>
	table {border: 1px solid #ddd;border-collapse: collapse;font-size: 15px;}
	table td {padding: 10px;font-size: 15px;border: 1px solid #ddd;text-align: center;}
	select {border: 1px solid #ddd;outline:none;border-radius: 0;}
	input[type="text"] {border: 1px solid #ddd;outline:none;border-radius: 0;padding: 5px;}
	input[type="submit"], input[type="reset"], input[type="button"] {border: 1px solid #ddd;outline:none;border-radius: 0;background-color: #fff;transition:all 0.3s;padding: 5px 12px;}
	input[type="submit"]:hover, input[type="reset"]:hover, input[type="button"]:hover {background-color: #ccc;}
	textarea {width: 100%;border: 1px solid #ddd;outline:none;border-radius: 0;padding: 10px;}
</style>
<form action="updateAction.sbox">
	<input type="hidden" name="id" value="<%=id%>">
	<input type="hidden" name="num" value="<%=num%>">
	<table>
    	<tr>
    		<td>상품번호</td>
    		<td>상품명</td>
    		<td>교체할 수량</td>
    	</tr>
    	<tr>
    		<td><%=num %></td>
    		<td><%=pname %></td>
    		<td><input type="text" name="stock"></td>
    	</tr>
    	<tr>
    		<td align="center" colspan="3">
    			<input type = "submit" value="수정">
    			<input type = "button" value="닫기" onclick="window.close()">
    		</td>
    	</tr>
    </table>
</form>
    
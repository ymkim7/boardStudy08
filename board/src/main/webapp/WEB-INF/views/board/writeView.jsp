<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr/>
	<h4>게시판 글쓰기</h4>
	<div><%@include file="/WEB-INF/views/include/include.jsp"%></div>
	<hr/>
	
	<form name="writeForm">
		<table>
			<tr>
				<td>제목</td>
				<td><input class="chk" id="title" name="title" title="제목을 입력해주세요."/></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea class="chk" id="content" name="content" title="내용을 입력해주세요."></textarea></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input class="chk" id="writer" name="writer" title="이름을 입력해주세요."/></td>
			</tr>
		</table>
	</form>
	<hr/>
	
	<div>
		<button type="button" id="writeBtn" name="writeBtn">등록</button>
		<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
	</div>
	
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $("form[name='writeForm']");
		
		$("#writeBtn").on("click", function(){
			
			if(fn_valiChk()) {
				return false;
			}
			
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#cancelBtn").on("click", function(){
			location.href = "/board/list";
		});
		
	});
	
	function fn_valiChk() {
		
		var regForm = $("form[name='writeForm'] .chk").length;
		
		for(var i = 0; i < regForm; i++) {
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
		
	}
	
</script>
</body>
</html>
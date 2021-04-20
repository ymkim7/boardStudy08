<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr/>
	<h4>게시판 목록</h4>
	<div><%@include file="/WEB-INF/views/include/include.jsp"%></div>
	<hr/>
	
	<form name="readForm">
		<input type="hidden" id="bno" name="bno" value="${update.bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
	
		<table>
			<tr>
				<td>제목</td>
				<td><input class="chk" id="title" name="title" value="${update.title }" title="제목을 입력해주세요."/></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea class="chk" id="content" name="content" title="내용을 입력해주세요."><c:out value="${update.content }"></c:out></textarea>
				</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input class="chk" id="writer" name="writer" value="${update.writer }" disabled="disabled"/></td>
			</tr>
		</table>
	</form>
	<hr/>
	
	<div>
		<button type="button" id="updateBtn" name="updateBtn">확인</button>
		<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
	</div>
	
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $("form[name='readForm']");
		
		$("#updateBtn").on("click", function(){
			
			if(fn_valiChk()) {
				return false;
			}
			
			formObj.attr("action", "/board/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#cancelBtn").on("click", function(){
			location.href = "/board/readView?bno=${update.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}";
		});
		
	});
	
	function fn_valiChk() {
		
		var regForm = $("form[name='readForm'] .chk").length;
		
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
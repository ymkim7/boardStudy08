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
		<input type="hidden" id="bno" name="bno" value="${read.bno}" />
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		
		<table>
			<tr>
				<td>제목</td>
				<td><input id="title" name="title" value="${read.title }" disabled="disabled"/></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea id="content" name="content" disabled="disabled"><c:out value="${read.content }"></c:out></textarea>
				</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input id="writer" name="writer" value="${read.writer }" disabled="disabled"/></td>
			</tr>
			
			<tr>
				<td>작성날짜</td>
				<td><fmt:formatDate value="${read.regdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
	</form>
	<hr/>
	
	<div>
		<button type="button" id="updateBtn" name="updateBtn">수정</button>
		<button type="button" id="deleteBtn" name="deleteBtn">삭제</button>
		<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
	</div>
	
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $("form[name='readForm']");
		
		$("#updateBtn").on("click", function(){
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#deleteBtn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니까?");
			
			if(deleteYN == true) {
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
			
		});
		
		$("#cancelBtn").on("click", function(){
			location.href = "/board/list?page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}";
		});
		
	});
	
</script>
</body>
</html>
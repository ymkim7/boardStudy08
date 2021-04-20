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
	
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
		</tr>
		
		<c:forEach items="${list }" var="list">
			<tr>
				<td><c:out value="${list.bno }"></c:out></td>
				<td>
					<a href="/board/readView?bno=${list.bno }
								&page=${scri.page}
								&perPageNum=${scri.perPageNum}
								&searchType=${scri.searchType}
								&keyword=${scri.keyword}">
						<c:out value="${list.title }"></c:out>
					</a>
				</td>
				<td><c:out value="${list.writer }"></c:out></td>
				<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	<hr/>
	
	<div style="display:flex; justify-content:center;">
		<select name="searchType">
			<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		</select>
	
		<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" style="width:200px;"/>
	
		<button type="button" id="searchBtn" name="searchBtn">검색</button>
	</div>
	
	<div style="display:flex; justify-content:center;">
		<c:if test="${pageMaker.prev}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		</c:if> 
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		</c:if>
	</div>
	
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#searchBtn").on("click", function(){
			self.location = "list" + '${pageMaker.makeQuery(1)}'
				+ "&searchType=" + $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	});
	
</script>
</body>
</html>
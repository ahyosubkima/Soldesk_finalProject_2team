<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	window.onpageshow = function(event) {
		if (event.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {
			let pgn = $("#pgn").val();
			let so = $("#so").val(); 
			let si = $("#si").val(); 
			if(so != ""){
				location.href="/danim/comm_free_search?search_option="+so+"&search_input="+si+"&pageNum="+pgn;
			}
			else{
			if (pgn != "") {
				location.href = "/danim/comm_free_page?pageNum=" + pgn;
			} else {
				location.href = "/danim/comm_free_page";
			}
				
			}
		}
	}
});
</script>
</head>
<body>


	<div id="comm_picture_area">
		<div id="comm_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_picture_page">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_video_page?pageNum=1">동영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_picture_content1122">
			<form action="comm_free_search">
				<table id="comm_picture_searchTbl2">
					<tr>
						<td><select name="search_option">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="txt">내용</option>
						</select> <input name="search_input">
						<input type="hidden" value="1" name="pageNum">
						 <input type="hidden" name="pageNum" value="${param.pageNum }" id="pgn">
						 <input type="hidden" name="search_option" value="${param.search_option }" id="so">
					<input type="hidden" name="search_input" value="${param.search_input }" id="si">
							<button id="comm_picture_searchBtn">검색</button></td>
					</tr>
				</table>
			</form>

			<h2>자유게시판</h2>
			<table id="comm_free_tbl">
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
				</tr>
				<c:forEach items="${frees }" var="f">
					<tr>
						<td>${f.cf_no }</td>
						<td
							onclick="location.href='comm_free_detail?no=${f.cf_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}'">
							${f.cf_write_name }</td>
						<td>${f.cf_writer }</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${sessionScope.loginMember != null}">
				<input type="button" id="comm_picture_writeBtn" value="글쓰기"
					onclick="location.href='/danim/comm_free_write'">
			</c:if>
			<c:if test="${pageMaker != null && not empty frees }">
				<div id="paging_div">
					<!-- 이전페이지 버튼 -->
					<table id="paging_Tbl">
						<tr>
							<td><c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="/danim/comm_free_page?pageNum=${pageMaker.startPage-1}">Previous</a></li>
								</c:if></td>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<td class="paging_Tbl_td"><a
									href="/danim/comm_free_page?pageNum=${num }">[${num}]</a></td>
							</c:forEach>
							<td><c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a
										href="/danim/comm_free_page?pageNum=${pageMaker.endPage + 1 }">Next</a></li>
								</c:if></td>
						</tr>
					</table>
				</div>
			</c:if>
			<c:if test="${pageMakerTitle != null && not empty frees }">
				<div id="paging_div">
					<!-- 이전페이지 버튼 -->
					<table id="paging_Tbl">
						<tr>
							<td><c:if test="${pageMakerTitle.prev}">
									<li class="pageInfo_btn previous"><a
										href="/danim/comm_free_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.startPage-1}&search_option=${sessionScope.search_option}">Previous</a></li>
								</c:if></td>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMakerTitle.startPage}"
								end="${pageMakerTitle.endPage}">
								<td class="paging_Tbl_td"><a
									href="/danim/comm_free_search?search_input=${param.search_input }&pageNum=${num }&search_option=${sessionScope.search_option}">[${num}]</a></td>
							</c:forEach>
							<td><c:if test="${pageMakerTitle.next}">
									<li class="pageInfo_btn next"><a
										href="/danim/comm_free_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.endPage + 1 }&search_option=${sessionScope.search_option}">Next</a></li>
								</c:if></td>
						</tr>
					</table>

				</div>

			</c:if>

		</div>
	</div>


</body>
</html>
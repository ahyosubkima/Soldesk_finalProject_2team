<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<div id="comm_picture_area">
		<div id="comm_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_video_page?pageNum=1">동영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>
		<div id="comm_picture_content112">
			<c:forEach var="video" items="${video }">
				<form action="comm_video_update_do" method="post"
					enctype="multipart/form-data">
					<table id="comm_picture_update_tbl">
						<tr>
					<td id="comm_picture_update_td2">제목</td>
							<td><input
								value="${video.cv_write_name }"
								name="cv_write_name" id="comm_picture_update_title">
								</td>

						</tr>
						<tr>
						</tr>
						<tr>
							<td  id="comm_picture_update_td2">영상</td>
							<td><video id="p_preview"
								src="resources/comm/file/${video.cv_name }" controls="controls">
								</video>
								<input
								type="hidden" value="${video.cv_name }"
								name="oldFile"> <input id="picture" type="file" name="newFile">
								<input type="hidden"
								value="${video.cv_no }" name="cv_no">
							</td>
						</tr>
						<tr>
							<td  id="comm_picture_update_td2">내용</td>
							<td><textarea id="comm_picture_update_txt"
									name="cv_txt">${video.cv_txt }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right"><button
									style="width: 70px; font-size: 15pt">수정</button></td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>
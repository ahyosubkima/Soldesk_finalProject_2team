<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	
	previewImg();

});
</script>
</head>
<body>
	<div id="comm_write_area">
		<div id="comm_menu1122">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_video_page?pageNum=1">영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_write_content112">
		<div id="content_title_div">
				<h2  class="best_write_pic2">영상게시판</h2>
				</div>
				<hr class="comm_write_hr">
				
			<form action="comm_video_upload" method="post"
				enctype="multipart/form-data" name="picture_upload"
				onsubmit="return videoUpload();">
				<table id="comm_write_tbl">
					<tr>
					<td colspan="2" id="comm_write_title">
					글쓰기
					</td>
					</tr>
					<tr>
						<td class="comm_write_left">제목</td>
						<td><input id="title" name="cv_write_name" class="comm_write_title"
						placeholder="제목 입력(최대20자)" maxlength="20"></td>
					</tr>
					<tr>
						<td  class="comm_write_left">영상</td>
						<td  class="comm_write_file">
						<input id="picture" type="file" name="cv_name">
						</td>
					</tr>
					<tr>
						<td class="comm_write_left">내용</td>
						<td><textarea id="txt" class="comm_picture_write_txt" name="cv_txt"
						placeholder="내용입력(최대300자)" maxlength="300" rows="4" cols="10"
						></textarea> 
							<input name="token"	type="hidden" value="${token }">
							<input type="hidden" name="cv_writer" value="${sessionScope.loginMember.dm_nickname }">
						</td>
					</tr>
					<tr>
						<td colspan="2" id="comm_write_Btn_td"><button id="comm_write_Btn">작성</button></td>
					</tr>
				</table>
				<div id="image_container" class="image_container_div">
				<h2>영상 미리보기</h2>
				<video id="p_preview" controls="controls" autoplay="autoplay"
				></video>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
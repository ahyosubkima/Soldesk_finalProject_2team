<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="resources/review/js/reviewDetail.js"></script>
<style>
.schedule_cell{
	margin: 1px;
}
.arrowImg:hover{
	filter: invert(81%) sepia(17%) saturate(1561%) hue-rotate(113deg) brightness(86%) contrast(89%);
	transition: 0.3s;
}

.totalText{
border: 2px solid transparent;
    border-radius: 20px;
    background-image: linear-gradient(#ffffff, #ffffff), linear-gradient(to bottom right, #38CEB5, #6D1E91);
    background-origin: border-box;
    background-clip: content-box, border-box;
    width: 80%;
    /* height: 140px; */
    display: flex;
    justify-content: center;
    align-items: center;
}

.dtContent{
	border: 2px solid transparent;
    border-radius: 20px;
    background-image: linear-gradient(#ffffff, #ffffff), linear-gradient(to bottom right, #38CEB5, #6D1E91);
    background-origin: border-box;
    background-clip: content-box, border-box;
    width: 70%;
    display: flex;
    /* height: 80px; */
    justify-content: center;
    align-items: center;
}

.scheTitle, .dtTitle, .trTitle{
margin-top: 10px;
margin-bottom: 10px;
}
.scheduleBox{
    display: flex;
    justify-content: center;
}
.schedule_con{
	border: 2px solid transparent;
    border-radius: 20px;
    background-image: linear-gradient(#ffffff, #ffffff), linear-gradient(to bottom right, #38CEB5, #6D1E91);
    background-origin: border-box;
    background-clip: content-box, border-box;
    /* height: 50px; */
    width: 33%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 3px;
    margin-right: 3px;
	
}

.schedule_wrapper{
	display: inline-block;
    justify-content: center;
    flex-direction: row;
    width: 70%;
	border: 2px solid rgb(232, 248, 240);
    border-top: none;
    padding-bottom: 10px;
}


	.scheduleController_wrapper{
		display: flex;
    justify-content: center;
	margin-top: 20px;
    margin-bottom: 0px;
	}
.scheduleController{
	display: flex;
    border: 2px solid  rgb(232, 248, 240);
    width: 70%;
}


.totalroute_content{
	text-align: center;
	border-bottom: 2px solid #545479;
	width: 60%;
	display: inline-block;
	padding-bottom: 5px;
}
.img_box{
	width: 33%;
    height: 400px;
    margin-right: 20px;
    margin-left: 20px;
}


.imgContainer_wrapper{
text-align: center;
}
.imgContainer{
	/* border: 1px solid #38CEB5; */
}

.totalroute_title{
	margin-bottom: 10px;
}	
.totalRoute_wrapper{

	margin-top: 20px;
	margin-bottom: 20px ;
	text-align: center;
}

.uninInfo_content{
margin-left: 10px;
margin-right: 10px;

}

.unitInfo{
	border: 2px solid transparent;
    border-radius: 20px;
    background-image: linear-gradient(#ffffff, #ffffff), linear-gradient(to bottom right, #38CEB5, #6D1E91);
    background-origin: border-box;
    background-clip: content-box, border-box;
	text-align: center;
	margin-right: 10px;
}

.content_wrapper{
	margin-top: 30px;
}
.titleBox{
	text-align: center;
	margin-bottom: 20px;
}

.totalReview{
	text-align: center;
}

.dailySelected{
	display: none;
    height: 100%;
    font-size: 22pt;
}

.dailySelected.activate{
	display: block;
	background-color: aliceblue;
	
}


.daySelector_wrapper{
 width: 80%;
 text-align: center;
 
}

textarea{
	width: 100%;
	resize: none;
}

.dailyBox{
	display: none;
	text-align: center;
	justify-content: center;
}

.dailyBox.activate{
	display: block;
}

.daily_schedule.active{

	background-color: red;
}

#daily_schedule_con{
width: 25%;
}

.axis{
	width: 15%;
}

.cell{
	width: 25%;
}

#schedule_inner_nav>a {
	border: 1px solid black;
}
/* Dropdown Button */
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
	background-color: #3e8e41;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
	display: block;
}

td, tr {
	border: 1px solid black;
}
/* div{
	border: 1px solid red;
} */



.flex-container {
	display: flex;
	justify-content: center;
}
</style>
<!-- <script type="text/javascript" src="resources/review/js/reviewWrite.js"></script> -->
<script type="text/javascript">
let map, infoWindow, marker, searchBox, input, poly;

let destination = [];

function initMap() {


//좌표가져와서 첫위치 설정
	let coordinate	 = document.getElementById("coordinate").textContent;
	console.log(coordinate);
	let splitedcoordinate = coordinate.split("|");
	console.log(splitedcoordinate);
	console.log(splitedcoordinate[0]);
	let spilted = splitedcoordinate[0];
	let parsed = JSON.parse(spilted);
	console.log(parsed);
  map = new google.maps.Map(document.getElementById("map"), {
    center: parsed,
    zoom: 12,
  });

  //좌표값 jsonparsing해서 배열에담기
  let rootCoordinates = [];
  
  for (let index = 0; index < splitedcoordinate.length-1; index++) {
	  let each = splitedcoordinate[index];
	  
	  let eachParsing = JSON.parse(each);
	  
	  rootCoordinates.push(eachParsing);
	  
	}
	console.log(rootCoordinates);

	//폴리라인 다시그리기

   const rootPath = new google.maps.Polyline({
     path: rootCoordinates,
     geodesic: true,
     strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
   });

  rootPath.setMap(map);

  //폴리라인 끝
 
  //마커추가하기

  let totalroute =document.getElementById("hidtotalroute").textContent;
  let splitedRoute = totalroute.split(",");
  console.log(splitedRoute);

  //좌표값 json배열, 총루트 배열을 이용하여 마커에 설정

  for (let index = 0; index < rootCoordinates.length; index++) {
	  const pos = rootCoordinates[index];
	  const tit = splitedRoute[index];

	  let locationNum = index+1;

	  const marker = new google.maps.Marker({
		position: pos,
		map: map,
		label:'#'+locationNum,
		title: tit,
	  });
	  
  }
  
  
}

</script>
</head>

<body>

	<div class="content_wrapper">
		<div class="titleBox"> <h2>${result.rb_title}</h2> </div>

		<div class="flex-container">

			<div class="unitInfo">
				<div class="uninInfo_content">#인원 🏃 : ${result.rb_headNum} 명</div>
			</div>
			<div class="unitInfo">
				<div class="uninInfo_content">#비용 💸 : <fmt:formatNumber value="${result.rb_budget}" type="currency"></fmt:formatNumber> 이하</div>

			</div>

			<div class="unitInfo">
				<div class="uninInfo_content">#테마 🎨: ${result.rb_theme}</div>

			</div>

			<div class="unitInfo">
				<div class="uninInfo_content">#지역 🌏: ${result.rb_location}</div>
			</div>
			<div class="unitInfo">
				<div class="uninInfo_content">#여행일정 📅 : ${result.rb_totalday} 일</div>
			</div>

		</div>

			<span id="coordinate" style="display: none;"> ${result.rb_coordinate} </span>
			<span id="hidtotalroute" style="display: none;"> ${result.rb_totalroute} </span>
		</div>
		<div style="text-align: center; margin-top: 10px; margin-bottom: 10px;">여행순서 표시 지도 🛬</div>
	<div id="map" style=" height: 400px; border: 2px solid #38CEB5;"></div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	 <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHwlLJC7x2AYE7IuJZCOkKJ1KRSBgCmoY&callback=initMap&libraries=places&v=weekly&region=KR&language=ko"
		async></script> 
			<div class="totalRoute_wrapper">
				<div class="totalroute_title">총 여행 방문지 📍</div>
				<c:set var="route" value="${result.rb_totalroute }"></c:set>
				<div class="totalroute_content" >
					<c:out value="${fn:replace(route,',','➨') }"></c:out>
				</div>
			</div>
			
		<div class="imgContainer_wrapper"> 
		<div class="imgContainer_title" style="margin-bottom: 10px;">후기사진📸</div>
			<div class="imgContainer">
			<!-- ,로 잘라낸 값을 imgArr에 저장 -->
				<c:set var="imgArr" value="${fn:split(result.rb_img, ',')}"></c:set>
				<c:forEach items="${imgArr}" var="img">
					<img class="img_box" src="resources/review/img/${img}" alt="이미지위치">
					
				</c:forEach>
			</div>
			</div>
			
	
	<!-- The div element for the map -->
	
	

<div class="scheduleController_wrapper">
	<div class="scheduleController"id="schedule">
		<div style="width: 10%;
		display: flex;
		align-items: center;
		justify-content: center; 
		background-color: aliceblue; ">
			<a href="javascript:void(0);" onclick="veiwPrevDay(this)">
			<img class="arrowImg" style="width: 28px;    padding-top: 2px;" alt="" src="resources/review/img/arrow-left-circle.svg"></a>
		</div>
		<div class="daySelector_wrapper" id="dayselWrap"></div>
		<div style="width: 10%;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: aliceblue;  ">
			<a href="javascript:void(0);" onclick="veiwNextDay(this)">
			<img class="arrowImg" style="width: 28px;    padding-top: 2px;" alt="" src="resources/review/img/arrow-right-circle.svg"></a>
		</div>
	</div>
</div>
	<div class="dailyBox" id="day1" data-day="1" style="display: block;">
		<div class="schedule_wrapper">
		<div class="scheTitle">day1 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr1" value="${fn:split(result.rb_d1Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr1}" var="d1Sch">
					<div class="schedule_con"><div class="schedule_cell">${d1Sch}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">1일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d1Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day2" data-day="2" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day2 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr2" value="${fn:split(result.rb_d2Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr2}" var="d2Sch">
					<div class="schedule_con"><div class="schedule_cell">${d2Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">2일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d2Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day3" data-day="3" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day3 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr3" value="${fn:split(result.rb_d3Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr3}" var="d3Sch">
					<div class="schedule_con"><div class="schedule_cell">${d3Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">3일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d3Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day4" data-day="4" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day4 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr4" value="${fn:split(result.rb_d4Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr4}" var="d4Sch">
					<div class="schedule_con"><div class="schedule_cell">${d4Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">4일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d4Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day5" data-day="5" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day5 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr5" value="${fn:split(result.rb_d5Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr5}" var="d5Sch">
					<div class="schedule_con"><div class="schedule_cell">${d5Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">5일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d5Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day6" data-day="6" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day6 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr6" value="${fn:split(result.rb_d6Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr6}" var="d6Sch">
					<div class="schedule_con"><div class="schedule_cell">${d6Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">6일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d6Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day7" data-day="7" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day7 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr7" value="${fn:split(result.rb_d7Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr7}" var="d7Sch">
					<div class="schedule_con"><div class="schedule_cell">${d7Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">7일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d7Text}</pre></div></div> 
		</div>
	</div>
	</div>

<div class="dailyBox" id="day8" data-day="8" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day8 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr8" value="${fn:split(result.rb_d8Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr8}" var="d8Sch">
					<div class="schedule_con"><div class="schedule_cell">${d8Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">8일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d8Text}</pre></div></div> 
		</div>
	</div>
	</div>	

<div class="dailyBox" id="day9" data-day="9" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day9 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr9" value="${fn:split(result.rb_d9Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr9}" var="d9Sch">
					<div class="schedule_con"><div class="schedule_cell">${d9Sch}}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">9일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d9Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="dailyBox" id="day10" data-day="10" >
		<div class="schedule_wrapper">
		<div class="scheTitle">day10 일정🦶</div>
		<div class="scheduleBox">
		<!-- ,로 잘라낸 값을 scheduleArr에 저장 -->
				<c:set var="scheduleArr10" value="${fn:split(result.rb_d10Schedule, ',')}"></c:set>
				<c:forEach items="${scheduleArr10}" var="d10Sch">
					<div class="schedule_con"><div class="schedule_cell">${d10Sch}</div></div>
					
				</c:forEach>
		</div>
		<div class="dailyText">
		<div class="dtTitle">10일차 간단후기✒</div>
		<div class="flex-container"><div class="dtContent"><pre style="white-space: pre-wrap;">${result.rb_d10Text}</pre></div></div> 
		</div>
	</div>
	</div>
	
	<div class="totalReview">
			<div class="trTitle">총 후기📝</div>

		<div class="flex-container"><div class="totalText">  <pre style="white-space: pre-wrap;">${result.rb_text}</pre>   </div></div>
	</div>

	<input type="text" id="totalday" value="${result.rb_totalday}" hidden ="hidden">



</body>

</html>
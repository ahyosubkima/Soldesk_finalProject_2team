/**
 * 
 */



// js준비
document.addEventListener('DOMContentLoaded', function () {

  var httpRequest;
	/* button이 클릭되었을때 이벤트 */
	document.getElementById("ajaxCall").addEventListener('click', () => {
		/* textBox에 작성된 name 데이터를 가져옴 */
		var inputTitle = document.getElementById("inputTitle").value;
		/* 통신에 사용 될 XMLHttpRequest 객체 정의 */
		httpRequest = new XMLHttpRequest();
		/* httpRequest의 readyState가 변화했을때 함수 실행 */
	    httpRequest.onreadystatechange = function() {
	    	/* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 name과 age를 그려줌 */
		    if (httpRequest.readyState === XMLHttpRequest.DONE) {
			      if (httpRequest.status === 200) {
			    	var result = httpRequest.response;
			         document.getElementById("name").innerText = result.name;
			         document.getElementById("age").innerText = result.age;
              console.log('확인');
              console.log(result);
			      } else {
			        alert('Request Error!');
			      }
		    }
	    };
	    /* Get 방식으로 name 파라미터와 함께 요청 */
	    httpRequest.open('GET', '/getTitleByJSON?rb_title=' + inputTitle);
	    /* Response Type을 Json으로 사전 정의 */
	    httpRequest.responseType = "json";
	    /* 정의된 서버에 요청을 전송 */
	    httpRequest.send();
	});

	  //인원수 슬라이더 value표시
let slider = document.getElementById("headcount");
let output = document.getElementById("headcount_value");
//output.innerHTML = slider.value;

slider.oninput = function() {
    output.innerHTML = this.value;
}
//탭메뉴

       const tabItem = document.querySelectorAll(".tab-container__item");
const tabContent = document.querySelectorAll(".content-container__content");

let cc = tabItem.forEach(function(item){

     item.addEventListener("click", tabHandler);
});

function tabHandler(item) {
  const tabTarget = item.currentTarget;
 
  const target = tabTarget.dataset.tab;

  // tabItem.forEach((title) => {
  //   title.classList.remove("active");
  // });
  tabContent.forEach(function(content) {
    content.classList.remove("target");
  });
  document.querySelector("#"+target).classList.add("target");
  // tabTarget.classList.add("active");
}


// 선택메뉴생성

document.querySelectorAll('.selector_btn').forEach(function(aaa){
  
  
  aaa.addEventListener("click",function(){
    let word = aaa.innerHTML;
    let newDiv = document.createElement('div');
    
  newDiv.classList.add('selected_btn')
  newDiv.append(word);

  document.getElementById('choosedVal').appendChild(newDiv);
})

});

	  

    var tag = {};
    var counter = 0;

    // 태그를 추가한다.
    function addTag(value) {
      tag[counter] = value; // 태그를 Object 안에 추가
      counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
    }

    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag() {
      return Object.values(tag)
        .filter(function (word) {
          return word !== "";
        });
    }

    $("#tag")
      .on("keyup", function (e) {
        var self = $(this);
        console.log("keypress");

        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter" || e.keyCode == 32) {

          var tagValue = self.val(); // 값 가져오기

          // 값이 없으면 동작 안합니다.
          if (tagValue !== "") {

            // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
            var result = Object.values(tag)
              .filter(function (word) {
                return word === tagValue;
              })

            // 태그 중복 검사
            if (result.length == 0) {
              $("#tag-list")
                .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
              addTag(tagValue);
              self.val("");
            } else {
              alert("태그값이 중복됩니다.");
            }
          }
          e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
      });

    // 삭제 버튼
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document)
      .on("click", ".del-btn", function (e) {
        var index = $(this)
          .attr("idx");
        tag[index] = "";
        $(this)
          .parent()
          .remove();
      });
  })
  
  function createDiv() {
	let aa = $("#dailyDummy").clone();

  
  // 4. <body>에 1에서 만든 <div> element 붙이기
  
  aa.appendTo('#dailyDetail');
} 


// 검색필터선택해제
function cancelingSelect(){
document.getElementById('choosedVal').innerHTML = "" ;

}


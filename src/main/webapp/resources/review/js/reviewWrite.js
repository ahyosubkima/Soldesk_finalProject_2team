/**
 * 
 */

//js 준비
document.addEventListener('DOMContentLoaded', function () {

    

	
   // console.log(document.getElementById('selectBox'));

   document.getElementById('selectBox').addEventListener('change',function(){

    if(document.getElementById('selectBox').value == "direct"){
        document.getElementById('inputContainer').style.display = 'inline-block';
       
    } else{
        document.getElementById('inputContainer').style.display = 'none';
    }
   // if(document.getElementById('selectBoxDirect').ariaValueMax())

 });
	





// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {

    // 드롭버튼클릭했을때
if(event.target.classList.contains('dropbtn')){
    console.log(event.target.parentNode.childNodes[3].classList.toggle("show"));
}

// Close the dropdown menu if the user clicks outside of it
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }

  //뒤에일정추가
  if(event.target.classList.contains('insert_col_back')){
      if(event.target.parentNode.parentNode.parentNode.nextElementSibling){
          alert('다음일정이 이미 존재합니다.');
          return false;
      }
      console.log(daycount);
      if(daycount < 10){
 createSchedule(event.target);
 document.getElementById('totalday').value=daycount;
 document.querySelector('.daily_schedule.active').nextElementSibling.classList.add('active') ;
 document.querySelector('.daily_schedule.active').classList.remove('active') ;
}
    if(daycount >=10){
        console.log('일정생성제한');
        alert('일정은 10일까지만 생성가능합니다.');
    }

  }



}


	
});
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
// function doDropdown() {
    
//     document.getElementById("myDropdown").classList.toggle("show");


// }

let daycount = 1;

function createSchedule(a){

    ++daycount;
   let newDiv =  document.createElement('div');
   newDiv.setAttribute('id','daily_schedule_con');
   newDiv.classList.add('daily_schedule');
   
   newDiv.setAttribute('data-day',daycount);

   newDiv.innerHTML = '<div class="dropdown">\
       <button type="button" onclick="" class="dropbtn">\
           <img alt="" src="resources/review/img/plus-circle.svg">\
       </button>\
       <div id="myDropdown" class="dropdown-content">\
           <a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="#" onclick="deleteDay(this)">일정삭제</a>\
       </div>\
   </div>\
   <a href="javascript:void(0);" onclick="activateDay(this)"><span>day '+daycount+'</span></a>'
   console.log(newDiv);
   console.log(a.parentNode.parentNode.parentNode);
   //document.getElementById('schedule_inner_nav').inn
//    a.parentNode.parentNode.parentNode.append('afterend',newDiv);
console.log(a);
    a.parentNode.parentNode.parentNode.parentNode.append(newDiv);
    
    console.log(document.getElementById('schedule_inner_nav').childNodes);
    console.log(document.querySelectorAll('.daily_schedule'));
    
    
    if(daycount >3){
        //console.log(document.querySelectorAll('.daily_schedule')[0]);
        document.querySelectorAll('.daily_schedule')[daycount-4].style.display = 'none';
    }


}

function moveNextD(){
    if(document.querySelector('.daily_schedule.active').nextElementSibling == null){
       result = confirm('마지막 일정입니다. 일정을 추가할까요?');
       if(result == true){
           console.log(document.querySelector('.daily_schedule.active').childNodes[0]);
        console.log(document.querySelector('.daily_schedule.active').childNodes[0].childNodes[3].childNodes[3]);
        backwardBtn = document.querySelector('.daily_schedule.active').childNodes[0].childNodes[3].childNodes[3];
          
        if(daycount < 10){
            createSchedule(backwardBtn);
            document.getElementById('totalday').value=daycount;
        }
        else{
            console.log('생성제한');
            alert('일정은 10일까지만 생성가능합니다.');
        }
        }
        else{
            return false;
        }
    }
    else if(document.querySelector('.daily_schedule.active').nextElementSibling.style.display =='none'){
        console.log('다음버튼 view 변경시');
        document.querySelector('.daily_schedule.active').previousElementSibling.previousElementSibling.style.display = 'none';

        let activateThis = document.querySelector('.daily_schedule.active').nextElementSibling;

        activateThis.classList.add('active') ;
        document.querySelector('.daily_schedule.active').classList.remove('active') ;
        document.querySelector('.daily_schedule.active').style.display ='block';

        onlyShowselected(activateThis);
        
    }
    else{
        console.log('다음버튼 일반상태');

        let activateThis = document.querySelector('.daily_schedule.active').nextElementSibling;
        activateThis.classList.add('active') ;
        document.querySelector('.daily_schedule.active').classList.remove('active') ;

        onlyShowselected(activateThis);

    }

}

function activateDay(e){
    document.querySelector('.daily_schedule.active').classList.remove('active');
    e.parentNode.classList.add('active');
    console.log('일정눌렀을때 활성화상태');


   onlyShowselected(e.parentNode);

}

//활성화된 일정만 보여주기
function onlyShowselected(target){
    let dayCheck = 'day'+target.getAttribute('data-day');
    console.log(dayCheck);


    document.querySelectorAll('.dailyBox').forEach(function(dailyBox){
       console.log(dailyBox);
        dailyBox.style.display ='none';
    });

    document.getElementById(dayCheck).style.display ='block';
    console.log(document.getElementById(dayCheck));
}

//앞으로눌렀을때
function movePrevD(){
    if(document.querySelector('.daily_schedule.active').getAttribute('data-day') == 1){
        alert('첫번째 일정입니다.');
    } else{
        console.log('이전버튼 일반상태');
        console.log(document.querySelector('.daily_schedule.active').previousElementSibling);

        let activateThis = document.querySelector('.daily_schedule.active').previousElementSibling;

        activateThis.classList.add('active');
        document.querySelector('.daily_schedule.active').nextElementSibling.classList.remove('active') ;
        if(document.querySelector('.daily_schedule.active').style.display == 'none'){
            document.querySelector('.daily_schedule.active').style.display = 'block';

            if(document.querySelector('.daily_schedule.active').nextElementSibling.nextElementSibling.nextElementSibling != null){
            document.querySelector('.daily_schedule.active').nextElementSibling.nextElementSibling.nextElementSibling.style.display = 'none';}
        }

        onlyShowselected(activateThis)
    }
}

function deleteDay(e){
    if(document.querySelectorAll('.daily_schedule').length ==1){
        alert('최소 1일 일정필요');
        return false;
    }
    else{

        console.log(e.parentNode.parentNode.parentNode.getAttribute('data-day'));

        if(e.parentNode.parentNode.parentNode.classList.contains('active')){
                
            e.parentNode.parentNode.parentNode.previousElementSibling.classList.add('active');

        }
        e.parentNode.parentNode.parentNode.remove();
        --daycount;
        document.getElementById('totalday').value=daycount;
        document.querySelectorAll('.daily_schedule').forEach(function reset(i, curidx){
                console.log(i, curidx);
               i.setAttribute('data-day',curidx+1);
               let dayNum = curidx +1;
               i.childNodes[2].firstChild.textContent = 'day ' + dayNum;
                i.style.display ='none';
        })

        document.querySelector('.daily_schedule.active').style.display = 'block';
        if(document.querySelector('.daily_schedule.active').previousElementSibling != null){
        document.querySelector('.daily_schedule.active').previousElementSibling.style.display ='block';}
        if(document.querySelector('.daily_schedule.active').nextElementSibling != null){
        document.querySelector('.daily_schedule.active').nextElementSibling.style.display ='block';}

        
    }
}

//미리보기

function showPreview(event) { 
    console.log(event);
    console.log(event.target.getAttribute('id')); 
    let targetId = event.target.getAttribute('id');
    console.log(event.target.files);

    for (var image of event.target.files) { 
        var reader = new FileReader(); 
        reader.readAsDataURL(image);
        reader.onload = function(event) {
             var img = document.createElement("img"); 
             img.classList.add('preview');
             img.setAttribute("src", event.target.result); 
             //console.log(event.target.result);
             document.querySelector("div#"+targetId+"_container").appendChild(img); 
            };
              console.log(image); 
            
            }
             }



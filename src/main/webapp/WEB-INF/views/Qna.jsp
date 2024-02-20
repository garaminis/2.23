<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">

<style>
	main {
	  margin: 20px;
	}
	
	.middle_top_title {
	  font-size: 24px;
	  color: #333;
	}
	
	.middle_top_hr {
	  border: 1px solid #333;
	  margin-bottom: 20px;
	}
	
	.announcement {
	  margin-bottom: 10px;
	  padding: 10px;
	  background-color: #f9f9f9;
	  border: 1px solid #ccc;
	}
	
	#data_write {
	  display: none;
	}
	
	button {
	  padding: 10px 20px;
	  background-color: #333;
	  color: white;
	  border: none;
	  cursor: pointer;
	  margin-right: 10px;
	}
	
	button:hover {
	  background-color: #555;
	}
	.announcement label {
	    display: block;
	    font-weight: bold;
	    margin-bottom: 5px;
	}
	.announcement input[type="text"],
	.announcement textarea {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 15px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	
	.announcement textarea {
	    min-height: 150px;
	    resize: vertical;
	}
	
	.announcement button {
	    background-color: black;
	    color: #fff;
	    border: none;
	    border-radius: 4px;
	    padding: 10px 20px;
	    cursor: pointer;
	    font-size: 16px;
	}
	
	.announcement button:hover {
	    background-color: #0056b3;
	}
		.announcement {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ccc;
}

/* Adjust spacing between different parts */
.announcement span {
  margin-right: 60px; /* Increase the margin for more space */
}
</style>
</head>

<body>

<div id="container">
<header id="herder">
  	<%@ include file="include/header.jsp" %>
</header>
<nav id="nav">
  	<%@ include file="include/nav.jsp" %>
</nav>
  

<main>
 <h1 class="middle_top_title">나의 문의내역</h1>
 <hr class="middle_top_hr">

<c:forEach items="${directQnAlist}" var="directQnA">
  <div class="announcement" id='data_list' style="cursor: pointer;">
     <span>제목: ${directQnA.title}</span>
  <div>
    <span>작성자: ${directQnA.writer}</span>
    <span>작성시각: ${directQnA.created}</span>
  </div>
  </div>

  <div class="announcement" id='data_write' style="display: none;"> 
      <input type="text" id="uniq" value="${directQnA.id}" > 
      <input type="text" id="category" value="${directQnA.category}" style="display: none;" > 
      <label>제목</label><input type="text" id="title" value="${directQnA.title}" >
      <label>작성자</label><input type="text" id="writer" value="${directQnA.writer}" readonly>
      <label>내용</label><textarea id="content">${directQnA.content}</textarea>


  <% if (admin!=null || id !=null) { %>
	<input id="comment_id"  >
	<label>답변</label><textarea id="comment"></textarea>
	<input type="text" id="Qwriter" value=<%=id%> readonly>
	<select id="answerstate" required="required">
    <option value="" selected disabled hidden>답변 상태를 선택해주세요.</option>
    </select>
<% } else if(admin==null) { %> 
	
	<input id="comment_id"  >
	<label>답변</label><textarea id="comment" readonly></textarea>
<% }  %> 

      <c:if test="${sessionScope.id != null and sessionScope.id==directQnA.writer}">  
          <button id="btnbModify" >수정하기</button>
          <button id="btnbClear" >취소하기</button>
          <button id="btnbDelete" >삭제하기</button>
      </c:if>

      <c:if test="${sessionScope.admin != null }">  
          <button id="btnComment" >답변하기</button>
          <button id="btnModify_coment" >답변수정하기</button>
          <button id="btnDelete_coment" >답변삭제하기</button>
      </c:if> 
  </div>
</c:forEach>



<button id=gowrite>작성하기</button>

</main>
  
<footer id="footer">
  	<%@ include file="include/footer.jsp" %>
</footer>   

 
</body>   



<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>

$(document)
.ready(function(){
	let str=$('#writer').val(); 
	commentLoad();
})
/* .on('change', '#answerstate', function() {
    let selectedValue = $(this).val(); 
    console.log('선택된 값:', selectedValue);
}) */

.on('click','#clear',function(){
	$('#title,#text').val('');
})
.on('click', '#data_list', function() {
    let clickedElement = $(this); // 클릭된 요소를 변수에 저장

    clickedElement.next().toggle(300); // 클릭된 요소의 다음 요소를 토글

    $.ajax({
        type: 'GET', 
        url: '/answerstate',
        data: {}, 
        dataType: 'json',
        success: function(data) {
            // 클릭된 요소를 변수로 사용하여 해당 요소 아래의 select 요소 선택
            let selectElement = clickedElement.next().find('select#answerstate'); 
            for (let i = 0; i < data.length; i++) {
                let ob = data[i];
                let str = '<option value="' + ob['id'] + '">' + ob['name'] + '</option>';
                selectElement.append(str);
            }
        },
        error: function(xhr, status, error) {
            console.error('Ajax 요청 중 오류 발생:', error);
        }
    });
})  

.on('click','#gowrite',function(){
	location.href="/write";
})

.on('click','#btnbDelete',function(){
	let id=$(this).parent().find('input#uniq').val();
	let category=$(this).parent().find('input#category').val();
	
	
	$.ajax({
		type:'post', url:'/boardDelete',
		data:{uniq:id,category:category},
		dataType:'text',
		success:function(data){
			if(data==1 || data==2){
				alert('성공하였습니다')
				location.href="/Qna";
			} else{
				alert('실패하였습니다')
			}
		}
	})	
})
.on('click','#btnbModify',function(){
	let title=$(this).parent().find('input#title').val();
	let content=$(this).parent().find('textarea#content').val();
	let id=$(this).parent().find('input#uniq').val();
	let category=$(this).parent().find('input#category').val();
	
	$.ajax({
		type:'post', url:'/boardModify',
		data:{title:title,content:content,uniq:id,category:category},//$('#uniq').val()}, 
		dataType:'text',
		success:function(data){
			if(data==1 || data==2){
				alert('성공하였습니다')
				location.href="/Qna";
			} else{
				alert('실패하였습니다')
			}
		}
	}) 
}) 
 .on('click','#btnComment',function(){
	let id=$(this).parent().find('input#uniq').val(); 
	let writer=$(this).parent().find('input#writer').val();
	let category=$(this).parent().find('input#category').val();
	let Qwriter=$(this).parent().find('input#Qwriter').val();
	let comment=$(this).parent().find('textarea#comment').val();
	
	   $.ajax({
        type:'post', url:'/doComment', 
        data:{uniq:id,writer:writer,category:category,Qwriter:Qwriter,comment:comment}, 
        dataType:'text',
        success:function(data){     	
        	if(data==1){
				console.log('성공하였습니다');
				location.href="/Qna";
			}else{
				console.log('실패하였습니다');
			}
        }
	 })    
})   
.on('click','#btnDelete_coment',function(){
	let comment_id=$(this).parent().find('input#comment_id').val();
	
	$.ajax({
		type:'post', url:'/QnaDelete',
		data:{comment_id:comment_id},
		dataType:'text',
		success:function(data){
			if(data==1){
				alert('답변성공하였습니다')
				location.href="/Qna";
			} else{
				alert('실패하였습니다')
			}
		}
	})	
})
.on('click','#btnModify_coment',function(){
	let comment_id=$(this).parent().find('input#comment_id').val();
	let comment=$(this).parent().find('textarea#comment').val();
	console.log(comment);
	
	
	 $.ajax({
		type:'post', url:'/QnaModify',
		data:{comment_id:comment_id,comment:comment},//$('#uniq').val()}, 
		dataType:'text',
		success:function(data){
			if(data==1){
				alert('성공하였습니다')
				location.href="/Qna";
			} else{
				alert('실패하였습니다')
			}
		}
	}) 
})

/* function answerstate(){
	$.ajax({
		type:'Get', url:'/answerstate', data:{}, dataType:'json',
		success:function(data){
			for(let i=0; i<data.length; i++){
				let ob=data[i];
				let str='<option value='+ob['id']+'>'+ ob['name'] + '</option>';
				$('#answerstate').append(str);
			}
		}
	})
} */
function commentLoad(clickedElement) {
    var directid = $(clickedElement).next().find('input#uniq').val(); 
    var textareaComment = $(clickedElement).closest('.announcement').next().find('textarea#comment');
    var comment_id = $(clickedElement).closest('.announcement').next().find('input#comment_id');
    
    $.ajax({
        type: 'POST',
        url: '/commentLoad',
        data: {directid: directid}, 
        dataType: 'json',
        success: function(data) { // 성공적인 응답을 처리하는 콜백 함수
            var found = false; // directid가 응답 데이터에 있는지 여부를 추적하는 변수
            for (let i = 0; i < data.length; i++) {
                if (data[i]['id'] == directid) {
                    found = true;  // id가 일치하는 경우 found를 true로 설정
                    textareaComment.val(data[i]['content']); // Set value to the targeted textarea
                    comment_id.val(data[i]['Commet_id'])
                    break;
                }
            }
            if (!found) { // directid가 응답 데이터에 없는 경우 에러 메시지를 로그로 출력
             
            }
        },
        error: function(xhr, status, error) {// AJAX 요청 중 발생한 에러를 처리하는 콜백 함수
            console.error('AJAX request failed:', status, error); // 에러를 콘솔에 출력
        }
    }); 
} 
//'announcement' 클래스를 가진 요소에 대한 클릭 이벤트 핸들러
$('.announcement').click(function() {
    commentLoad(this);
});







</script>
</html>
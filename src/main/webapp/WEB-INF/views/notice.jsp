<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
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
	 <h1 class="middle_top_title">공지사항</h1>
	 <hr class="middle_top_hr">

<c:forEach items="${boardlist}" var="board">  
<div class="announcement" id='data_list' style="cursor: pointer;" >
 <span>제목: ${board.title}</span>
  <div>
    <span>작성자: ${board.writer}</span>
    <span>작성시각: ${board.created}</span>
  </div>
</div>
<div class="announcement" id='data_write' style="display: none;"> 
   <input type="text" id="uniq" value=${board.id} style="display: none;">
   <input type="text" id="category" value="${board.category}" > 
   <label>제목</label><input type="text" id="title" value=${board.title}>
   <label>작성자</label><input type="text" id="writer"  value=${board.writer} readonly >
   <label>내용</label><textarea id="content">${board.content}</textarea>
 
<c:if test="${sessionScope.admin != null }">  
  <button id="btnbModify" >수정하기</button>
  <button id="btnbDelete" >삭제하기</button>
 </c:if>
  
</div>
</c:forEach>

<c:if test="${sessionScope.admin != null }">  
<button id=gowrite>작성하기</button>
</c:if>
</main>
  
<footer id="footer">
  	<%@ include file="include/footer.jsp" %>
</footer>   

 
</body>   



<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.ready(function(){
	focusOnEmptyInput();	
})

.on('click','#clear',function(){
	$('#title,#text').val('');
})

.on('click','#data_list',function(){
	//let ndx = $(this).index();
	//console.log('ndx='+ndx)
	//$('#data_write:eq(' + ndx + ')').toggle(300);
	//$(this).find('div#data_write').toggle(300);
	$(this).next().toggle(300);
	
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
			if(data==1||data==2){
				alert('성공하였습니다')
				location.href="/notice";
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
				location.href="/notice";
			} else{
				alert('실패하였습니다')
			}
		}
	}) 
}) 
function category(){
	$.ajax({
		type:'Get', url:'/catagoryboard', data:{}, dataType:'json',
		success:function(data){
			for(let i=0; i<data.length; i++){
				let ob=data[i];
				let str='<option value='+ob['id']+'>'+ ob['name'] + '</option>';
				$('#category').append(str);
			}
		}
	})
}

function focusOnEmptyInput(){
	 $('#data_div input').each(function() {
	      if ($(this).val() === '') {
	        $(this).focus();
	        return false; 
	      }
	 });
}

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성하기</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
</head>
<style>
	 body {
	     font-family: Arial, sans-serif;
	     background-color: #f4f4f4;
	     margin: 0;
	     padding: 0;
	 }
	
	 .layout {
	     width: 80%;
	     max-width: 600px;
	     margin: 20px auto;
	     background-color: #fff;
	     padding: 20px;
	     border-radius: 8px;
	     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	 }
	
	 .layout label {
	     display: block;
	     font-weight: bold;
	     margin-bottom: 5px;
	 }
	
	 .layout input[type="text"],
	 .layout textarea {
	     width: 100%;
	     padding: 10px;
	     margin-bottom: 15px;
	     border: 1px solid #ccc;
	     border-radius: 4px;
	     box-sizing: border-box;
	 }
	
	 .layout textarea {
	     min-height: 150px;
	     resize: vertical;
	 }
	
	 .layout button {
	     background-color: black;
	     color: #fff;
	     border: none;
	     border-radius: 4px;
	     padding: 10px 20px;
	     cursor: pointer;
	     font-size: 16px;
	 }
	
	 .layout button:hover {
	     background-color: #0056b3;
	 }
	
	 .layout select {
	     width: 100%;
	     padding: 10px;
	     margin-bottom: 15px;
	     border: 1px solid #ccc;
	     border-radius: 4px;
	     box-sizing: border-box;
	 }
</style>
<body>
<div id="container">
   <header id="herder">
        <%@ include file="include/header.jsp" %>
   </header>
   
    <nav id="nav">
       <%@ include file="include/nav.jsp" %>
   </nav>
   
    <main id="main">
     <div id="mainContent"> 
     
<div class="layout" id='data_div'>
   	<label>작성하기</label>
    <input type="text" id="title" placeholder="제목">

  
    <input type="text" id="writer" value=<%=id%> readonly >

   
    <textarea id="text" placeholder="내용"></textarea>


    <select id="category" required="required">
    <option value="" selected disabled hidden>카테고리를 선택해주세요.</option>
    </select>

    <button id="write" >등록하기</button>
    <button id="clear" >취소하기</button>
</div>
</div>
</main>
 <footer id="footer">
	<%@ include file="include/footer.jsp" %>
</footer>
</body>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.ready(function(){
	category();
	focusOnEmptyInput();
	console.log($('#category option:selected').val());
})
/* .on('change','#category',function(){
	console.log($('#category option:selected').val());
}) */
.on('click','#write',function(){
	$.ajax({
		type:'post', url:'/doWrite', 
		data:{title:$('#title').val(),writer:$('#writer').val(),text:$('#text').val(),category:$('#category option:selected').val()}, 
		dataType:'text',
		success:function(data){
			if(data==1){
				alert('글 작성 성공')
				$('#title,#text').val('');
			}
		}
	})
})
.on('click','#clear',function(){
	$('#title,#text').val('');
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
</body>
</html>
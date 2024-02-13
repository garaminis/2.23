<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보수정</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<style>

h1 {
    text-align: center;
} 
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

table {
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    
}

table tr td {
    padding: 15px;
    vertical-align: top;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="number"],
input[type="tel"],
input[type="email"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    padding: 10px 10px;
    background-color: navy;
    color: #fff;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #0056b3;
}

#signup:hover {
    background-color: #004080;
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
      <h1><br>내 정보수정</h1><br>
      <hr>
			<table id="tblMyUpdate">
			  <tr>
			    <td colspan="2"><input type="text" id="user_id" name='id' placeholder="아이디" value=<%=id%> readonly></td>
			  </tr>
		    <tr>
			    <td colspan="2" ><input type="text" id="name" placeholder="이름" value="${members.name}"></td>
			  </tr>
		    <tr>
	        <td colspan="2"><input type="date" id="birth"></td>
		    </tr>
			  <tr>
	        <td><input type="number" id="zip_code" placeholder="우편번호"> <br> <td><button> 주소검색</button> </td> 
  	    </tr>
        <tr>
	        <td colspan="2"><input type="text" id="adress"  placeholder="기본주소"></td>
	      </tr>
			  <tr>
			    <td colspan="2"><input type="text" id="adress2"  placeholder="상세주소(아직 미완성)"></td>
			  </tr>
			  <tr>
			    <td colspan="2"><input type="tel" id="mobile"  placeholder="핸드폰번호" ></td>
			  </tr>
			  <tr>
			    <td colspan="2"><input type="email" id="mail" placeholder="이메일"></td>
			  </tr>
			  <tr>
			    <td colspan="2"><button id="btnupdate">수정완료</button></td>
			  </tr>
	      <tr>
		      <td colspan="2"><button id="btnclear" >취소</button></td>
			  </tr>
			</table>
		</div>
  </main>
<footer id="footer">
	<%@ include file="include/footer.jsp" %>
</footer>

</body>

<script>
$(document)
.ready(function(){
	 setingData();
	 focusOnEmptyInput();
})

.on('click','#btnupdate',function(){
	$.ajax({
		type:'post', url:'/myModify',
		data:{user_id:$('#user_id').val(),name:$('#name').val(),birth:$('#birth').val(),zip_code:$('#zip_code').val(),
			  adress:$('#adress').val(), mobile:$('#mobile').val(),mail:$('#mail').val()}, 
		dataType:'text',
		success:function(data){
			if(data==1){
				alert('회원정보수정에 성공하였습니다')
				$('#name,#birth,#zip_code,#adress,#birth,#zipcode,#mobile,#mail').val('');
				location.href="/mypage";
			} else{
				alert('회원정보수정에 실패하였습니다')
				focusOnEmptyInput();
			}
		}
	})
})
.on('click','#btnclear',function(){
	location.href="/mypage";
})

function focusOnEmptyInput(){
	 $('#tblMyUpdate input').each(function() {
	      if ($(this).val() === '') {
	        $(this).focus();
	        return false; 
	      }
	 });
}


function setingData(){
	let id = '<%=(String)session.getAttribute("id")%>';
	alert(id)
	$.ajax({
		type:'post', url:'/myLoad',
		data:{user_id:id},
		dataType:'json',
		success:function(data){
				$('#name').val(data[0].name);
				$('#birth').val(data[0].birth);
				$('#zip_code').val(data[0].zipcode);
				$('#adress').val(data[0].adress);
				$('#mobile').val(data[0].mobile);
				$('#mail').val(data[0].mail);
		}
	})
}

</script>
</html>
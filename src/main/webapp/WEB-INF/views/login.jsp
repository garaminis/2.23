<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
    margin-top: 50px;
}

table {
    margin: 0 auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
}

table tr td {
    padding: 10px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    padding: 13px 30px; /* Increased button size */
    background-color: rgb(39, 39, 151); /* Changed button color to navy */
    color: #ffffff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #305be7;
}

#signup {
    margin-top: 10px; /* Add space between login and signup buttons */
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
			<table id=tblLogin>
  		  <tr>
	        <td> Login ID </td>
	        <td><input type="text" id="loginId">  </td>
        </tr>
        <tr>
			    <td> Password </td>
			    <td><input type="password" id="password" ></td>
		    </tr>
		    <tr style="color: red; display: none;" id='error'>
		    	<td colspan="2">아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.</td>
		    </tr>
		    <tr>
			  	<td ><a href="">비밀번호찾기</a></td>
		    </tr>
		    <tr>
		      <td colspan="2"> <button id=btnLogin >로그인</button></td>
		  	</tr>
		    <tr>
		      <td colspan="2"> <button id=btnSignup >회원가입</button>
		    </tr>
		  </table>
    </div>
  </main>
  
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
</body>


<script>
$(document)
.ready(function(){
	$('#loginId').focus();
})
.on('click','#btnLogin',function(){
  $.ajax({
		type:'Post',
		url:'/dologin' ,
		data:{loginId:$('#loginId').val(),passwd:$('#password').val()},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				$('#loginId,#password').val('');
				location.href="/";
			} else if(data=='2'){
				alert("관리자로그인 성공");
				$('#loginId,#password').val('');
				location.href="/";
			}else{
				$('#error').show();
				$('#loginId,#password').val('');
				$('#loginId').focus();
			}
		}
	}) 
	return false;
})

.on('click','#btnSignup',function(){
	location.href="/signup";
}) 

</script>
</html>
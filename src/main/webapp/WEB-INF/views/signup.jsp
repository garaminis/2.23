<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
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
    border-radius: 8px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);  
  }
  table tr td {
    padding: 10px;
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
    border-radius: 4px;
    cursor: pointer;
  }
  button:hover {
    background-color: #0056b3;
  }
  #signup,#cancel {
    width: 100%;
  }
  #signup:hover {
    background-color: #004080;
  }
  #zipcode {
    width: 70%;
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
 	   <h1 ><br>회원가입</h1><br>
     <hr> 
		 <table id="tblSignup">
	     <tr>
	       <td>로그인 아이디</td>
	       <td><input type="text" id="userId" maxlength="12"></td>
	       <td></td>
	     </tr>
	     <tr style="display: none;" >     
	       <td><input type="text" id="userIdCheck"></td>
	     </tr>
	     <tr>
	       <td>비밀번호</td>
	       <td><input type="password" id="password" maxlength="12"></td>
	       <td></td>
	     </tr>
	     <tr>
	       <td>비밀번호 확인</td>
	       <td><input type="password" id="passwordCheck" maxlength="12"></td>
	       <td></td>
	     </tr>
	     <tr>
	       <td>이름</td>
	       <td><input type="text" id="userName" ></td>
	     </tr>
	     <tr>
	       <td>생년월일</td>
	       <td><input type="date" id="birth" min="1900-01-01"></td>
	     </tr>
	     <tr>
	       <td rowspan="3">주소 </td>
	       <td> <input type="number" id="zipcode"   placeholder="우편번호">&nbsp;<button id=ADRshow>주소검색</button></td>
	     </tr>
	     <tr>
	       <td><input type="text" id="adress"  placeholder="기본주소"></td>
	     </tr>
	     <tr>
	       <td><input type="text"  id="ADR_SangSoo"  placeholder="상세주소"></td>
	     </tr>
	     <tr>
	       <td>핸드폰 번호 </td>
	       <td><input type="tel" id="mobile"  placeholder="010-0000-0000"  pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required></td>
	       <td></td>
	     </tr>
	     <tr>
	       <td>E-mail </td>
	       <td><input type="email" id="mail"></td>
	     </tr>
	     <tr>
	       <td>성별 </td>
	       <td ><input type=radio name=gender value=male>남성 &nbsp; <input type=radio name=gender value=female>여성 </td>
	     </tr>
	     <tr>
	       <td colspan="2"><button id="signup">회원가입</button></td>
	     </tr>
	     <tr>
	       <td colspan="2"><button id="cancel">취소</button></td>
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
.ready(function() {
	focusOnEmptyInput();
})
.on('click','#signup',function(){
	alert($("#password").val().length)
	if($('#userId').val() != $('#userIdCheck').val()){
		alert("ID 중복 확인해주세요.");
		$("#userId").focus();
	}else if($("#password").val().length < 4){
		alert("비밀번호가 너무 짧습니다. 4~12자");
		$("#password").focus();
	}else if($("#password").val() != $("#passwordCheck").val()){
		alert("비밀번호 확인해주세요.");
		$("#password,#passwordCheck").val('');
		$("#password").focus();
	}else if($('#userId').val() === '' || 
		$('#password').val() === '' || 
		$('#userName').val() === '' || 
		$('#mobile').val() === '' || 
		$('#mail').val() === '' || 
		$('#birth').val() === '' || 
		$('#adress').val() === '' || 
		$('#zipcode').val() === '' || 
		$('input[name="gender"]:checked').length === 0
	) {
		alert("빈칸에 값을 입력해주세요."); 
		focusOnEmptyInput();
	} else {
		 singup();
		 alert("회원가입 완료")
		 location.href="/login";
	}
})

.on('click','#cancel',function(){
	location.href="/";
})
.on('click','#ADRshow',function(){
	ADRshow();
})
.on('keyup','#userId',function(){
	idcheck();
})

.on('keyup','#passwordCheck',function(){
	pswcheck();
})



function singup(){
	console.log($('#ADR_SangSoo').val());
	$.ajax({
		type:'post', url:'/doSignup',
		data:{userId:$('#userId').val(),psw:$('#password').val(),name:$('#userName').val(),mobile:$('#mobile').val(),
		  		mail:$('#mail').val(),birth:$('#birth').val(),
			 	  adress:$('#adress').val(),zipcode:$('#zipcode').val(),gender:$('input[name=gender]:checked').val(),
			 	  sAdress:$('#ADR_SangSoo').val()}, 
		dataType:'text',
		success:function(data){
			 if(data == 1){
				 $('#userId,#password,#passwordCheck,#userName,#birth,#zipcode,#address,#mobile,#mail').val('');
			 }else {
				 alert("회원가입 실패");
				 $('#userId,#password,#passwordCheck,#userName,#birth,#zipcode,#address,#mobile,#mail').val('');
			 }
		}
	})  
}


function idcheck(){
	$.ajax({
		type:'post', url:'/idcheck', data: {userId:$('#userId').val()},
		dataType:'text',
		success:function(data){
		  if($("#userId").val().length < 4){
				 let str='<td style="color: red; text-align:center;"> Id가 너무 짧습니다. 4 ~ 12자</td>'; 
				 $('#tblSignup tr:eq(0) td:eq(2)').after (str);
		  } else {
			  if(data==1){
					 let str='<td style="color: red; text-align:center;"> 이미 사용중인 아이디입니다.</td>'; 
					 $('#tblSignup tr:eq(0) td:eq(2)').after (str);
				} else if(data==0 && $('#userId').val()==""){
					let str='<td style="color: red; text-align:center;"> 값을 입력해주세요.</td>'; 
					$('#tblSignup tr:eq(0) td:eq(2)').after (str);
				} else{
					let str='<td style="color: green; text-align:center;"> 가입가능한 아이디입니다.</td>'; 
					$('#tblSignup tr:eq(0) td:eq(2)').after (str);
					$('#userIdCheck').val($('#userId').val());
				}
		  }
			$('#tblSignup tr:eq(0) td:eq(2)').remove(); 
		}
	})  
}

function pswcheck(){
  if ($("#password").val() !== $("#passwordCheck").val() ) {
	  let str='<td style="color: red; text-align:center;"> 확인 비밀번호가 일치하지 않습니다.</td>'; 
	  $('#tblSignup tr:eq(3) td:eq(2)').after (str);
	} else{
	  let str='<td style="color: green; text-align:center;"> 확인 비밀번호가 일치합니다.</td>'; 
	  $('#tblSignup tr:eq(3) td:eq(2)').after (str);
	} $('#tblSignup tr:eq(3) td:eq(2)').remove();	
}

function focusOnEmptyInput(){
	 $('#tblSignup input').each(function() {
	      if ($(this).val() === '') {
	        $(this).focus();
	        return false; 
	      }
	 });
}

function ADRshow(){
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                $('#zipcode').val(data.zonecode) // 우편번호 넣는코드
                if(roadAddr!==''){              
                   $('#adress').val(roadAddr) 
                }else if(jibunAddr!==''){
                    $('#adress').val(jibunAddr)  //도로명이 없을경우 지번을 넣는다
                }
            }
        }).open();
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음카카오 주소API 스크립트 -->

</html>
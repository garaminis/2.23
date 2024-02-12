<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
<style>
   body {
       font-family: Arial, sans-serif;
       margin: 0;
       padding: 0;
   }
   .subcontainer {
       max-width: 90%;
       margin: 0 auto;
       padding: 20px;
   }
   h1 {
       text-align: center;
   }
   .announcement {
       margin-bottom: 10px;
       border: 1px solid #ccc;
       padding: 10px;
       background-color: #f9f9f9;
   }
    button {
            padding: 10px 10px;
            background-color: black;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer; 
        }
        
        button:hover {
            background-color: navy;
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
<div class="mainContent">
<div id="middle_box">
<div id="middle_top">
<h1 class="middle_top_title">공지사항</h1>
<hr class="middle_top_hr">
</div>
<div>
<div class="subcontainer">
<button id='write'>작성하기</button>
<c:forEach items="${boardlist}" var="board"> 
	<table>
	<div class="announcement" >${board.title},${board.writer},${board.created}</div>
	<div class="announcement1" >----</div>
	</table>
</c:forEach>  

</div>
</div>

</div>
 
 <br>
  </main>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</body>   
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script> 
$(document)
.on('click','#write',function(){
	location.href="/write";
})
</script>
</html>
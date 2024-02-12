<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
</head>
<style>
  .square {
    width: 100px;
    height: 100px;
    background-color: blue;
    margin: 10px;
    display: inline-block;
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
<% if (id == null) { %> 
		<jsp:forward page="login.jsp" />
<%} else {%>
  <main>
    <div class="mainContent">
      <div id="middle_box">
        <div id="middle_top">
          <h1 class="middle_top_title">마이페이지</h1>
          <hr class="middle_top_hr">
        </div>
        <div id="middle_bottom">
          <div class="middleMenu"><a href="/orderList"><img src="/img/myOrder.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/cart"><img src="/img/cart.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/myQna"><img src="/img/myQnA.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/myUpdate"><img src="/img/myUpdate.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/mypage"><img src="/img/wating.jpg" id=""></a></div>
        </div>
      </div>

      <div>
        여기에는 각종 게시판(jsp)이 따라 붙습니다.jsp코드
      </div>  
    </div>
  </main>
<%} %>  
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</body>
</html>
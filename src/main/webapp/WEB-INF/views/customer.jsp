<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  
 <main>
    <div class="mainContent">
      <div id="middle_box">
        <div id="middle_top">
          <h1 class="middle_top_title">고객센터</h1>
          <hr class="middle_top_hr">
        </div>
        <div id="middle_bottom">
          <div class="middleMenu"><a href="/notice"><img src="/img/notice.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/Qna"><img src="/img/QnA.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/Fna"><img src="/img/FAQ.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/myAbout"><img src="/img/myQnA.jpg" id=""></a></div>
          <div class="middleMenu"><a href="/customer"><img src="/img/wating.jpg" id=""></a></div>
        </div>
      </div>

    
      <div>
        여기에는 각종 게시판(jsp)이 따라 붙습니다.jsp코드
      </div>
   
   
    
	</div>
 
 
  </main>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</body>    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
</head>
<style>
.shop-item-image {
  width: 100%;
  height: 300px;
  overflow: hidden;
  display: flex;
  align-items: center;
}

.shop-item-image img {
  width: 100%;
}

@media (max-width: 767px) {
  .module-small .col-sm-6 {
    width: 50%;
    float: left; /* 가로로 나열하기 위해 float 속성 추가 */
  }
}

/* 중간과 큰 화면에서는 4개의 열을 가로로 나열 */
@media (min-width: 768px) {
  .module-small .col-md-3,
  .module-small .col-lg-3 {
    width: 25%;
    float: left; /* 가로로 나열하기 위해 float 속성 추가 */
  }
}

/* clearfix 속성을 사용하여 부모 컨테이너의 높이 자동 조절 */
.module-small .row::after {
  content: "";
  display: table;
  clear: both;
}

#middle_area2 .row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 0 -15px;
}

#middle_area2 .col-sm-6 {
    padding: 0 15px;
    margin-bottom: 20px; /* 각 요소의 아래쪽 여백 추가 */
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
<!--       <div id="middle_box"> 여기 배너자리 -->
        <div id="middle_top">
          <h1 class="middle_top_title">New Arrived</h1>
          <hr class="middle_top_hr">
   		</div>
<!--       </div> -->
      <div>
      <div id="middle_area2">
        <div class="row" style="width: 100%; margin: 0 auto; padding: 0 15px;">
          <section class="module-small">
            <c:forEach items="${itemList}" var="item">
              <div class="col-sm-6 col-md-3 col-lg-3 mt-60 mb-40" item="${item.id}" style="padding-left: 10px; padding-right: 10px;">
                <div class="shop-item">
                  <a href="/goods?id=${item.id}">
                  <div style="text-align: center; padding: 30px;">
                    <div style="width: 100%; height: 300px; overflow: hidden; display: flex; align-items: center;">
                      <img style="width: 100%;  "src="/img/coffee/${item.img1}" alt="상품이미지"/>
                    </div>
                    <div>
                      <h4 class="shop-item-title font-alt">${item.title}</h4>
                      ₩ <fmt:formatNumber pattern="###,###,###" value="${item.price}"/>
                    </div>
                  </div>
                  </a>
                </div>
              </div>
            </c:forEach>
          </section>
        </div>
      </div>
      </div>
    </div>
  </main>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
</body>
</html>
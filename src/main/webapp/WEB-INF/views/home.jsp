<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
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
          <h1 class="middle_top_title">home</h1>
          <hr class="middle_top_hr">
       
    
      <div>
        <section class="module-small">
          <div class="container">
            <div class="row multi-columns-row">
            <form>
            <c:forEach items="${itemList}" var="itemList">
              <div class="col-sm-6 col-md-3 col-lg-3 mt-60 mb-40">
              
                <div class="shop-item">
                	<a href="/main/itemContent?item_no=${itemList.item_no}&page=${cri.page}&perPageNum=${cri.perPageNum}&catemain=${cri.catemain}&catesub=${cri.catesub}&sort=${cri.sort}">
                  <div class="shop-item-image"><img width="10%" src="/img/${itemList.item_imgmain}" alt="Accessories Pack"/>
                    <div class="shop-item-detail"><img src="/img/${itemList.item_imgsub}" alt="Accessories Pack"/></div>
                  </div>
                  <h4 class="shop-item-title font-alt">${itemList.item_name}</h4>
                  ₩ <fmt:formatNumber pattern="###,###,###" value="${itemList.item_price}"/>
                  </a>
                </div>
                
              </div>
              </c:forEach>
              </form>
   
            </div>
   
                 <div class="row">
              <div class="col-sm-12" style="text-align:center;">
     <div class="pagination font-alt">
  
    <c:if test="${pageMaker.prev}">
    <a href="/main/itemView${pageMaker.makeQuery(pageMaker.startPage - 1)}"><i class="fa fa-angle-left"></i></a>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<a class="active" href="/main/itemView${pageMaker.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<a href="/main/itemView${pageMaker.makeQuery(pageMaker.endPage + 1)}"><i class="fa fa-angle-right"></i></a>
    </c:if> 

</div>
</div>
</div>
          </div>
        </section>
      </div>
    </div>
  </main>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
</body>
</html>
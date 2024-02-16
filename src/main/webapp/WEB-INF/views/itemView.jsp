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
/* 작은 화면에서는 2개의 열을 가로로 나열 */
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
      <div id="middle_area1">
        <div id="middle_top">
          <h1 class="middle_top_title">${itemList[0].name}</h1><input type="hidden" style="display:none" id="catrgoryCheck" value="${itemList[0].id}">
          <hr class="middle_top_hr">
        </div>
      </div>
      <div id="middle_area2">
        <div class="row" style="width: 100%; margin: 0 auto; padding: 0 15px;">
          <section class="module-small">
            <c:forEach items="${itemList}" var="item">
              <div class="col-sm-6 col-md-3 col-lg-3 mt-60 mb-40scrolling" item="${item.id}" style="padding-left: 10px; padding-right: 10px;">
                <div class="shop-item">
                  <a href="/goods?id=${item.id}">
                  <div style="text-align: center; padding: 30px;">
                    <div style="width: 100%; height: 300px; overflow: hidden; display: flex; align-items: center;">
                      <img style="width: 100%;  " src="/img/${item.img1}" alt="이미지제대로 넣어라"/>
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
  </main>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
</body>
<script>
$(document)
.ready(function(){
	
})

let pageCnt = 0;

$(window).scroll(function(){
	let currentScrollTop = $(window).scrollTop();
	let lastScrollTop = 0;

	let id = $('#catrgoryCheck').val();
	if(currentScrollTop - lastScrollTop > 0) {
	  lastScrollTop = currentScrollTop;		
	} else {
	  lastScrollTop = currentScrollTop;
	}
	if($(window).scrollTop() >= ($(document).height() - $(window).height())) {
		let lastItem = $(".scrolling:last").attr("item");
		pageCnt += 1;
		$.ajax({
			type:'get', url:'/itemScroll',
			data:{id : $('#catrgoryCheck').val(), page : pageCnt, lastItem: lastItem }, 
			dataType:'json',
			success:function(data){
				alert(pageCnt)
				let str = "";
					for(let i = 0; i < data.length; i++){
						if (lastItem != data[i].id) {
						let price = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(data[i].price);
						str += '<div class="col-sm-6 col-md-3 col-lg-3 mt-60 mb-40 scrolling" item="' + data[i].id + '" style="padding-left: 10px; padding-right: 10px;">'
			                + '<div class="shop-item">'
			                + '<a href="/goods?id='+ data[i].id +'">'
			                + '<div style="text-align: center; padding: 30px;">'
			                + '<div style="width: 100%; height: 300px; overflow: hidden; display: flex; align-items: center;">'
			                + '<img style="width: 100%;  " src="/img/' + data[i].img1 + '" alt="이미지제대로 넣어라"/></div>'
			                + '<div><h4 class="shop-item-title font-alt">' + data[i].title + '</h4>'
			                + price + '</div></div></a></div></div>'
						}
					}
				$(".module-small").append(str);
				lastItem = $(".scrolling:last").attr("item");
			}
		})
	}
});
</script>

</html>
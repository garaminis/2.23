<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>홈</title>
    <link href="/css/theme.css" rel="stylesheet" type="text/css">
    <style>
	table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	th, td {
	    border: 1px solid #ccc;
	    padding: 10px;
	    text-align: center;
	}
}</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>

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
    <main id="main">
      <div id="mainContent">
        <div id="middle_top">
          <h1 class="middle_top_title">주문/결제</h1>
          <hr class="middle_top_hr">
        </div>
        <div style="width: 80%; margin: 0 auto;"> <!--총 정보를 감싼 DIV-->
          <div style="float:left; width: 100%;height: 100%;">
          <h2>1. 주문상품 정보</h2>
            <table>
              <thead>
                <tr>
                  <th colspan="2">상품정보</th>
                  <th>수량</th>
                  <th>구매금액</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><img src="" alt="magic keyboard"> </td>
                  <td>
                    <p>Apple 매직 키보드 - 한국어(MK2A3KH/A)</p>
                    <sapn class="price">개별금액: <input id="sPrice" value=20000 style="border:none">원</sapn>
                  </td>
                  <td>
                    <input type="text" id="amount" value="1" size="1">
                    <input type="button" id=plus value=" + ">
                    <input type="button" id=minus value=" - ">
                  </td>
                  <td><input type="text" id="aPrice" style="border:none"></td>
                </tr>
              </tbody>
            </table>
            <br>
            <table>
              <thead>
                <tr>
                  <th>상품금액</th>
                  <th>배송비</th>
                  <th>할인금액</th>
                  <th>결제금액</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div style="float:left; width: 60%;height: 100%;"> <!--구매자 정보,배송지 정보,결제정보 DIV-->
            <div><!--구매자 정보DIV-->
              <h2>2. 구매자 정보</h2>
              <table>
                <tr>
                  <td>이름</td>
                  <td><input class="name" type="text" readonly></td>
                </tr>
                <tr>
                  <td>이메일</td>
                  <td><input class="mail" type="text" readonly></td>
                </tr>
                <tr>
                  <td>모바일번호</td>
                  <td><input class="mobile" type="text" readonly></td>
                </tr>
                <tr hidden="">
                  <td>배송지</td>
                  <td><input class="adress" type="text" readonly></td>
                </tr>
              </table>
            </div>
            <div><!--배송지 정보DIV-->
              <h2>3. 배송지 정보</h2>
              <h3><input type="checkbox" class="sameOrder">주문자와 동일</h3>
              <table>
                <tr>
                  <td>이름</td>
                  <td><input class="tkname" type="text"></td>
                </tr>
                <tr>
                  <td>배송지</td>
                  <td><input class="tkadress" type="text"></td>
                </tr>
                <tr>
                  <td>연락처</td>
                  <td><input class="tkmobile" type="text"></td>
                </tr>
                <tr>
                  <td>배송시 요청사항</td>
                  <td><input type="text"></td>
                </tr>
              </table>
            </div>
            <div><!--결제 정보 DIV-->
              <h2>4. 결제정보</h2>
              <table>
                <tr>
                  <td>결제방법</td>
                  <td>
	                <input type="radio" name="payment" value=1>계좌이체
	                <input type="radio" name="payment" value=2>신용/체크카드
	                <input type="radio" name="payment" value=3>간편결제
	                <input type="radio" name="payment" value=4>휴대폰
	                <input type="radio" name="payment" value=5>무통장입금
                  </td>
                </tr>
              </table>
            </div>
          </div>
          <div style="float:right; width: 30%;height: 100%; position : relative;">
          <div><!--주문목록 총정보DIV--><!--주문목록 테이블 DIV-->
            <h2>최종결제금액</h2>
            <table>
              <tr><td>최종결제금액</td></tr>
              <tr><td>상품가격</td></tr>
              <tr><td>배송비</td></tr>
              <tr><td>할인금액</td></tr>
            </table>
          </div>
          <div>
            <button>결제하기</button>
        </div>
     </main>
<%} %>  
     <footer id="footer">
       <%@ include file="include/footer.jsp" %>
     </footer>
  </div>
</body>

<script>
$(document)
.ready(function() { /*체크표시하면 주문자와 동일한 값 가져오는 함수 */
  $(".sameOrder").change(function() {
    if ($(".sameOrder").is(":checked")) {
      $(".tkname").val($(".name").val())
      $(".tkadress").val($(".adress").val())
      $(".tkmobile").val($(".mobile").val())
    } else {
      $(".tkname").val("")
      $(".tkadress").val("")
      $(".tkmobile").val("")
    }
  });
  setingOrder();
});

<%-- .on('click','#bgngoOrder',function(){
	let id = '<%=(String)session.getAttribute("id")%>';
	$.ajax({
		type:'post', url:'/saveOrder',
		data:{user_id:id, tkname:$('.tkname').val(), tkname:$('.tkadress').val(), tkmobile:$('.tkmobile').val(),
			  payment :$('input[name=payment]:checked').val(), cnt : }, 
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
}) --%>


    
    function setingOrder(){
	
    	let id = '<%=(String)session.getAttribute("id")%>';
    	$.ajax({
    		type:'post', url:'/orderData',
    		data:{user_id:id},
    		dataType:'json',
    		success:function(data){
    				$('.name').val(data[0].name);
    				$('.mail').val(data[0].mail);
    				$('.mobile').val(data[0].mobile);
    				$('.adress').val(data[0].adress);
    		}
    	})
    }
</script>

</html>
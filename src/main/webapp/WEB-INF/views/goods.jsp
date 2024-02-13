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
    html{
  scroll-behavior: initial;
    } /*스크롤 내릴때 확내려가거나 부드럽게 내려가는 타입*/
    a{
        text-decoration: none;
    }
    #coment{
        scroll-margin-top: 120px;
    } /*버튼누르고 스크롤 내려갔을때 상단의 공백*/
    #mainDIS{
        scroll-margin-top: 120px;
    }/*버튼누르고 스크롤 내려갔을때 상단의 공백*/
    #QnA{
        scroll-margin-top: 120px;
    }/*버튼누르고 스크롤 내려갔을때 상단의 공백*/
    #먹태{
        scroll-margin-top: 120px;
    }/*버튼누르고 스크롤 내려갔을때 상단의 공백*/
    
tr,td {
	border: 1px solid black;
}
table {
	border-collapse:collapse; margin: auto;
}
    
</style>
<body>
 <!-- <div id="scrollbar"style="background-color: white; text-align: center; position: sticky; top: 0px; right: 300px;">
 	93번줄의 div position을 sticky를 34번줄 div밖에서 선언하면 움직이는 사이드바 작동가능함 안에선 불가능  -->
<div id="container">
  <header id="herder">
   	<%@ include file="include/header.jsp" %>
  </header>
  
  <nav id="nav">
  	<%@ include file="include/nav.jsp" %>
  </nav>
<c:forEach items="${itemInfo}" var="item">
<c:set var="imgSrc" value="${item.img1}" />
<main id="main">
    <div id="mainContent">
        <main>
        <div style="margin-top: 20px; text-align: center; ">
            <div class="img-box" style="display: inline-block;">
                <img class="M_img"style="width: 280px;" src="/img/${item.img1}" alt="">
                <br>
                <div>
                <img class="S_img1" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${item.img1}" alt="">
                <img class="S_img2" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${item.img1}" alt="">
                <img class="S_img3" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${item.img1}" alt="">
                <img class="S_img4" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${item.img1}" alt="">
                </div>
            </div>
            <div style="display: inline-block;">
                <table style="font-size: 30px;display: inline-block;">
                    <tr>
                        <td colspan="2" class="goodsName">${item.title}</td>
                    </tr>
                    <tr>
                        <td>판매가</td>
                        <td class="goodsPrice">${item.price}</td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td class="goodsSend">3000원</td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><input type="text" class="result" readonly value="1"style="text-align: right;width: 80px;height: 30px;font-size: 30px;"><input type="button" style="width: 40px;height: 30px;" onclick='count("plus")' value="+"><input type="button" style="width: 40px;height: 30px;" onclick='count("minus")' value="-"></td>
                    </tr>
                </table>
            </div>
            <div style="text-align: right;">
                <input type="button" style="width: 120px;height: 30px;" value="장바구니에담기">
                <input type="button" style="width: 120px;height: 30px;" onclick=Juuu(); value="주문하기">
            </div>
        </div>
        <div id="scrollbar"style="background-color: white; text-align: center; position: sticky; top: 0px; right: 300px;">
            <div>
                <div style="width: 200px; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#mainDIS" class="scroll_bar">상세정보</a></div>
                <div style="width: 200px; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#coment" class="scroll_bar">상품평</a></div>
                <div style="width: 200px; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#QnA" class="scroll_bar">Q&A</a></div>
                <div style="width: 200px; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#먹태" class="scroll_bar">먹태</a></div>
            </div>
        </div>
        <div id="mainDIS"><!--상품상세설명-->
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>
            <h1 style="text-align: center;">먹태가 고추장에는 어울려</h1>

        </div>
        <div id="coment"><!--상품평-->
            <h1 style="text-align: center;font-style: initial;">상품평</h1>
    <div>
        <table>
          <!-- 여기는 테이블의 제목부분입니다. -->
          <tr>
            <th>번호</th>
            <th>별점</th>
            <th>내용</th>
            <th>구매자</th>
            <th>작성일</th>
            <th>추천수</th>
          </tr>
          <!-- 여기는 테이블의 내용부분입니다.. -->
          <tr>
            <td><input type="text" readonly></td>
            <td>
              5★
            </td>
            <td class="Re1" onclick="togl(this)" style="cursor: pointer;">
              내용은클릭하게 만들었습니다
            </td>
            <td>
              민수
            </td>
            <td>
              2024/02/02
            </td>
            <td>
              답변등록
            </td>
          </tr>
          <tr class="Re1" hidden>
            <td colspan="2" >
              <img src="https://m.sulanjoo.com/web/product/big/sulanjoo_1789.jpg" style="height: 120px;">
            </td>
            <td colspan="2">어릴적 아버지가 자주사다주시던 뻥튀기가 생각이났어요</td>
            <td>2024/02/14</td>
            <td>답변완료</td>
          </tr>
        </table>
      </div>
        </div>
        <div id="QnA"><!--QnA-->
            <h1 style="text-align: center;font-style: initial;">Q&A</h1>
                <div>
        <table>
          <tr>
            <th>번호</th>
            <th>문의종류</th>
            <th>내용</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>상태</th>
          </tr>
          <tr>
            <td><input type="text" readonly></td>
            <td>
              사기
            </td>
            <td class="Moon1" onclick="togl(this)" style="cursor: pointer;">
              내용은클릭하게 만들었습니다
            </td>
            <td>
              민수
            </td>
            <td>
              2024/02/02
            </td>
            <td>
              답변등록
            </td>
          </tr>
          <tr class="Moon1" hidden >
            <td colspan="4" >
              Q.내용은 클릭하게 만들었습니다<br>
              A.안녕하세요 고객님 문의내용 잘 읽었습니다 감사합니다<br>
            </td>
            <td>2024/02/14</td>
            <td>답변완료</td>
          </tr>
          

          <tr>
            <td><input type="text" readonly></td>
            <td>
              사기
            </td>
            <td class="Moon2" onclick="togl(this)" style="cursor: pointer;">
              내용은클릭하게 만들었습니다
            </td>
            <td>
              민수
            </td>
            <td>
              2024/02/02
            </td>
            <td>
              답변등록
            </td>
          </tr>
          <tr class="Moon2" hidden >
            <td colspan="4" >
              Q.내용은 클릭하게 만들었습니다<br>
              A.안녕하세요 고객님 문의내용 잘 읽었습니다 감사합니다<br>
            </td>
            <td>2024/02/14</td>
            <td>답변완료</td>
          </tr>
        </table>
      </div>
        </div>
        <div id="먹태"><!--미정-->
            <h1 style="text-align: center;font-style: initial;">먹태야먹태</h1>
        </div>
    </main>   
</div>
  </main>
</c:forEach>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
    $("#Qone").click(function() {
        $("#Moon").toggle();
    });
    let imgSrc = '<%= request.getAttribute("imgSrc") %>';
});
function togl(TKclass){
  var cla1 = TKclass.className;
  var cla2 = document.getElementsByClassName(cla1)[1];
  $(cla2).toggle();
};
    function count(type)  {
        const resultElement = $('.result');
        let number = resultElement.val();
        if(type === 'plus') {
            number = parseInt(number) + 1;
        }else if(type === 'minus')  {
            number = parseInt(number) - 1;
            if(number<1){return false;}
        }
        resultElement.val(number);
    } /*+ - 버튼눌러 수량을 나타내는 스크립트*/

    function onIMG(){
        var src = $(event.target).attr('src');
        $('.M_img').attr('src',src);
    } /*작은 그림에 마우스 올렸을떄 올린 그림의 링크를 큰그림 링크에 붙여넣는 스크립트*/
    function offIMG(){
        $('.M_img').attr('src','/img/' + imgSrc);
    } /*마우스가 그림에서 떠날때 설정한 기본상품의 그림 초반그림 설정해줘야함*/
    function Juuu(){
    	document.location='/tkorder?img='+$('.M_img').attr('src')+'&goodsName='+$('.goodsName').text()+'&goodsPrice='+$('.goodsPrice').text()+'&goodsSend='+$('.goodsSend').text()+'&result='+$('.result').val();
    }/**/
    function Janggg(){

    }
</script>
</html>
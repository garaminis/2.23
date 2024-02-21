<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
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
  

<c:set var="imgSrc" value="${item.img1}" />
  <main id="main">
    <div id="mainContent">
      <div style="margin-top: 20px; text-align: center; ">
        <div class="img-box" style="display: inline-block;">
          <img class="M_img"style="width: 280px;" src="/img/${itemInfo[0].img1}" alt=""><br>
          <div>
            <img class="S_img1" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${itemInfo[0].img1}" alt="">
            <img class="S_img2" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${itemInfo[0].img1}" alt="">
            <img class="S_img3" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${itemInfo[0].img1}" alt="">
            <img class="S_img4" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${itemInfo[0].img1}" alt="">
            <img class="S_img5" onmouseover="onIMG();" onmouseout="offIMG();"style="width: 40px;" src="/img/${itemInfo[0].img1}" alt="">
          </div>
        </div>
        <form method='get' action="/order" id="goOrder">
        <input type="hidden" style="display:none" id="goodsNumber" name="goodsNumber" value="${itemInfo[0].id}">
         <input type="hidden" style="display:none" id="gPrice" name="goodsPrice" value="">
        <div style="display: inline-block;">
          <table style="font-size: 30px;display: inline-block;">
            <tr><td colspan="2" class="goodsName">${itemInfo[0].title}</td></tr>
            <tr>
              <td>판매가</td>
              <td class="goodsPrice">${itemInfo[0].price}</td>
            </tr>
            <tr>
              <td>배송비</td>
              <td class="goodsSend">${itemInfo[0].pay}</td>
            </tr>
            <tr>
              <td>수량</td>
              <td>
                <input type="text" id="result" name="result" readonly value="1" style="text-align: right;width: 80px;height: 30px;font-size: 30px;">
                <input type="button" style="width: 40px;height: 30px;" onclick='count("plus")' value="+">
                <input type="button" style="width: 40px;height: 30px;" onclick='count("minus")' value="-">
              </td>
            </tr>
          </table>
        </div>
        </form>
        <div style="text-align: right;">
          <input type="button" style="width: 120px;height: 30px;" id="addCart" value="장바구니에담기">
          <input type="button" style="width: 120px;height: 30px;" id="directOrder" value="주문하기">
        </div>
      </div>
      <div id="scrollbar"style="background-color: white; text-align: center; position: sticky; top: 0px; right: 300px;">
        <div>
          <div style="width: 20%; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#mainDIS" class="scroll_bar">상세정보</a></div>
          <div style="width: 20%; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#coment" class="scroll_bar">상품평</a></div>
          <div style="width: 20%; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#QnA" class="scroll_bar">Q&A</a></div>
          <div style="width: 20%; font-size: 35px; line-height: 120px;display: inline-block;"><a href="#change" class="scroll_bar">교환/반품안내</a></div>
        </div>
      </div>
      <div id="mainDIS"><!--상품상세설명-->
        ${itemInfo[0].content}
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
        <h1 style="text-align: left;font-style: initial;">상품평</h1>
        <hr style="width:90%">
        <div>
          <table id="tblReview">
          </table>
        </div>
      </div>
      <div id="QnA"><!--QnA-->
        <h1 style="text-align: left;font-style: initial;">QnA</h1>
        <hr style="width:90%">
        <div>
          <table id="tblQna">
            <tr>
              <th>상태</th>
              <th>내용</th>
              <th>작성자</th>
              <th>작성일</th>
            </tr>
          </table>
        </div>
      </div>
      <div id="change">
        <h1 style="text-align: left;font-style: initial;">교환/반품 안내</h1>
        <hr style="width:90%">
      </div>
      </div>
    </main>

    <footer id="footer">
      <%@ include file="include/footer.jsp" %>
    </footer>
</div>
</body>

<script>
$(document).ready(function() {
	
    let imgSrc = '<%= request.getAttribute("imgSrc") %>';
    getReviwe();
    getQna();
});
let id = '<%=(String)session.getAttribute("id")%>';

$(document).on('click', '.btnQna', function() {
	
    let i = $(this).data('i');
    let content = $('#setAnswer' + i).val();
    let qna_id = $(this).data('qna_id');
    let member_name = $(this).data('member_name');
    let member_id = $(this).data('member_id');
    alert(i)
    $.ajax({
    	type:'post', url:'/setAnswer',
    	data:{id:$('#goodsNumber').val(), content : content, qna_id : qna_id, member_name : member_name, member_id : member_id}, 
    	dataType:'text',
    	success:function(data){
    			$('#tblQna tr.Re1').remove();
    			getQna();
    	}
    })
})
.on('click','.notyet',function(){
	if($(this).find('td:eq(0)').text() == '미답변' && id != 'admin'){
       return false;
	}
	$(this).closest('tr').next('.Re1').toggle();
})


.on('click','#addCart',function(){
	alert(id);
	alert($('#goodsNumber').val());
	alert($('#result').val());
	$.ajax({
		type:'post', url:'/addCart',
		data:{member_id:id, goods_id:$('#goodsNumber').val(), cnt:$('#result').val()},
		dataType:'text',
		success:function(data){
			if(data == 1){
				alert("장바구니에 상품을 담았습니다.")
				let result = confirm("장바구니로 이동하시겠습니까?")
				if(result){
					document.location='/cart'
				} else {
					return false;
				};
			} else {
				alert("이미 같은 상품이 장바구니에 담겨있습니다.")
				return false;
			}
		}
	})
})

.on('click','#directOrder',function(){
	alert($('#goodsNumber').val())
	$('#gPrice').val($('.goodsPrice').text())
	$('#goOrder').submit();
})


function toglReview(TKclass) {
    $(TKclass).closest('tr').next('.Re1').toggle();
}

function count(type)  {
  const resultElement = $('#result');
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
  let src = $(event.target).attr('src');
  $('.M_img').attr('src',src);
} /*작은 그림에 마우스 올렸을떄 올린 그림의 링크를 큰그림 링크에 붙여넣는 스크립트*/

function offIMG(){
  $('.M_img').attr('src','/img/' + imgSrc);
} /*마우스가 그림에서 떠날때 설정한 기본상품의 그림 초반그림 설정해줘야함*/

function Juuu(){
  document.location='/tkorder?img='+$('.M_img').attr('src')+'&goodsName='+$('.goodsName').text()+'&goodsPrice='+$('.goodsPrice').text()+'&goodsSend='+$('.goodsSend').text()+'&result='+$('#result').val();
}/**/



//리뷰 불러오는 함수
function getReviwe() {
	$.ajax({
		type:'post', url:'/getReview',
		data:{id:$('#goodsNumber').val()},
		dataType:'json',
		success:function(data){
			let str = "";
			for(let i = 0; i < data.length; i++) {
	            str += '<tr><td colspan="2">' + data[i].rating + '</td></tr>'
	            + '<tr><td colspan="2">' + data[i].user_id + '/' + data[i].created +'</td></tr>'
	            + '<tr><td class="Re1" onclick="toglReview(this)" style="cursor: pointer;" colspan="2">' + data[i].content +'</td></tr>'
	            + '<tr class="Re1" hidden>'
	            + '  <td>여백</td><td>관리자 답변</td></tr>'
			}
			$('#tblReview').append(str)
		}
	})
}

function getQna() {
	$.ajax({
		type:'post', url:'/getQna',
		data:{id:$('#goodsNumber').val()},
		dataType:'json',
		success:function(data){
			let str = "";
			for(let i = 0; i < data.length; i++) {
				let qna_id = data[i].id;
				let member_name = data[i].qwriter;
				let member_id = data[i].member_id;
	            //str += '<tr class="Re1" onclick="toglQna(this)" style="cursor: pointer;">'
	            str += '<tr class="Re1 notyet"  style="cursor: pointer;">'
	            +  '<td>' + data[i].name +'</td>'
	            +  '<td>'+ data[i].content+ '</td>'
	            +  '<td>'+ member_name +'</td>'
	            +  '<td>' + data[i].qusdate +'</td></tr>'
	            
	            if(data[i].state == '1' && id == 'admin') {
	            		str+=  '<tr class="Re1" hidden>'
			            +  '<td colspan="3"><textarea rows="4" id="setAnswer' + i + '"></textarea></td>'
			            + '<td><button class="btnQna"data-i="' + i + '" data-qna_id="' + qna_id + '" data-member_name="' + member_name + '" data-member_id="' + member_id + '">등록하기</button></td></tr>'
	            } else {
		            str+=  '<tr class="Re1" hidden>'
		            +  '<td></td>'
		            +  '<td>'+ data[i].content +'<br><hr>' + data[i].answer+ '<br></td>'
		            +  '<td>' + data[i].awriter + '</td>'
		            +  '<td>' + data[i].ansdate + '</td></tr>'	
	            }
			}
			$('#tblQna').append(str)
		}
	})
}


//QnA불러오는 함수
</script>
</html>
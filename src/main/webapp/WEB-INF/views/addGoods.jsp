<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link href="/css/thema.css" rel="stylesheet" type="text/css">
</head>
<script src='https://code.jquery.com/jquery-latest.js'></script>
<style>
</style>
<body>
  <nav id="nav" >
      <span id="serchArea" style="padding-left: 150px;width: 20%; ">
        <button id="doSerch" onclick="location.href='/'" style="width: 70%;">어쩌구</button>
    </span>
    <span id="categoryBar" style="width:80%">
        <a href="/상점관리" class="categoryMenu">상점관리</a>
        <a href="/admin" class="categoryMenu">상품관리</a>
        <a href="/adminorder" class="categoryMenu">주문관리</a>
        <a href="memberList" class="categoryMenu">고객관리</a>
        <a href="/계시판관리" class="categoryMenu">계시판관리</a>
        <a href="/통계분석" class="categoryMenu">통계분석</a>
        <button id="doSerch" onclick="location.href='/'">메인페이지</button>
    </span>
</nav>
<input type = hidden name = id id=hiddenid value="">
<table>
   <tr><td>카테고리</td><td>
      <select style="width: 100%" name=category_name id=category_id>
           <option name=category id=category value="1">1번 카테</option>
           <option name=category id=category value="2">2번 카테</option>
           <option name=category id=category value="3">3번 카테</option>
           <option name=category id=category value="4">4번 카테</option>
           <option name=category id=category value="5">5번 카테</option>
           <option name=category id=category value="6">6번 카테</option>
         </select></td></tr>
   <tr><td>노출명</td><td><input type=text name=title id=title></td></tr>
   <tr><td>판매가</td><td><input type=text name=price id=price></td></tr>
   <tr><td>할인</td><td><input type=text name=discnt id=discnt value="0"></td><td><input type=radio name="disradio" class="disradio" value="percent">%<input type=radio name="disradio" class="disradio" value="won">원<input type=radio name="disradio" class="disradio" value="no">할인안함</td></tr>
   <tr><td>총 판매금액</td><td><input type=text name=totalPrice id=totalPrice readonly></td></tr>
   <tr><td>재고수량</td><td><input type=number name=stock id=stock></td></tr>
   <tr><td>배송방법</td>
   <td><input type="radio" name="delivery" id="delivery_paid" value="1">유료배송</td>
   <td><input type="radio" name="delivery" id="delivery_free" value="2">무료배송</td></tr>
   <tr><td>이미지등록 1번 메인이미지</td><td><input type="file" name="img1" id=img1 /></td></tr>
   <tr><td>2번</td><td><input type="file" name="img2" id=img2 /></td></tr>
   <tr><td>3번</td><td><input type="file" name="img3" id=img3 /></td></tr>
   <tr><td>4번</td><td><input type="file" name="img4" id=img4 /></td></tr>
   <tr><td>5번</td><td><input type="file" name="img5" id=img5 /></td></tr>
   <tr><td>상품설명</td><td><textarea id=content></textarea></td></tr>
   <tr><td colspan=2> <button id=btnAdd>등록</button></td>
      <td colspan=2><button id=btnDel>취소</button></td>
   </tr>
</table>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){ //시작하자마자 session안에 goodsid가 들어있으면 상품수정형 없다면 상품추가형
<%
	if(session.getAttribute("goodsid")==null) {
%>
	var goodsid = null;
<% } else { %>
	var goodsid = '<%=session.getAttribute("goodsid")%>';
<% } %>
    console.log('goodsid ['+goodsid+']')
    $('input.disradio[value="no"]').prop('checked', true);
    if(goodsid!=null){
    	$('#hiddenid').val(goodsid);
    	$.ajax({
    		type:'post',
    		url: '/view',
    		data:{goods_id:$('#hiddenid').val()},
    	    dataType : 'json',
    	    error:function(){
    	    	alert('server error')
    	    },
    		success : function(data){
    			let ob = data;
    			let delpay = ob['delpay']
    			if(delpay==1){
    				$('input[id="delivery_paid"]').prop('checked', true)
    			}else if(delpay==2){
    				$('input[id="delivery_free"]').prop('checked', true)
    			}
    			$('#category_id').val(ob['category'])
/*     			$('#img1').val(ob['img1'])
    			$('#img2').val(ob['img2'])
    			$('#img3').val(ob['img3'])
    			$('#img4').val(ob['img4'])
    			$('#img5').val(ob['img5']) */
    			$('#title').val(ob['title'])
    			$('#price').val(ob['price'])
    			$('#stock').val(ob['stock'])
    			$('#content').val(ob['content'])
    			$('#discnt').val(ob['discnt'])
    			$('input[value="percent"]').prop('checked', true) /*확정으로 퍼센트를 넣은거라 수정필요*/
    			discnt()
    			<%session.invalidate();%>
    		}
    	})
    }
})
.on('click','#btnAdd',function(){ //상품추가버튼을 눌렀을때 hidden안에 id값이있으면 그id를 수정 없으면 새로 상품추가
	
	if($('#hiddenid').val()!=null && $('#hiddenid').val()!=''){
		$.ajax({
			type:'post',
			url:'/update',
			data : {goods_id:$('#hiddenid').val(),category_id : $('#category_id option:selected').val(), title : $('#title').val(),discnt : $('#discnt').val(), price : $('#price').val(), stock : $('#stock').val(), delivery : $('input[name=delivery]:checked').val(), img : $('#img').val(),content: $('#content').val()},
			dataType : 'text',
			success : function(data){
				$('#hiddenid, #category_id, #title,#totalPrice,#content,#discnt, #price, #stock, #deliver').val('');
				$('input[id="delivery_paid"]').prop('checked', false)
				$('input[id="delivery_free"]').prop('checked', false)
				$('input[class="disradio"]').prop('checked', false)
				window.location.href = '/admin';//끝나고 상품관리페이지로 가는코드
			}
		})
	} else if ($('#hiddenid').val() == '') {
	    if ($('#title').val() === '') {
	        alert("노출명을 입력해주세요.");
	        return false;
	    }
	    $.ajax({
	        type: 'post',
	        url: '/goodsAdd',
	        data: {
	            category_id: $('#category_id option:selected').val(),
	            title: $('#title').val(),
	            goods: $('#goods').val(),
	            price: $('#price').val(),
	            discnt: $('#discnt').val(),
	            stock: $('#stock').val(),
	            delivery: $('input[name=delivery]:checked').val(),
	            img: $('#img').val(),
	            content: $('#content').val()
	        },
	        dataType: 'text',
	        success: function (data) {
	            if (data === '1') {
	                $('#category_id, #title, #goods, #price, #stock, #deliver, #img, #content').val('');
	            } else {
	                alert('등록 실패');
	            }
	            window.location.href = '/admin'; // 끝나고 상품관리페이지로 가는 코드
	        }
	    })
	}
	return false;

})
.on('click','#btnDel',function(){
	$('#hiddenid, #category_id, #title,#totalPrice,#content,#discnt, #price, #stock, #deliver').val('');
	$('input[id="delivery_paid"]').prop('checked', false)
	$('input[id="delivery_free"]').prop('checked', false)
	$('input[class="disradio"]').prop('checked', false)
})
.on('change', '#price', function () {
	$('#totalPrice').val($('#price').val())
	discnt()
})
.on('change', '#discnt', function () {
	discnt()
})
.on('click','.disradio',function(){
	discnt()
})
function discnt(){ //퍼센트 체크시 총금액에 퍼센트할인금액입력 원 체크시 총금액에 원할인금액 입력
	if($('input[value="percent"]').is(":checked")){
		let a = $('#discnt').val()
		let b = $('#price').val()*(1 - a / 100)
		let c = Math.round(b / 10) * 10;
		$('#totalPrice').val(c)
		return false;
	}else if($('input[value="won"]').is(":checked")){
		let discount = parseFloat($('#discnt').val());
		$('#totalPrice').val($('#price').val()-discount)
		return false;
	}else if($('input[value="no"]').is(":checked")){
		$('#discnt').val('0')
		$('#totalPrice').val($('#price').val())
	}
}
</script>

</html>
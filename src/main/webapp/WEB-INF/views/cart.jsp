<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
<style>
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	section {
	    margin: 20px;
	}
	
	section > div > ul {
	    list-style-type: none;
	}
	
	section > table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	section > table th,
	section > table td {
	    border: 1px solid #ccc;
	    padding: 10px;
	    text-align: center;
	}
	
	section > table input[type="checkbox"] {
	    transform: scale(1.5);
	}
	
	
	section > table img {
	    width: 50px;
	    height: auto;
	}
	
	section > table .price {
	    font-weight: bold;
	}
	
	
	section > div > button {
	    margin-top: 10px;
	    padding: 10px 20px;
	    font-size: 16px;
	    border: none;
	    cursor: pointer;
	    background-color: black;
	    color: whitesmoke;
	}
	
	section > div > button:hover {
	    background-color: black;
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
          <h1 class="middle_top_title"> 장바구니</h1>
          <hr class="middle_top_hr">
    </div>
 <% if (id!=null) { %>   
   <section>
     <table>
       <thead>
           <tr>
               <td><input type="checkbox"></td>
               <td colspan="2">상품정보</td>
               <td>옵션</td>
               <td>상품금액</td>
               <td> </td>
               <td>배송비</td>
           </tr>
       </thead>
       <tbody>
           <tr >
               <td><input type="checkbox"></td>
               <td>
                   <img src="" alt="magic keyboard">
               </td>
               <td>
                   <p>Apple 매직 키보드 - 한국어(MK2A3KH/A)</p>
                   <sapn class="price">
                   개별금액: <input id="sPrice" value=20000 style="border:none">원</sapn>
               </td>
               <td >
                   수량 :  <input type="text" id="amount" value="1" size="1">
                   <input type="button" id=plus value=" + ">
                   <input type="button" id=minus value=" - ">
               </td>
                 <td><input type="text" id="aPrice" style="border:none"></td>
               <td>
                  <button>즉시주문</button><button >삭제</button>
               </td>
               <td>무료</td>
           </tr>
       </tbody>
       <tfoot>
           <tr>
               <td colspan="3"><input type="checkbox"> <button>선택상품 삭제</button>
                   <button >선택상품 찜</button>
               </td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
           </tr>
       </tfoot>
     </table>
     <input id="sum" style="border:none">
        <div>
            <button id=btn_shopping>쇼핑 계속하기</button>
            <button id=btn_delete>전체삭제</button>
            <button id=btn_allorder>선택상품주문</button>
            <button id=btn_order>전체상품주문</button>
        </div>
     
    </section>
<% }   %>  
  </main>
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.ready(function(){
	
})
.on('click','#btn_shopping',function(){
	location.href="/";
})
.on('click','#btn_allorder,#btn_order',function(){
	location.href="/order";
})

.on('click','#plus',function() {    
      var number = $(this).parent().find('input#amount');
      number.val(parseInt(number.val()) + 1);
     
      var sPrice=$('#sPrice').val(); 
      var quantit=number.val();
      $('#aPrice').val(quantit*sPrice);  
      
})
.on('click','#minus',function() {    
    var number = $(this).parent().find('input#amount');
    number.val(parseInt(number.val()) - 1);
    
    var sPrice=$('#sPrice').val(); 
    var quantit=number.val();
    $('#aPrice').val(quantit*sPrice);  
})

/* $("#minus").click(function() {    
    var number = $(this).parent().find('input#amount');
    number.val(parseInt(number.val()) - 1);
}); */

</script>
</body>
</html>
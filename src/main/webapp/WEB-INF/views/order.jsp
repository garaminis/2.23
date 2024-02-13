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
    tr,td {
	border: 1px solid black;
}
table {
	border-collapse:collapse; margin: auto;
}</style>
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
                <div style="height: 500px; text-align: center;">
                    <!--총 정보를 감싼 DIV-->
                    <div style="float:left; width: 45%;height: 100%;">
                        <!--구매자 정보,배송지 정보,결제정보 DIV-->
                        <div>
                            <!--구매자 정보-->
                            <h2>구매자 정보</h2>
                            <table>
                                <tr>
                                    <td>이름</td>
                                    <td><input class="name" type="text" readonly value="${name}"></td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td><input class="mail" type="text" readonly value="${mail}"></td>
                                </tr>
                                <tr>
                                    <td>모바일번호</td>
                                    <td><input class="mobile" type="text" readonly value="${mobile}"></td>
                                </tr>
                                <tr hidden="">
                                    <td>배송지</td>
                                    <td><input class="adress" type="text" readonly value="${adress}"></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <!--배송지 정보DIV-->
                            <h2>배송지 정보</h2>
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
                        <div>
                            <!--결제 정보 DIV-->
                            <h2>결제정보</h2>
                            <table>
                                <tr>
                                    <td>총 상품가격</td>
                                    <td><input type="text" readonly></td>
                                </tr>
                                <tr>
                                    <td>결제방법</td>
                                    <td><input type="radio">계좌이체<input type="radio">신용/체크카드<input type="radio">법인카드<input type="radio">휴대폰<input type="radio">무통장입금</td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div style="float:right; width: 45%;height: 100%;position : relative;">
                        <!--주문목록 총정보DIV-->
                        <div>
                            <!--주문목록 테이블 DIV-->
                            <h2>주문목록</h2>
                            <table>
                                <tr>
                                    <td>이미지칸<img style="height: 120px;" src="${img}" alt=""></td>
                                    <td><a href="">${goodsName}</a></td>
                                    <td>${result}개</td>
                                    <td>${goodsPrice}원</td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <!--총금액,배송비 정보-->
                            <table>
                                <tr>
                                    <td>총금액</td>
                                    <td>${goodsPrice}</td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td>${goodsSend }</td>
                                </tr>
                            </table>
                        </div>
                        <!--이 밑DIV는 결제완료 버튼을 강제로 담긴DIV의 맨아래로 위치하게 한 DIV-->
                        <div style="position : absolute;bottom : 0; font-size: 60px;width: 100%;"><a href="">결제완료</a></div>
                    </div>
                </div>
        </main>
<%} %>  
        <footer id="footer">
            <%@ include file="include/footer.jsp" %>
        </footer>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function() { /*체크표시하면 주문자와 동일한 값 가져오는 함수 */
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
    });
</script>

</html>
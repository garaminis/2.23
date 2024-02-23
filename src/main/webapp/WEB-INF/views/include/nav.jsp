<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<span id="categoryBar">
  <a href="/itemView?id=1" class="categoryMenu" id="1">coffebeans</a>
  <a href="/itemView?id=2" class="categoryMenu" id="2">cup</a>
  <a href="/itemView?id=3" class="categoryMenu" id="3">homecafe</a>
  <a href="/itemView?id=4" class="categoryMenu" id="4">instantcoffee</a>
  <a href="/itemView?id=5" class="categoryMenu" id="5">tea</a>
</span>
<span id="searchArea">
<form method='get' action="/itemView" name="search">
  <input type="text" id="search" name="id" minlength="2" required>&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="submit" id="doSearch" value="Search">
</form>
</span>
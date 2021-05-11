<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='fas fa-home'></i></span> <span>HOME</span>" />
<%@ include file="../common/head.jspf"%>

<form action="../article/list?boardId=${board.id}">
	<input type="hidden" name="boardId" value="${board.id}" />
	<div class="search form-control">
		<input value="${param.searchKeyword}" name="searchKeyword" type="text"
			placeholder="Search or type URL" maxlength="10" />
		<button type="submit" class="searchButton">
			<i class="fa fa-search"></i>
		</button>
	</div>
</form>
<div class="top">
	<a class="hero" href="/">INSTA</a>
</div>
<main>
	<div>
		<span></span>
	</div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
</main>

<%@ include file="../common/foot.jspf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-family: 'Jua', sans-serif; font-size: 20px">
	<div class="container-fluid" style="background-color: rgb(189, 255, 200); border-radius: 5px;">
		<a class="navbar-brand" href="./main"><img src="./img/logo.png"
			height="35px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="./boardlist">게시판</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="./bestBoardList">인기게시판</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="./noticeList">공지사항</a></li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#" 
					tabindex="-1" aria-disabled="true">Disabled</a></li>  -->
			</ul>
			<ul class="navbar-nav me-2-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${sessionScope.m_email ne null}">
						<li class="nav-item"><a class="nav-link active"
							href="./logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link active" href="./userInfo">유저정보</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link active"
							href="./join.jsp">회원가입</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="./login.jsp">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<form method="post" name="search" action="./boardSearch">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option style="text-align: center;" value="b_title" selected="selected">제목</option>
								<option style="text-align: center;" value="m_nickname">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="content" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</nav>
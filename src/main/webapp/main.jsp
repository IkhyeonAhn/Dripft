<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>드립프트 Dripft</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
	<div class="container">
		<div class="panel panel-info" style="width: 45%;">
			<div class="panel-heading">인기게시글</div>
			<table class="table table-primary table-hover"
				style="font-size: 12px; text-align: center;">
				<tbody>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>추천</th>
						<th>비추</th>
						<th>조회수</th>
						<th>닉네임</th>
						<th>댓글수</th>
					</tr>
					<c:forEach items="${bboard}" var="i">
						<tr>
							<td>${i.b_no}</td>
							<td><a href="./boardDetail?b_no=${i.b_no}">${i.b_title}</a></td>
							<td>${i.b_date}</td>
							<td>${i.b_like}</td>
							<td>${i.b_dislike}</td>
							<td>${i.b_viewcount}</td>
							<td>${i.m_nickname}</td>
							<td>${i.totalcomments}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="panel" style="background-color: limegreen; width: 45%;">
			<table class="table" style="font-size: 12px;">
				<c:forEach items="${board}" var="i">
					<tr>
						<td>${i.b_no}</td>
						<td>${i.b_title}</td>
						<td>${i.b_date}</td>
						<td>좋아요 = ${i.b_like}</td>
						<td>${i.b_dislike}</td>
						<td>${i.b_viewcount}</td>
						<td>${i.m_nickname}</td>
						<td>${i.totalcomments}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="panel"
			style="background-color: blue; width: 45%; float: bottom;">
			<table class="table" style="font-size: 12px;">
				<c:forEach items="${notice}" var="i">
					<tr>
						<td>${i.n_no}</td>
						<td>${i.n_title}</td>
						<td>${i.n_date}</td>
						<td>좋아요 = ${i.n_viewcount}</td>
						<td>${i.m_nickname}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
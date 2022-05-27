<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
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
					aria-current="page" href="#">게시판</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">인기게시판</a>
				</li>
				<li class="nav-item"><a class="nav-link active" href="#">공지사항</a>
				</li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#" 
					tabindex="-1" aria-disabled="true">Disabled</a></li>  -->
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
			<ul class="navbar-nav me-2-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" href="#">로그인</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
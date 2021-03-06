<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 비밀번호 재설정</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">
function checkpw() {
	var password = document.getElementById('m_password').value;
	var pw2 = document.getElementById('pw2').value;
	if(password != pw2) {
		alert("비밀번호가 일치하지 않습니다");
		return false;
	} else {
		/* alert("비밀번호가 일치합니다"); */
		return true;
	}
}
function emailCheck() {
	var m_email = $("#m_email").val();
	
	$.ajax({
		url : "./emailCheck",
		type : "POST",
		dataType : "html",
		data : {"m_email" : m_email},
		success : function(result) {
			if (result == 0) {
				alert("해당 등록 된 계정이 없습니다.");
				alert("계정 찾기 페이지로 이동합니다.");
				location.href = './idFind.jsp';
			} else {
				alert("변경되었습니다.");
			}
		},
		error : function() {
			alert("서버가 동작하지 않습니다.");
		}
	});
}
</script>
<style type="text/css">
.content {
    width: 805px;
    min-height: 800px;
    margin: auto;
    margin-top: 100px;
}
.content-header {
    margin-top: 0;
    margin-bottom: 20px;
    color: #6f7275;
}
#content-heade{
	margin-bottom: 15px;
}
h3, .h3 {
    font-size: 24px;
}
h3 {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    margin: auto;
    text-align: center;
}
.form-group {
	margin-bottom: 15px;
}
p {
	margin: 0 0 10px;
}
.panel {
	border-width: 1px;
	border: 1px;
	background-color: #f8f8f8;
	position: absolute;
  	left: 50%;
  	transform: translateX(-50%);
}	
</style>
</head>
<body>
<jsp:include page="nav_main.jsp"></jsp:include>
<div id="create-user" class="content" role="main">
		<h3 id="content-heade">비밀번호 재설정</h3>
			<form name="pwFind"  action="./pwFind" method="post" onsubmit="return emailCheck()">
			<div class="col-sm-8 col-sm-offset-2">
			    <div class="panel panel-default panel-margin-10">
			        <div class="panel-body panel-body-content text-center" style="width: 600px;">
			        <br>
			            <p class="lead">회원정보를 입력해주세요.</p>
			            	<p>회원 가입시 입력하신 이메일과 이름, 전화번호를 입력하신 후,<br> 하단에 비밀번호 설정을 하실 수 있습니다.</p>
			            		<div class="form-group">
			            	    <input type="email" id="m_email" name="m_email" class="form-control form-control-inline text-center" placeholder="이메일" value="" required="required">
			            	    <input type="text" name="m_name" class="form-control form-control-inline text-center" placeholder="이름" value="" required="required">
			            	    <input type="text" name="m_tel" class="form-control form-control-inline text-center" placeholder="전화번호" value="" required="required">
			            	    <input type="password" id="m_password" name="m_password" class="form-control form-control-inline text-center" placeholder="비밀번호" value="" required="required">
			            	    <input type="password" id="pw2" name="pw2" class="form-control form-control-inline text-center" placeholder="비밀번호 확인" value="" required="required" onchange="checkpw()">
			        	    </div>
			    	        <button type="submit" class="btn btn-primary">재설정</button> <a href="/main" class="btn btn-default">메인으로</a>
			    	        <hr>
				        </div>
				    </div>
				</div>
			</form>
		</div>
	<hr>	
</body>
</html>
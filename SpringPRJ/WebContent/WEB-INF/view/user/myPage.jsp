<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Audience Interaction System</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/css/style.css"/>
		
		
		<style>
		
.accordion { width: 100%; position: relative; }
.accordian-chk { 
  width: 100%;
  position: absolute; 
  left: 0px;
  top: 0px;
  height: 40px;
  -webkit-appearance: none;
  -moz-appearance: none;
  -o-appearance: none;
  -khtml-appearance: none;
  appearnace: none;
  cursor: pointer;
  box-sizing: border-box;
  padding: 0 20px;
  z-index: 2;
  margin: 0px;
} 

.accordion h3 { 
  background: #349DE1 none; 
  border: 1px solid #3175c4 !important; 
  position: relative; 
  padding: 10px; 
  color: #fff; 
  font-size: 16px; 
  font-weight: normal; 
  font-family: arial; 
  margin: 0;
  z-index: 1;
}

.accordion h3 .acc-icon { 
  width: 0; 
  height: 0; 
  position: absolute; 
  right: 10px; 
  top: 15px; 
  border-left: 5px solid transparent; 
  border-right: 5px solid transparent; 
  border-top: 5px solid #fff; 
  border-bottom: 5px solid transparent; 
}

.accordion .accordian-chk:checked + h3 > .acc-icon { 
  border-left: 5px solid transparent; 
  border-right: 5px solid transparent; 
  border-bottom: 5px solid #fff; 
  border-top: 5px solid transparent; 
  top: 10px; 
}

.accordion .accordian-chk:checked + h3 + div.accordian-content { 
   opacity: 1;
   -moz-transition-duration: 0.5s;
    -webkit-transition-duration: 0.5s;
    -o-transition-duration: 0.5s;
    transition-duration: 0.5s;
    -moz-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    -webkit-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    -o-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    max-height: 1000px;
    overflow: hidden;
    padding: 15px;
}

.accordian-content { 
   opacity: 0;
    padding: 15px;
    overflow: hidden;
    max-height: 0;
    padding-top: 0;
    padding-bottom: 0;
    margin-top: 0;
    margin-bottom: 0;
    -moz-transition-duration: 0.5s;
    -webkit-transition-duration: 0.5s;
    -o-transition-duration: 0.5s;
    transition-duration: 0.5s;
    -moz-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    -webkit-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    -o-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    border: 1px solid #3175c4;
    margin-bottom: 2px;
}
		</style>
<style>
	.myProfileRes{
		width:70%;
		height:auto;
		position:absolute; 
		background-color:white;
		top:25%;
		left:15%
		}
	.myProfileTitle{
	    position: absolute;
	    top: 20%;
	    -webkit-transform: translateY(-50%);
	    -ms-transform: translateY(-50%);
	    transform: translateY(-50%);
	    left: 15%;
	    right: 0;
		}
		
		
/* 마이페이지 수정창 반응형*/
@media (max-width:767px){
		.myProfileRes{
			width:90%;
			height:auto;
			position:absolute; 
			background-color:white;
			top:25%;
			left:5%
			}
		.myProfileTitle{
		    position: absolute;
		    top: 20%;
		    -webkit-transform: translateY(-50%);
		    -ms-transform: translateY(-50%);
		    transform: translateY(-50%);
		    left: 5%;
		    right: 0;
			}
}


</style>

</head>
<body>
	<%@include file="/WEB-INF/view/headerScript.jsp" %>
	<%@include file="/WEB-INF/view/headerAIS.jsp" %>
		<div class="bg-image bg-parallax overlay" style="background-image:url(/img/home-background.jpg)"></div>
			
			
		<div class="myProfileTitle">
	<h1 style="color:white">My Profile</h1></div>
		<div class="myProfileRes">
		
		<div id="accordion">
  <div class="accordion">
    <input type="radio" name="radacc" class="accordian-chk" checked />
    <h3 class="accordian-header active">
     이메일 및 이름
      <span class="acc-icon"></span>
    </h3>
    <div class="accordian-content" tabindex="2">
<label for="input-email">이메일</label>
    <input  type="text" name="email"/>
 <label for="input-name">이름</label>
    <input type="text"  name="name"/>
    <button style="margin-left:40%;padding-left: 10%;padding-right: 10%" class="btn btn-success">수정</button>
    </div>
  </div>
  <div class="accordion">
    <input type="radio" name="radacc" class="accordian-chk" />
    <h3 class="accordian-header">
      비밀번호 변경
      <span class="acc-icon"></span>
    </h3>
    <div class="accordian-content">
     <label for="input-curPwd">현재 비밀번호</label>
    <input type="password" name="curPwd"/>
 <label for="input-name">변경할 비밀번호</label>
    <input type="password" name="chgPwd"/>
     <label for="input-name">변경할 비밀번호 재입력</label>
    <input type="password" name="chgRePwd"/>
      <button style="margin-left:45%" class="btn btn-success">수정</button>
    </div>
  </div>
  
  <div class="accordion">
    <input type="radio" name="radacc" class="accordian-chk" />
    <h3 class="accordian-header">
      계정삭제
      <span class="acc-icon"></span>
    </h3>
    <div class="accordian-content">
      <p>
     AIS 서비스는 무료로 이용가능한 웹서비스입니다 . 
     <br/>그래도 삭제하시겠습니까?
      </p>
       <button style="margin-left:45%" class="btn btn-danger">삭제</button>
    </div>
  </div>
</div>
		
	</div>
		
		
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/main.js"></script>	
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>

</body>
</html>
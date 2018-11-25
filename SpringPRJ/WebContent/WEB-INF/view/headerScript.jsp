<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<style>
			.search {
			  width: 100%;
			  position: relative
			}
			
			.searchTerm {
			  float: left;
			  width: 100%;
			  border: 3px solid #00B4CC;
			  padding: 5px;
			  height: 20px;
			  border-radius: 5px;
			  outline: none;
			  color: #9DBFAF;
			  background:white;
			}
			
			.searchTerm:focus{
			  color: #00B4CC;
			  background:white;
			}
			
			.searchButton {
			  position: absolute;  
			  right: -50px;
			  width: 40px;
			  height: 36px;
			  border: 1px solid #00B4CC;
			  background: #00B4CC;
			  text-align: center;
			  color: #fff;
			  border-radius: 5px;
			  cursor: pointer;
			  font-size: 20px;
			}
			
			/*Resize the wrap to see the search bar change!*/
			.wrap-search{
		
			  position: absolute;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			}
			
			
					
		</style>

<!-- 로그인 -->
<!-- 로그인 css -->
	<style>
		/*
		 *
		 * login-register modal
		 * Autor: Creative Tim
		 * Web-autor: creative.tim
		 * Web script: http://creative-tim.com
		 * 
		 */
		 
		/*  Shake animation  */
		
		@charset "UTF-8";
		
		.animated {
		  -webkit-animation-duration: 1s;
			   -moz-animation-duration: 1s;
			     -o-animation-duration: 1s;
			        animation-duration: 1s;
			-webkit-animation-fill-mode: both;
			   -moz-animation-fill-mode: both;
			     -o-animation-fill-mode: both;
			        animation-fill-mode: both;
		}
		
		.animated.hinges {
			-webkit-animation-duration: 2s;
			   -moz-animation-duration: 2s;
			     -o-animation-duration: 2s;
			        animation-duration: 2s;
		}
		
		.animated.slow {
			-webkit-animation-duration: 3s;
			   -moz-animation-duration: 3s;
			     -o-animation-duration: 3s;
			        animation-duration: 3s;
		}
		
		.animated.snail {
			-webkit-animation-duration: 4s;
			   -moz-animation-duration: 4s;
			     -o-animation-duration: 4s;
			        animation-duration: 4s;
		}
		
		@-webkit-keyframes shake {
			0%, 100% {-webkit-transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {-webkit-transform: translateX(-10px);}
			20%, 40%, 60%, 80% {-webkit-transform: translateX(10px);}
		}
		
		@-moz-keyframes shake {
			0%, 100% {-moz-transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {-moz-transform: translateX(-10px);}
			20%, 40%, 60%, 80% {-moz-transform: translateX(10px);}
		}
		
		@-o-keyframes shake {
			0%, 100% {-o-transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {-o-transform: translateX(-10px);}
			20%, 40%, 60%, 80% {-o-transform: translateX(10px);}
		}
		
		@keyframes shake {
			0%, 100% {transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {transform: translateX(-10px);}
			20%, 40%, 60%, 80% {transform: translateX(10px);}
		}
		
		.shake {
			-webkit-animation-name: shake;
			-moz-animation-name: shake;
			-o-animation-name: shake;
			animation-name: shake;
		}
		
		.login .modal-dialog{
		   
		}
		.login .modal-footer{
		    border-top: 0;
		    margin-top: 0px;
		    padding: 10px 20px 20px;
		}
		.login .modal-header {
		    border: 0 none;
		    padding: 15px 15px 15px;
		/*     padding: 11px 15px; */
		}
		.login .modal-body{
		/*     background-color: #eeeeee; */
		}
		.login .division {
		    float: none;
		    margin: 0 auto 18px;
		    overflow: hidden;
		    position: relative;
		    text-align: center;
		    width: 100%;
		}
		.login .division .line {
		    border-top: 1px solid #DFDFDF;
		    position: absolute;
		    top: 10px;
		    width: 34%;
		}
		.login .division .line.l {
		    left: 0;
		}
		.login .division .line.r {
		    right: 0;
		}
		.login .division span {
		    color: #424242;
		    font-size: 17px;
		}
		.login .box .social {
		    float: none;
		    margin: 0 auto 30px;
		    text-align: center;
		}
		
		.login .social .circle{
		    background-color: #EEEEEE;
		    color: #FFFFFF;
		    border-radius: 100px;
		    display: inline-block;
		    margin: 0 17px;
		    padding: 15px;
		}
		.login .social .circle .fa{
		    font-size: 16px;
		}
		.login .social .facebook{
		    background-color: #455CA8;
		    color: #FFFFFF;
		}
		.login .social .google{
		    background-color: #F74933;
		}
		.login .social .github{
		    background-color: #403A3A;
		}
		.login .facebook:hover{
		    background-color: #6E83CD;
		}
		.login .google:hover{
		    background-color: #FF7566;
		}
		.login .github:hover{
		    background-color: #4D4D4d;;
		}
		.login .forgot {
		    color: #797979;
		    margin-left: 0;
		    overflow: hidden;
		    text-align: center;
		    width: 100%;
		}
		.login .btn-login, .registerBox .btn-register{
		    background-color: #00BBFF;
		    border-color: #00BBFF;
		    border-width: 0;
		    color: #FFFFFF;
		    display: block;
		    margin: 0 auto;
		    padding: 15px 50px;
		    text-transform: uppercase;
		    width: 100%;
		}
		.login .btn-login:hover, .registerBox .btn-register:hover{
		    background-color: #00A4E4;
		    color: #FFFFFF;
		}
		.login .form-control{
		    border-radius: 3px;
		    background-color: rgba(0, 0, 0, 0.09);
		    box-shadow: 0 1px 0px 0px rgba(0, 0, 0, 0.09) inset;
		    color: #FFFFFF;
		}
		.login .form-control:hover{
		    background-color: rgba(0,0,0,.16);
		}
		.login .form-control:focus{
		    box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.04) inset;
		    background-color: rgba(0,0,0,0.23);
		    color: #FFFFFF;
		}
		.login .box .form input[type="text"], .login .box .form input[type="password"] ,.form input[type="tel"]{
		    border-radius: 3px;
		    border: none;
		    color: #333333;
		    font-size: 16px;
		    height: 46px;
		    margin-bottom: 5px;
		    padding: 13px 12px;
		    width: 100%;
		}
		
		
		@media (max-width:400px){
		    .login .modal-dialog{
		    }
		}
		
		.big-login, .big-register{
		    background-color: #ffffff;
		    color: #FFFFFF;
		    border-radius: 7px;
		    border-width: 2px;
		    font-size: 14px;
		    font-style: normal;
		    font-weight: 200;
		    padding: 16px 60px;
		    text-transform: uppercase;
		    transition: all 0.3s ease 0s;
		}
		.big-login:hover{
		    background-color: #00A4E4;
		    color: #FFFFFF;
		}
		.big-register{
		    background-color: rgba(0,0,0,.0);
		    color: #00bbff;
		    border-color: #00bbff;
		}
		.big-register:hover{
		    border-color: #00A4E4;
		    color:  #00A4E4;
		}
		
		
	</style>
	<script>

		//로그인 ////////////////////////////////
	/* 	function login(){	
			 openLoginModal();
			
			};
			 */
	
		function showLoginForm(){
		    $('#loginModal .registerBox').fadeOut('fast',function(){
		        $('.loginBox').fadeIn('fast');
		        $('.register-footer').fadeOut('fast',function(){
		            $('.login-footer').fadeIn('fast');    
		        });
		        
		       
		    });       
		     $('.error').removeClass('alert alert-danger').html(''); 
		}
	
		function openLoginModal(){
		    showLoginForm();
		    setTimeout(function(){
		        $('#loginModal').modal('show');    
		    }, 230);
		}
		/////////////////////////////////////////////////////
		//회원가입
		function showRegisterForm(){
			 $('#registerModal .registerBox').fadeOut('fast',function(){
			        $('.registerBox').fadeIn('fast');
			        $('.register-footer').fadeOut('fast',function(){
			            $('.login-footer').fadeIn('fast');    
			        });
			        
			       
			    });       
			     $('.error').removeClass('alert alert-danger').html(''); 
		}
		function openRegisterModal(){
		    showRegisterForm();
		    setTimeout(function(){
		        $('#registerModal').modal('show');    
		    }, 230);
		}
		
		////////////////////////////////////////
		//find id email
	
		function openFindModal(){
			showFindForm();
			 setTimeout(function(){
			    $('#findModal').modal('show');    
			    }, 230);
			}
		function showFindForm(){
			 $('#findModal .registerBox').fadeOut('fast',function(){
			        $('.registerBox').fadeIn('fast');
			        $('.register-footer').fadeOut('fast',function(){
			            $('.login-footer').fadeIn('fast');    
			        });
			        
			       
			    });       
			     $('.error').removeClass('alert alert-danger').html(''); 
		}
		///로그아웃
		function logout(){
			alert("로그아웃 하셨습니다.")
			location.href = "/user/logout.do"
		}	
		
		/////////////////////////////////////
		//id찾기 ajax 
		function idFind(){
			var name=$('#idName').val();
			var tel=$('#idTel').val();
			$.ajax({
				url:"/idFind.do",
				method:"post",
				data:{
					"name":name,
					"tel":tel
				},
				success:function(data){
					console.log(data)
				},
				error:function(){
					alert("에러발생")
				}
			})
			
			
		}
		
		
		
	</script>
    
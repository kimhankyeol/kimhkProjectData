<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<%@include file="headerScript.jsp" %>	
	
    </head>
	<body>

	<%@include file="headerAIS.jsp" %>

		<!-- Home -->
		<div id="home" class="hero-area">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay" style="background-image:url(/img/home-background.jpg)"></div>
			<!-- /Backgound Image -->

			<div class="home-wrapper">
				
				<div class="container">

					<div class="row">
						<div class="wrap-search">
							<div class="search">
							<%if ("".equals(email)){ %>
								<div><h2 style="color:white">Join Presentation</h2></div> 
								<input type="text" style="background:white"class="searchTerm"
									placeholder="#코드번호를 입력해주세요">
								<button id="searchPt" type="submit" class="searchButton">
									<i class="fa fa-search"></i>
								</button>
							<%} else { %>
								<div><h2 style="color:white">Create Presentation</h2></div> 
								<a class="main-button icon-button" href="/pt/ptReg.do">발표 방 생성</a>
							<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /Home -->
	<!-- /Call To Action -->

		<!-- Why us -->
		<div id="why-us" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">
					<div class="section-header text-center">
						<h2>Why A.I.S</h2>
						<p class="lead">왜 Audience Interaction System이어야 하는가 ?</p>
					</div>

					<!-- feature -->
					<div class="col-md-4">
						<div class="feature">
							<i class="feature-icon fa fa-flask"></i>
							<div class="feature-content">
								<h4>실시간 질문 </h4>
								<p>청중의 실시간 질문을 통한 궁금증 해소</p>
							</div>
						</div>
					</div>
					<!-- /feature -->

					<!-- feature -->
					<div class="col-md-4">
						<div class="feature">
							<i class="feature-icon fa fa-users"></i>
							<div class="feature-content">
								<h4>설문지 , 투표 작성</h4>
								<p>설문, 투표 작성으로 청중의 의견을 적극 반영</p>
							</div>
						</div>
					</div>
					<!-- /feature -->

					<!-- feature -->
					<div class="col-md-4">
						<div class="feature">
							<i class="feature-icon fa fa-comments"></i>
							<div class="feature-content">
								<h4>빅 데이터 분석</h4>
								<p> 질문, 설문, 투표를 분석하여 청중의 생각을 시각화 </p>
							</div>
						</div>
					</div>
					<!-- /feature -->

				</div>
				<!-- /row -->

		
			</div>
			<!-- /container -->

		</div>
		<!-- /Why us -->

		<!-- Contact CTA -->
		<div id="contact-cta" class="section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay" style="background-image:url(/img/cta2-background.jpg)"></div>
			<!-- Backgound Image -->

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<div class="col-md-8 col-md-offset-2 text-center">
						<h2 class="white-text">Contact Us</h2>
						<p class="lead white-text">Libris vivendo eloquentiam ex ius, nec id splendide abhorreant.</p>
						<a class="main-button icon-button" href="#">Contact Us Now</a>
					</div>

				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /Contact CTA -->

		<!-- Footer -->
		<footer id="footer" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<!-- footer logo -->
					<div class="col-md-6">
						<div class="footer-logo">
							<a class="logo" href="/home.do">
								<img src="/img/logo.png" alt="logo">
							</a>
						</div>
					</div>
					<!-- footer logo -->

				</div>
				<!-- /row -->

				<!-- row -->
				<div id="bottom-footer" class="row">

					<!-- social -->
					<div class="col-md-4 col-md-push-8">
						<ul class="footer-social">
							<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#" class="youtube"><i class="fa fa-youtube"></i></a></li>
							<li><a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
					<!-- /social -->

					<!-- copyright -->
					<div class="col-md-8 col-md-pull-4">
						<div class="footer-copyright">
							<span>&copy; Copyright 2018. All Rights Reserved. | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com">Colorlib</a></span>
						</div>
					</div>
					<!-- /copyright -->

				</div>
				<!-- row -->

			</div>
			<!-- /container -->

		</footer>
		<!-- /Footer -->

		<!-- preloader -->
		<div id='preloader'><div class='preloader'></div></div>
		<!-- /preloader -->


		<!-- jQuery Plugins -->
		<script type="text/javascript" src="/js/jquery.min.js"></script>
		<script type="text/javascript" src="/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/main.js"></script>
		


		<!-- 로그인 모달 -->
		<div class="container">
				 <div class="modal fade login" id="loginModal">
				      <div class="modal-dialog login animated">
		    		      <div class="modal-content">
		    		         <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">Login with</h4>
		                    </div>
		                    <div class="modal-body">  
		                        <div class="box">
		                             <div class="content">
		                                <div class="social">
		                                    <a class="circle github" href="/auth/github">
		                                        <i class="fa fa-github fa-fw"></i>
		                                    </a>
		                                    <a id="google_login" class="circle google" href="/auth/google_oauth2">
		                                        <i class="fa fa-google-plus fa-fw"></i>
		                                    </a>
		                                    <a id="facebook_login" class="circle facebook" href="/auth/facebook">
		                                        <i class="fa fa-facebook fa-fw"></i>
		                                    </a>
		                                </div>
		                                <div class="division">
		                                    <div class="line l"></div>
		                                      <span>or</span>
		                                    <div class="line r"></div>
		                                </div>
		                                <div class="error"></div>
		                       			<!-- 로그인 -->
		                    
		                                <div class="form loginBox">
		                                    <form method="post" action="/user/loginProc.do" >
		                                    <input  class="form-control" type="text" placeholder="Email" name="email">
		                                    <input  class="form-control" type="password" placeholder="Password" name="password">
		                                  <input type="submit" class="btn btn-primary" value="로그인" />
		                                    </form>
		                                </div>
		                            
		                             </div>
		                        </div>
		                       
		                    </div>
		                    <div class="modal-footer">
		                        <div class="forgot login-footer">
		                            <span>Looking to 
		                                 <a href="javascript: showRegisterForm();">create an account</a>
		                            ?</span>
		                        </div>
		                        <div class="forgot register-footer" style="display:none">
		                             <span>Already have an account?</span>
		                             <a href="javascript: showLoginForm();">Login</a>
		                        </div>
		                    </div>        
		    		      </div>
				      </div>
				  </div>
		    </div>
			<!--  -->
			<!-- 회원가입 -->
			<div class="container">
				 <div class="modal fade login" id="registerModal">
				      <div class="modal-dialog login animated">
		    		      <div class="modal-content">
		    		         <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">Register with</h4>
		                    </div>
		                    <div class="modal-body">  
		                        <div class="box">
		                             <div class="content">
		                                <div class="social">
		                                    <a class="circle github" href="/auth/github">
		                                        <i class="fa fa-github fa-fw"></i>
		                                    </a>
		                                    <a id="google_login" class="circle google" href="/auth/google_oauth2">
		                                        <i class="fa fa-google-plus fa-fw"></i>
		                                    </a>
		                                    <a id="facebook_login" class="circle facebook" href="/auth/facebook">
		                                        <i class="fa fa-facebook fa-fw"></i>
		                                    </a>
		                                </div>
		                                <div class="division">
		                                    <div class="line l"></div>
		                                      <span>or</span>
		                                    <div class="line r"></div>
		                                </div>
		                                <div class="error"></div>
		                       			<!-- 회원가입 -->
		                    
		                                <div class="form RegisterBox">
		                                    <form method="post"  action="/user/userRegProc.do">
		                                    
		                                   <input class="form-control" type="text" placeholder="이메일" id="email" name="email"> 
		                                   <input type="button" class="btn btn-success" value="이메일 중복체크" id="emailCk" />
		                                    <input class="form-control" type="password" placeholder="비밀번호" id="password" name="password">
		                                    <font id="length" size="2" color="red">8자리 이상 20자리 이하의 [영문 + 숫자] 조합</font>
		                                    <input class="form-control" type="password" placeholder="비밀번호 재입력" id="repassword" name="repassword"/>
		                                    <font id="check" size="2" color="red"></font>
		                                    <input class="form-control" type="text" placeholder="이름" id="name" name="name"/>
		                                    <input class="form-control" type="text" placeholder="전화번호 입력" id="tel" name="tel"> 
		                                  	<input type="submit"  id="userRegForm" class="btn btn-primary" value="회원가입" />
		                                    </form>
		                                </div>
		                            
		                             </div>
		                        </div>
		                    </div>
		    		      </div>
				      </div>
				  </div>
		    </div>
		    <!-- 이메일이 중복이면  유효성 검사를 통해 안넘어가게 -->
								<input type="hidden" id="conf"value="0"/>
		<%@include file="/WEB-INF/view/user/userScript.jsp" %>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<%@page import="poly.util.CmmUtil"%>
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
		                                	<!-- 카카오 로그인 시작 -->
		                                	<div class="col-sm-12 text-center">
		                                		<a id = "kakao-login-btn"></a>
		                                	</div>
		                                	<script type='text/javascript'>
		                                	//<![CDATA[
		            						// 사용할 앱의 JavaScript 키를 설정해 주세요.
		            						Kakao.init('dfe82cc3269d1711faf54135539438a7');
		            						var kId = '';
		            						var kName = '';
		            						// 카카오 로그인 버튼을 생성합니다.
		            						Kakao.Auth.createLoginButton({
		            							container : '#kakao-login-btn',
		            							success : function(authObj) {
		            								// 로그인 성공시, API를 호출합니다.
		            								Kakao.API.request({
		            									url: '/v2/user/me',
		            									success: function(res){
		            										alert(JSON.stringify(res));
		            										kId = JSON.stringify(res.id);
		            										kName = JSON.stringify(res.properties.nickname);
		            										console.log(" res.id : " +JSON.stringify(res.id));
		            										console.log(" res.properties.nickname : " + JSON.stringify(res.properties.nickname));
		            										console.log(" kId : " + JSON.stringify(res.id));
		            										console.log(" kName : " + JSON.stringify(res.properties.nickname));
		            										location.href='/kakaoCallback.do?kId='+kId+'&kName='+kName;
		            									},
		            									fail: function(error){
		            										alert(JSON.stringify(error));
		            									}
		            								});
		            								alert(JSON.stringify(authObj));
		            							},
		            							fail : function(err) {
		            								alert(JSON.stringify(err));
		            							}
		            						});
		            						//]]>
											</script>
		                                	<!-- 카카오 로그인 끝 -->
		                                    <!-- <a class="circle github" href="/auth/github">
		                                        <i class="fa fa-github fa-fw"></i>
		                                    </a>
		                                    <a id="google_login" class="circle google" href="/auth/google_oauth2">
		                                        <i class="fa fa-google-plus fa-fw"></i>
		                                    </a>
		                                    <a id="facebook_login" class="circle facebook" href="/auth/facebook">
		                                        <i class="fa fa-facebook fa-fw"></i>
		                                    </a> -->
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
		    <!-- 아이디 중복체크 확인하는 변수 -->
		    <input type="hidden" id="conf" value="0"/>
		    
		    <!-- 아이디 찾기/ 비밀번호 찾기 -->
		    	<div class="container">
				 <div class="modal fade login" id="findModal">
				      <div class="modal-dialog login animated">
		    		      <div class="modal-content">
		    		         <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">ID/PW FIND</h4>
		                    </div>
		                    <div class="modal-body">  
		                        <div class="box">
		                             <div class="content">
		                               <!-- 아이디 찾기 --> 
		                                 <div class="division">
		                                    <div class="line l"></div>
		                                      <span>아이디 찾기</span>
		                                    <div class="line r"></div>
		                                </div>
		                                <!--  1번 방법 그냥 ajax 를 쓰는 것 2번 form에다가 담아서 ajax form  -->
		                                
		                             
		                                <div class="form loginBox">
		                                    <input  class="form-control" type="text" placeholder="이름을 입력하세요" id="idName">
		                                    <input  class="form-control" type="text" placeholder="전화번호" id="idTel">
			                                <a type="button" class="btn btn-primary" onclick="javascript:idFind()" >아이디 찾기</a>
		                                </div>
		                            
		                                <!--비밀번호 찾기  -->
		                                <div class="division">
		                                    <div class="line l"></div>
		                                      <span>비밀번호 찾기</span>
		                                    <div class="line r"></div>
		                                </div>
		                    
		                                <div class="form loginBox">
		                                    <input  class="form-control" type="text" placeholder="이메일을 입력하세요" id="pwEmail">
		                                    <input  class="form-control" type="text" placeholder="이름을 입력하세요" id="pwName">
		                                    <input  class="form-control" type="text" placeholder="전화번호" id="pwTel">
			                                 <a type="button" class="btn btn-primary" onclick="javascript:pwFind()" >비밀번호 찾기</a>
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
	
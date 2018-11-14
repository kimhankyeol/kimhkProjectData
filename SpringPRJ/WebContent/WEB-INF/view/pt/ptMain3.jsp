<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AIS-PTMAIN</title>
<!-- <script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css"/> -->
<link rel="stylesheet" href="/css/custom.css" />
<%@include file="/WEB-INF/view/headerScript.jsp" %>	
</head>
<body >
	<%@include file="/WEB-INF/view/headerPTAIS.jsp" %>
		<div class="container bootstrap snippet" style="margin-top:20%">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4 style="color:white">
								<i class="fa fa-circle text-green"></i>
							     질문
								</h4> 
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow-y:auto; width:auto; height:100%;">
								<!-- 상단 -->
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">날짜</p>
									</div>
								</div>
	<!-- 							본문
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="/img/new_logo.png"/>
											</a>
											<div class="media-body">
												이름
												<h4 class="media-heading">김한결
													<span class="small pull-right">오전 12:13</span>
												</h4>
											</div>
											내용
											<p>안녕하세요</p>											
										</div>
									</div>
								</div>
								<hr />
										본문
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="/img/new_logo.png"/>
											</a>
											<div class="media-body">
												이름
												<h4 class="media-heading">김한결2
													<span class="small pull-right">오전 12:23</span>
												</h4>
											</div>
											내용
											<p>안녕하세요</p>											
										</div>
									</div>
								</div>
								<hr /> -->
							</div>
							<!-- 내용 입력 -->
							<form action="">
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height:40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20"/>
									</div>
								</div>
								<div class="row" style="height:90px">
									<div class="form-group col-xs-8">
										<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요"  maxlength="100">
										</textarea>
									</div>
									<div class="form-group col-xs-4">
										<button type="button" class="btn btn-default pull-rigth">전송</button>
										<div class="clearfix"></div>
									</div>
								
								</div>
							</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery Plugins -->
		<script type="text/javascript" src="/js/jquery.min.js"></script>
		<script type="text/javascript" src="/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/main.js"></script>
		<script type="text/javascript" src="/js/userValid.js"></script>
			<%@include file="/WEB-INF/view/footerLoginRegModal.jsp" %>
</body>
</html>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = CmmUtil.nvl((String) session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));
%>

<!-- Header -->
		<header id="header" class="transparent-nav">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<a class="logo" href="/home.do">
							<img src="/img/logo.png" alt="logo">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Mobile toggle -->
					<button class="navbar-toggle">
						<span></span>
					</button>
					<!-- /Mobile toggle -->
				</div>

				<!-- Navigation -->
				<nav id="nav">	
					<ul class="main-menu nav navbar-nav navbar-right">
						<%if ("".equals(email)) {%>
							<li><a href="/home.do">Home</a></li>
							<li><a data-toggle="modal"onclick="openLoginModal();">Login</a></li>
							<li><a data-toggle="modal" onclick="openFindModal();" >아이디 찾기/비밀번호 찾기</a></li>
							<li><a data-toggle="modal"onclick="openRegisterModal();">회원가입</a></li> 
						<%} else { %>
							<li><a>Home</a></li>
							<li><a>마이페이지</a></li>
							<li><a href="/pt/ptManagement.do?userNo=<%=userNo%>">발표관리</a></li>
							<li><a><%=name %>님 안녕하세요</a> </li>
							<li><a onclick="logout()">로그아웃</a></li>
						<%} %>
					</ul>
				</nav>
				<!-- /Navigation -->

			</div>
		</header>
		<!-- /Header -->
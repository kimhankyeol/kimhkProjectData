<%@page import="poly.util.CmmUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="poly.util.DateUtil"%>
<%@page import="poly.dto.PreFileDTO"%>
<%@page import="poly.dto.ManagePresentationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ManagePresentationDTO mpDTO = (ManagePresentationDTO) request.getAttribute("mpDTO");
   PreFileDTO pfDTO = (PreFileDTO)request.getAttribute("pfDTO");
  
	String email = CmmUtil.nvl((String) session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));

%>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AIS - 청중</title>

    <!-- Bootstrap Core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- custom css question -->
    <link rel="stylesheet" href="/css/custom.css" />

  
</head>
<body>

    <div id="wrapper"  class="in">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Audience Interaction System</a>
            </div>
       

            <div class="navbar-default sidebar in" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                   <!--  클릭안해도 전체조회 -->
                   <!-- 첫번쨰거 클릭 ajax 전체 질문 조회 -->
                        <li>
                            <a href="/pt/ptManagement.do" class="active"><i class="fa fa-question-circle-o fa-fw"></i> 질문</a>
                        </li>
                         <li>
                            <a href="form.html"><i class="fa fa-clipboard  fa-fw"></i> 투표/ 설문</a>
                        </li>
                        <% if(mpDTO.getRegNo().toString().equals(userNo)){ %>
                         <li>
                            <a href="form.html"><i class="fa fa-registered  fa-fw"></i>투표 / 설문 등록</a>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	
        <div id="page-wrapper" style="min-height: 651px;">
			<!-- 설문지 들어갈 자리 -->
    </div>
 </div>
    
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/vendor/raphael/raphael.min.js"></script>
    <script src="/vendor/morrisjs/morris.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>
    <!-- ajax form -->
    <script src="/js/jquery.form.min.js"></script>
	
	<!-- 전송 누르면 질문 전송 -->
	<script>
		function questionForm(){
			var cont="";
			$('#questionForm').ajaxForm({
				beforeSubmit: function(){
					
				},
				success:function(data){
					console.log(data);
					$.each(data,function(key,value){
						cont+='<div class="row">';
						cont+='<div class="col-lg-12">';
						cont+='<div class="media">';
						cont+='<a class="pull-left" href="#">';	
						cont+='<img class="media-object img-circle" src="/img/new_logo.png"/>';	
						cont+='</a>';	
						cont+='<div class="media-body">';	
						cont+='이름';
						cont+='<h4 class="media-heading">';
						cont+=value.cid;	
						cont+='<span class="small pull-right">'+value.regDate+'</span>';	
						cont+='</h4>';
						cont+='</div>';
						cont+='<p>'+value.questionContent+'</p>';
						cont+='</div>';
						cont+='</div>';
						cont+='</div>';
						cont+='<hr />';
					})
					$('#questionText').html(cont);
				},
				error:function(){
					
				}
			}).submit();
		};
	
	</script>
	<!-- 질문 전체 조회 -->
	<script>
 	$(function(){
		var cont="";
		$.ajax({
			url:'/pt/questionAllForm.do',
			method:'post',
			data:{
				'manageCode':'<%=mpDTO.getManageCode()%>'
			},
			success:function(data){
				console.log(data);
				$.each(data,function(key,value){
					cont+='<div class="row">';
					cont+='<div class="col-lg-12">';
					cont+='<div class="media">';
					cont+='<a class="pull-left" href="#">';	
					cont+='<img class="media-object img-circle" src="/img/new_logo.png"/>';	
					cont+='</a>';	
					cont+='<div class="media-body">';	
					cont+='이름';
					cont+='<h4 class="media-heading">';
					cont+=value.cid;	
					cont+='<span class="small pull-right">'+value.regDate+'</span>';	
					cont+='</h4>';
					cont+='</div>';
					cont+='<p>'+value.questionContent+'</p>';
					cont+='</div>';
					cont+='</div>';
					cont+='</div>';
					cont+='<hr />';
				})
				$('#questionText').html(cont);
			},
			error:function(){
				alert('에러');
			}
		})
	});
<%--  setInterval(function questionAll(){
		var cont="";
		$.ajax({
			url:'/pt/questionAllForm.do',
			method:'post',
			data:{
				'manageCode':'<%=mpDTO.getManageCode()%>'
			},
			success:function(data){
				console.log(data);
				$.each(data,function(key,value){
					cont+='<div class="row">';
					cont+='<div class="col-lg-12">';
					cont+='<div class="media">';
					cont+='<a class="pull-left" href="#">';	
					cont+='<img class="media-object img-circle" src="/img/new_logo.png"/>';	
					cont+='</a>';	
					cont+='<div class="media-body">';	
					cont+='이름';
					cont+='<h4 class="media-heading">';
					cont+=value.cid;	
					cont+='<span class="small pull-right">'+value.regDate+'</span>';	
					cont+='</h4>';
					cont+='</div>';
					cont+='<p>'+value.questionContent+'</p>';
					cont+='</div>';
					cont+='</div>';
					cont+='</div>';
					cont+='<hr />';
				})
				$('#questionText').html(cont);
			},
			error:function(){
				alert('에러');
			}
		})
	},1000); --%>
	/* setInterval(
	,1000); */
	
	
	</script>
	


</body>
</html>
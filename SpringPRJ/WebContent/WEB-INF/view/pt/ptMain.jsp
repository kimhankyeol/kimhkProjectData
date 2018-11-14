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
                    <ul class="nav in tabs" id="side-menu">
                   <!--  클릭안해도 전체조회 -->
                   <!-- 첫번쨰거 클릭 ajax 전체 질문 조회 -->
                        <li>
                            <a href="/ptMain.do?ptCode=<%=mpDTO.getManageCode() %>" class="tablinks active" onclick="openTab(event, 'tab3')"><i class="fa fa-question-circle-o fa-fw"></i> 질문</a>
                        </li>
                         <li>
                           <a class="tablinks" onclick="openTab(event, 'tab1')" style="cursor:pointer"><i class="fa fa-clipboard  fa-fw"></i>투표/ 설문</a>
                        </li>
                        <% if(mpDTO.getRegNo().toString().equals(userNo)){ %>
                         <li>
                            <a class="tablinks" onclick="openTab(event, 'tab2')" style="cursor:pointer"><i class="fa fa-registered  fa-fw"></i>투표 / 설문 등록</a>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		 
		    	<!--tab -->
		    		<div id="tab3" class="tabcontent">
			           <div id="page-wrapper"  style="min-height: 651px;">
			        
			            <div class="row">
			                <div class="col-lg-12">
			                    <h4 class="page-header"> 코드번호:<%=mpDTO.getManageCode()%> </h4>
			                    <h4 class="page-header"> 발표 제목:<%=mpDTO.getManageTitle()%></h4>
			                    <h4 class="page-header"> 방 생성 일자:<%=DateUtil.DateFormatter(mpDTO.getRegDate().toString())%></h4>
			                </div>
			                <!-- /.col-lg-12 -->
			            </div>
			            
			            
			            <!-- /.row -->
			            <div class="row">
			            		<div class="container bootstrap snippet" >
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
										<div class="portlet-body chat-widget" style="overflow-y:auto; width:auto; height:50%;">
											<!-- 상단 -->
											<div class="row">
												<div class="col-lg-12">
													<p class="text-center text-muted small">날짜</p>
												</div>
											</div>
											<div id="questionText"></div>
												
										</div>
									</div>
									<form id="questionForm" action="/pt/questionForm.do">
										<div class="portlet-footer">
											<div class="row">
											<!-- 로그인 하면 이름 주고 없으면 익명 이나 원하는 이름 -->
											<%if("".equals(email)){ %>
												<div class="form-group col-xs-4">
													<input style="height:40px;" type="text" id="chatName" name="chatName" class="form-control"  placeholder="이름 입력 없을 시 익명으로 올라갑니다." maxlength="20"/>
												</div>
											<%}else{ %>
												<div class="form-group col-xs-4">
													<input style="height:40px;" type="text" id="chatName"  name="chatName" class="form-control" value="<%=name%>" placeholder="<%=name%>" maxlength="20"/>
												</div>
											<%} %>	
											</div>
											<div class="row" style="height:90px">
												<div class="form-group col-xs-8">
													<textarea style="height:80px;" id="questionContent" name="questionContent" class="form-control" placeholder="메시지를 입력하세요"  maxlength="100"></textarea>
												</div>
												<div class="form-group col-xs-4">
													<a href="javascript:questionForm()" class="btn btn-default pull-rigth">전송</a>
													<div class="clearfix"></div>
												</div>
											
											</div>
										</div>
										<input type="hidden" name="manageCode"  value="<%=mpDTO.getManageCode()%>"/>
										</form>
								</div>
							</div>
						</div>
					</div>
			         
			            <!-- /.row -->
			        </div>
			        <!-- /#page-wrapper -->
			    </div>
			 </div>
		<!-- tab1 -->
		<div id="tab1" class="tabcontent" style="display:none">
		     <div id="page-wrapper"  style="min-height: 651px;">
		     김한결
		     </div>
		</div>
		<!-- tab2 -->
		<div id="tab2" class="tabcontent" style="display:none">
			  <div id="page-wrapper2"  style="min-height: 651px;">
				<!-- <div style="width:50%; float:left">
					<a class="tablns active" onclick="surveyInsertTab(event, 'tabSurvey')" style=";cursor:pointer"><h3><i class="fa fa-clipboard  fa-fw"></i>설문지 등록</h3></a>
				</div>
				<div style="width:50%; float:left">     	
			     	<a class="tablns" onclick="surveyInsertTab(event, 'tabVote')" style=" cursor:pointer"><h3><i class="fa fa-clipboard  fa-fw"></i>투표 등록</h3></a>
		   		</div>
		     	<div id="tabSurvey" class="tabcont" >
		     	김한결
		     	</div>
		     	<div id="tabVote" class="tabcont" style="display:none">
		     	김한결2
		     	</div> -->
					     	<!--  탭  구성 상단 -->
					<ul class="nav nav-tabs">
						<li class="active" style="width: 50%;" ><a data-toggle="tab" href="#tabSurvey" aria-expanded="true"  style="text-align:center"><h4>설문지 등록</h4></a></li>
						<li style="width: 50%;"><a data-toggle="tab" href="#tabVote" aria-expanded="false"style="text-align:center"><h4>투표 등록</h4></a></li>
					</ul>
					<div class="tab-content">
						<div id="tabSurvey" class="tab-pane in active">
						제목: <input type="text" placeholder="설문 제목을 입력해 주세요"/>
						성별:
						</div>
						<div id="tabVote" class="tab-pane">
						김한결 2
						</div>
					</div>
		     </div>
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


<!-- 좌측 탭  -->
<script>
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");

    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>

<!-- 설문 추가 삭제 -->

<script>

$(document).ready(function(){ 
	  $("ol").on("click", ".remove", function(){
	    $(this).parent().remove();
	  });
	  $("#add").on("click", function(){
	    $("ol").append("<li><span>List element</span><button type='button' class='remove'><i class='fa fa-trash fa-2x'></i></button></li>");  
	  });
	});

</script>
</body>
</html>
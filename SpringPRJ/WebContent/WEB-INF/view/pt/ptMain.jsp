<%@page import="poly.dto.QuestionDTO"%>
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
    
    <style>
    /* 성별 버튼*/
    .switch-field {
  font-family: "Lucida Grande", Tahoma, Verdana, sans-serif;
	overflow: hidden;
}


.switch-field input {
    position: absolute !important;
    clip: rect(0, 0, 0, 0);
    height: 1px;
    width: 1px;
    border: 0;
    overflow: hidden;
}

.switch-field label {
  float: left;
}

.switch-field label {
  display: inline-block;
  width: 50%;
  background-color: #e4e4e4;
  color: rgba(0, 0, 0, 0.6);
  font-size: 14px;
  font-weight: normal;
  text-align: center;
  text-shadow: none;
  padding: 6px 14px;
  border: 1px solid rgba(0, 0, 0, 0.2);
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
  -webkit-transition: all 0.1s ease-in-out;
  -moz-transition:    all 0.1s ease-in-out;
  -ms-transition:     all 0.1s ease-in-out;
  -o-transition:      all 0.1s ease-in-out;
  transition:         all 0.1s ease-in-out;
}

.switch-field label:hover {
	cursor: pointer;
}

.switch-field input:checked + label {
  background-color: #A5DC86;
  -webkit-box-shadow: none;
  box-shadow: none;
}

.switch-field label:first-of-type {
  border-radius: 4px 0 0 4px;
}

.switch-field label:last-of-type {
  border-radius: 0 4px 4px 0;
}

/*연령별 버튼*/
    .switch-field2 {
  font-family: "Lucida Grande", Tahoma, Verdana, sans-serif;
	overflow: hidden;
}


.switch-field2 input {
    position: absolute !important;
    clip: rect(0, 0, 0, 0);
    height: 1px;
    width: 1px;
    border: 0;
    overflow: hidden;
}

.switch-field2 label {
  float: left;
}

.switch-field2 label {
  display: inline-block;
  width: 20%;
  background-color: #e4e4e4;
  color: rgba(0, 0, 0, 0.6);
  font-size: 14px;
  font-weight: normal;
  text-align: center;
  text-shadow: none;
  padding: 6px 14px;
  border: 1px solid rgba(0, 0, 0, 0.2);
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
  -webkit-transition: all 0.1s ease-in-out;
  -moz-transition:    all 0.1s ease-in-out;
  -ms-transition:     all 0.1s ease-in-out;
  -o-transition:      all 0.1s ease-in-out;
  transition:         all 0.1s ease-in-out;
}

.switch-field2 label:hover {
	cursor: pointer;
}

.switch-field2 input:checked + label {
  background-color: #A5DC86;
  -webkit-box-shadow: none;
  box-shadow: none;
}

.switch-field2 label:first-of-type {
  border-radius: 4px 0 0 4px;
}

.switch-field2 label:last-of-type {
  border-radius: 0 4px 4px 0;
}
//////////////

.colorR{
color:red;
}
.colorG{
color:green;
}
/*pdf*/
.pdfobject-container {
   width: 100%;
   height: 50%;
}
    
    </style>
 
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
                            <a class="tablinks active" onclick="openTab(event, 'tab3')"><i class="fa fa-question-circle-o fa-fw"></i> 질문</a>
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
			                <div class="col-lg-12" id="cont1">
			                    <h4 class="page-header"> 코드번호:<%=mpDTO.getManageCode()%> </h4>
			                    <h4 class="page-header"> 발표 제목:<%=mpDTO.getManageTitle()%></h4>
			                    <h4 class="page-header"> 방 생성 일자:<%=DateUtil.DateFormatter(mpDTO.getRegDate().toString())%></h4>
			                </div>
			                <!-- /.col-lg-12 -->
			            </div>
				<!-- pdf view -->	
						<div id="embed"></div>
						<script src="/js/pdfobject.js"></script>
						<script>
						var fileName='<%=pfDTO.getFileOrgName()%>';
						var email='<%=mpDTO.getEmail()%>';
						var options = {
								   width: "100%",
								   height: "100%",
								   page:"1"
								};
						//PDFObject.embed("C:/Users/data12/git/SpringPRJ/WebContent/presentationPDF/docs.pdf","#embed",options);
						PDFObject.embed("/presentationPDF/"+email+"/"+fileName,"#embed",options);
						</script>
			    
			        <div id="ajaxView" style="margin-top:15px">
			            <!-- /.row -->
			            <div class="row">
			            		<div class="bootstrap snippet" >
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
									<div id="cont2">
										<form id="questionForm" action="/pt/questionForm.do">
											<div class="portlet-footer" >
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
					</div>
			         
			            <!-- /.row -->
			        </div>
			  	</div>	
			        <!-- /#page-wrapper -->
			    </div>
			 </div>
	 
		
		<!-- tab1 -->
		<div id="tab1" class="tabcontent" style="display:none">
		     <div id="page-wrapper3"  style="min-height: 651px;">
		     		<ul class="nav nav-tabs">
		     		<!-- class="tabSurveyAud" -->
						<li class="active" style="width: 50%;"><a data-toggle="tab"   id="tabSurveyAud"  href="#tabSurveyReg"  aria-expanded="true"  style="text-align:center"><h4>설문지 작성</h4></a></li>
						<li style="width: 50%;" ><a data-toggle="tab"  id="tabVoteAud" href="#tabVoteReg" aria-expanded="false"style="text-align:center"><h4>투표 작성</h4></a></li>
					</ul>
		     		<div class="tab-content">
		     			<div id="tabSurveyReg" class="tab-pane in active">
		     					<div id="viewSurvey">설문지가 등록 되지 않았습니다.</div>
		     			</div>
		     			<div id="tabVoteReg" class="tab-pane">
		     				<div id="viewVote">투표가 등록 되지 않았습니다.</div>
		     			</div>
		     		</div> 
		     </div>
		</div>
		<!-- tab2 -->
		<div id="tab2" class="tabcontent" style="display:none">
			  <div id="page-wrapper2"  style="min-height: 651px;">
			
					<ul class="nav nav-tabs">
						<li class="active" style="width: 50%;" ><a data-toggle="tab" href="#tabSurvey" aria-expanded="true"  style="text-align:center"><h4>설문지 등록</h4></a></li>
						<li style="width: 50%;"><a data-toggle="tab" href="#tabVote" aria-expanded="false"style="text-align:center"><h4>투표 등록</h4></a></li>
					</ul>
					<div class="tab-content">
					<!-- 설문지 optNo = 1 -->
					<div id="tabSurvey" class="tab-pane in active">
					<form id="surveyForm" action="/pt/surveyInsert.do"  method="post">
						
							<div class="form-group">
								<label for="surveyTitle"><b style="color:red">*</b> 설문지 제목</label>
							</div>
							<div class="form-group">
        						<input type="text" id="surveyTitle" name="surveyTitle" class="form-control"  placeholder="설문지 제목을 입력해주세요">
							</div>
								<div class="form-group">
									<label for="surveyQuestion" style="width:50%"><b style="color:red">*</b> 설문지 질문 </label>
								</div>
							<div id="questionList">
	        					<div class="form-group">
	        						<input type="text" name="surveyQuestion" class="form-control surveyQuestion" placeholder="설문지 질문을 입력해주세요">
	        					</div>
	        				</div>
					
	        					<div style="width:50%;float:left">
	        						<div onclick="javascript:questionAdd()" class="btn btn-primary" style="cursor:pointer;width:92.5%;margin-left:5%;margin-right:2.5%;;margin-bottom:15px">질문 추가</div>
	        					</div>
	        					<div style="width:50%;float:left">
	        						 <div onclick="javascript:questionDel()" class="btn btn-danger" style="width:92.5%;margin-left:2.5%;margin-right:5%;;margin-bottom:15px">질문 삭제</div>
	        					</div>
	        					
	        					<input type="hidden" name="manageCode"  id="manageCode" value="<%=mpDTO.getManageCode()%>"/>
								<input type="hidden" name="surveyRegister"  value="<%=name%>"/>
								<input type="hidden" name="regNo"  value="<%=userNo%>"/>
								<input type="hidden" name="svAnsOptType"  id="svAnsOptType" value="1"/>
							</form>
	        			    	<div style="width:100%; ">
	        			    		<button class="btn btn-success" onclick="javascript:surveyForm()" style="width:95%;margin-left:2.5%;margin-right:2.5%;">설문 등록</button>
	        			    	</div>
						</div>
						<div id="tabVote" class="tab-pane">
							<form id="voteForm" action="/pt/voteInsert.do"  method="post">
						
							<div class="form-group">
								<label for="voteTitle"><b style="color:red">*</b> 투표 제목</label>
							</div>
							<div class="form-group">
        						<input type="text" id="voteTitle" name="voteTitle" class="form-control"  placeholder="투표 제목을 입력해주세요">
							</div>
							<div class="form-group">
								<label for="voteQuestion" style="width:50%"><b style="color:red">*</b> 투표 질문 1번</label>
							</div>
						
							<div class="form-group">
								<div class="switch-field">
									<input type="radio"  id="ck" name="ckRadio0" value="ck" /> <label for="ck"><h4>다중선택</h4></label>
								 	<input type="radio"  id="radio" name="ckRadio0" value="radio" /> <label for="radio"><h4>선택</h4></label>
							 	</div>
						 	</div>
							
							
							<div id="voteQuestionList">
	        					<div class="form-group">
	        						<input type="text" name="voteQuestion" class="form-control voteQuestion" placeholder="투표 질문을 입력해주세요">
	        					</div>
		        				<div id="voteValList">
		        					<div class="form-group">
		        						<input type="text"  name="voteVal" class="form-control voteVal" placeholder="투표 답을 입력해주세요">
		        					</div>
	        					</div>
	        					<div style="width:50%;float:left">
	        						<div onclick="javascript:voteValAdd(0)" class="btn btn-primary" style="cursor:pointer;width:92.5%;margin-left:5%;margin-right:2.5%;;margin-bottom:15px">답 추가</div>
	        					</div>
	        					<div style="width:50%;float:left">
	        						 <div onclick="javascript:voteValDel(0)" class="btn btn-danger" style="width:92.5%;margin-left:2.5%;margin-right:5%;;margin-bottom:15px">답 삭제</div>
	        					</div>
	        				</div>
	        				
							
								<!-- 질문추가 삭제 버튼 -->
	        					<div style="width:50%;float:left">
	        						<div onclick="javascript:voteAdd()" class="btn btn-primary" style="cursor:pointer;width:92.5%;margin-left:5%;margin-right:2.5%;;margin-bottom:15px">질문 추가</div>
	        					</div>
	        					<div style="width:50%;float:left">
	        						 <div onclick="javascript:voteDel()" class="btn btn-danger" style="width:92.5%;margin-left:2.5%;margin-right:5%;;margin-bottom:15px">질문 삭제</div>
	        					</div>
	        					
	        					<input type="hidden" name="manageCode"  id="manageCode" value="<%=mpDTO.getManageCode()%>"/>
								<input type="hidden" name="voteRegister"  value="<%=name%>"/>
								<input type="hidden" name="regNo"  value="<%=userNo%>"/>
								<input type="hidden" name="svAnsOptType"  id="svAnsOptType" value="0"/>
							</form>
	        			    	<div style="width:100%; ">
	        			    		<button class="btn btn-success" onclick="javascript:voteForm()" style="width:95%;margin-left:2.5%;margin-right:2.5%;">투표 등록</button>
	        			    	</div>
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
	,1000);  지우면 안됨*/
	
	
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
	
    
    
    //질문 보기 클릭
    if(tabName=="tab3"){
    	$.ajax({
    		
    		url:"/ptMain2.do?manageCode="+'<%=mpDTO.getManageCode()%>',
    		method:"get",
    		dataType:'text',
    		success:function(data){
				$('#ajaxView').html(data);
    			
    		},
    		error:function(){
    			
    		}
    	})
    }
    
}
</script>
<script>
//완료여부  설문지 조회
$(function(){
		$('#tabSurveyAud').click(function(){
			if($('#surveyCompleteCheck').val()=='0'){
				$.ajax({
					url:"/ptMain3.do?manageCode="+"<%=mpDTO.getManageCode()%>"+'&svAnsOptType=1',
					method:"get",
					dataType:'text',
					success:function(data){
							$('#viewSurvey').html(data);
						
					},
					error:function(){
						
					}
				})
			}else{
		    	var cont="";
				cont+='<div class="form-group" style="text-align:center">';
				cont+='<label><i class="fa fa-check-square-o fa-2x" style="color:green"> 설문지 등록 완료</label>';
				cont+='</div>';
				$('#viewSurvey').html(cont)
		   
		    }

		});
})


</script>



<!-- 설문 추가 삭제 ,투표 질문 추가 삭제 , 투표 답 추가 삭제 -->
<script>
function questionAdd(){
	var qLength=$('.surveyQuestion').length;
	if(qLength<3){
	$('#questionList').append('<div class="form-group"><input type="text" name="surveyQuestion'+qLength+'" class="form-control surveyQuestion" placeholder="설문지 질문을 입력해주세요"></div>');
	}else{
		alert('설문지의 질문은 최대 3개까지 등록할 수 있습니다.');
		return false;
	}	
	
}
function questionDel(){
	var qLength=parseInt($('.surveyQuestion').length)-1;
	
		if(qLength>0){
			$("input[name=surveyQuestion"+qLength+"]").remove();
		}else{
			alert('설문지의 질문은 최소 1개이상은 되어야 합니다.');
			return false;
		}
	
}
function voteAdd(){
	var qLength=$('.voteQuestion').length;
	if(qLength<3){
		
		$('#voteQuestionList').append('<div class="form-group voteDelview'+qLength+'"><label for="voteQuestion" style="width:50%"><b style="color:red">*</b> 투표 질문 '+parseInt(qLength+1)+'번  </label></div>');
		$('#voteQuestionList').append('<div class="form-group voteDelview'+qLength+'"><div class="switch-field"><input type="radio"  id="ck'+qLength+'" name="ckRadio'+qLength+'" value="ck" /> <label for="ck'+qLength+'"><h4>다중선택</h4></label><input type="radio"  id="radio'+qLength+'" name="ckRadio'+qLength+'" value="radio" /> <label for="radio'+qLength+'"><h4>선택</h4></label></div></div>');
		$('#voteQuestionList').append('<div class="form-group voteDelview'+qLength+'"><input type="text" name="voteQuestion" class="form-control voteQuestion" placeholder="투표 질문을 입력해주세요"></div>');
		$('#voteQuestionList').append('<div class="voteDelview'+qLength+'" id="voteValList'+qLength+'"><div class="form-group"><input type="text" name="voteVal'+qLength+'" class="form-control voteVal'+qLength+'" placeholder="투표 답을 입력해주세요"></div></div>');
		$('#voteQuestionList').append('<div class="voteDelview'+qLength+'" style="width:50%;float:left"><div onclick="javascript:voteValAdd('+qLength+')" class="btn btn-primary" style="cursor:pointer;width:92.5%;margin-left:5%;margin-right:2.5%;;margin-bottom:15px">답 추가</div></div><div class="voteDelview'+qLength+'" style="width:50%;float:left"><div onclick="javascript:voteValDel('+qLength+')" class="btn btn-danger" style="width:92.5%;margin-left:2.5%;margin-right:5%;;margin-bottom:15px">답 삭제</div></div>');
		
	
	}else{
		alert('투표의 질문은 최대 3개까지 등록할 수 있습니다.');
		return false;
	}	
	
}
function voteDel(){
	var qLength=parseInt($('.voteQuestion').length)-1;
		if(qLength>0){
			
			$(".voteDelView"+qLength).remove();
		}else{
			alert('투표의 질문은 최소 1개이상은 되어야 합니다.');
			return false;
		}
	
}

function voteValAdd(i){
	
		if(i==0){
			var qLength=$('.voteVal').length;
			if(qLength<3){
			$('#voteValList').append('<div class="form-group"><input type="text" name="voteVal" class="form-control voteVal" placeholder="투표 답을 입력해주세요"></div>');
			}else{
				alert('투표의 답은 최대 3개까지 등록할 수 있습니다.');
				return false;
			}	
		}else if(i==1){
			var qLength=$('.voteVal1').length;
			if(qLength<3){
			$('#voteValList1').append('<div class="form-group"><input type="text" name="voteVal1" class="form-control voteVal1" placeholder="투표 답을 입력해주세요"></div>');
			}else{
				alert('투표의 답은 최대 3개까지 등록할 수 있습니다.');
				return false;
			}	
		}else if(i==2){
			var qLength=$('.voteVal2').length;
			if(qLength<3){
			$('#voteValList2').append('<div class="form-group"><input type="text" name="voteVal2" class="form-control voteVal2" placeholder="투표 답을 입력해주세요"></div>');
			}else{
				alert('투표의 답은 최대 3개까지 등록할 수 있습니다.');
				return false;
			}	
		}
			
}


function voteValDel(i){
	if(i==0){
		var qLength=parseInt($('.voteVal').length)-1;
		if(qLength>0){
			$("input[name=voteVal]").eq(qLength).remove();
		}else{
			alert('투표의 답은 최소 1개이상은 되어야 합니다.');
			return false;
		}
	}else if(i==1){
		var qLength=parseInt($('.voteVal1').length)-1;
		if(qLength>0){
			$("input[name=voteVal1]").eq(qLength).remove();
		}else{
			alert('투표의 답은 최소 1개이상은 되어야 합니다.');
			return false;
		}
	}else if(i==2){
		var qLength=parseInt($('.voteVal2').length)-1;
		if(qLength>0){
			$("input[name=voteVal2]").eq(qLength).remove();
		}else{
			alert('투표의 답은 최소 1개이상은 되어야 합니다.');
			return false;
		}
	}
	
	
}






</script>
<!-- 설문지 유효성 검사 및 ajaxform 처리 -->

<script>
function surveyForm(){
	var qLength=parseInt($('.surveyQuestion').length);

	$('#surveyForm').ajaxForm({
		beforeSubmit: function(){
			if($('#surveyTitle').val()==""){
				alert("설문 제목이 입력 되지 않았습니다.");
				$('#surveyTitle').focus();
				return false;
			}else{
			 	if(qLength==1&&$("input[name=surveyQuestion]").val()==""){
						alert("설문 질문이 입력되지 않았습니다.");
						$("input[name=surveyQuestion]").focus();
						return false;
				}else if(qLength==2&&($("input[name=surveyQuestion]").val()==""||$("input[name=surveyQuestion1]").val()=="")){
					alert("설문 질문이 입력되지 않았습니다.");
					$("input[name=surveyQuestion]").focus();
					return false;
				}else if(qLength==2&&($("input[name=surveyQuestion]").val()==""||$("input[name=surveyQuestion1]").val()==""||$("input[name=surveyQuestion2]").val()=="")){
					alert("설문 질문이 입력되지 않았습니다.");
					$("input[name=surveyQuestion]").focus();
					return false;
				} 
				
			} 
		},
		success:function(data){
			alert("설문지가 등록되었습니다.")
			var cont="";
			var cont1="";//나의 설문 리스트를 담을 변수
				if(data.msg=="n"){
					cont+='<form id="surveyAudReg" action="/pt/surveyAudReg.do">';
					cont+='<div class="form-group"><label for="surveyAudTitle"><h3> 발표 제목 : '+data.sList[0].manageTitle+'</h3></label></div>'
					cont+='<hr />';
					cont+='<div class="form-group"><label for="surveyAudVal"><h4><b style="color:red">*</b> 설문 제목 : '+data.sList[0].surveyTitle+'</h4></label></div>'
					cont+='<hr />';
					var sList =data.sList;
					for(var i = 0; i <sList.length ; i++){
						cont+='<div class="form-group"><label for="surveyAudVal"><h4><i class="fa fa-check" id="surveyTextCss'+i+'"  style="color:red"></i>  설문 질문 '+parseInt(i+1)+'번 : ' +sList[i].surveyTitleQ+'</h4></label></div>'
						cont+='<div class="form-group"><input type="text" name="surveyAudVal" class="form-control inputSurveyAudVal"  placeholder="답변을 적어주세요"></div>'
						cont+="<input type='hidden' name='surveyTitleQ' value='"+sList[i].surveyTitleQ+"'/>";
						cont+="<input type='hidden' name='surveyTitleNo' value='"+sList[i].surveyTitleNo+"'/>";
						}
					cont+='<hr />';
					cont+='<div class="form-group">';
					cont+='<label for="surveyNeedInfo"><h4><b style="color:red">*</b>필수 입력 정보</h4></label>'
					cont+='</div>';
					cont+='<hr />';
					cont+='<div class="form-group">';
					cont+='<label><h4><i id="surveyAudGenCss" class="fa fa-check" style="color:red"></i>성별</h4></label>'
					cont+='</div>';
					cont+='<div class="form-group">'
					cont+='<div class="switch-field">';
					cont+='<input type="radio"  id="man" name="gender" value="m" /> <label for="man"><h4>남</h4></label>';
			 		cont+='<input type="radio"  id="woman" name="gender" value="w" /> <label for="woman"><h4>여</h4></label>';
			 		cont+='</div>';
			 		cont+='</div>';
			 		cont+='<div class="form-group">';
					cont+='<label><h4><i id="surveyAudAgeCss" class="fa fa-check" style="color:red"></i>연령별</h4></label>'
					cont+='</div>';
					cont+='<div class="form-group">'
					cont+='<div class="switch-field2">';
					cont+='<input type="radio"  id="ten" name="age" value="10"  /> <label for="ten"><h5>10대 이상</h5></label>';
				 	cont+='<input type="radio"  id="twenty" name="age" value="20" /> <label for="twenty"><h5>20대 이상</h5></label>';
					cont+='<input type="radio"  id="thirty" name="age" value="30" /> <label for="thirty"><h5>30대 이상</h5></label>';
				 	cont+='<input type="radio"  id="fourty" name="age" value="40" /> <label for="fourty"><h5>40대 이상</h5></label>';
					cont+='<input type="radio"  id="fifty" name="age" value="50" /> <label for="fifty"><h5>50대 이상</h5></label>';
				 	cont+='</div>';
				 	cont+='</div>';
				 	cont+='<hr />';
				 	cont+="<input type='hidden' name='svAnsOptType' value='1'/>";
				 	cont+='</form>';
					cont+='<div style="width:100%;"><button class="btn btn-success" onclick="javascript:surveyAudRegForm()" style="width:95%;margin-left:2.5%;margin-right:2.5%; margin-bottom:10%">설문 등록</button></div>'
					$('#viewSurvey').html(cont);
				
				
				}else if(data.msg=="y"){
					alert("설문지는 1개 이상 등록 할 수 없습니다.");
				}
			
			},
		error:function(){
			alert('에러발생');
		}
		
	}).submit();
	//inputAudTextCss();
}

</script>
<!-- 설문 유효성 색 및  검사 -->
<script>
//체크 색상 변경 함수

	//입력여부 확인
	$(document).on('keyup','.inputSurveyAudVal', function(){
		var index=$('.inputSurveyAudVal').index(this);
		if($(this).val()==""){
			$('#surveyTextCss'+index).css({
				"color":"red"
			})
		}else{
			$('#surveyTextCss'+index).css({
				"color":"green"
			})
		}
	}); 
	
	$(document).on('click','input:radio[name=age]',function(){
 		$('input:radio[name=age]').removeAttr('checked');
 		$(this).attr('checked','checked');
 		if($('input:radio[name=age]:checked')){
			$('#surveyAudAgeCss').css({
				"color":"green"
			})
		}else{
			$('#surveyAudAgeCss').css({
				"color":"red"
			})
	
		} 
	});
 	$(document).on('click','input:radio[name=gender]',function(){
 		$('input:radio[name=gender]').removeAttr('checked');
 		$(this).attr('checked','checked');
 		if($('input:radio[name=gender]:checked')){
			$('#surveyAudGenCss').css({
				"color":"green"
			})
		}else{
			$('#surveyAudGenCss').css({
				"color":"red"
			})
	
		} 
	});
/*  	function inputAudTextCss(){

} */

//청중 설문지 등록 폼

	function surveyAudRegForm(){
		
		$('#surveyAudReg').ajaxForm({
			//유효성 검사
			beforeSubmit:function(){
			 	$('.inputSurveyAudVal').each(function(index){
					if($(this).val()==''){
						alert(parseInt(index+1)+"번째 설문이 작성되지 않았습니다.")
						return false;
					}
				});  
			 	var genCheck=$('input:radio[name=gender]').is(":checked");
				var ageCheck=$('input:radio[name=age]').is(":checked");
				
			 	if(genCheck==false){
					alert('필수 : 성별이 선택 되지 않았습니다.');
					return false;
				}
			 	if(ageCheck==false){
					alert('필수 : 연령별이 선택 되지 않았습니다.');
					return false;
				} 
			},
			method:'post',
			success:function(data){
				console.log(data)
				var cont="";
				if(data!=0){
					cont+='<div class="form-group" style="text-align:center">';
					cont+='<label><i class="fa fa-check-square-o fa-2x" style="color:green"> 설문지 등록 완료</label>';
					cont+='</div>';
					$('#surveyCompleteCheck').val('1')
				}
				$('#viewSurvey').html(cont)
			},
			error:function(){
				
			}
		}).submit();
		
	}
</script>
<!-- 투표 ajax 유효성 검사 -->
<script>


function voteForm(){
	
	$('#voteForm').ajaxForm({
		//유효성 검사
		beforeSubmit:function(){
			var qLength=parseInt($('.voteQuestion').length);
			if($('#voteTitle').val()==""){
				alert("투표 제목이 입력되지 않았습니다.");
				return false;
			}
			
			$('input[name=voteQuestion]').each(function(index){
				if($(this).val()==""){
					alert("투표 질문 "+parseInt(index+1)+"번 이 입력되지 않았습니다.");
					$(this).focus();
					return false;
				}
			});
			for(var i=0 ; i<qLength;i++){
				$(document).on('click','input:radio[name=ckRadio'+i+']',function(){
					$('input:radio[name=ckRadio'+i+']').removeAttr('checked');
					$(this).attr('checked','checked');
				});
			}
			 for(var i = 0 ; i<qLength; i++){
			 if($('input[name=ckRadio'+i+']').is(":checked")==false){
					alert(parseInt(i+1)+"번 :다중 선택/ 선택을 클릭해주세요")
					return false;
				}
			 } 
		 
			if($('.voteVal').length>0){
				$('.voteVal').each(function(index){
					if($(this).val()==""){
						alert("투표 질문1 : "+parseInt(index+1)+"번 답이 입력되지 않았습니다.");
						$(this).focus();
						return false;
					}
				})
			}
			
			if($('.voteVal1').length>0){
				$('.voteVal1').each(function(index){
					if($(this).val()==""){
						alert("투표 질문2 : "+parseInt(index+1)+"번 답이 입력되지 않았습니다.");
						$(this).focus();
						return false;
					}
				})
			}
			if($('.voteVal2').length>0){
				$('.voteVal2').each(function(index){
					if($(this).val()==""){
						alert("투표 질문3 : "+parseInt(index+1)+"번 답이 입력되지 않았습니다.");
						$(this).focus();
						return false;
					}
				})
			}
		},
		method:'post',
		dataType:'text',
		success:function(data){
			console.log(data)
			$('#viewVote').html(data);
			
		},
		error:function(){
			
		}
	}).submit();
	
}


</script>


<!-- 설문지 완료 여부  체크 input -->
<input type="hidden" id="surveyCompleteCheck" value="0"/>

</body>
</html>
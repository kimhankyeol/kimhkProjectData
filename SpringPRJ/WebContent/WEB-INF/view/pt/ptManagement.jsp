<%@page import="poly.util.DateUtil"%>
<%@page import="poly.dto.SurveyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<SurveyDTO> sList = (List<SurveyDTO>)request.getAttribute("sList"); %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AIS-발표 관리</title>

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
    
    <!-- dataTable -->
    
    <link rel="stylesheet" href="/css/dataTables.min.css"/>

	<style>
	.timelineP {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}
.timelineP:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 50%;
  margin-left: -1.5px;
}
.timelineP > li {
  margin-bottom: 20px;
  position: relative;
}
.timelineP > li:before,
.timelineP > li:after {
  content: " ";
  display: table;
}
.timelineP > li:after {
  clear: both;
}
.timelineP > li:before,
.timelineP > li:after {
  content: " ";
  display: table;
}
.timelineP > li:after {
  clear: both;
}
.timelineP > li > .timelineP-panel {
  width: 46%;
  float: left;
  border: 1px solid #d4d4d4;
  border-radius: 2px;
  padding: 20px;
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}
.timelineP > li > .timelineP-panel:before {
  position: absolute;
  top: 26px;
  right: -15px;
  display: inline-block;
  border-top: 15px solid transparent;
  border-left: 15px solid #ccc;
  border-right: 0 solid #ccc;
  border-bottom: 15px solid transparent;
  content: " ";
}
.timelineP > li > .timelineP-panel:after {
  position: absolute;
  top: 27px;
  right: -14px;
  display: inline-block;
  border-top: 14px solid transparent;
  border-left: 14px solid #fff;
  border-right: 0 solid #fff;
  border-bottom: 14px solid transparent;
  content: " ";
}
.timelineP > li > .timelineP-badge {
  padding-top:15px;
  color: #fff;
  width: 50px;
  height: 50px;
  line-height: 50px;
  font-size: 1.4em;
  text-align: center;
  position: absolute;
  top: 16px;
  left: 50%;
  margin-left: -25px;
  background-color: #999999;
  z-index: 100;
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
}
.timelineP > li.timelineP-inverted > .timelineP-panel {
  float: right;
}
.timelineP > li.timelineP-inverted > .timelineP-panel:before {
  border-left-width: 0;
  border-right-width: 15px;
  left: -15px;
  right: auto;
}
.timelineP > li.timelineP-inverted > .timelineP-panel:after {
  border-left-width: 0;
  border-right-width: 14px;
  left: -14px;
  right: auto;
}
.timelineP-badge.primary {
  background-color: #2e6da4 !important;
}
.timelineP-badge.success {
  background-color: #3f903f !important;
}
.timelineP-badge.warning {
  background-color: #f0ad4e !important;
}
.timelineP-badge.danger {
  background-color: #d9534f !important;
}
.timelineP-badge.info {
  background-color: #5bc0de !important;
}
.timelineP-title {
  margin-top: 0;
  color: inherit;
}
.timelineP-body > p,
.timelineP-body > ul {
  margin-bottom: 0;
}
.timelineP-body > p + p {
  margin-top: 5px;
}
@media (max-width:768px){

	.timelineP-title{
		font-size:90%
	}
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
                <a class="navbar-brand" href="/home.do">Audience Interaction System</a>
            </div>
       

            <div class="navbar-default sidebar in" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                   
                        <li>
                            <a href="/pt/ptManagement.do?userNo=<%=session.getAttribute("userNo") %>" class="active"><i class="fa fa-dashboard fa-fw"></i> 발표 관리</a>
                        </li>
                        <li>
                            <a style="cursor:pointer"><i class="fa fa-bar-chart-o fa-fw"></i>빅데이터 분석 차트<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a style="cursor:pointer" onclick="javascript:ptListView()"><i class="fa fa-th-list  fa-fw"></i> 발표 리스트</a>
                        </li>
                         <li>
                            <a style="cursor:pointer" href="form.html"><i class="fa fa-book  fa-fw"></i> 설문지 관리</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	
        <div id="page-wrapper" style="min-height: 651px;">
         <div id="ptManageList">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">발표 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
           
            <!-- /.row -->
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                <% if(sList==null){ %>
                                    <div class="huge">0</div>
                                <% }else{ %>
                                	 <div class="huge"><%=sList.size()%></div>
                                <%} %>
                                    <div>운영중인 발표</div>
                                </div>
                            </div>
                        </div>
                        <a style="cursor:pointer">
                            <div class="panel-footer">
                                <span class="pull-left" onclick="javascript:ptListView()">발표방 보러가기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                    	</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">5</div>
                                    <div>빅데이터 분석</div>
                                </div>
                            </div>
                        </div>
                        <a style="cursor:pointer">
                            <div class="panel-footer">
                                <span class="pull-left">빅데이터 분석보러가기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
              <!--  <h1>Presentation TimeLine</h1>
	            	<div class="comments">
				  		<p class="timeP">학술논문대회 김한결 발표   2018/10/20 </p>
				    	<p class="timeP">학술논문대회 송진수 발표   2018/10/20 </p>
					    <p class="timeP">학술논문대회 황윤영 발표   2018/10/20 </p>
						<p class="timeP">숭실대 산업융합 발표   2018/10/21 </p>
					    <p class="timeP">학술논문대회 발표   2018/10/22 </p>
					</div>
			          -->
                    <div class="container">
					    <div class="page-header">
					        <h1 id="timelineP"><%=session.getAttribute("name") %>님의 TimeLine</h1>
					    </div>
					    <ul class="timelineP">
					    <!-- 짝수번째는 오른쪽 invert -->
					    <% if(sList.size()==0){%>
					    	 <li>
					          <div class="timelineP-badge"><i class="glyphicon glyphicon-check"></i></div>
					          <div class="timelineP-panel">
					            <div class="timelineP-heading">
					              <h4 class="timelineP-title" >등록된 발표가 없습니다.</h4>
					            </div>
					            <div class="timelineP-body">
					            </div>
					          </div>
					        </li>
					    <%}else{ %>
					     <% for(int i = 0 ; i<sList.size(); i++) {%>
					     	<% if(i%2==0) {%>
					     	 <li >
					          <div class="timelineP-badge"><i class="glyphicon glyphicon-check"></i></div>
					          <div class="timelineP-panel">
					            <div class="timelineP-heading">
					              <h4 class="timelineP-title" ><a href="/ptMain.do?manageCode=<%=sList.get(i).getManageCode()%>"><%=sList.get(i).getManageTitle() %></a></h4>
					              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i><%=DateUtil.DateFormatter(sList.get(i).getRegDate())%></small></p>
					            </div>
					            <div class="timelineP-body">
					              <p> <%=sList.get(i).getFileOrgName()%> - <%=sList.get(i).getFileSize()%> MB</p>
					            </div>
					          </div>
					        </li>
					     	<%}else if(i%2!=0){ %>
					      <li class="timelineP-inverted">
					          <div class="timelineP-badge"><i class="glyphicon glyphicon-check"></i></div>
					          <div class="timelineP-panel">
					            <div class="timelineP-heading">
					              <h4 class="timelineP-title" ><a href="/ptMain.do?manageCode=<%=sList.get(i).getManageCode()%>"><%=sList.get(i).getManageTitle() %></a></h4>
					              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i><%=DateUtil.DateFormatter(sList.get(i).getRegDate())%></small></p>
					            </div>
					            <div class="timelineP-body">
					              <p> <%=sList.get(i).getFileOrgName() %> - <%=sList.get(i).getFileSize()%> MB</p>
					            </div>
					          </div>
					        </li>
					     	<%} %>
					    	
					    <%} %>
					   <%} %>
					       
					    </ul>
					</div>
                </div>
                <!-- /.col-lg-12 -->


            </div>
            <!-- /.row -->
           </div>
        </div>
        <!-- /#page-wrapper -->

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
    <!-- dataTable -->
	<script src="/js/jquery.dataTables.min.js"></script>

	<script>
	function ptListView(){
		$.ajax({
			url:"/ptManagement/ptList.do?userNo=<%=session.getAttribute("userNo")%>",
			method:"post",
			dataType:'text',
			success:function(data){
					$('#ptManageList').html(data);
				
			},
			error:function(){
				
			}
		})
	}
	
	</script>


</body>
</html>
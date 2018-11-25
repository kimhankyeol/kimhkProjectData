<%@page import="poly.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="poly.util.DateUtil"%>
<%@page import="poly.dto.PreFileDTO"%>
<%@page import="poly.dto.ManagePresentationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ManagePresentationDTO mpDTO = (ManagePresentationDTO) request.getAttribute("mpDTO");
   PreFileDTO pfDTO = (PreFileDTO)request.getAttribute("pfDTO");
   List<QuestionDTO> qList= (List<QuestionDTO>)request.getAttribute("qList");
  
	String email = CmmUtil.nvl((String) session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));

%>
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
											<div id="questionText">
											<%for(int i=0 ; i<qList.size();i++){ %>
											<div class="row">
												<div class="col-lg-12">
													<div class="media">
														<a class="pull-left" href="#"> <img
															class="media-object img-circle" src="/img/new_logo.png" />
														</a>
														<div class="media-body">
															이름
															<h4 class="media-heading">
																<%=qList.get(i).getCid() %> <span class="small pull-right"><%=qList.get(i).getRegDate() %></span>
															</h4>
														</div>
														<p><%=qList.get(i).getQuestionContent() %></p>
													</div>
												</div>
											</div>
											<hr />
											<%
												}
											%>
											
											</div>
												
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
			 
<%@page import="poly.dto.SurveyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<SurveyDTO> sList= (List<SurveyDTO>)request.getAttribute("sList");
	String msg = (String)request.getAttribute("msg");
%>



<% if(msg=="y"){ %>
<form id="surveyAudReg" action="/pt/surveyAudReg.do">
	<div class="form-group">
		<label for="surveyAudTitle"><h3>발표 제목 : <%=sList.get(0).getManageTitle() %></h3></label>
	</div>
	<hr />
	<div class="form-group">
		<label for="surveyAudVal"><h4>
				<b style="color: red">*</b> 설문 제목 : <%=sList.get(0).getSurveyTitle() %>
			</h4></label>
	</div>
	<hr />
	<%for (int i=0 ; i<sList.size();i++) {%>
	<div class="form-group">
		<label for="surveyAudVal"><h4>
				<i class="fa fa-check" id="surveyTextCss<%=i%>" style="color: red"></i>
				설문 질문 <%=i+1%>번 : <%=sList.get(i).getSurveyTitleQ() %>
			</h4></label>
	</div>
	<div class="form-group">
		<input type="text" name="surveyAudVal"
			class="form-control inputSurveyAudVal" placeholder="답변을 적어주세요">
	</div>
	<input type='hidden' name='surveyTitleQ' value="<%=sList.get(i).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList.get(i).getSurveyTitleNo() %>" />
	<hr />
	<%} %>
	<div class="form-group">
		<label for="surveyNeedInfo"><h4><b style="color: red">*</b>필수 입력 정보</h4></label>
	</div>
	<hr />
	<div class="form-group">
		<label><h4><i id="surveyAudGenCss" class="fa fa-check" style="color: red"></i>성별</h4></label>
	</div>
	<div class="form-group">
		<div class="switch-field">
			<input type="radio" id="man" name="gender" value="m" /> 
			<label for="man"><h4>남</h4></label> <input type="radio" id="woman" name="gender" value="w" /> <label for="woman"><h4>여</h4></label>
		</div>
	</div>
	<div class="form-group">
		<label><h4><i id="surveyAudAgeCss" class="fa fa-check" style="color: red"></i>연령별</h4></label>'
	</div>
	<div class="form-group">
		<div class="switch-field2">
			<input type="radio" id="ten" name="age" value="10" /> 
				<label for="ten"><h5>10대 이상</h5></label> 
			<input type="radio" id="twenty"name="age" value="20" /> 
				<label for="twenty"><h5>20대 이상</h5></label> 
			<input type="radio" id="thirty" name="age" value="30" /> 
				<label for="thirty"><h5>30대 이상</h5></label> 
			<input type="radio" id="fourty" name="age" value="40" /> 
				<label for="fourty"><h5>40대 이상</h5></label> 
			<input type="radio" id="fifty" name="age" value="50" /> 
				<label for="fifty"><h5>50대 이상</h5></label>
		</div>
	</div>
	<hr />
	<input type='hidden' name='svAnsOptType' value='1' />
</form>
<div style="width: 100%;">
	<button class="btn btn-success" onclick="javascript:surveyAudRegForm()" style="width: 95%; margin-left: 2.5%; margin-right: 2.5%; margin-bottom: 10%">설문 등록</button>
</div>

<%} else if(msg=="n"){%>
<div>설문지가 등록 되지 않았습니다.</div>
<%}%>
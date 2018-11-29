<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.SurveyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  List<SurveyDTO> sList1= (List<SurveyDTO>)request.getAttribute("sList1");
	List<SurveyDTO> sList2= (List<SurveyDTO>)request.getAttribute("sList2");
	List<SurveyDTO> sList3= (List<SurveyDTO>)request.getAttribute("sList3");
	String msg = (String)request.getAttribute("msg");
%>

<%if(msg=="n"){ %>
<form id="voteAudReg" name="voteAudReg" action="/pt/voteAudReg.do">
	<div class="form-group" style="clear:both">
		<label for="surveyAudTitle"><h3>발표 제목 : <%=sList1.get(0).getManageTitle() %> </h3></label>
	</div>
	<hr />
	<div class="form-group" style="clear:both">
		<label for="surveyAudVal"><h4>
				<b style="color: red">*</b> 투표 제목 :  <%=sList1.get(0).getSurveyTitle() %>
			</h4></label>
	</div>
	<hr />
	<%if(sList1!=null&&sList2==null&&sList3==null){ %>
	<!-- 1번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss1" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList1.get(0).getSurveyAnsOptType()%>번</h4></label>
	</div>
	
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList1.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList1.size();i++) {%>
				<input type="<%=sList1.get(0).getCkRadio() %>" class="voteVal1" name="voteVal1" value="<%=sList1.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal"><h4><%=sList1.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	 <input type='hidden' name='surveyTitleQ' value="<%=sList1.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList1.get(0).getSurveyTitleNo() %>"  />
	<%} %>
	
	<% if(sList1!=null&&sList2!=null&&sList3==null) {%>
	
	<!-- 1번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss1" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList1.get(0).getSurveyAnsOptType()%>번</h4></label>
	</div>
	
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList1.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList1.size();i++) {%>
				<input type="<%=sList1.get(0).getCkRadio() %>"  class="voteVal1" name="voteVal1" value="<%=sList1.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal1<%=(i+1)%>"><h4><%=sList1.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	<!-- 2번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss2" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList2.get(0).getSurveyAnsOptType()%>번</h4></label>
	</div>
	
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList2.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList2.size();i++) {%>
				<input type="<%=sList2.get(0).getCkRadio() %>"  class="voteVal2" name="voteVal2" value="<%=sList2.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal2<%=(i+1)%>"><h4><%=sList2.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	<input type='hidden' name='surveyTitleQ' value="<%=sList1.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList1.get(0).getSurveyTitleNo() %>" />
	 <input type='hidden' name='surveyTitleQ' value="<%=sList2.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList2.get(0).getSurveyTitleNo() %>"  />

	<%}%>
	<%if(sList1!=null&&sList2!=null&&sList3!=null){ %> 
	<!-- 1번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss1" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList1.get(0).getSurveyAnsOptType()%>번</h4></label>
	</div>
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList1.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList1.size();i++) {%>
				<input type="<%=sList1.get(0).getCkRadio() %>" id="voteVal1<%=(i+1)%>"  class="voteVal1"  name="voteVal1" value="<%=sList1.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal1<%=(i+1)%>"><h4><%=sList1.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	<!-- 2번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss2" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList2.get(0).getSurveyAnsOptType()%>번</h4></label>
	</div>
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList2.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList2.size();i++) {%>
				<input type="<%=sList2.get(0).getCkRadio() %>" id="voteVal2<%=(i+1)%>"  class="voteVal2"  name="voteVal2" value="<%=sList2.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal2<%=(i+1)%>"><h4><%=sList2.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	
	<!-- 3번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss3" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList3.get(0).getSurveyAnsOptType()%>번</h4></label>
	</div>
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList3.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList3.size();i++) {%>
				<input type="<%=sList3.get(0).getCkRadio() %>" id="voteVal3<%=(i+1)%>" class="voteVal3"  name="voteVal3" value="<%=sList3.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal3<%=(i+1)%>"><h4><%=sList3.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	 <input type='hidden' name='surveyTitleQ' value="<%=sList1.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList1.get(0).getSurveyTitleNo() %>"  />	
	 <input type='hidden' name='surveyTitleQ' value="<%=sList2.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList2.get(0).getSurveyTitleNo() %>"  />
	 <input type='hidden' name='surveyTitleQ' value="<%=sList3.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo' value="<%=sList3.get(0).getSurveyTitleNo() %>"  />
	<%} %>
	
	<div class="form-group" style="clear:both">
		<label for="surveyNeedInfo"><h4><b style="color: red">*</b>필수 입력 정보</h4></label>
	</div>
	<hr />
	<div class="form-group" style="clear:both">
		<label><h4><i id="surveyAudGenCss1" class="fa fa-check" style="color: red"></i>성별</h4></label>
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field">
			<input type="radio" id="man2" name="gender" value="m" /> 
			<label for="man2"><h4>남</h4></label> <input type="radio" id="woman2" name="gender" value="w" /> <label for="woman2"><h4>여</h4></label>
		</div>
	</div>
	<div class="form-group" style="clear:both">
		<label><h4><i id="surveyAudAgeCss1" class="fa fa-check" style="color: red"></i>연령별</h4></label>'
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field2">
			<input type="radio" id="ten1" name="age" value="10" /> 
				<label for="ten1"><h5>10대 이상</h5></label> 
			<input type="radio" id="twenty1"name="age" value="20" /> 
				<label for="twenty1"><h5>20대 이상</h5></label> 
			<input type="radio" id="thirty1" name="age" value="30" /> 
				<label for="thirty1"><h5>30대 이상</h5></label> 
			<input type="radio" id="fourty1" name="age" value="40" /> 
				<label for="fourty1"><h5>40대 이상</h5></label> 
			<input type="radio" id="fifty1" name="age" value="50" /> 
				<label for="fifty1"><h5>50대 이상</h5></label>
		</div>
	</div>
	<hr />
	<input type='hidden' name='svAnsOptType' value='1' />
</form>
<div style="width: 100%;">
	<button class="btn btn-success" onclick="javascript:voteAudRegForm()" style="width: 95%; margin-left: 2.5%; margin-right: 2.5%; margin-bottom: 10%">설문 등록</button>
</div>
<% } %>

<script>
//입력여부 확인
/* 
$(function(){
	var vLength=$('.voteQ').length;
	for(var i = 0 ; i<vLength;i++){
		$(document).on('click','.voteVal'+parseInt(i+1),function(){
			$('.voteVal'+parseInt(i+1)).removeAttr('checked');
			$(this).attr('checked','checked');
			if($('.voteVal'+parseInt(i+1)).is(":checked")){
			$('#voteAudCss'+parseInt(i+1)).css({
				"color":"green"
			})
		}else{
			$('#voteAudCss'+i).css({
				"color":"red"
			})

		} 
	});
		
	}

}) */



function voteAudRegForm(){
	var vLength=$('.voteQ').length;
	for( var i = 0;i <vLength;i++){
		
		$(document).on('click','input[name=voteVal'+parseInt(i+1)+']',function(){
		
	alert((i+1))
	})
		
	
	}
}
</script>

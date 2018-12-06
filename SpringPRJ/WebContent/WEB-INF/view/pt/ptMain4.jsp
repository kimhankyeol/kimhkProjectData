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

<%if(msg=="y"){ %>
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
		<label><h4><i id="voteAudCss1" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList1.get(0).getSurveyAnsOptNo()%>번</h4></label>
	</div>
	
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList1.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList1.size();i++) {%>
				<input type="<%=sList1.get(0).getCkRadio() %>" id="voteVal1<%=i+1%>" class="voteVal1" name="voteVal1" value="<%=sList1.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal1<%=i+1%>"><h4><%=sList1.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	 <input type='hidden' name='surveyTitleQ1' value="<%=sList1.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo1' value="<%=sList1.get(0).getSurveyTitleNo() %>"  />
	  <input type='hidden'name='svAnsOptNo1' value="<%=sList1.get(0).getSurveyAnsOptNo() %>"  />
	<%} %>
	
	<% if(sList1!=null&&sList2!=null&&sList3==null) {%>
	
	<!-- 1번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss1" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList1.get(0).getSurveyAnsOptNo()%>번</h4></label>
	</div>
	
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList1.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList1.size();i++) {%>
				<input type="<%=sList1.get(0).getCkRadio() %>" id="voteVal1<%=i+1%>" class="voteVal1" name="voteVal1" value="<%=sList1.get(i).getSurveyAnsOptNo() %>" /> 
				<label for="voteVal1<%=(i+1)%>"><h4><%=sList1.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	<!-- 2번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss2" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList2.get(0).getSurveyAnsOptNo()%>번</h4></label>
	</div>
	
	<div class="form-group voteQ" style="clear:both">
		<label><h4><%=sList2.get(0).getSurveyTitleQ()%></h4></label>
	</div>
	
	<div class="form-group" style="clear:both">
		<div class="switch-field3">
			<%for (int i=0 ; i<sList2.size();i++) {%>
				<input type="<%=sList2.get(0).getCkRadio() %>" id="voteVal2<%=i+1%>" class="voteVal2" name="voteVal2" value="<%=sList2.get(i).getSurveyAnsOptValue() %>" /> 
				<label for="voteVal2<%=(i+1)%>"><h4><%=sList2.get(i).getSurveyAnsOptValue() %></h4></label>
			<%} %>
		</div>
	</div>
	<input type='hidden' name='surveyTitleQ1' value="<%=sList1.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo1' value="<%=sList1.get(0).getSurveyTitleNo() %>" />
	  <input type='hidden'name='svAnsOptNo1' value="<%=sList1.get(0).getSurveyAnsOptNo() %>"  />
	 <input type='hidden' name='surveyTitleQ2' value="<%=sList2.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo2' value="<%=sList2.get(0).getSurveyTitleNo() %>"  />
	  <input type='hidden'name='svAnsOptNo2' value="<%=sList2.get(0).getSurveyAnsOptNo() %>"  />

	<%}%>
	<%if(sList1!=null&&sList2!=null&&sList3!=null){ %> 
	<!-- 1번 val -->
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudCss1" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList1.get(0).getSurveyAnsOptNo()%>번</h4></label>
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
		<label><h4><i id="voteAudCss2" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList2.get(0).getSurveyAnsOptNo()%>번</h4></label>
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
		<label><h4><i id="voteAudCss3" class="fa fa-check" style="color: red"></i>투표 질문 <%=sList3.get(0).getSurveyAnsOptNo()%>번</h4></label>
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
	 <input type='hidden' name='surveyTitleQ1' value="<%=sList1.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo1' value="<%=sList1.get(0).getSurveyTitleNo() %>"  />
	  <input type='hidden'name='svAnsOptNo1' value="<%=sList1.get(0).getSurveyAnsOptNo() %>"  />	
	 <input type='hidden' name='surveyTitleQ2' value="<%=sList2.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo2' value="<%=sList2.get(0).getSurveyTitleNo() %>"  />
	  <input type='hidden'name='svAnsOptNo2' value="<%=sList2.get(0).getSurveyAnsOptNo() %>"  />
	 <input type='hidden' name='surveyTitleQ3' value="<%=sList3.get(0).getSurveyTitleQ() %>" />
	 <input type='hidden'name='surveyTitleNo3' value="<%=sList3.get(0).getSurveyTitleNo() %>"  />
	  <input type='hidden'name='svAnsOptNo3' value="<%=sList3.get(0).getSurveyAnsOptNo() %>"  />
	<%} %>
	
	<div class="form-group" style="clear:both">
		<label for="surveyNeedInfo"><h4><b style="color: red">*</b>필수 입력 정보</h4></label>
	</div>
	<hr />
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudGenCss1" class="fa fa-check" style="color: red"></i>성별</h4></label>
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field">
			<input type="radio" id="man2" class="gender" name="gender" value="m" /> 
			<label for="man2"><h4>남</h4></label> <input type="radio" id="woman2" class="gender" name="gender" value="w" /> <label for="woman2"><h4>여</h4></label>
		</div>
	</div>
	<div class="form-group" style="clear:both">
		<label><h4><i id="voteAudAgeCss1" class="fa fa-check" style="color: red"></i>연령별</h4></label>'
	</div>
	<div class="form-group" style="clear:both">
		<div class="switch-field2">
			<input type="radio" id="ten1" class="age" name="age" value="10" /> 
				<label for="ten1"><h5>10대 이상</h5></label> 
			<input type="radio" id="twenty1"  class="age" name="age" value="20" /> 
				<label for="twenty1"><h5>20대 이상</h5></label> 
			<input type="radio" id="thirty1"  class="age" name="age" value="30" /> 
				<label for="thirty1"><h5>30대 이상</h5></label> 
			<input type="radio" id="fourty1"  class="age" name="age" value="40" /> 
				<label for="fourty1"><h5>40대 이상</h5></label> 
			<input type="radio" id="fifty1"  class="age"  name="age" value="50" /> 
				<label for="fifty1"><h5>50대 이상</h5></label>
		</div>
	</div>
	<hr />
	<input type='hidden' name='svAnsOptType' value='1' />
	<input type="hidden" name='manageCode' value='<%=sList1.get(0).getManageCode() %>'/>
</form>
<div style="width: 100%;">
	<button class="btn btn-success" onclick="javascript:voteAudRegForm()" style="width: 95%; margin-left: 2.5%; margin-right: 2.5%; margin-bottom: 10%">투표 등록</button>
</div>
<% }else { %>
<div id="voteCheck">투표가 등록 되지 않았습니다.</div>
<%} %>
<!-- 투표 선택 여부 -->

<script>
$(function(){
	

var vLength=$('.voteQ').length;
if($('.voteVal1').length>0 &&$('.voteVal2').length==0&&$('.voteVal3').length==0){
	$('.voteVal1').change(function() {
		if($(".voteVal1:checked").length>0){
			$('#voteAudCss1').css({
				"color":"green"
			})
		}else{
			$('#voteAudCss1').css({
				"color":"red"
			})
		}
	    
	})
}else if($('.voteVal1').length>0 && $('.voteVal2').length>0 && $('.voteVal3').length==0){
	$('.voteVal1').change(function() {
		if($(".voteVal1:checked").length>0){
			$('#voteAudCss1').css({
				"color":"green"
			})
		}else{
			$('#voteAudCss1').css({
				"color":"red"
			})
		}
	    
	})
	$('.voteVal2').change(function() {
		if($(".voteVal2:checked").length>0){
			$('#voteAudCss2').css({
				"color":"green"
			})
		}else{
			$('#voteAudCss2').css({
				"color":"red"
			})
		}
	    
	})
	
	
}else if($('.voteVal1').length>0 &&$('.voteVal2').length>0&&$('.voteVal3').length>0){
	$('.voteVal1').change(function() {
		if($(".voteVal1:checked").length>0){
			$('#voteAudCss1').css({
				"color":"green"
			})
		}else{
			$('#voteAudCss1').css({
				"color":"red"
			})
		}
	    
	})
	$('.voteVal2').change(function() {
		if($(".voteVal2:checked").length>0){
			$('#voteAudCss2').css({
				"color":"green"
			})
		}else{
			$('#voteAudCss2').css({
				"color":"red"
			})
		}
	    
	})
	$('.voteVal3').change(function() {
		if($(".voteVal3:checked").length>0){
			$('#voteAudCss3').css({
				"color":"green"
			})
		}else{
			$('#voteAudCss3').css({
				"color":"red"
			})
		}
	    
	})
	
}



///////////////////

$('.gender').change(function(){
	
	
	if($('.gender:checked').length>0){
		$('#voteAudGenCss1').css({
			"color":"green"
		})
	}else{
		$('#voteAudGenCss1').css({
			"color":"red"
		})
	}
})

$('.age').change(function(){
	
	
	if($('.age:checked').length>0){
		$('#voteAudAgeCss1').css({
			"color":"green"
		})
	}else{
		$('#voteAudAgeCss1').css({
			"color":"red"
		})
	}
})
	
})


function voteAudRegForm(){
	$('#voteAudReg').ajaxForm({
		//유효성 검사
		beforeSubmit:function(){
			
			
			if($('.voteVal1').length>0 &&$('.voteVal2').length==0&&$('.voteVal3').length==0){
				if($('.voteVal1').is(':checked')==false){
					alert('1번이 체크 되지 않았습니다.');
					return false;
				}
			}
			
			 if($('.voteVal1').length>0 && $('.voteVal2').length>0 && $('.voteVal3').length==0){
				 if($('.voteVal1').is(':checked')==false){
						alert('1번이 체크 되지 않았습니다.');
						return false;
					}
				if($('.voteVal2').is(':checked')==false){
					alert('2번이 체크 되지 않았습니다.');
					return false;
				}
			
			}
			 
			 if($('.voteVal1').length>0 && $('.voteVal2').length>0 && $('.voteVal3').length>0){
				 if($('.voteVal1').is(':checked')==false){
						alert('1번이 체크 되지 않았습니다.');
						return false;
					}
				if($('.voteVal2').is(':checked')==false){
					alert('2번이 체크 되지 않았습니다.');
					return false;
				}
				if($('.voteVal3').is(':checked')==false){
					alert('3번이 체크 되지 않았습니다.');
					return false;
				}
			
			}else if($('.gender:checked').length==0){
				alert('성별이 체크 되지 않았습니다.')
				return false;
			
			}else if($('.age:checked').length==0){
				alert('연령대가 체크 되지 않았습니다.')
				return false;
			}
		},
		method:'post',
		success:function(data){
			var cont="";
			cont+='<div class="form-group" style="text-align:center">';
			cont+='<label><i class="fa fa-check-square-o fa-2x" style="color:green"> 투표 등록 완료</label>';
			cont+='</div>';
			$('#voteCompleteCheck').val('1')
			$('#viewVote').html(cont);
			
		},
		error:function(){
			
		}
	}).submit();

}
</script>

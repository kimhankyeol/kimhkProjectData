<%@page import="poly.dto.SurveyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<SurveyDTO> sList =(List<SurveyDTO>)request.getAttribute("sList"); %>
<script>
$(document).ready( function () {
    $('#myTable').DataTable();
} );
</script>


<div class="row">
	<div class="col-lg-12">                  
		<h1 class="page-header">발표 리스트</h1>
	</div>
</div>
<table id="myTable">
<thead>
<tr>
<th><input type="checkbox" id="checkAll" /></th>
<th>발표 방번호</th>
<th>발표 제목</th>
<th>업로드 날짜</th>
<th>다운로드 가능 여부</th>
</tr>
</thead>
<tbody>
<% for(int i =  0 ; i<sList.size(); i++){ %>
<tr>
<td style="text-align:center"><input type="checkbox"  name="check" value="<%=sList.get(i).getManageCode()%>"/></td>
<td style="text-align:center"><%=sList.get(i).getManageCode() %></td>
<td style="text-align:center"><a href="/pt/ptUpdate.do?manageCode=<%=sList.get(i).getManageCode()%>"><%=sList.get(i).getManageTitle() %></a></td>
<td style="text-align:center"><%=sList.get(i).getRegDate() %></td>
<% if(sList.get(i).getDownCk().toString()=="0"){ %>
<td style="text-align:center"><i class="fa fa-cloud-download fa-2x" style="color:red"></i>다운로드 불가</td>
<% }else{%>
<td style="text-align:center"><i class="fa fa-cloud-download fa-2x" style="color:green"></i>다운로드 가능</td>
<%} %>
</tr>
<%} %>
</tbody>
</table>
<div style="width:50%;float:left">
	<div onclick="javascript:surveyAdd()" class="btn btn-primary" style="cursor:pointer;width:92.5%;margin-left:5%;margin-right:2.5%;;margin-top:15px">발표 등록</div>
</div>
<div style="width:50%;float:left">
	<div onclick="javascript:surveyDel()" class="btn btn-danger" style="width:92.5%;margin-left:2.5%;margin-right:5%;;margin-top:15px">발표 삭제</div>
</div>
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkAll").click(function(){
        //클릭되었으면
        if($("#checkAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
})

//발표 등록 최대 5개까지
function surveyAdd(){
	location.href="/pt/ptReg.do"	
}


//발표 삭제

function surveyDel(){
	var manageCodeArr=[];
	$('input[name=check]:checked').each(function(index){
		manageCodeArr.push($(this).val());
	})
	
	if($('input[name=check]').is(':checked')==false){
		alert('발표가 선택 되지 않았습니다.')
	}else{
		location.href="/pt/ptDelete.do?manageCodeArr="+manageCodeArr;
	}
	
	
	
}

</script>
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
<script>
function openInviteModal(){
	showInviteForm();
	 setTimeout(function(){
	    $('#inviteModal').modal('show');    
	    }, 230);
	}
function showInviteForm(){
	 $('#inviteModal .registerBox').fadeOut('fast',function(){
	        $('.registerBox').fadeIn('fast');
	        $('.register-footer').fadeOut('fast',function(){
	            $('.login-footer').fadeIn('fast');    
	        });
	        
	       
	    });       
	     $('.error').removeClass('alert alert-danger').html(''); 
}
</script>
<style>
		/*
		 *
		 * login-register modal
		 * Autor: Creative Tim
		 * Web-autor: creative.tim
		 * Web script: http://creative-tim.com
		 * 
		 */
		 
		/*  Shake animation  */
		
		@charset "UTF-8";
		
		.animated {
		  -webkit-animation-duration: 1s;
			   -moz-animation-duration: 1s;
			     -o-animation-duration: 1s;
			        animation-duration: 1s;
			-webkit-animation-fill-mode: both;
			   -moz-animation-fill-mode: both;
			     -o-animation-fill-mode: both;
			        animation-fill-mode: both;
		}
		
		.animated.hinges {
			-webkit-animation-duration: 2s;
			   -moz-animation-duration: 2s;
			     -o-animation-duration: 2s;
			        animation-duration: 2s;
		}
		
		.animated.slow {
			-webkit-animation-duration: 3s;
			   -moz-animation-duration: 3s;
			     -o-animation-duration: 3s;
			        animation-duration: 3s;
		}
		
		.animated.snail {
			-webkit-animation-duration: 4s;
			   -moz-animation-duration: 4s;
			     -o-animation-duration: 4s;
			        animation-duration: 4s;
		}
		
		@-webkit-keyframes shake {
			0%, 100% {-webkit-transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {-webkit-transform: translateX(-10px);}
			20%, 40%, 60%, 80% {-webkit-transform: translateX(10px);}
		}
		
		@-moz-keyframes shake {
			0%, 100% {-moz-transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {-moz-transform: translateX(-10px);}
			20%, 40%, 60%, 80% {-moz-transform: translateX(10px);}
		}
		
		@-o-keyframes shake {
			0%, 100% {-o-transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {-o-transform: translateX(-10px);}
			20%, 40%, 60%, 80% {-o-transform: translateX(10px);}
		}
		
		@keyframes shake {
			0%, 100% {transform: translateX(0);}
			10%, 30%, 50%, 70%, 90% {transform: translateX(-10px);}
			20%, 40%, 60%, 80% {transform: translateX(10px);}
		}
		
		.shake {
			-webkit-animation-name: shake;
			-moz-animation-name: shake;
			-o-animation-name: shake;
			animation-name: shake;
		}
		
		.login .modal-dialog{
		   
		}
		.login .modal-footer{
		    border-top: 0;
		    margin-top: 0px;
		    padding: 10px 20px 20px;
		}
		.login .modal-header {
		    border: 0 none;
		    padding: 15px 15px 15px;
		/*     padding: 11px 15px; */
		}
		.login .modal-body{
		/*     background-color: #eeeeee; */
		}
		.login .division {
		    float: none;
		    margin: 0 auto 18px;
		    overflow: hidden;
		    position: relative;
		    text-align: center;
		    width: 100%;
		}
		.login .division .line {
		    border-top: 1px solid #DFDFDF;
		    position: absolute;
		    top: 10px;
		    width: 34%;
		}
		.login .division .line.l {
		    left: 0;
		}
		.login .division .line.r {
		    right: 0;
		}
		.login .division span {
		    color: #424242;
		    font-size: 17px;
		}
		.login .box .social {
		    float: none;
		    margin: 0 auto 30px;
		    text-align: center;
		}
		
		.login .social .circle{
		    background-color: #EEEEEE;
		    color: #FFFFFF;
		    border-radius: 100px;
		    display: inline-block;
		    margin: 0 17px;
		    padding: 15px;
		}
		.login .social .circle .fa{
		    font-size: 16px;
		}
		.login .social .facebook{
		    background-color: #455CA8;
		    color: #FFFFFF;
		}
		.login .social .google{
		    background-color: #F74933;
		}
		.login .social .github{
		    background-color: #403A3A;
		}
		.login .facebook:hover{
		    background-color: #6E83CD;
		}
		.login .google:hover{
		    background-color: #FF7566;
		}
		.login .github:hover{
		    background-color: #4D4D4d;;
		}
		.login .forgot {
		    color: #797979;
		    margin-left: 0;
		    overflow: hidden;
		    text-align: center;
		    width: 100%;
		}
		.login .btn-login, .registerBox .btn-register{
		    background-color: #00BBFF;
		    border-color: #00BBFF;
		    border-width: 0;
		    color: #FFFFFF;
		    display: block;
		    margin: 0 auto;
		    padding: 15px 50px;
		    text-transform: uppercase;
		    width: 100%;
		}
		.login .btn-login:hover, .registerBox .btn-register:hover{
		    background-color: #00A4E4;
		    color: #FFFFFF;
		}
		.login .form-control{
		    border-radius: 3px;
		    background-color: rgba(0, 0, 0, 0.09);
		    box-shadow: 0 1px 0px 0px rgba(0, 0, 0, 0.09) inset;
		    color: #FFFFFF;
		}
		.login .form-control:hover{
		    background-color: rgba(0,0,0,.16);
		}
		.login .form-control:focus{
		    box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.04) inset;
		    background-color: rgba(0,0,0,0.23);
		    color: #FFFFFF;
		}
		.login .box .form input[type="text"], .login .box .form input[type="password"] ,.form input[type="tel"]{
		    border-radius: 3px;
		    border: none;
		    color: #333333;
		    font-size: 16px;
		    height: 46px;
		    margin-bottom: 5px;
		    padding: 13px 12px;
		    width: 100%;
		}
		
		
		@media (max-width:400px){
		    .login .modal-dialog{
		    }
		}
		
		.big-login, .big-register{
		    background-color: #ffffff;
		    color: #FFFFFF;
		    border-radius: 7px;
		    border-width: 2px;
		    font-size: 14px;
		    font-style: normal;
		    font-weight: 200;
		    padding: 16px 60px;
		    text-transform: uppercase;
		    transition: all 0.3s ease 0s;
		}
		.big-login:hover{
		    background-color: #00A4E4;
		    color: #FFFFFF;
		}
		.big-register{
		    background-color: rgba(0,0,0,.0);
		    color: #00bbff;
		    border-color: #00bbff;
		}
		.big-register:hover{
		    border-color: #00A4E4;
		    color:  #00A4E4;
		}
		
		
	</style>

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
	<div onclick="javascript:surveyDel()" class="btn btn-danger" style="cursor:pointer;width:92.5%;margin-left:2.5%;margin-right:5%;;margin-top:15px">발표 삭제</div>
</div>
<div style="width:100%">
	<div data-toggle="modal" onclick="javascript:openInviteModal()" class="btn btn-success" style="cursor:pointer;width:95%;margin-left:2.5%;margin-right:2.5%;;margin-top:15px">초대 하기</div>
</div>

	<div class="container">
				 <div class="modal fade login" id="inviteModal">
				      <div class="modal-dialog login animated">
		    		      <div class="modal-content">
		    		         <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">ID/PW FIND</h4>
		                    </div>
		                    <div class="modal-body">  
		                        <div class="box">
		                             <div class="content">
		                               <!-- 아이디 찾기 --> 
		                                 <div class="division">
		                                    <div class="line l"></div>
		                                      <span>초대 하기</span>
		                                    <div class="line r"></div>
		                                </div>
		                             <form action="/inviteFriend.do">
		                                <div id="invitePeople" class="form loginBox">
		                                 <div class="form-group"><input type="text" name="inviteFriend" class="form-control invite" placeholder="친구 이메일을 입력해주세요"></div>
		                                </div>
		                                 <div class="division">
		                                    <div class="line l"></div>
		                                      <span>방 번호</span>
		                                    <div class="line r"></div>
		                                </div>
		                                <div class="form-group" style="width:100%">
		                                 <select style="width:100%" name="manageCode">
		                                 <% for(int i =  0 ; i<sList.size(); i++){ %>
		                                 	<option  value="<%=sList.get(i).getManageCode()%>"><%=sList.get(i).getManageCode()%></option>
		                                
		                            	 <%} %>
		                            	  </select>
		                            	  </div>
		                               <input type="hidden"  name="userNo" value='<%=session.getAttribute("userNo") %>'/>
		                                <input type="hidden"  name="name" value='<%=session.getAttribute("name") %>'/>  
		                            
		                                <div style="width:50%;float:left">
											<div onclick="javascript:inviteAdd()" class="btn btn-primary" style="cursor:pointer;width:92.5%;margin-left:5%;margin-right:2.5%;;margin-top:15px">청중 추가</div>
										</div>
										<div style="width:50%;float:left">
											<div onclick="javascript:inviteDel()" class="btn btn-danger" style="cursor:pointer;width:92.5%;margin-left:2.5%;margin-right:5%;;margin-top:15px">청중 삭제</div>
										</div>
		                            	<button type="submit" class="btn btn-success" style="cursor:pointer;width:95%;margin-left:2.5%;margin-right:2.5%;;margin-top:15px">초대 하기</button>
		                             </form>
		                             </div>
		                        </div>
		                       
		                    </div>
		                    <div class="modal-footer">
		                        <div class="forgot login-footer">
		                            <span>
		                              다양한 친구들을 초대해보세요 
		                          </span>
		                        </div>
		                    </div>        
		    		      </div>
				      </div>
				  </div>
		    </div>
<script>



</script>


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
//초대 추가 삭제
function inviteAdd(){
	var iLength=$('.invite').length;
	if(iLength<10){
	$('#invitePeople').append('<div class="form-group"><input type="text" name="inviteFriend" class="form-control invite" placeholder="친구 이메일을 입력해주세요"></div>');
	}else{
		alert('청중을 최대 10명까지 초대 할 수 있습니다.');
		return false;
	}	
	
}
function inviteDel(){
	var iLength=parseInt($('.invite').length)-1;
	
		if(iLength>0){
			$("input[name=inviteFriend]").eq(iLength).remove();
		}else{
			alert('청중을 최소 1명부터 초대 해야합니다. 있습니다.');
			return false;
		}
	
}


</script>
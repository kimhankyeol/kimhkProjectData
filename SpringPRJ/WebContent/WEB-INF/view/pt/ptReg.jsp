<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<%@include file="/WEB-INF/view/headerScript.jsp" %>
<%@include file="ptCss.jsp" %>

</head>
<body>
<%@include file="/WEB-INF/view/headerAIS.jsp" %>
		<div class="bg-image bg-parallax overlay" style="background-image:url(/img/home-background.jpg)"></div>
		<!-- multistep form -->
			<form id="msform" name="msform" action="/ptReg/ptFileUpload.do" enctype="multipart/form-data" method="post">
				<!-- progressbar -->
				<ul id="progressbar">
					<li class="active">발표방 생성</li>
					<li>발표자료 업로드</li>
					<li>발표자료 미리보기</li>
				</ul>
				<!-- fieldsets -->
				<fieldset>
					<h2 class="fs-title">Create Presentation</h2>
					<h3 class="fs-subtitle">발표 제목 등록</h3>
					<input type="text" name="preTitle" id="preTitle" placeholder="발표 제목을 입력하세요" />
					<input type="text" name="preContent" id="preContent" placeholder="발표 내용을 간단하게 입력하세요" />
					<input type="button" name="next" class="next action-button" value="Next" />
				</fieldset>
				<fieldset>
					<h2 class="fs-title">PPT ,PDF FILE UPLOAD</h2>
					<h3 class="fs-subtitle">발표할 PPT,PDF 파일을 업로드 하세요.<br><small>최대 100MB</small></h3>
					 <div class="file-upload">
					  <div class="file-select">
					    <div class="file-select-button" id="fileName">파일 선택</div>
					    <div class="file-select-name" id="noFile" >파일이 없습니다.</div> 
					    <input type="file" name="preFile" id="preFile" >
					  </div>
					</div>
					<!-- 업로드 가능한지 텍스트로 나타냄 -->
					<div id="uploadText" class="col-md-12">
					</div>
					<div class="col-md-12">
						<label class="switch">
							  <input  name="downCk" id="downCk" type="checkbox" />
							  <span class="slider round"></span>
						</label>
							<!-- 다운로드 체크여부 -->
							  <input name="downCkVal" type="hidden" value="0"/>
							 <!-- 유저넘버 -->
							  <input name="userNo" type="hidden" value="<%=userNo%>">
					</div>
					<div id="downCkText" class="col-md-12" style="text-align:center"></div>
					
			<input type="button" name="previous" class="previous action-button" value="Previous" />
					<input type="button" name="next" class="next action-button" value="Next" />
				</fieldset>
				<fieldset>
					<h2 class="fs-title">발표자료 미리보기 </h2>
					<h3 class="fs-subtitle">PPT를 PDF로 변환하여 미리 볼 수 있습니다.</h3>
     <!--   <input id="previewImage" type="button" value="Preview"  />
       <div id="pptView">
       </div> -->
       	<input type="button" value="Preview" onclick="PreviewImage()"/>
 		
         <div style="clear:both">
           <iframe id="viewer" frameborder="0" scrolling="no" width="100%" height="auto"></iframe>
        </div> 

					<input type="button" name="previous" class="previous action-button" value="Previous" />
					<input type="submit" name="submit" class="submit action-button" value="Submit" />
				</fieldset>
			</form>
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/main.js"></script>	
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.gdocsviewer.min.js"></script>
	<script type="text/javascript" src="/js/userValid.js"></script>
	<script>
	/* $(function(){
		$('#previewImage').click(function(){
			 ptFileVal=$("#preFile").val()
			 console.log(ptFileVal)
			 if(ptFileVal==''){
				 alert('발표자료를 등록되지 않았습니다.')
				 return false;
			 }else{
				 ptFile=document.getElementById("preFile").files[0];
				 ptFile_url=URL.createObjectURL(ptFile);
			     console.log(ptFile_url)
			     console.log(ptFile.name)
			     var cont='<a href="'+ptFileVal+'"class="embed"></a>';
			   	  
			     console.log(cont)
			    $('#pptView').html(cont);
				$('a.embed').gdocsViewer({width:480,height:350})
			    $('#embedURL').gdocsViewer();

			 }
			 
			
		})
	})
	
	 */
	</script>
    <script type="text/javascript">
 			function PreviewImage() {
                pdffile=document.getElementById("preFile").files[0];
                console.log(pdffile)
                pdffile_url=URL.createObjectURL(pdffile);
                console.log(pdffile_url)
                $('#viewer').attr('src',pdffile_url);
            }
    </script>
	<script>
				//jQuery time
				var current_fs, next_fs, previous_fs; 
				var left, opacity, scale; //fieldset properties which we will animate
				var animating; //flag to prevent quick multi-click glitches
			
				$(".next").click(function(){
					
					if($('#preTitle').val()==''){
						alert("제목을 입력해주세요")
						$('#preTitle').focus();
						return false;
					}else if($('#preContent').val()==''){
						alert("소제목을 입력해주세요")
						$('#preContent').focus();
						return false;
					}else{
						if(animating) return false;
						animating = true;
						
						current_fs = $(this).parent();
						next_fs = $(this).parent().next();
						
						//activate next step on progressbar using the index of next_fs
						$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
						
						//show the next fieldset
						next_fs.show(); 
						//hide the current fieldset with style
						current_fs.animate({opacity: 0}, {
							step: function(now, mx) {
								//as the opacity of current_fs reduces to 0 - stored in "now"
								//1. scale current_fs down to 80%
								scale = 1 - (1 - now) * 0.2;
								//2. bring next_fs from the right(50%)
								left = (now * 50)+"%";
								//3. increase opacity of next_fs to 1 as it moves in
								opacity = 1 - now;
								current_fs.css({'transform': 'scale('+scale+')'});
								next_fs.css({'left': left, 'opacity': opacity});
							}, 
							duration: 800, 
							complete: function(){
								current_fs.hide();
								animating = false;
							}, 
							//this comes from the custom easing plugin
							easing: 'easeInOutBack'
						});
						
					}
				});
			
				$(".previous").click(function(){
					if(animating) return false;
					animating = true;
					
					current_fs = $(this).parent();
					previous_fs = $(this).parent().prev();
					
					//de-activate current step on progressbar
					$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
					
					//show the previous fieldset
					previous_fs.show(); 
					//hide the current fieldset with style
					current_fs.animate({opacity: 0}, {
						step: function(now, mx) {
							//as the opacity of current_fs reduces to 0 - stored in "now"
							//1. scale previous_fs from 80% to 100%
							scale = 0.8 + (1 - now) * 0.2;
							//2. take current_fs to the right(50%) - from 0%
							left = ((1-now) * 50)+"%";
							//3. increase opacity of previous_fs to 1 as it moves in
							opacity = 1 - now;
							current_fs.css({'left': left});
							previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
						}, 
						duration: 800, 
						complete: function(){
							current_fs.hide();
							animating = false;
						}, 
						//this comes from the custom easing plugin
						easing: 'easeInOutBack'
					});
				});
			
			
				
	</script>
	<!--파일 업로드 자바 스크립트 -->
	<script>
	$('#preFile').bind('change', function () {
		  var filename = $("#preFile").val();
		  if (/^\s*$/.test(filename)) {
		    $(".file-upload").removeClass('active');
		    $("#noFile").text("No file"); 
		  }
		  else {
		    $(".file-upload").addClass('active');
		    $("#noFile").text(filename.replace("C:\\fakepath\\", "")); 
		    var thumbtext = $('#preFile').val();
			thumbtext=thumbtext.slice(thumbtext.indexOf(".")+1).toLowerCase();//파일 확장자를 잘라내고 ,비교를 위해 소문자로 만듬
		    if(thumbtext != "ppt" && thumbtext != "pptx" &&  thumbtext != "pdf"){ //확장자를 확인합니다.
				alert('파일 등록은 ppt, pptx, pdf만 가능합니다.');
				$('#preFile').focus();
				return false;
		  	}
		  }
		});
	//전송 유효성 검사
	$(".submit").click(function (){
	var fileMaxSize=100*1024*1024; //100MB 크기 제한 나중에 바꿀거임
		var filename = $('#preFile').val();
		var fileSize=document.getElementById("preFile").files[0].size
		thumbtext=filename.slice(filename.indexOf(".")+1).toLowerCase();//파일 확장자를 잘라내고 ,비교를 위해 소문자로 만듬
		
		if($('#preFile').val()==''){
			alert('발표자료를 등록하지 않았습니다.')
			$('#preFile').focus();
			return false;
		}else if(thumbtext != "ppt" && thumbtext != "pptx" &&  thumbtext != "pdf"){ //확장자를 확인합니다.
			alert('파일 등록은 ppt, pptx, pdf만 가능합니다.');
			$('#preFile').focus();
			return false;
		}else if(fileSize>=fileMaxSize){
				alert('파일 등록은 100MB 이하만 가능합니다.')
				return false;
		}else{
			var f=document.msform;
			f.action = "/ptReg/ptFileUpload.do";
			// 파일 전송이 필요할 경우만 씀.
			f.encoding = "multipart/form-data";
			f.submit();
		} 
		
		
	})
	
	</script>
	<!-- 파일 업로드 자바스크립트 -->
	<!-- 파일 다운로드 여부 체크 -->
	<script>
	$(function(){
		$('#downCkText').html('<h3 style="color:red">다운로드 불가능</h3>')
		$('input[name=downCk]').click(function(){
			if($('input[name=downCkVal]').val()==0){
				$('input[name=downCkVal]').val('1')
				$('#downCkText').html('<h3 style="color:green">다운로드 가능</h3>')
			}else{
				$('input[name=downCkVal]').val('0')
				$('#downCkText').html('<h3 style="color:red">다운로드 불가능</h3>')
			}
				
		})
		
	})
	
	</script>
	<!-- 파일 다운로드 여부 체크 -->
	<!-- 로그인 회원가입-->
	<%@include file="/WEB-INF/view/footerLoginRegModal.jsp" %>
</body>
</html>
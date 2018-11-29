package poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.springframework.http.HttpRange;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.SplitCharacter;
import com.sun.net.httpserver.HttpServer;

import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;
import poly.dto.QuestionDTO;
import poly.dto.SurveyDTO;
import poly.service.IPtService;
import poly.service.IQuestionService;
import poly.service.impl.UserService;
import poly.util.CmmUtil;
import poly.util.PPTtoPDFConverter;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@CrossOrigin(origins="*")
@Controller
public class PtController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="PtService")
	private IPtService ptService;
	@Resource(name="QuestionService")
	private IQuestionService questionService;
	
	String filePathOrg="C:\\Users\\data12\\git\\SpringPRJ\\WebContent\\presentationPDF\\";
	
	//PT 등록하러가기 / 발표방생성
	@RequestMapping(value="/pt/ptReg")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		return "/pt/ptReg";
	}
	//PT 관리창
	@RequestMapping(value="/pt/ptManagement")
	public String  getPtManagement(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		String userNo=req.getParameter("userNo");
		log.info(userNo);
		List<SurveyDTO> sList = new ArrayList<>();
		sList= ptService.getPtManageMent(userNo);
		
		model.addAttribute("sList",sList);
		return "/pt/ptManagement";
		
	}
	
	//pt 리스트 
	@RequestMapping(value="/ptManagement/ptList")
	public String getPtList(HttpServletRequest req, Model model) throws Exception{
		String userNo=req.getParameter("userNo");
		List<SurveyDTO> sList = new ArrayList<>();
		sList= ptService.getPtManageMent(userNo);
		model.addAttribute("sList",sList);
		return "/pt/ptList";
	}

	//pt 글,파일 업로드
	//pt  확장자명이 ppt ,pptx 인거 pdf 로 변경  80% 완료 컨버터 쪽 pdf 크기만 조정하면 될듯
	@CrossOrigin
	@RequestMapping(value="/ptReg/ptFileUpload",method=RequestMethod.POST)
	public String ptRegTitleFile(HttpSession session,@RequestParam(value="preFile") MultipartFile file,@RequestParam(value="preTitle") String preTitle,@RequestParam(value="preContent") String preContent,@RequestParam(value="downCkVal") String downCk,@RequestParam(value="userNo") String userNo ,Model model) throws Exception{
		String email=(String)session.getAttribute("email");
		String filePath=filePathOrg+email+"\\";
		log.info(this.getClass()+"start pt title fileupload");
		log.info("유저번호:"+userNo);
		log.info("파일:"+file);
		log.info(file.getBytes());
		log.info(file.getContentType());
		log.info(file.getName());
		log.info(file.getOriginalFilename());
		log.info(file.getSize());
		log.info("제목:"+preTitle);
		log.info("내용:"+preContent);
		log.info("다운로드 여부 체크 "+ downCk);
		
	
		float fileSize= (float)file.getSize()/1024/1024;

	
	
		/////////////////////////////////
		//글등록
		ManagePresentationDTO mpDTO = new ManagePresentationDTO();
		//글 제목
		mpDTO.setManageTitle(preTitle);
		//글 내용
		mpDTO.setManageContent(preContent);
		//다운로드 체크 여부 0 ,1 
		mpDTO.setDownCk(downCk);
		//회원 번호 등록번호
		mpDTO.setRegNo(userNo);
		
		
		log.info("mpDTO get mTitle"+mpDTO.getManageTitle());
		log.info("mpDTO get mCont"+mpDTO.getManageContent());
		log.info("mpDTO get mDownCk"+mpDTO.getDownCk());
		log.info("mpDTO get UserNo"+mpDTO.getRegNo());
		
		///////////////////////////////////////
		
		//파일 등록 
		
		//서버 파일 재정의
		String fileServerName="";
		String fileOrgName=file.getOriginalFilename();
		String extended = fileOrgName.substring(fileOrgName.indexOf("."),fileOrgName.length());
		log.info(extended);
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
		log.info(now);
		fileServerName=filePath+now+extended;//새로운 파일명으로 저장할 위치경로 + 시간 + 확장자 
		String fileOrgNameLoc=filePath+fileOrgName;
		File newFile =new File(fileOrgNameLoc);
		if(!newFile.isDirectory()) {
			newFile.mkdirs();
		}
		file.transferTo(newFile);//이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
		//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
		//데이터를 DTO에 세팅
		PreFileDTO pfDTO= new PreFileDTO();
		//ppt 파일을 pdf로
		String pdfFileName=PPTtoPDFConverter.PPTtoPDFConverter(fileOrgName,email);
		pfDTO.setFileOrgName(pdfFileName);
		pfDTO.setFilePath(filePath);
		pfDTO.setFileServerName(fileServerName);
		pfDTO.setRegNo(userNo);
		pfDTO.setFileSize(String.valueOf(fileSize));

		//ppt 파일 삭제
		
		////////////////////////////////
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("mpDTO", mpDTO);
		hMap.put("pfDTO", pfDTO);
		//글 자료 등록
		hMap=ptService.insertPt(hMap);
		int result=Integer.parseInt(hMap.get("resultMP1").toString())+Integer.parseInt(hMap.get("resultMP2").toString())+Integer.parseInt(hMap.get("resultMP3").toString())+Integer.parseInt(hMap.get("resultMP4").toString());
		String msg="";
		String url="";
		
		log.info("합산"+result);
		if(result==4) {
			msg="발표 글, 자료가 등록 되었습니다.";
			url="/home.do";
		}else {
			msg="등록되지 않습니다.";
			url="redirect:/home.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		//초기화
		hMap=null;
		pfDTO=null;
		mpDTO=null;
		log.info(this.getClass()+"end pt title fileupload");
		return "/alert";
	}
	
	
	//발표 메인화면 
	@RequestMapping(value="/ptMain.do")
	public String getPtMain(HttpServletRequest req , HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass()+"ptMain start");
		String manageCode=CmmUtil.nvl(req.getParameter("manageCode"));
		log.info(manageCode);
		//발표 글,자료 조회
		ManagePresentationDTO mpDTO = new ManagePresentationDTO();
		ManagePresentationDTO mpDTO2 = new ManagePresentationDTO();
		PreFileDTO pfDTO=new PreFileDTO();
		mpDTO=ptService.getPtMain(manageCode);
		pfDTO=ptService.getPtMainFile(manageCode);
		//발표번호에 맞는 방 생성자 번호


		//글 , 자료를 model 객체에 저장
		model.addAttribute("mpDTO",mpDTO);
		model.addAttribute("mpDTO2",mpDTO2);
		model.addAttribute("pfDTO",pfDTO);

		//초기화
		mpDTO=null;
		mpDTO2=null;
		pfDTO=null;
		log.info(this.getClass()+"ptMain end");
		return "/pt/ptMain";
	}
	
	//발표 메인화면 
	@RequestMapping(value="/ptMain2.do")
	public String getPtMain2(HttpServletRequest req , HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass()+"ptMain start");
		String manageCode=CmmUtil.nvl(req.getParameter("manageCode"));
		log.info(manageCode);
		//발표 글,자료 조회
		ManagePresentationDTO mpDTO = new ManagePresentationDTO();
		ManagePresentationDTO mpDTO2 = new ManagePresentationDTO();
		PreFileDTO pfDTO=new PreFileDTO();

		mpDTO=ptService.getPtMain(manageCode);
		pfDTO=ptService.getPtMainFile(manageCode);
		
		//발표번호에 맞는 방 생성자 번호
		
		
		
		//전체 질문 조회
		QuestionDTO qDTO = new QuestionDTO();
		qDTO.setManageCode(manageCode);
		List<QuestionDTO> qList = questionService.getQuestionAll(qDTO);
		
		//글 , 자료를 model 객체에 저장
		model.addAttribute("mpDTO",mpDTO);
		model.addAttribute("mpDTO2",mpDTO2);
		model.addAttribute("pfDTO",pfDTO);
		model.addAttribute("qList",qList);
		
		//초기화
		mpDTO=null;
		mpDTO2=null;
		pfDTO=null;
		qDTO=null;
		qList=null;
		log.info(this.getClass()+"ptMain end");
		return "/pt/ptMain2";
	}
	@RequestMapping(value="/ptMain3.do")
	public String getPtMain3(HttpServletRequest req , HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass()+"start");
		String manageCode= req.getParameter("manageCode");
		String svAnsOptType=req.getParameter("svAnsOptType");
		SurveyDTO sDTO =new SurveyDTO();
		List<SurveyDTO> sList =new ArrayList<>();
		sDTO.setManageCode(manageCode);
		sDTO.setSurveyAnsOptType(svAnsOptType);
		
		sList=ptService.getSurveyView(sDTO);
		String msg="y";
		if(sList==null){
			msg="n";
			model.addAttribute("msg",msg);
		}
		
		model.addAttribute("sList",sList);
		model.addAttribute("msg",msg);
		log.info(this.getClass()+"end");
		
		return "/pt/ptMain3";
				
	}
	
	
	
/*	//투표 / 설문 클릭시 화면
	@RequestMapping(value="/pt/ptMainVoteSurvey.do")
	public String getPtMainVoteSurvey() throws Exception{
		return "/pt/ptMainVoteSurvey";
	}
*/

	//설문지 등록 
	@RequestMapping(value="/pt/surveyInsert")
	public @ResponseBody HashMap<String,Object> insertSurvey(HttpServletRequest req) throws Exception{
		String surveyTitle=CmmUtil.nvl(req.getParameter("surveyTitle"));
		String surveyQuestion=CmmUtil.nvl(req.getParameter("surveyQuestion"));
		String surveyQuestion1="";
		String surveyQuestion2="";
		String surveyTitleQ="";
		String surveyRegister=CmmUtil.nvl(req.getParameter("surveyRegister"));
		String manageCode=CmmUtil.nvl(req.getParameter("manageCode"));
		String regNo=CmmUtil.nvl(req.getParameter("regNo"));
		String svAnsOptType=req.getParameter("svAnsOptType");
		
		
		//surveyDTO
		SurveyDTO sDTO= new SurveyDTO();

		sDTO.setSurveyTitle(surveyTitle);
		sDTO.setSurveyRegister(surveyRegister);
		sDTO.setRegNo(regNo);
		sDTO.setManageCode(manageCode);
		sDTO.setSurveyAnsOptType(svAnsOptType);
		
		//sList
		List<SurveyDTO> sList=new ArrayList<>();
		//HashMap
		HashMap<String,Object> hMap = new HashMap<>();
		//surveyTitle
		SurveyDTO svtDTO=new SurveyDTO();
		SurveyDTO svtDTO1=new SurveyDTO();
		SurveyDTO svtDTO2=new SurveyDTO();
		
	
		
		
		int count=0;
		//설문 투표 등록은 각각 한개씩
		count=ptService.getSurveyCount(sDTO);
		log.info(count);
		
		int result2=0;
		if(count<1) {
			
		//surveyDTO 등록 
		int result=ptService.insertSurveyDTO(sDTO);
		log.info(result);
		//셀렉트키로 뽑아온 svNo
		String surveyNo=sDTO.getSurveyNo();
		
		if(req.getParameter("surveyQuestion1")!=null&&req.getParameter("surveyQuestion2")==null) {
			 surveyQuestion1=CmmUtil.nvl(req.getParameter("surveyQuestion1"));
			 
			 svtDTO.setSurveyNo(surveyNo);
			 svtDTO.setSurveyTitleQ(surveyQuestion);
			 svtDTO.setSurveyAnsOptType(svAnsOptType);
			 svtDTO.setManageCode(manageCode);
			 svtDTO.setRegNo(regNo);
			 sList.add(svtDTO);
			 svtDTO1.setSurveyNo(surveyNo);
			 svtDTO1.setSurveyTitleQ(surveyQuestion1);
			 svtDTO1.setSurveyAnsOptType(svAnsOptType);
			 svtDTO1.setManageCode(manageCode);
			 svtDTO1.setRegNo(regNo);
			 sList.add(svtDTO1);
			 
		}else if(req.getParameter("surveyQuestion1")!=null&&req.getParameter("surveyQuestion2")!=null) {
			 surveyQuestion1=CmmUtil.nvl(req.getParameter("surveyQuestion1"));
			 surveyQuestion2=CmmUtil.nvl(req.getParameter("surveyQuestion2"));
			 svtDTO.setSurveyNo(surveyNo);
			 svtDTO.setSurveyTitleQ(surveyQuestion);
			 svtDTO.setSurveyAnsOptType(svAnsOptType);
			 svtDTO.setManageCode(manageCode);
			 svtDTO.setRegNo(regNo);
			 sList.add(svtDTO);
			 svtDTO1.setSurveyNo(surveyNo);
			 svtDTO1.setSurveyTitleQ(surveyQuestion1);
			 svtDTO1.setSurveyAnsOptType(svAnsOptType);
			 svtDTO1.setManageCode(manageCode);
			 svtDTO1.setRegNo(regNo);	
			 sList.add(svtDTO1);
			 svtDTO2.setSurveyNo(surveyNo);
			 svtDTO2.setSurveyTitleQ(surveyQuestion2);
			 svtDTO2.setSurveyAnsOptType(svAnsOptType);
			 svtDTO2.setManageCode(manageCode);
			 svtDTO2.setRegNo(regNo);
			 sList.add(svtDTO2);
			 
		}else {
			 svtDTO.setSurveyNo(surveyNo);
			 svtDTO.setSurveyTitleQ(surveyQuestion);
			 svtDTO.setSurveyAnsOptType(svAnsOptType);
			 svtDTO.setManageCode(manageCode);
			 svtDTO.setRegNo(regNo);
			 sList.add(svtDTO);
		}

			
		 result2=ptService.insertSurveyTitleDTO(sList);
		 
			sList=null;
			svtDTO.setManageCode(manageCode);
			svtDTO.setSurveyAnsOptType(svAnsOptType);
			log.info(svtDTO.getManageCode());
			log.info(svtDTO.getSurveyAnsOptType());
			//등록후 ajax 에 데이터를 보여주기 위해 select 문으로 조회 해서 리스트에 저장
			//일단 설문지는 리스트 형식으로 조회
			sList=ptService.getSurveyView(svtDTO);
			
			log.info(sList);
			String msg="n";
			hMap.put("sList", sList);
			hMap.put("msg",msg);
		}else {
			String msg="y";
			hMap.put("msg",msg);
		}
		
		
		
		sDTO=null;
		svtDTO=null;
		svtDTO1=null;
		svtDTO2=null;
		
		
		return hMap;	
	}
	//설문지 화면 
	@RequestMapping(value="/pt/surveyView")
	public @ResponseBody List<SurveyDTO> getSurveyView(HttpServletRequest req) throws Exception{
	
		String manageCode=req.getParameter("manageCode");
		String svAnsOptType=req.getParameter("svAnsOptType");
	
		//surveyDTO
		SurveyDTO sDTO= new SurveyDTO();
		sDTO.setManageCode(manageCode);
		sDTO.setSurveyAnsOptType(svAnsOptType);
		
		
		List<SurveyDTO> sList = new ArrayList<>();
		
		sList=ptService.getSurveyAudView(sDTO);
		
		return sList;
	}
	
	//청중 설문지 등록
	@RequestMapping(value="/pt/surveyAudReg",method=RequestMethod.POST)
	public @ResponseBody int insertSurveyAud(HttpServletRequest req,@RequestParam(value="surveyAudVal",required=true) List<String> surveyAudVal,
			@RequestParam(value="surveyTitleQ",required=true) List<String> surveyTitleQ,
			@RequestParam(value="surveyTitleNo",required=true) List<String> surveyTitleNo) throws Exception{
	log.info(this.getClass()+"start");
	SurveyDTO sDTO=new SurveyDTO();
	
	String gender=req.getParameter("gender");
	String age=req.getParameter("age");
	String svAnsOptType=req.getParameter("svAnsOptType");
	log.info("429:"+svAnsOptType);
	
	
	int result=0;
		sDTO.setSurveyAnsAudGender(gender);
		sDTO.setSurveyAnsAudAge(age);
		
		sDTO.setSurveyAnsOptType(svAnsOptType);
	for(int i = 0 ;i<surveyAudVal.size();i++) {
		sDTO.setSurveyTitleNo(surveyTitleNo.get(i));
		sDTO.setSurveyAnsOptValue(surveyAudVal.get(i));
		sDTO.setSurveyTitleQ(surveyTitleQ.get(i));
		
		result=ptService.insertSurveyAnsAud(sDTO);
		if(result!=1) {
			return 0;
		}
	}
	log.info(this.getClass()+"end");
		
		return result;
	}
	
	//설문 삭제
	
	@RequestMapping(value="/pt/ptDelete")
	public String deleteSurvey(@RequestParam(value="manageCodeArr",required=true) List<String> manageCodeArr, HttpSession session,Model model) throws Exception{
		String email=(String)session.getAttribute("email");
	String filePath=filePathOrg+email+"\\";
	log.info(this.getClass()+"start");

	String userNo =(String)session.getAttribute("userNo");
	String manageCode="";
	int result=0;
	int result2=0;
	int result3=0;
	SurveyDTO sDTO = new SurveyDTO();	
	PreFileDTO pfDTO =new PreFileDTO();
	sDTO.setRegNo(userNo);
	
	for(int i =0 ;i<manageCodeArr.size();i++) {
		sDTO.setManageCode(manageCodeArr.get(i));
		manageCode=manageCodeArr.get(i);
		// 발표 삭제 
		 result=ptService.deletePt(sDTO);
		 log.info("result"+result);
		// 설문지 삭제
		 result2=ptService.deleteSurvey(sDTO);
		 log.info("result2"+result2);
		//파일 명 조회 
		 pfDTO=ptService.getPtMainFile(manageCode);
		 
		 //db에서 파일삭제
		 result3=ptService.deleteFile(sDTO);
		 log.info("result3"+result3);
		// 실제 경로 파일 삭제 
		 filePath=filePath+pfDTO.getFileOrgName();
		 log.info(filePath);
		 File file =new File(filePath);
		 if(file.exists()==true) {
			 file.delete();
		 }
		}
		String msg="";
		String url="";
		
			msg="발표 삭제에 성공했습니다.";
			url="/pt/ptManagement.do?userNo="+userNo;
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		log.info(this.getClass()+"end");
		return "/alert";
	}
	

	////////////////////////////////////////////////////
	//투표 등록
	@RequestMapping(value="/pt/voteInsert",method=RequestMethod.POST)
	public String insertVote(HttpServletRequest req,Model model,@RequestParam(value="voteQuestion") List<String> voteQuestion,@RequestParam(value="voteVal" ,required=false) List<String> voteVal,@RequestParam(value="voteVal1" ,required=false) List<String> voteVal1,@RequestParam(value="voteVal2",required=false) List<String> voteVal2) throws Exception{
		/*@ResponseBody List<SurveyDTO>*/
		String voteTitle=CmmUtil.nvl(req.getParameter("voteTitle"));
		String svAnsOptType=CmmUtil.nvl(req.getParameter("svAnsOptType"));
		String voteRegister=CmmUtil.nvl(req.getParameter("voteRegister"));
		String manageCode=CmmUtil.nvl(req.getParameter("manageCode"));
		String regNo=CmmUtil.nvl(req.getParameter("regNo"));
		String ckRadio0=CmmUtil.nvl(req.getParameter("ckRadio0"));
		String ckRadio1=CmmUtil.nvl(req.getParameter("ckRadio1"));
		String ckRadio2=CmmUtil.nvl(req.getParameter("ckRadio2"));
		
	
		SurveyDTO sDTO= new SurveyDTO();
		SurveyDTO sDTO1 = new SurveyDTO();
		SurveyDTO sDTO2 = new SurveyDTO();
		SurveyDTO sDTO3 = new SurveyDTO();
		int result=0;
		int result1=0;
	
		//제목 등록 
		sDTO.setSurveyTitle(voteTitle);
		sDTO.setSurveyRegister(voteRegister);
		sDTO.setRegNo(regNo);
		sDTO.setManageCode(manageCode);
		sDTO.setSurveyAnsOptType(svAnsOptType);;
		
		result=ptService.insertSurveyDTO(sDTO);
		String surveyNo=sDTO.getSurveyNo();

		int count=0;
		//설문 투표 등록은 각각 한개씩
		count=ptService.getSurveyCount(sDTO);
		if(count<1) {
		/*투표 val1 ,val2,val3*/
		List<HashMap<String,Object>> sList = new ArrayList<>();
		List<SurveyDTO> sList1 = new ArrayList<>();
		List<SurveyDTO> sList2 = new ArrayList<>();
		List<SurveyDTO> sList3 = new ArrayList<>();
		
		
		
		if(voteVal!=null&&voteVal1==null&&voteVal2==null) {
			log.info("1번실행");
			sDTO1.setSurveyTitleQ(voteQuestion.get(0).toString());
			sDTO1.setSurveyAnsOptType(svAnsOptType);
			sDTO1.setSurveyNo(surveyNo);
			sDTO1.setCkRadio(ckRadio0);
			sDTO1.setSurveyAnsOptNo("1");
			sDTO1.setManageCode(manageCode);
			sDTO1.setRegNo(regNo);
			for(int i =0;i<voteVal.size();i++) {
				HashMap<String,Object> hMap=new HashMap<>();
				
				hMap.put("surveyTitleQ",sDTO1.getSurveyTitleQ());
				hMap.put("surveyAnsOptType",sDTO1.getSurveyAnsOptType());
				hMap.put("surveyNo",sDTO1.getSurveyNo());
				hMap.put("ckRadio",sDTO1.getCkRadio());
				hMap.put("surveyAnsOptNo",sDTO1.getSurveyAnsOptNo());
				sDTO1.setSurveyAnsOptValue(voteVal.get(i));
				hMap.put("surveyAnsOptValue", sDTO1.getSurveyAnsOptValue());
				hMap.put("manageCode", sDTO2.getManageCode());
				hMap.put("regNo",sDTO1.getRegNo());
				sList.add(hMap);
				hMap=null;
			}
			
			sDTO.setSurveyNo(surveyNo);
			sDTO.setSurveyAnsOptType(svAnsOptType);
			
			result1=ptService.insertVote(sList);
			
			String msg="n";
			model.addAttribute("msg",msg);
			model.addAttribute("sList1",sList1);
			
		}else if(voteVal!=null&&voteVal1!=null&&voteVal2==null) {
			log.info("2번실행");
			sDTO.setSurveyNo(surveyNo);
			sDTO.setSurveyAnsOptType(svAnsOptType);
			
			sDTO1.setSurveyTitleQ(voteQuestion.get(0).toString());
			sDTO1.setSurveyAnsOptType(svAnsOptType);
			sDTO1.setSurveyNo(surveyNo);
			sDTO1.setCkRadio(ckRadio0);
			sDTO1.setSurveyAnsOptNo("1");
			sDTO1.setManageCode(manageCode);
			sDTO1.setRegNo(regNo);
			
			sDTO2.setSurveyTitleQ(voteQuestion.get(1).toString());
			sDTO2.setSurveyAnsOptType(svAnsOptType);
			sDTO2.setSurveyNo(surveyNo);
			sDTO2.setCkRadio(ckRadio1);
			sDTO2.setSurveyAnsOptNo("2");
			sDTO2.setManageCode(manageCode);
			sDTO2.setRegNo(regNo);
			
			for(int i =0;i<voteVal.size();i++) {
				HashMap<String,Object> hMap=new HashMap<>();
				
				hMap.put("surveyTitleQ",sDTO1.getSurveyTitleQ());
				hMap.put("surveyAnsOptType",sDTO1.getSurveyAnsOptType());
				hMap.put("surveyNo",sDTO1.getSurveyNo());
				hMap.put("ckRadio",sDTO1.getCkRadio());
				hMap.put("surveyAnsOptNo",sDTO1.getSurveyAnsOptNo());
				sDTO1.setSurveyAnsOptValue(voteVal.get(i));
				hMap.put("surveyAnsOptValue", sDTO1.getSurveyAnsOptValue());
				hMap.put("manageCode", sDTO1.getManageCode());
				hMap.put("regNo",sDTO1.getRegNo());
				sList.add(hMap);
				hMap=null;
			}
			
			result1=ptService.insertVote(sList);
			
			sList=new ArrayList<>();
			for(int i =0;i<voteVal1.size();i++) {
				HashMap<String,Object> hMap=new HashMap<>();
				
				hMap.put("surveyTitleQ",sDTO2.getSurveyTitleQ());
				hMap.put("surveyAnsOptType",sDTO2.getSurveyAnsOptType());
				hMap.put("surveyNo",sDTO2.getSurveyNo());
				hMap.put("ckRadio",sDTO2.getCkRadio());
				hMap.put("surveyAnsOptNo",sDTO2.getSurveyAnsOptNo());
				sDTO2.setSurveyAnsOptValue(voteVal1.get(i));
				hMap.put("surveyAnsOptValue", sDTO2.getSurveyAnsOptValue());
				hMap.put("manageCode", sDTO2.getManageCode());
				hMap.put("regNo",sDTO2.getRegNo());
				sList.add(hMap);
				hMap=null;
			}
			result1=ptService.insertVote(sList);
			sList=new ArrayList<>();
			sList1=ptService.getVoteValCount1(sDTO1);
			sList2=ptService.getVoteValCount2(sDTO2);
			
			String msg="n";
			model.addAttribute("msg",msg);
			model.addAttribute("sList1",sList1);
			model.addAttribute("sList2",sList2);
		
		}else if(voteVal!=null&&voteVal1!=null&&voteVal2!=null) {
			log.info("3번실행");
			sDTO.setSurveyNo(surveyNo);
			sDTO.setSurveyAnsOptType(svAnsOptType);
			
			sDTO1.setSurveyAnsOptNo("1");
			sDTO1.setSurveyTitleQ(voteQuestion.get(0).toString());
			sDTO1.setSurveyAnsOptType(svAnsOptType);
			sDTO1.setSurveyNo(surveyNo);
			sDTO1.setCkRadio(ckRadio0);
			sDTO1.setManageCode(manageCode);	
			sDTO1.setRegNo(regNo);
			
			sDTO2.setSurveyTitleQ(voteQuestion.get(1).toString());
			sDTO2.setSurveyAnsOptType(svAnsOptType);
			sDTO2.setSurveyNo(surveyNo);
			sDTO2.setCkRadio(ckRadio1);
			sDTO2.setSurveyAnsOptNo("2");
			sDTO2.setManageCode(manageCode);
			sDTO2.setRegNo(regNo);
			
			sDTO3.setSurveyTitleQ(voteQuestion.get(2).toString());
			sDTO3.setSurveyAnsOptType(svAnsOptType);
			sDTO3.setSurveyNo(surveyNo);
			sDTO3.setCkRadio(ckRadio2);
			sDTO3.setSurveyAnsOptNo("3");
			sDTO3.setManageCode(manageCode);
			sDTO3.setRegNo(regNo);
			
			for(int i =0;i<voteVal.size();i++) {
				HashMap<String,Object> hMap=new HashMap<>();
				
				sDTO1.setSurveyAnsOptValue(voteVal.get(i));
		
				hMap.put("surveyTitleQ",sDTO1.getSurveyTitleQ());
				hMap.put("surveyAnsOptType",sDTO1.getSurveyAnsOptType());
				hMap.put("surveyNo",sDTO1.getSurveyNo());
				hMap.put("ckRadio",sDTO1.getCkRadio());
				hMap.put("surveyAnsOptNo",sDTO1.getSurveyAnsOptNo());
				sDTO1.setSurveyAnsOptValue(voteVal.get(i));
				hMap.put("surveyAnsOptValue", sDTO1.getSurveyAnsOptValue());
				hMap.put("manageCode", sDTO1.getManageCode());
				hMap.put("regNo",sDTO1.getRegNo());
				sList.add(hMap);
				hMap=null;
			}
			result1=ptService.insertVote(sList);
			sList=new ArrayList<>();
			
			for(int i =0;i<voteVal1.size();i++) {
				HashMap<String,Object> hMap=new HashMap<>();
				
				sDTO2.setSurveyAnsOptValue(voteVal1.get(i));
				hMap.put("surveyTitleQ",sDTO2.getSurveyTitleQ());
				hMap.put("surveyAnsOptType",sDTO2.getSurveyAnsOptType());
				hMap.put("surveyNo",sDTO2.getSurveyNo());
				hMap.put("ckRadio",sDTO2.getCkRadio());
				hMap.put("surveyAnsOptNo",sDTO2.getSurveyAnsOptNo());
				sDTO2.setSurveyAnsOptValue(voteVal1.get(i));
				hMap.put("surveyAnsOptValue", sDTO2.getSurveyAnsOptValue());
				hMap.put("manageCode", sDTO2.getManageCode());
				hMap.put("regNo",sDTO2.getRegNo());
				sList.add(hMap);
				hMap=null;
			}
			result1=ptService.insertVote(sList);
			sList=new ArrayList<>();
			for(int i =0;i<voteVal2.size();i++) {
				HashMap<String,Object> hMap=new HashMap<>();
				
				sDTO3.setSurveyAnsOptValue(voteVal2.get(i));
				hMap.put("surveyTitleQ",sDTO3.getSurveyTitleQ());
				hMap.put("surveyAnsOptType",sDTO3.getSurveyAnsOptType());
				hMap.put("surveyNo",sDTO3.getSurveyNo());
				hMap.put("ckRadio",sDTO3.getCkRadio());
				hMap.put("surveyAnsOptNo",sDTO3.getSurveyAnsOptNo());
				hMap.put("surveyAnsOptValue", sDTO3.getSurveyAnsOptValue());
				hMap.put("manageCode", sDTO3.getManageCode());
				hMap.put("regNo",sDTO3.getRegNo());
				sList.add(hMap);
				hMap=null;
			}
			result1=ptService.insertVote(sList);
			sList=new ArrayList<>();
			
			sList1=ptService.getVoteValCount1(sDTO1);
			sList2=ptService.getVoteValCount2(sDTO2);
			sList3=ptService.getVoteValCount3(sDTO3);
		
			
			String msg="n";
			model.addAttribute("msg",msg);
			model.addAttribute("sList1",sList1);
			model.addAttribute("sList2",sList2);
			model.addAttribute("sList3",sList3);
			
		}
		
		//sDTO1 ,sDTO2, sDTO3에 조회하기 위한 변수 세팅
		sList=null;
		sList1=null;
		sList2=null;
		sList3=null;
		sDTO1=null;
		sDTO2=null;
		sDTO3=null;
		}else {
			String msg="투표는 1개만 등록가능합니다.";
			model.addAttribute("msg",msg);
			
		}
		return "/pt/ptMain4";
		
	}
	
	@RequestMapping(value="/ptMain4")
	public String getPtMain4(HttpServletRequest req,Model model ) throws Exception {
		String surveyNo="";
		String manageCode=req.getParameter("manageCode");
		String svAnsOptType =req.getParameter("svAnsOptType");

		log.info(manageCode);
		log.info(svAnsOptType);
		String msg="";
		SurveyDTO sDTO= new SurveyDTO();
		List<SurveyDTO> sList1 = new ArrayList<>();
		List<SurveyDTO> sList2 = new ArrayList<>();
		List<SurveyDTO> sList3 = new ArrayList<>();
		sDTO.setManageCode(manageCode);
		sDTO.setSurveyAnsOptType(svAnsOptType);
		surveyNo=ptService.getVoteSurveyNo(sDTO);
		sDTO.setSurveyNo(surveyNo);
		sList1=ptService.getVoteValCount1(sDTO);
		sList2=ptService.getVoteValCount2(sDTO);
		sList3=ptService.getVoteValCount3(sDTO);
		if(sList1!=null&&sList2==null&&sList3==null) {
			model.addAttribute("sList1", sList1);
			msg="n";
			model.addAttribute("msg",msg);
		}else if(sList1!=null&&sList2!=null&&sList3==null) {
			model.addAttribute("sList1", sList1);
			model.addAttribute("sList2", sList2);
			msg="n";
			model.addAttribute("msg",msg);
		}else if(sList1!=null&&sList2!=null&&sList3!=null) {
			model.addAttribute("sList1", sList1);
			model.addAttribute("sList2", sList2);
			model.addAttribute("sList3", sList3);
			msg="n";
			model.addAttribute("msg",msg);
		}else if(sList1==null&&sList2==null&&sList3==null) {
			msg="y";
			model.addAttribute("msg",msg);
		}
	
		
				
		
		sList1=null;
		sList2=null;
		sList3=null;
				
		return "/pt/ptMain4";
	}
	

	
}

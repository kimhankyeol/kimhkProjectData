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

import poly.dto.ManagePresentationDTO;
import poly.dto.NoticeDTO;
import poly.dto.PreFileDTO;
import poly.dto.QuestionDTO;
import poly.service.INoticeService;
import poly.service.IPtService;
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
	
	String filePath="C:\\Users\\data12\\git\\SpringPRJ\\WebContent\\presentationPDF\\";

	
	//PT 등록하러가기 / 발표방생성
	@RequestMapping(value="/pt/ptReg")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		return "/pt/ptReg";
	}
	//PT 관리창
	@RequestMapping(value="/pt/ptManagement")
	public String  getPtManagement(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return "/pt/ptManagement";
		
	}
/*	//ppt to pdf convert 미리보기 클릭했을때
	@RequestMapping(value="/convert/PPTtoPDF")
	public @ResponseBody String convertPPTtoPDF(@RequestParam(value="filePT") MultipartFile file) throws Exception{
		log.info(file.getOriginalFilename());
		log.info(file.getBytes());
		
		return null;
	}*/
	//pt 글,파일 업로드
	//pt  확장자명이 ppt ,pptx 인거 pdf 로 변경  80% 완료 컨버터 쪽 pdf 크기만 조정하면 될듯
	@CrossOrigin
	@RequestMapping(value="/ptReg/ptFileUpload",method=RequestMethod.POST)
	public String ptRegTitleFile(@RequestParam(value="preFile") MultipartFile file,@RequestParam(value="preTitle") String preTitle,@RequestParam(value="preContent") String preContent,@RequestParam(value="downCkVal") String downCk,@RequestParam(value="userNo") String userNo ,Model model) throws Exception{
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
		//여기는 ppt to pdf converter
		//
		/*String pdfFileName=PPTtoPDFConverter.PPTtoPDFConverter(file.getOriginalFilename());
		log.info("pdfFileName:"+pdfFileName);*/
	
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
		file.transferTo(newFile);//이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
		//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
		//데이터를 DTO에 세팅
		PreFileDTO pfDTO= new PreFileDTO();
		//ppt 파일을 pdf로
		String pdfFileName=PPTtoPDFConverter.PPTtoPDFConverter(fileOrgName);
		pfDTO.setFileOrgName(pdfFileName);
		pfDTO.setFilePath(filePath);
		pfDTO.setFileServerName(fileServerName);
		pfDTO.setRegNo(userNo);

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
		if(result==4) {
			msg="발표 글, 자료가 등록 되었습니다.";
			url="redirect:/home.do";
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
		String ptCode=req.getParameter("ptCode");
		log.info(ptCode);
		//발표 글,자료 조회
		ManagePresentationDTO mpDTO = new ManagePresentationDTO();
		ManagePresentationDTO mpDTO2 = new ManagePresentationDTO();
		PreFileDTO pfDTO=new PreFileDTO();
		mpDTO=ptService.getPtMain(ptCode);
		pfDTO=ptService.getPtMainFile(ptCode);
		//발표번호에 맞는 방 생성자 번호
		log.info(mpDTO.getManageTitle());
		log.info(mpDTO.getManageContent());
		log.info(mpDTO.getManageCode());


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
	//투표 / 설문 클릭시 화면
	@RequestMapping(value="/pt/ptMainVoteSurvey.do")
	public String getPtMainVoteSurvey() throws Exception{
		return "/pt/ptMainVoteSurvey";
	}

	
}

package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.NoticeDTO;
import poly.service.INoticeService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class PtController {
	private Logger log = Logger.getLogger(this.getClass());
	
	String filePath="C:\\kimhkProjectData\\SpringPRJ\\WebContent\\uploadFile";

	
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
	//pt  확장자명이 ppt ,pptx 인거 pdf 로 변경
	@RequestMapping(value="/ptReg/ptFileUpload",method=RequestMethod.POST)
	public String ptRegTitleFile(@RequestParam(value="preFile") MultipartFile file,@RequestParam(value="preTitle") String preTitle,@RequestParam(value="smallTitle") String smallTitle,@RequestParam(value="ckBox") String ckBox) throws Exception{
		log.info(this.getClass()+"start pt title fileupload");
		log.info("파일:"+file);
		log.info(file.getBytes());
		log.info(file.getContentType());
		log.info(file.getName());
		log.info(file.getOriginalFilename());
		log.info(file.getSize());
		log.info("제목:"+preTitle);
		log.info("소제목:"+smallTitle);
		log.info("다운로드 여부 체크 "+ ckBox);
		log.info(this.getClass()+"end pt title fileupload");
		return null;
	}
	
}

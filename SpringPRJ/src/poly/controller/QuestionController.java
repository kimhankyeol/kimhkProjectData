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
import poly.service.IQuestionService;
import poly.util.CmmUtil;
import poly.util.PPTtoPDFConverter;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class QuestionController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="QuestionService")
	IQuestionService questionService;
	
	
	//질문등록
	@RequestMapping(value="/pt/questionForm.do")
	public @ResponseBody List<QuestionDTO> insertQuestion(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		log.info(this.getClass()+"start");
		String chatName = CmmUtil.nvl(req.getParameter("chatName"));
		log.info(chatName);
		String questionContent= CmmUtil.nvl(req.getParameter("questionContent"));
		log.info(questionContent);
		String manageCode=req.getParameter("manageCode");
		log.info(manageCode);
		
		QuestionDTO qDTO= new QuestionDTO();
		qDTO.setQuestionContent(questionContent);
		qDTO.setManageCode(manageCode);
		qDTO.setCid(chatName);

		List<QuestionDTO> qList = questionService.getQuestion(qDTO);
		
		log.info(this.getClass()+"end");
		return qList;
	}
	//질문 전체 조회
	@RequestMapping(value="/pt/questionAllForm.do",method=RequestMethod.POST)
	public @ResponseBody List<QuestionDTO> getQuestionAll(HttpServletRequest req , HttpServletResponse resp) throws Exception {
	
		String manageCode=req.getParameter("manageCode");
		log.info(manageCode);
		QuestionDTO qDTO= new QuestionDTO();
		qDTO.setManageCode(manageCode);

		List<QuestionDTO> qList = questionService.getQuestionAll(qDTO);
		
		return qList;
	}
}

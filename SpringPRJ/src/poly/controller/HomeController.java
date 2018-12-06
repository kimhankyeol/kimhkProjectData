package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.xmlbeans.impl.xb.xsdschema.Attribute.Use;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.NoticeDTO;
import poly.dto.UserDTO;
import poly.service.INoticeService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.StringUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	IUserService userService;

	
	//연습
	@RequestMapping(value="home")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		
		//count 
		System.out.println("home");
		return "/home";
	}
	// 여기서부터 카카오 로그인
		@RequestMapping(value="/kakaoCallback")
		public String kakaoCallback(HttpServletRequest req, HttpSession session) throws Exception {
			String id = CmmUtil.nvl(req.getParameter("kId"));
			String name = CmmUtil.nvl(req.getParameter("kName"));
			String email=CmmUtil.nvl(req.getParameter("kEmail"));
			log.info("콜백"+id);
			log.info("콜백"+name);
			UserDTO uDTO =new UserDTO();
			
			name=StringUtil.spec(name, "\"");
			email=StringUtil.spec(email, "\"");

			uDTO.setEmail(email);
			uDTO.setUserName(name);

			int result = userService.getUserEmailCheck(email);
			if(result==0) {
				int result1 = userService.insertUserRegSns(uDTO);
				String userNo=uDTO.getUserNo();
				session.setAttribute("userNo", userNo);
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("snsVal", "y");
			}else {
				String userNo=userService.getFindUserNo(uDTO);
				session.setAttribute("userNo", userNo);
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("snsVal", "y");
			}
			
			
		
			return "redirect:/home.do";
		}
}


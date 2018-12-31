package poly.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.Email;
import poly.util.EmailSender;

@Controller
public class UserController {
	
	@Resource(name="UserService")
	private IUserService userService;
	@Autowired
	private EmailSender emailSender;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/user/myPage")
	public String getMyPage() throws Exception{
		
		return "/user/myPage";
	}
	
	//회원 가입 
	@RequestMapping(value="/user/userRegProc")
	public String userRegProc(HttpServletRequest req,Model model ) throws Exception {
		log.info("start userRegProc");

		 String email=req.getParameter("email") ;
		 log.info(email);
		 String password=req.getParameter("password");
		 log.info(password);
		 String name=req.getParameter("name");
		 log.info(name);
		 String tel=req.getParameter("tel");
		 log.info(tel);
		 
		 UserDTO uDTO = new UserDTO();
		 uDTO.setEmail(email);
		 uDTO.setPassWord(password);
		 uDTO.setUserName(name);
		 uDTO.setTel(tel);
		 
		 int result = userService.insertUserReg(uDTO);
		 log.info("회원가입 결과:"+result);
		//경고창에 메시지를 띄우기 위해
			String msg="";
			String url="";
			if(result ==1 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
				//회원가입이 정상적으로 이루어진 상태
				msg="회원가입에 성공하셨습니다.";
				url = "/home.do";
			}else {
				//회원가입이 이루어지지않은 상태
				msg="회원가입 실패";
				url="/home.do";
				
			}
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
		log.info("end regProc");
		return "/alert";
		
	}
	//회원 체크
		@RequestMapping(value="user/userChecked")
		@ResponseBody // ajax사용을 위해 지정해줘야됨 json으로 넘어온 email 매개변수 사용Map<Object,Object>@RequestBody String email
		public void getUserEmailCheck(HttpServletRequest req,HttpServletResponse res) throws Exception{
			String email=CmmUtil.nvl(req.getParameter("email"));
			
			
			int count=0;// 이메일 중복을 체크하기 위한 변수선언
			//Map<Object, Object> map = new HashMap<Object,Object>();
			
			count = userService.getUserEmailCheck(email);
			
			
			log.info(count);
			System.out.println("115번쨰 카운트:"+count);
			
			//getwriter 는  한개만 보낼때
			res.getWriter().println(count);
			//map.put("cnt", count);		
		}
		//로그인 
		@RequestMapping(value="/user/loginProc",method=RequestMethod.POST)
		public String loginProc(HttpServletRequest request,HttpSession session,Model model) throws Exception {
			//1. 
			String email=CmmUtil.nvl(request.getParameter("email"));
			log.info("email"+email);
			String password= CmmUtil.nvl(request.getParameter("password"));
			log.info("password:"+password);
			

			
			
			//로그인을 하고나서는 정보를 다받아와야되니 UserDTO 
			//2.데이터를 받아와서
			UserDTO uDTO =new UserDTO();
			uDTO.setEmail(email);
			uDTO.setPassWord(password);
		
			uDTO=userService.getUserLogin(uDTO);// 성공하지못하면 아무것도 가져오지 못해서 널
			String msg="";
			String url="";
			if(uDTO==null) {
				//로그인 실패
				msg="로그인실패하셨습니다.";
				url = "/home.do";
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				 		
				
				return "/alert";
			}else {
				//로그인 성공
				log.info(uDTO.getUserNo());
				session.setAttribute("email", uDTO.getEmail());
				session.setAttribute("name",uDTO.getUserName());
				session.setAttribute("userNo",uDTO.getUserNo());
			}
			//관리자만 관리버튼 나오게 하려고받는 것
			// userNo 도 받아야됨
			
			
			return "redirect:/home.do";
		}
		//회원 로그아웃
		@RequestMapping(value="user/logout")
		public String logout(HttpSession session) throws Exception{
			
			//세션을 초기화 시키는 함수
			session.invalidate();
			//로그아웃끝
			
			
			return "redirect:/home.do";
		}
		
		
		//id 찾기 
		@RequestMapping(value="/idFind")
		public @ResponseBody String idFind(HttpServletRequest req) throws Exception{
			String idName=req.getParameter("idName");
			log.info(idName);
			String idTel=req.getParameter("idTel");
			log.info(idTel);
			
			UserDTO uDTO =new UserDTO();
			uDTO.setUserName(idName);
			uDTO.setTel(idTel);
			
			String result = userService.getIdFind(uDTO);
			
			log.info(result);
			
			return result;
		}
		//id 찾기 
		@RequestMapping(value="/pwFind")
		public @ResponseBody String pwFind(HttpServletRequest req,Model model) throws Exception{
			String pwEmail=req.getParameter("pwEmail");
			String pwName=req.getParameter("pwName");
			String pwTel=req.getParameter("pwTel");
			
			//이메일을 보내기 위한 생성자
			Email sendEmail=new Email();
			UserDTO uDTO = new UserDTO();
			uDTO.setEmail(pwEmail);
			uDTO.setUserName(pwName);
			
			HashMap<String,Object> hMap =new HashMap<>();
			hMap.put("uDTO", uDTO);
			hMap=userService.updateTmpPass(hMap);
			String msg="";
			String url="";
			int result = (int) hMap.get("result");
			if(result == 0 ) {
				msg= "회원 정보가 일치하지 않습니다.";
				url="/home.do";
			}else {
				sendEmail.setReciver(pwEmail);
				log.info(sendEmail.getReciver());
				sendEmail.setSubject(pwName+"님 임시비밀번호");
				sendEmail.setContent(sendEmail.setContents(hMap));
				
				emailSender.SendEmail(sendEmail);
				
				msg = "가입하신 이메일로 임시비밀번호가 전송되었습니다.";
				url = "/home.do";
			}
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			hMap = null;
			uDTO = null;
			
			return null;
		}
		
		@RequestMapping(value="mypage")
		public String mypage( ) throws Exception{
			
			
			
			return "/user/myPage";
		}
		
}

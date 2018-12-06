package poly.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name="UserMapper")
	private  UserMapper userMapper;
	
	//회원가입
	@Override
	public int insertUserReg(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insertUserReg(uDTO);
	}
	//회원 이메일 중복 체크
	@Override
	public int getUserEmailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserEmailCheck(email);
	}
	//로그인
	@Override
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserLogin(uDTO);
	}
	//id찾기
	@Override
	public String getIdFind(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getIdFind(uDTO);
	}
	@Override
	public HashMap<String, Object> updateTmpPass(HashMap<String, Object> hMap) throws Exception {
		// TODO Auto-generated method stub
		UserDTO uDTO=(UserDTO)hMap.get("uDTO");
		//난수 임시비밀번호 
		long temp_Pw = (long) (Math.random() * 9000000000l) + 1000000000l;
		String temp_password = Long.toHexString(temp_Pw);
		uDTO.setPassWord(temp_password);
		// 결과값반환 리턴값이 hMap 이라 result 를 hMap에 저장하고 값을 컨트롤러에 보내야됨
		int result = userMapper.updateTmpPass(uDTO);

		// 반환한값을 hMap 에 저장

		hMap.put("tmpPass", temp_password);
		hMap.put("result", result);

		
		return hMap;
	}
	@Override
	public int insertUserRegSns(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insertUserRegSns(uDTO);
	}
	@Override
	public String getFindUserNo(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getFindUserNo(uDTO);
	}
}

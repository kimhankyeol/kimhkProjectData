package poly.service.impl;

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
}

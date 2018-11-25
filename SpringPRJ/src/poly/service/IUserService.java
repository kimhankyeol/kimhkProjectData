package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	//회원 가입
	public int insertUserReg(UserDTO uDTO) throws Exception;

	// 회원 중복 체크
	public int getUserEmailCheck(String email) throws Exception;
	
	//로그인
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;

	//id찾기
	public String getIdFind(UserDTO uDTO) throws Exception;
}

package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {

	//회원 가입
	public int insertUserReg(UserDTO uDTO) throws Exception;
	//이메일 중복 체크
	public int getUserEmailCheck(String email) throws Exception;
	//로그인
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
	//아이디 찾기
	public String getIdFind(UserDTO uDTO) throws Exception;
	//pw 찾기 바꾸기 이메일 
	public int updateTmpPass(UserDTO uDTO) throws Exception;

	
}

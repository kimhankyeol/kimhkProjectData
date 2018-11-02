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

	
}

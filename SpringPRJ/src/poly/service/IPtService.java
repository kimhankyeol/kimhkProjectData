package poly.service;

import java.util.HashMap;

import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;

public interface IPtService {

	//발표 글 파일 등록
	public HashMap<String, Object> insertPt(HashMap<String, Object> hMap) throws Exception;
	
	//코드번호 입력후 글 조회
	public ManagePresentationDTO getPtMain(String ptCode) throws Exception;

	//코드 번호 입력후 파일 조회 
	public PreFileDTO getPtMainFile(String ptCode) throws Exception;
	

}

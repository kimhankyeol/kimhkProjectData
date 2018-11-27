package poly.service;

import java.util.HashMap;
import java.util.List;

import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;
import poly.dto.SurveyDTO;

public interface IPtService {

	//발표 글 파일 등록
	public HashMap<String, Object> insertPt(HashMap<String, Object> hMap) throws Exception;
	
	//코드번호 입력후 글 조회
	public ManagePresentationDTO getPtMain(String manageCode) throws Exception;

	//코드 번호 입력후 파일 조회 
	public PreFileDTO getPtMainFile(String manageCode) throws Exception;

	//설문 등록 SurveyDTO 
	public int insertSurveyDTO(SurveyDTO sDTO) throws Exception;
	
	//설문등록 SurveyTitleDTO
	public int insertSurveyTitleDTO(List<SurveyDTO> sList) throws Exception;

	//설문 보여주기 getSurveyView
	public List<SurveyDTO> getSurveyView(SurveyDTO svtDTO) throws Exception;

	//설문 1개만 등록되기 위해 카운트
	public int getSurveyCount(SurveyDTO sDTO) throws Exception;

	//청중 설문 분석 보기
	public List<SurveyDTO> getSurveyAudView(SurveyDTO sDTO) throws Exception;
	
	//청중 설문 답 등록
	public int insertSurveyAnsAud(SurveyDTO sDTO) throws Exception;

	//발표 관리 창  
	public List<SurveyDTO> getPtManageMent(String userNo) throws Exception;

	
	
	//설문 삭제 
	public int deleteSurvey(SurveyDTO sDTO) throws Exception;
	//발표 삭제 
	public int deletePt(SurveyDTO sDTO) throws Exception;
	// 파일 삭제
	public int deleteFile(SurveyDTO sDTO) throws Exception;

	//투표 등록
	public int insertVote(List<HashMap<String,Object>> sList) throws Exception;


	


	

}

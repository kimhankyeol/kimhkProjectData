package poly.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import config.Mapper;
import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;
import poly.dto.SurveyDTO;

@Mapper("PtMapper")
public interface PtMapper {
	//발표 글등록
	public int insertPtText(ManagePresentationDTO mpDTO) throws Exception;
	//발표 파일 등록
	public int insertPtFile(PreFileDTO pfDTO) throws Exception;
	// 발표 입장코드 방번호 + 난수 (고유한 값으로 만들기 위해 방번호와 난수를 합침)
	public int updateManageCode(ManagePresentationDTO mpDTO2) throws Exception;
	//코드번호 입력후 발표 글 조회
	public ManagePresentationDTO getPtMain(String manageCode) throws Exception;
	//코드번호 입력후 발표 파일 조회
	public PreFileDTO getPtMainFile(String manageCode) throws Exception;
	//ManagementPresentation 에 fileNo을 넣기위해 만든 거 나중에 확인 후 불필요하면 지워도됨
	public int updateFileNo(PreFileDTO pfDTO) throws Exception;
	
	//설문등록 surveyDTO
	public int insertSurveyDTO(SurveyDTO sDTO) throws Exception;
	//설문 등록 surveyTitleDTO
	public int insertSurveyTitleDTO(List<SurveyDTO> sList) throws Exception;
	//설문 보여주기 getSurveyView
	public List<SurveyDTO> getSurveyView(SurveyDTO svtDTO) throws Exception;
	//설문지 등록은 1개만 
	public int getSurveyCount(SurveyDTO sDTO) throws Exception;
	//청중 설문지
	public List<SurveyDTO> getSurveyAudView(SurveyDTO sDTO);
	//청중 설문 등록
	public int insertSurveyAnsAud(SurveyDTO sDTO) throws Exception;
	//발표관리 화면
	public List<SurveyDTO> getPtManageMent(String userNo) throws Exception;
	//설문 삭제
	public int deleteSurvey(SurveyDTO sDTO) throws Exception;
	//발표 삭제
	public int deletePt(SurveyDTO sDTO) throws Exception;
	//파일 삭제
	public int deleteFile(SurveyDTO sDTO) throws Exception;
	//투표 등록
	public int insertVote(List<HashMap<String,Object>> sList) throws Exception;
	



	
}

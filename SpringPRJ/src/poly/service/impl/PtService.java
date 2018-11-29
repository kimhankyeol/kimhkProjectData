package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.stereotype.Service;

import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;
import poly.dto.SurveyDTO;
import poly.persistance.mapper.PtMapper;
import poly.service.IPtService;

@Service("PtService")
public class PtService implements IPtService{
	
	@Resource(name="PtMapper")
	private  PtMapper ptMapper;

	@Override
	public HashMap<String, Object> insertPt(HashMap<String,Object> hMap) throws Exception {
		// TODO Auto-generated method stub
	
		
		
		//발표 글등록
		ManagePresentationDTO mpDTO = (ManagePresentationDTO) hMap.get("mpDTO");
		long temp_code = (long) (Math.random() * 900l) + 100l;
		String manageCode = Long.toHexString(temp_code);
	    mpDTO.setManageCode(manageCode);
		int resultMP1=ptMapper.insertPtText(mpDTO);
		System.out.println("글등록 확인 1 성공"+resultMP1);
		String manageNo=mpDTO.getManageNo();
		System.out.println("방번호"+manageNo);
		
		//생성코드번호 + 방번호  '#'+
		String unionManageCode=manageCode+manageNo;
		ManagePresentationDTO mpDTO2=new ManagePresentationDTO();
		mpDTO2.setManageNo(manageNo);
		mpDTO2.setManageCode(unionManageCode);
		// 코드번호 업데이트
		int resultMP2=ptMapper.updateManageCode(mpDTO2);	
		
	
		PreFileDTO pfDTO=(PreFileDTO)hMap.get("pfDTO");
		pfDTO.setManageNo(manageNo);
		pfDTO.setManageCode(unionManageCode);
		
		int resultMP3=ptMapper.insertPtFile(pfDTO);
		System.out.println("파일등록 확인 1 성공"+resultMP3);
		//fileNo을 ManagementPresentation 에  넣기 위해 업데이트 구문 //  일단은 
		int resultMP4=ptMapper.updateFileNo(pfDTO);
		
		   hMap.put("resultMP1",resultMP1);
		   hMap.put("resultMP2",resultMP2);
		   hMap.put("resultMP3",resultMP3);
		   hMap.put("resultMP4",resultMP4);
		
		mpDTO=null;
		mpDTO2=null;
		pfDTO=null;
		
		return hMap;
	}
	
	//코드번호 입력후 발표 글 조회
	@Override
	public ManagePresentationDTO getPtMain(String manageCode) throws Exception {
		// TODO Auto-generated method stub
		//일단은 글만 조회 
		//파일은 나중에 조회
		return ptMapper.getPtMain(manageCode);
	}

	@Override
	public PreFileDTO getPtMainFile(String manageCode) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getPtMainFile(manageCode);
	}

	//설문 등록 SurveyDTO 
	@Override
	public int insertSurveyDTO(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.insertSurveyDTO(sDTO);
	}
/*
	@Override
	public int insertSurveyTitleDTO(SurveyTitleDTO svtDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.insertSurveyTitleDTO(svtDTO);
	}
	*/

	@Override
	public int insertSurveyTitleDTO(List<SurveyDTO> sList) throws Exception {
		// TODO Auto-generated method stub
		
		return ptMapper.insertSurveyTitleDTO(sList);
	}

	@Override
	public List<SurveyDTO> getSurveyView(SurveyDTO svtDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getSurveyView(svtDTO);
	}

	@Override
	public int getSurveyCount(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getSurveyCount(sDTO);
	}

	@Override
	public List<SurveyDTO> getSurveyAudView(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getSurveyAudView(sDTO);
	}

	@Override
	public int insertSurveyAnsAud(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.insertSurveyAnsAud(sDTO);
	}
	//발표관리  
	@Override
	public List<SurveyDTO> getPtManageMent(String userNo) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getPtManageMent(userNo);
	}
	//설문삭제
	@Override
	public int deleteSurvey(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.deleteSurvey(sDTO);
	}
	//발표 삭제
	@Override
	public int deletePt(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.deletePt(sDTO);
	}
	// 파일 삭제
	@Override
	public int deleteFile(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.deleteFile(sDTO);
	}

	//투표 등록
	@Override
	public int insertVote(List<HashMap<String,Object>> sList) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.insertVote(sList);
	}

	//투표 조회
	@Override
	public List<SurveyDTO> getVoteView(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getVoteView(sDTO);
	}
	//voteValCOunt 1,2,3
	@Override
	public List<SurveyDTO> getVoteValCount1(SurveyDTO sDTO1) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getVoteValCount1(sDTO1);
	}

	@Override
	public List<SurveyDTO> getVoteValCount2(SurveyDTO sDTO2) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getVoteValCount2(sDTO2);
	}

	@Override
	public List<SurveyDTO> getVoteValCount3(SurveyDTO sDTO3) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getVoteValCount3(sDTO3);
	}
	//투표 한개만 조회 되기 위한 카운트
	@Override
	public int getVoteCount(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getVoteCount(sDTO);
	}
	//투표조회후 리스트 뽑아오기 위해 surveyNO
	@Override
	public String getVoteSurveyNo(SurveyDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getVoteSurveyNo(sDTO);
	}



	
	
	

}

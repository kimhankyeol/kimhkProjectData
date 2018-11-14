package poly.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.stereotype.Service;

import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;
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
	public ManagePresentationDTO getPtMain(String ptCode) throws Exception {
		// TODO Auto-generated method stub
		//일단은 글만 조회 
		//파일은 나중에 조회
		return ptMapper.getPtMain(ptCode);
	}

	@Override
	public PreFileDTO getPtMainFile(String ptCode) throws Exception {
		// TODO Auto-generated method stub
		return ptMapper.getPtMainFile(ptCode);
	}
	

}

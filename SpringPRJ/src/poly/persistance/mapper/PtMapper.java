package poly.persistance.mapper;

import config.Mapper;
import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;

@Mapper("PtMapper")
public interface PtMapper {
	//발표 글등록
	public int insertPtText(ManagePresentationDTO mpDTO) throws Exception;
	//발표 파일 등록
	public int insertPtFile(PreFileDTO pfDTO) throws Exception;
	// 발표 입장코드 방번호 + 난수 (고유한 값으로 만들기 위해 방번호와 난수를 합침)
	public int updateManageCode(ManagePresentationDTO mpDTO2) throws Exception;
	//코드번호 입력후 발표 글 조회
	public ManagePresentationDTO getPtMain(String ptCode) throws Exception;
	//코드번호 입력후 발표 파일 조회
	public PreFileDTO getPtMainFile(String ptCode) throws Exception;
	//ManagementPresentation 에 fileNo을 넣기위해 만든 거 나중에 확인 후 불필요하면 지워도됨
	public int updateFileNo(PreFileDTO pfDTO) throws Exception;



	
}

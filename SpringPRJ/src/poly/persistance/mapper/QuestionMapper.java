package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ManagePresentationDTO;
import poly.dto.PreFileDTO;
import poly.dto.QuestionDTO;

@Mapper("QuestionMapper")
public interface QuestionMapper {
	//질문 등록 버튼
	public int insertQuestion(QuestionDTO qDTO) throws Exception;
	//질문 등록 버튼 클릭후 리스트 보여주기
	public List<QuestionDTO> getQuestion(QuestionDTO qDTO) throws Exception;
	//질문 전체 조회
	public List<QuestionDTO> getQuestionAll(QuestionDTO qDTO) throws Exception;

	
}

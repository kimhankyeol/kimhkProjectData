package poly.service;

import java.util.List;

import poly.dto.QuestionDTO;

public interface IQuestionService {
	//질문 등록버튼후 리스트
	public List<QuestionDTO> getQuestion(QuestionDTO qDTO) throws Exception;
	//질문 전체 조회
	public List<QuestionDTO> getQuestionAll(QuestionDTO qDTO) throws Exception;


}

package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.QuestionDTO;
import poly.persistance.mapper.QuestionMapper;
import poly.service.IQuestionService;

@Service("QuestionService")
public class QuestionService implements IQuestionService{
	
	@Resource(name="QuestionMapper")
	private  QuestionMapper questionMapper;

	@Override
	public List<QuestionDTO> getQuestion(QuestionDTO qDTO) throws Exception {
		// TODO Auto-generated method stub
		//질문 등록 하는 매퍼 실행
		questionMapper.insertQuestion(qDTO);
		return questionMapper.getQuestion(qDTO);
	}
	//질문 전체 조회
	@Override
	public List<QuestionDTO> getQuestionAll(QuestionDTO qDTO) throws Exception {
		// TODO Auto-generated method stub
		return questionMapper.getQuestionAll(qDTO);
	}

	

}

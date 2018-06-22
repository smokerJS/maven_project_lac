package kr.co.lac.chatting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lac.repository.domain.Chatting;
import kr.co.lac.repository.mapper.ChattingMapper;

@Service("chattingService")
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	private ChattingMapper mapper;

	@Override
	public void chattingSend(Chatting chatting) {
		mapper.insertChatting(chatting);
	}

	@Override
	public List<Chatting> retrieveChattingList(int projectNo) {
		return mapper.selectChattingList(projectNo);
	}

	@Override
	public Chatting retrieveChattingByChattingNo(int chattingNo) {
		return mapper.selectChattingByChattingNo(chattingNo);
	}

	@Override
	public void uploadFile(Chatting chatting) {
		mapper.uploadFile(chatting);
	}

	
}

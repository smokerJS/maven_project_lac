package kr.co.lac.repository.mapper;

import java.util.List;

import kr.co.lac.repository.domain.Chatting;

public interface ChattingMapper {
	public void insertChatting(Chatting chatting);
	public List<Chatting> selectChattingList(int projectNo);
	public Chatting selectChattingByChattingNo(int chattingNo);
	public void uploadFile(Chatting chatting);
}

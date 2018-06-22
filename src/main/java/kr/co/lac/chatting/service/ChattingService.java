package kr.co.lac.chatting.service;

import java.util.List;

import kr.co.lac.repository.domain.Chatting;

public interface ChattingService {
	public void chattingSend(Chatting chatting);
	public void uploadFile(Chatting chatting);
	public List<Chatting> retrieveChattingList(int projectNo);
	public Chatting retrieveChattingByChattingNo(int chattingNo);
}
 
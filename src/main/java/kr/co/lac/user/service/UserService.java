package kr.co.lac.user.service;

import kr.co.lac.repository.domain.User;

public interface UserService {
	public User selectUserEmail(String email) throws Exception;
	public User findUserByNo(int userNo) throws Exception;
	public void insertUser(User user) throws Exception;
	public void editPass(User user) throws Exception;
	public void editNick(User user) throws Exception;
	public void leaveId(User user) throws Exception;
	public int findUserByPass(User user) throws Exception;
	
}

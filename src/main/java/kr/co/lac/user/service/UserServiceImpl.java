package kr.co.lac.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lac.repository.domain.User;
import kr.co.lac.repository.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public User selectUserEmail(String email) throws Exception {
		return mapper.selectUserEmail(email);
	}

	@Override
	public void insertUser(User user) throws Exception {
		mapper.insertUser(user);
		user.setNickname(user.getNickname()+"님 가입을 환영합니다!");
		mapper.insertJoinNoti(user);
	}

	@Override
	public void editPass(User user) throws Exception {
		mapper.editPass(user);
		
	}

	@Override
	public void editNick(User user) throws Exception {
		mapper.editNick(user);
		
	}

	@Override
	public void leaveId(User user) throws Exception {
		mapper.leaveId(user);
		
	}

	@Override
	public int findUserByPass(User user) throws Exception {
		return mapper.findUserByPass(user);
	}

	@Override
	public User findUserByNo(int userNo) throws Exception {
		return mapper.findUserByNo(userNo);
	}
	
	
	
}

package kr.co.lac.firends.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.lac.repository.domain.FriendsRequest;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;
import kr.co.lac.repository.mapper.FriendsMapper;

@Service("friendsService")
public class FriendsServiceImpl implements FriendsService {
	
	@Autowired
	private FriendsMapper mapper;

	@Override
	public List<User> retrieveSearchFriends(Search search) {
		return mapper.selectSearchUser(search);
	}

	@Override
	public void requestFriends(FriendsRequest friendsRequest) {
		mapper.insertFriendsRequest(friendsRequest);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public void insertFriends(FriendsRequest friendsRequest) throws Exception {
		mapper.deleteFriendsRequest(friendsRequest);
		mapper.insertFriends(friendsRequest);
		int temp = friendsRequest.getfReqUNo();
		friendsRequest.setfReqUNo(friendsRequest.getfResUNo());
		friendsRequest.setfResUNo(temp);
		mapper.insertFriends(friendsRequest);
		mapper.deleteFriendsRequest(friendsRequest);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public void deleteFriends(FriendsRequest friendsRequest) throws Exception {
		mapper.deleteFriends(friendsRequest);
		int temp = friendsRequest.getfReqUNo();
		friendsRequest.setfReqUNo(friendsRequest.getfResUNo());
		friendsRequest.setfResUNo(temp);
		mapper.deleteFriends(friendsRequest);
		
	}

	@Override
	public void requestFriendsDelete(FriendsRequest friendsRequest) {
		mapper.deleteFriendsRequest(friendsRequest);
		
	}


	
}

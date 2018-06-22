package kr.co.lac.firends.service;

import java.util.List;

import kr.co.lac.repository.domain.FriendsRequest;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;

public interface FriendsService {
	public List<User> retrieveSearchFriends(Search search);
	public void requestFriends(FriendsRequest friendsRequest);
	public void requestFriendsDelete(FriendsRequest friendsRequest);
	public void insertFriends(FriendsRequest friendsRequest) throws Exception;
	public void deleteFriends(FriendsRequest friendsRequest) throws Exception;
}
 
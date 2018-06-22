package kr.co.lac.repository.mapper;

import java.util.List;

import kr.co.lac.repository.domain.FriendsRequest;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;

public interface FriendsMapper {
	public List<User> selectSearchUser(Search search);
	public void insertFriendsRequest(FriendsRequest friendsRequest);
	public void deleteFriendsRequest(FriendsRequest friendsRequest);
	public void insertFriends(FriendsRequest friendsRequest);
	public void deleteFriends(FriendsRequest friendsRequest);
}

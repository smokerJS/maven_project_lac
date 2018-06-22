package kr.co.lac.friends.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lac.firends.service.FriendsService;
import kr.co.lac.repository.domain.FriendsRequest;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;

@Controller
@RequestMapping("/friends")
public class FriendsController {
	
	@Autowired
	private FriendsService friendsService;
	
	@RequestMapping("/search.json")
	@ResponseBody
	public List<User> friendsSearch(Search search) throws Exception {
		return friendsService.retrieveSearchFriends(search);
	}
	
	@RequestMapping("/request.json")
	@ResponseBody
	public void friendsRequest(FriendsRequest friendsRequest) throws Exception {
		friendsService.requestFriends(friendsRequest);
	}
	
	@RequestMapping("/requestDelete.json")
	@ResponseBody
	public void friendsRequestDelete(FriendsRequest friendsRequest) throws Exception {
		friendsService.requestFriendsDelete(friendsRequest);
	}
	
	@RequestMapping("/insert.json")
	@ResponseBody
	public void friendsInsert(FriendsRequest friendsRequest) throws Exception {
		friendsService.insertFriends(friendsRequest);
	}
	
	@RequestMapping("/delete.json")
	@ResponseBody
	public void friendsDelete(FriendsRequest friendsRequest) throws Exception {
		friendsService.deleteFriends(friendsRequest);
	}
	
	
	
}

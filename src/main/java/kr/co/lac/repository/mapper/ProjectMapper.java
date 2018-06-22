package kr.co.lac.repository.mapper;

import java.util.List;

import kr.co.lac.repository.domain.Project;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;

public interface ProjectMapper {
	public void insertProject(Project project);
	public void insertProjectParticipant(Project project);
	public List<Project> selectProjectList(int userNo); 
	public Project selectProjectByNo(int projectNo);
	public List<User> selectProjectByUser(int projectNo);
	public List<User> selectInviteFriends(Search search); //친구초대 하기위한 목록 가져오기
	public void inviteFriends(Search search); 
	
	public void leaveProject(Search search);
	public Search selectProjectNo(Search search);
	public void updateProject(Search search);
	public void updateProjectName(Search search);
}

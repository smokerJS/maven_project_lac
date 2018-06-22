package kr.co.lac.project.service;

import java.util.List;

import kr.co.lac.repository.domain.Project;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;

public interface ProjectService {
	public void createProject(Project project);
	public List<Project> retrieveProjectList(int userNo);
	public Project selectProjectByNo(int projectNo);
	public List<User> selectProjectByUser(int projectNo);
	public List<User> selectInviteFriends(Search search);
	public void inviteFriends(Search search);
	public void leaveClass(Search search) throws Exception;
	public void updateProjectName(Search search);
}
 
package kr.co.lac.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.lac.repository.domain.Project;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;
import kr.co.lac.repository.mapper.ProjectMapper;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectMapper mapper;
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void createProject(Project project) {
		mapper.insertProject(project);
		mapper.insertProjectParticipant(project);
	}

	@Override
	public List<Project> retrieveProjectList(int userNo) {
		return mapper.selectProjectList(userNo);
	}

	@Override
	public Project selectProjectByNo(int projectNo) {
		return mapper.selectProjectByNo(projectNo);
	}

	@Override
	public List<User> selectProjectByUser(int projectNo) {
		return mapper.selectProjectByUser(projectNo);
	}

	@Override
	public List<User> selectInviteFriends(Search search) {
		return mapper.selectInviteFriends(search);
	}

	@Override
	public void inviteFriends(Search search) {
		mapper.inviteFriends(search);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void leaveClass(Search search) throws Exception{
		mapper.leaveProject(search);
		
		if(mapper.selectProjectNo(search)!=null) {
			search.setUserNo(mapper.selectProjectNo(search).getUserNo());
			search.setType("master");
			mapper.updateProject(search);
		}
	}

	@Override
	public void updateProjectName(Search search) {
		mapper.updateProject(search);
	}
	
}

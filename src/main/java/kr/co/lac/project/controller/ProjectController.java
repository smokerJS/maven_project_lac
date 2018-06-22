package kr.co.lac.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lac.project.service.ProjectService;
import kr.co.lac.repository.domain.Project;
import kr.co.lac.repository.domain.Search;
import kr.co.lac.repository.domain.User;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/lobby.do")
	public void lobby() throws Exception {}
	
	@RequestMapping("/{projectNo}/codingRoom.do")
	public String codingRoom(@PathVariable int projectNo, Model model) {
		model.addAttribute("project", projectService.selectProjectByNo(projectNo));
		model.addAttribute("userList", projectService.selectProjectByUser(projectNo));
		
		return "project/codingRoom";
	}
	
	@RequestMapping("/refreshList.json")
	@ResponseBody
	public List<Project> refreshList(int userNo) throws Exception {
		return projectService.retrieveProjectList(userNo);
	}
	
	@RequestMapping("/createProject.json")
	@ResponseBody
	public void createProject(Project project) throws Exception {
		projectService.createProject(project);
	}
	
	@RequestMapping("/selectInviteFriends.json")
	@ResponseBody
	public List<User> selectInviteFriends(Search search) throws Exception {
		return projectService.selectInviteFriends(search);
	}
	
	@RequestMapping("/inviteFriends.do")
	public String inviteFriends(Search search) throws Exception {
		projectService.inviteFriends(search);
		return "redirect:/project/"+search.getProjectNo()+"/codingRoom.do";
	}
	
	@RequestMapping("/leaveClass.do")
	public String leaveClass(Search search) throws Exception {
		projectService.leaveClass(search);
		return "redirect:/project/lobby.do";
	}
	
	@RequestMapping("/updateProjectName.json")
	@ResponseBody
	public void updateProjectName(Search search) throws Exception {
		projectService.updateProjectName(search);
	}
}









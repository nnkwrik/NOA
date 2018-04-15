package com.noa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.noa.po.EmployeeCustom;
import com.noa.po.Mission;
import com.noa.po.MissionCustom;
import com.noa.service.MissionService;
import com.noa.service.SysService;

@Controller
@RequestMapping("/mission")

@SuppressWarnings("all")
public class MissionController {

	@Autowired
	private MissionService missionService;
	
	@Autowired
	private SysService sysService;
	
	EmployeeCustom activeEmp;

	@RequestMapping("")
	public String showMissionPage(Model model, HttpSession session,String view) throws Exception {
		List<MissionCustom> missionList = null;
		activeEmp= (EmployeeCustom) session.getAttribute("activeEmp");
		switch (view) {
		case "all":
			missionList = missionService.showAllMission(activeEmp);
			break;
		case "overall":
			missionList = missionService.filterMission(0);
			break;
		case "main":
			missionList = missionService.filterMission((activeEmp.getDepartmentId()/10)*10);
			break;
		case "sub":
			missionList = missionService.filterMission(activeEmp.getDepartmentId());
			break;
		default:
			missionList = missionService.showAllMission(activeEmp);
			break;
		}

		model.addAttribute("missionList", missionList);
		model.addAttribute("isInbox",true);
		return "mission/mission_inbox";
	}
	
	@RequestMapping(value="/mission_view" ,method=RequestMethod.GET)
	public String showMissionDetail(Model model,Integer mission_id,Integer updateProgress) throws Exception{
		if (updateProgress!=null) {
			missionService.updateProgress(mission_id, updateProgress);
		}
		model.addAttribute("mission", missionService.missionDetail(mission_id));

		return "mission/mission_view";
		
	}
	
	@RequestMapping(value="/mission_view" ,method=RequestMethod.POST)
	public String insertComment(Model model,HttpSession session,Integer mission_id,String oldComment,String newComment) throws Exception{
		
		newComment = newComment.replaceAll("\r\n", "<br>");
		
		
		missionService.comment(mission_id, oldComment, newComment, (EmployeeCustom) session.getAttribute("activeEmp"));
		model.addAttribute("mission", missionService.missionDetail(mission_id));
		
		return "mission/mission_view";
	}
	
	@RequestMapping("/mission_compose")
	public String showComposeForm(Model model)throws Exception{
		
		

		model.addAttribute("departmentList", sysService.getAbleToPostDeps());

		return "mission/mission_compose";
	}

	@RequestMapping("/post_mission.action")
	@RequiresPermissions(value={"mission:create:all","mission:create:main","mission:create:sub"},logical=Logical.OR)
	public String postMission(HttpSession session,Mission mission,MultipartFile mission_pic) throws Exception{
		
		//Í¼Æ¬ÉÏ´«
		String originalFilename = null;
		if (mission_pic != null) {
			mission_pic.getOriginalFilename();
		} 
		if (mission_pic!=null && originalFilename!=null && originalFilename.trim()!="") {
			mission.setPic(sysService.uploadPic("mission", mission_pic));
		}
		
		activeEmp = (EmployeeCustom) session.getAttribute("activeEmp");
		mission.setAutherId(activeEmp.getId());
		
		mission.setText(mission.getText().replaceAll("\r\n", "<br>"));
		missionService.postMission(mission, activeEmp);
		
		return "redirect:/mission?view=all";
	}
	@RequestMapping("/delete_mission.action")
	public String deleteMission(Integer delete_id) throws Exception{
		missionService.deleteMission(delete_id);
		
		return "redirect:/mission?view=all";
	}
	
	@RequestMapping(value="/delete_comment.action",method=RequestMethod.POST)
	public String deleteMission(Integer mission_id,Integer comment_emp,String comment,String all_comment) throws Exception{
		
		missionService.deleteComment(mission_id, comment_emp, comment, all_comment);
		
		return "redirect:/mission/mission_view?mission_id="+mission_id;
	}
	
	
}

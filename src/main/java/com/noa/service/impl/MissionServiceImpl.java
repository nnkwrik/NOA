package com.noa.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.noa.exception.CustomException;
import com.noa.mapper.EmployeeMapper;
import com.noa.mapper.MissionMapper;
import com.noa.po.EmployeeCustom;
import com.noa.po.Mission;
import com.noa.po.MissionCustom;
import com.noa.po.MissionVo;
import com.noa.service.MissionService;
import com.noa.service.SysService;

@Service
public class MissionServiceImpl implements MissionService {

	@Autowired
	private MissionMapper missionMapper;

	@Autowired
	private EmployeeMapper employeeMapper;

	@Autowired
	private SysService sysService;

	// 展示所有给我的任务
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MissionCustom> showAllMission(EmployeeCustom employeeCustom) throws Exception {

		Integer departmentId = employeeCustom.getDepartmentId();
		List<Integer> depIds = null;

		if (departmentId % 10 == 0) { // 无所属的子部门,获取该大部门下的所有子部门
			depIds = sysService.getSubDepByMain(departmentId);
			depIds.add(0); // 加上全体
			return missionMapper.showMissionList(depIds);
		}

		// 有所属的组部门
		depIds = new ArrayList<Integer>();
		depIds.add(0); // 全体
		depIds.add((departmentId / 10) * 10); // main
		depIds.add(departmentId); // sub
		return missionMapper.showMissionList(depIds);

	}

	// 筛选显示的任务
	public List<MissionCustom> filterMission(Integer department_id) throws Exception {
		return missionMapper.filterMission(department_id);
	}

	// 展示任务详细
	public MissionVo missionDetail(Integer mission_id) throws Exception {
		MissionCustom missionDetail = missionMapper.missionDetail(mission_id);
		MissionVo missionVo = new MissionVo();

		// String str = "2:#DASDASD:&3:#测试:&";

		// 把每条评论包装进Map<EmployeeCustom, String>
		String str = missionDetail.getComment();
		if (str != null && str.trim() != "") {

			String[] strs = str.split(":&");
			// Map不允许相同的key. Integer型的id相同时会被覆盖( 当同一个员工发出的多条时,会被覆盖),
			// ->用List<Map>
			List<Map<Integer, String>> idCommentList = new ArrayList<Map<Integer, String>>();

			for (int i = 0; i < strs.length; i++) {
				String[] tmp = strs[i].split(":#");
				Map<Integer, String> idCommentMap = new HashMap<Integer, String>();
				idCommentMap.put(Integer.parseInt(tmp[0]), tmp[1]);
				idCommentList.add(idCommentMap);

			}
			Map<EmployeeCustom, String> employeeCommentMap = new LinkedHashMap<EmployeeCustom, String>();
			for (Map<Integer, String> idComment : idCommentList) {
				for (Integer key : idComment.keySet()) {
					// 一个map只有一个key, 该for只会重复一次
					employeeCommentMap.put(employeeMapper.findEmployeeById(key), idComment.get(key));
				}
			}
			missionVo.setEmployeeCommentMap(employeeCommentMap);
		}

		missionVo.setMissionDetail(missionDetail);

		return missionVo;
	}

	// 发布任务
	public void postMission(Mission mission, EmployeeCustom employeeCustom) throws Exception {
		mission.setAutherId(employeeCustom.getId());
		missionMapper.postMission(mission);
	}

	// 更新进度
	public void updateProgress(Integer missionId, Integer progress) throws Exception {

		missionMapper.updateProgress(progress, missionId);

	}

	// 添加评论
	public void comment(Integer missionId, String oldComment, String newComment, EmployeeCustom employeeCustom)
			throws Exception {

		// String str = "2:#DASDASD:&3:#测试:&";

		String commentStr = oldComment + employeeCustom.getId() + ":#" + newComment + ":&";
		Mission mission = new Mission();
		mission.setId(missionId);
		mission.setComment(commentStr);
		missionMapper.comment(mission);

	}

	// 删除评论
	public void deleteComment(Integer missionId, Integer commentEmp, String comment, String allComment)
			throws Exception {
		String commentStr = commentEmp + ":#" + comment + ":&";
		allComment = allComment.replaceFirst(commentStr, "");
		Mission mission = new Mission();
		mission.setId(missionId);
		mission.setComment(allComment);
		missionMapper.comment(mission);
	}

	// 删除任务
	public void deleteMission(Integer missionId) throws Exception {

		missionMapper.deleteMission(missionId);

	}

	// 编辑任务
	public void editMission(Mission mission, EmployeeCustom employeeCustom) throws Exception {
		if (mission.getAutherId() != employeeCustom.getId()) {
			throw new CustomException("只有作者能编辑!");
		}
		missionMapper.editMission(mission);
	}

}

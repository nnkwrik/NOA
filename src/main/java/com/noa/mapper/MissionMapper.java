package com.noa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.noa.po.Mission;
import com.noa.po.MissionCustom;

public interface MissionMapper {

	List<MissionCustom> filterMission(Integer department_id) throws Exception;
	
	List<MissionCustom> showMissionList(List<Integer> department_id) throws Exception;

	MissionCustom missionDetail(Integer mission_id) throws Exception;

	void postMission(Mission mission) throws Exception;

	void updateProgress(@Param("progress")Integer progress,@Param("id")Integer missionId) throws Exception;

	void comment(Mission mission) throws Exception;

	void deleteMission(Integer mission_id) throws Exception;

	void editMission(Mission mission) throws Exception;

}

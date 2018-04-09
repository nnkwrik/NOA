package com.noa.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AttendanceMapper {

	void on(Integer employee_id) throws Exception;

	void filedwork(Integer employee_id) throws Exception;

	void off(@Param("employee_id") Integer employee_id, @Param("state") Integer state) throws Exception;

	Date getOnTime(Integer employee_id) throws Exception;

	List<Integer> countMonthState(Integer employee_id) throws Exception;
}

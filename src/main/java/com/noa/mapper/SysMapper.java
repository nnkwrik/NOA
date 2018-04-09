package com.noa.mapper;

import java.util.List;

import com.noa.po.SysDepartment;
import com.noa.po.SysPosition;

public interface SysMapper {

	List<SysDepartment> getAllDepartment() throws Exception;

	List<SysDepartment> getDepByDepIds(List<Integer> depIds) throws Exception;

	List<SysPosition> getAllPosition() throws Exception;

	List<String> getPermissionByEmpId(Integer empId) throws Exception;

}

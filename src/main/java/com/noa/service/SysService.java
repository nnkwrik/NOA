package com.noa.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.noa.po.SysDepartment;
import com.noa.po.SysPosition;

public interface SysService {
	List<SysDepartment> getAllDepartment() throws Exception;
	
	List<SysPosition> getAllPosition() throws Exception;
	
	List<String> getPermissionByEmpId(Integer empId) throws Exception;
	
	List<Integer> getSubDepByMain(Integer mainDep) throws Exception;
	
	List<SysDepartment> getDepsByDepIds(List<Integer> depIds) throws Exception;
	
	
	List<SysDepartment> getAbleToPostDeps() throws Exception;
	
	List<SysDepartment> getAbleToAnnounceDeps() throws Exception;
	
	List<SysPosition> getAbleToRegPos() throws Exception;
	
	List<SysDepartment> getAbleToRegDep(Integer posId) throws Exception;
	
	String uploadPic(String dir,MultipartFile pic) throws Exception;
}

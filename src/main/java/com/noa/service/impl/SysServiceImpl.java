package com.noa.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.noa.mapper.SysMapper;
import com.noa.po.EmployeeCustom;
import com.noa.po.SysDepartment;
import com.noa.po.SysPosition;
import com.noa.service.SysService;

@Service
public class SysServiceImpl implements SysService {

	@Autowired
	private SysMapper sysMapper;

	public List<SysDepartment> getAllDepartment() throws Exception {

		return sysMapper.getAllDepartment();
	}

	public List<SysPosition> getAllPosition() throws Exception {

		return sysMapper.getAllPosition();
	}

	public List<String> getPermissionByEmpId(Integer empId) throws Exception {

		return sysMapper.getPermissionByEmpId(empId);
	}

	public List<Integer> getSubDepByMain(Integer mainDep) throws Exception {
		List<SysDepartment> allDep = getAllDepartment();
		List<Integer> subDepList = new ArrayList<Integer>();
		for (SysDepartment dep : allDep) {
			int depId = dep.getDepartmentId();
			if ((depId / 10) * 10 == mainDep) {
				// 是mainDep下的部门 (包括main)
				subDepList.add(depId);
			}
		}
		// subDepList = {main,sub1,sub2,...}
		return subDepList;

	}

	public List<SysDepartment> getDepsByDepIds(List<Integer> depIds) throws Exception {
		return sysMapper.getDepByDepIds(depIds);
	}

	// 获取可布置任务的对象
	public List<SysDepartment> getAbleToPostDeps() throws Exception {
		// 获取权限
		Subject subject = SecurityUtils.getSubject();
		EmployeeCustom activeEmp = (EmployeeCustom) subject.getPrincipal();
		int activeEmpDep = activeEmp.getDepartmentId();
		List<Integer> depIds = new ArrayList<Integer>();

		// 根据权限添加,可布置任务的对象
		if (subject.isPermitted("mission:create:all")) { // 有发布全体的的权限
			depIds.add(0);
		}
		if (subject.isPermitted("mission:create:main")) {
			depIds.addAll(getSubDepByMain((activeEmpDep / 10) * 10));
		} else if (subject.isPermitted("mission:create:sub")) {// 只有发布自己的子部门的权限
			if (activeEmpDep % 10 != 0) {
				depIds.add(activeEmpDep);
			}
		}
		if (depIds.isEmpty()) {
			return null;
		}
		return getDepsByDepIds(depIds);

	}

	// 获取可发布公告的对象
	public List<SysDepartment> getAbleToAnnounceDeps() throws Exception {
		// 获取权限
		Subject subject = SecurityUtils.getSubject();
		EmployeeCustom activeEmp = (EmployeeCustom) subject.getPrincipal();
		int activeEmpDep = activeEmp.getDepartmentId();
		List<Integer> depIds = new ArrayList<Integer>();

		// 根据权限添加,可发布公告的对象
		if (subject.isPermitted("announce:create:all")) { // 有发布全体的的权限
			depIds.add(0);
		}
		if (subject.isPermitted("announce:create:main")) {
			depIds.addAll(getSubDepByMain((activeEmpDep / 10) * 10));
		} else if (subject.isPermitted("announce:create:sub")) {// 只有发布自己的子部门的权限
			if (activeEmpDep % 10 != 0) {
				depIds.add(activeEmpDep);
			}
		}
		if (depIds.isEmpty()) {
			return null;
		}
		return getDepsByDepIds(depIds);
	}

	// 获取可注册的岗位
	public List<SysPosition> getAbleToRegPos() throws Exception {
		List<SysPosition> allPositions = getAllPosition();
		List<SysPosition> resultList = new ArrayList<SysPosition>();
		// 截掉不可注册的
		for (SysPosition posistion : allPositions) {
			if (posistion.getAvailable() != 0) {
				resultList.add(posistion);
			}
		}
		return resultList;
	}

	// 获取可注册的部门
	public List<SysDepartment> getAbleToRegDep(Integer posId) throws Exception {
		List<SysDepartment> allDepartments = getAllDepartment();
		List<SysDepartment> resultList = new ArrayList<SysDepartment>();

		// 截掉不可注册的
		for (SysDepartment department : allDepartments) {

			if (department.getAvailable() == 1) { // 可注册的部门
				if (department.getDepartmentId() % 10 != 0 && posId <= 1) { // 无或组长
																			// 只能注册子部门
					resultList.add(department);
				} else if (department.getDepartmentId() % 10 == 0 && posId > 1) { // 总监或经理,只能注册大部门
					resultList.add(department);
				}
			}
		}

		return resultList;
	}

	// 上传图片
	public String uploadPic(String dir, MultipartFile pic) throws Exception {

		// 上传图片
		// 原始名称
		String originalFilename = pic.getOriginalFilename();

		// 存储图片的物理路径
		String pic_path = "D:\\Util\\develop\\upload\\" + dir + "\\";

		// 新的图片名称 : 随机数 + 扩展名
		String newfileNStringame = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));

		// 新图片
		File newfile = new File(pic_path + newfileNStringame);

		// 将内存中的数据写入磁盘
		pic.transferTo(newfile);

		return newfileNStringame;

	}

}

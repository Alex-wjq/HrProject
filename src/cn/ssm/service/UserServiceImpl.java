package cn.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ssm.mapper.DeptMapper;
import cn.ssm.mapper.EmployeeMapper;
import cn.ssm.mapper.JobMapper;
import cn.ssm.mapper.UserMapper;
import cn.ssm.pojo.Dept;
import cn.ssm.pojo.DeptExample;
import cn.ssm.pojo.Employee;
import cn.ssm.pojo.EmployeeExample;
import cn.ssm.pojo.Job;
import cn.ssm.pojo.JobExample;
import cn.ssm.pojo.User;
import cn.ssm.pojo.UserExample;
import cn.ssm.pojo.UserExample.Criteria;

/**
 * UserService-->调用的是dao层
 * @author 
 *
 */
@Service
public class UserServiceImpl implements UserService {
 
	@Autowired
	private UserMapper userMapper;
	@Autowired
    private JobMapper jobMapper;
	@Autowired
	private DeptMapper deptMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Override
	public List<User> findByNumber(String number) {
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andNumberEqualTo(number);
		
		return userMapper.selectByExample(example);
	}
    
	//2.添加用户
	@Override
	public int addUser(User user) {
				
		return userMapper.insert(user);
	}
    
	//3.添加职位
	@Override
	public int addjobServlet(Job job) {
		
		return jobMapper.insert(job);
	}
    
	//4、添加部门
	@Override
	public int addDept(Dept dept) {
		
		return deptMapper.insert(dept);
	}
 
	//5、添加员工
	@Override
	public int addEmp(Employee emp) {
		
		return employeeMapper.insert(emp);
	}

	@Override
	public List<User> findByPage() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	@Override
	public List<Job> findJobByPage() {
		JobExample example = new JobExample();
		return jobMapper.selectByExample(example);
	}

	@Override
	public List<Dept> findDeptByPage() {
		DeptExample example = new DeptExample();
		return deptMapper.selectByExample(example);
	}

	@Override
	public int updateUser(User user) {
	
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public int updateJob(Job job) {
		
		return jobMapper.updateByPrimaryKey(job);
	}

	@Override
	public int updateDept(Dept dept) {
		
		return deptMapper.updateByPrimaryKey(dept);
	}

	@Override
	public int deleteUser(String number) {
		
		return userMapper.deleteByPrimaryKey(number);
	}

	@Override
	public int deleteJob(int id) {
		
		return jobMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteDept(int id) {
		
		return deptMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Employee> findEmpByPage() {
		
		EmployeeExample example = new EmployeeExample();
		return employeeMapper.selectByExample(example);
	}

	@Override
	public int updateEmp(Employee emp) {
		return employeeMapper.updateByPrimaryKey(emp);
	}

	@Override
	public int deleteEmp(int id) {
		
		return employeeMapper.deleteByPrimaryKey(id);
	}
	


}

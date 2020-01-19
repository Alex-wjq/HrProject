package cn.ssm.service;

import java.util.List;

import cn.ssm.pojo.Dept;
import cn.ssm.pojo.Employee;
import cn.ssm.pojo.Job;
import cn.ssm.pojo.User;

public interface UserService {

    //1.用户登录
	List<User> findByNumber(String number);
	
	//2.添加用户
	int addUser(User user);
	
	//3、添加职位
	int addjobServlet(Job job);
	
	//4、添加部门
	int addDept(Dept dept);
	
	//5、添加员工
	int addEmp(Employee emp);
	
	//6、查询用户,分页浏览
	List<User> findByPage();
	
	//7、查询职位，分页浏览
	List<Job> findJobByPage();
   
	//8、查询部门
	List<Dept> findDeptByPage();
	
	//9、修改用户信息
	int updateUser(User user);
	
	//10、修改职位信息
	int updateJob(Job job);
	
	//11、修改部门信息
	int updateDept(Dept dept);
	
   //12、删除用户
	int deleteUser(String number);
	
	//12、删除职位
	int deleteJob(int id);

	//14、删除部门
	int deleteDept(int id);
	
	//15、查询员工
	List<Employee> findEmpByPage();
   
	//16、修改员工
	int updateEmp(Employee emp);
   
	//17、删除员工
	int deleteEmp(int id);
	
	
}

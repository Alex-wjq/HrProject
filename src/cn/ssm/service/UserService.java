package cn.ssm.service;

import java.util.List;

import cn.ssm.pojo.Dept;
import cn.ssm.pojo.Employee;
import cn.ssm.pojo.Job;
import cn.ssm.pojo.User;

public interface UserService {

    //1.�û���¼
	List<User> findByNumber(String number);
	
	//2.����û�
	int addUser(User user);
	
	//3�����ְλ
	int addjobServlet(Job job);
	
	//4����Ӳ���
	int addDept(Dept dept);
	
	//5�����Ա��
	int addEmp(Employee emp);
	
	//6����ѯ�û�,��ҳ���
	List<User> findByPage();
	
	//7����ѯְλ����ҳ���
	List<Job> findJobByPage();
   
	//8����ѯ����
	List<Dept> findDeptByPage();
	
	//9���޸��û���Ϣ
	int updateUser(User user);
	
	//10���޸�ְλ��Ϣ
	int updateJob(Job job);
	
	//11���޸Ĳ�����Ϣ
	int updateDept(Dept dept);
	
   //12��ɾ���û�
	int deleteUser(String number);
	
	//12��ɾ��ְλ
	int deleteJob(int id);

	//14��ɾ������
	int deleteDept(int id);
	
	//15����ѯԱ��
	List<Employee> findEmpByPage();
   
	//16���޸�Ա��
	int updateEmp(Employee emp);
   
	//17��ɾ��Ա��
	int deleteEmp(int id);
	
	
}

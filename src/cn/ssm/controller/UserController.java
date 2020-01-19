package cn.ssm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ssm.pojo.Dept;
import cn.ssm.pojo.Employee;
import cn.ssm.pojo.Job;
import cn.ssm.pojo.User;
import cn.ssm.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/login")
	public String login(String number,String password,Model model,HttpSession session) {
		System.out.println("�û���ţ�"+number+"\n"+"�����ǣ�"+password);
		//�õ���ѯ���ļ�������
		List<User> list = userService.findByNumber(number);
		//�жϼ����Ƿ�Ϊ�գ������Ϊ��˵��û�������
		if (list.size()==0) {
			System.out.println("û�������");
			model.addAttribute("loginfo","�Բ���û������û�");
			return "index";
		}
		//�����Ϊ�գ��ж�����
		if (list.get(0).getPassword().equals(password)) {
			System.out.println("��¼�ɹ�");
			//�����½�ɹ������û������浽session����
			session.setAttribute("user", list.get(0));
			return "main";
		} else {
			model.addAttribute("loginfo","�������");
			System.out.println("�������");
			return "index";

		}
	}
	
	
	
	
	
	//������֤
	@RequestMapping("/registerUser")
	@ResponseBody
	public String register(User user ) {
		user.setCreatedate(new Date());
		user.setStatus(1);
		System.out.println("user=="+user);
		int in = userService.addUser(user);
		String data="0";
		if (in>0) {
			data="1";
			System.out.println("��ӳɹ�");
		} 
		return data;
		
	}
	
	@RequestMapping(value="/selectUser",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public String selectByPage(int page, int rows) {
		System.out.println("page=="+page+",rows==" +rows);
		//��ҳ��ѯ
		PageHelper.startPage(page,rows); 
		List<User> listPage  = userService.findByPage();
		listPage.forEach(li->System.out.println(li));
		PageInfo pageInfo = new PageInfo<>(listPage);
		//�õ��ܼ�¼��
		long total = pageInfo.getTotal();
		
		//��total��list������json��ʽ����
		//list���Ϸ�װ��json����
		  String listString = JSON.toJSONString(listPage);
		  //����json���ݣ�tatal��rows
		  String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
		  
		//��json���ݷ���ǰ��
		return json;	
	}
	
	
	//�޸�
	@RequestMapping("/updataUser")
	@ResponseBody
	public String updataUser(User user) {
		System.out.println("user---->"+user);
		//����޸Ĳ���
		int in = userService.updateUser(user);
		
		return in +"";
		
	}
	
	//ɾ��
	@RequestMapping(value="/deleteUser",produces= {"application/text;charset=UTF-8"})
	@ResponseBody
	public String deleteUser(String number) {
		System.out.println("Ҫɾ�����˺���===="+number);
		
		int in  =userService.deleteUser(number);
		String info = "ɾ��ʧ��";
		if (in>0) {
			info="ɾ���ɹ�";
		}
		return in+"";

	}
	
	  @RequestMapping("/addJob")
      @ResponseBody
      public String addJob(Job job) {
   	 
   	   System.out.println(job);
   	   
   	   int in = userService.addjobServlet(job);
   	   System.out.println(in);
   	   String data = "0";
   	   if(in>0) {
   		   data = "1";
   		   System.out.println("��ӳɹ�");
   		   System.out.println(data);
   	   }else {
   		   System.out.println("���ʧ��");
   	   }
   	   return data;
		
	}
      
      @RequestMapping("/addDept")
      @ResponseBody
      public String addDept(Dept dept) {
   	 
   	   System.out.println(dept);
   	   
   	   int in = userService.addDept(dept);
   	   System.out.println(in);
   	   String data = "0";
   	   if(in>0) {
   		   data = "1";
   		   System.out.println("��ӳɹ�");
   		   System.out.println(data);
   	   }else {
   		   System.out.println("���ʧ��");
   	   }
   	   return data;
		
	}
      
      @RequestMapping("/addEmp")
      @ResponseBody
      public String addEmp(Employee emp) {
   	   emp.setBirthday(new Date());
   	   emp.setCreateDate(new Date());
   	   
   	   System.out.println(emp);
   	   
   	   int in = userService.addEmp(emp);
   	   System.out.println(in);
   	   String data = "0";
   	   if(in>0) {
   		   data = "1";
   		   System.out.println("��ӳɹ�");
   		   System.out.println(data);
   	   }else {
   		   System.out.println("���ʧ��");
   	   }
   	   return data;
		
	}
      
      @RequestMapping(value="/selectJob",produces= {"application/json;charset=UTF-8"})
      @ResponseBody
      public String selectJobByPage(int page,int rows) {
   	   System.out.println("page=="+page+",rows=="+rows);
   	   
   	   //��ҳ��ѯ
   	   PageHelper.startPage(page, rows);
   	   List<Job> listPage = userService.findJobByPage();
   	   listPage.forEach(li->System.out.println(li));
   	   PageInfo pageInfo = new PageInfo<>(listPage);
   	   
   	   //�õ��ܼ�¼��
   	   long total = pageInfo.getTotal();
   	   
   	   //��total��list������json��ʽ������
   	   //list���Ϸ�װ��json����
   	   String listString = JSON.toJSONString(listPage);
   	   
   	   //����json����:total,rows
   	   String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
   	   //��json���ݷ���ǰ��
   	   return json;
		
	}
      
      @RequestMapping(value="/selectDept",produces= {"application/json;charset=UTF-8"})
      @ResponseBody
      public String selectDeptByPage(int page,int rows) {
   	   System.out.println("page=="+page+",rows=="+rows);
   	   
   	   //��ҳ��ѯ
   	   PageHelper.startPage(page, rows);
   	   List<Dept> listPage = userService.findDeptByPage();
   	   listPage.forEach(li->System.out.println(li));
   	   PageInfo pageInfo = new PageInfo<>(listPage);
   	   
   	   //�õ��ܼ�¼��
   	   long total = pageInfo.getTotal();
   	   
   	   //��total��list������json��ʽ������
   	   //list���Ϸ�װ��json����
   	   String listString = JSON.toJSONString(listPage);
   	   
   	   //����json����:total,rows
   	   String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
   	   //��json���ݷ���ǰ��
   	   return json;
		
	}
      
      @RequestMapping(value="/selectEmp",produces= {"application/json;charset=UTF-8"})
      @ResponseBody
      public String selectEmpByPage(int page,int rows) {
   	   System.out.println("page=="+page+",rows=="+rows);
   	   
   	   //��ҳ��ѯ
   	   PageHelper.startPage(page, rows);
   	   List<Employee> listPage = userService.findEmpByPage();
   	   listPage.forEach(li->System.out.println(li));
   	   PageInfo pageInfo = new PageInfo<>(listPage);
   	   
   	   //�õ��ܼ�¼��
   	   long total = pageInfo.getTotal();
   	   
   	   //��total��list������json��ʽ������
   	   //list���Ϸ�װ��json����
   	   String listString = JSON.toJSONString(listPage);
   	   
   	   //����json����:total,rows
   	   String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
   	   //��json���ݷ���ǰ��
   	   return json;
		
	}
      
      @RequestMapping("/updateDept")
      @ResponseBody
      public String updateDept(Dept dept) {
   	   System.out.println("user---->"+dept);
   	   //����޸ĵĲ���
   	   int in = userService.updateDept(dept);
   	   return in+"";
      }
      
      @RequestMapping("/updateEmp")
      @ResponseBody
      public String updateEmp(Employee emp) {
   	   System.out.println("user---->"+emp);
   	   //����޸ĵĲ���
   	   int in = userService.updateEmp(emp);
   	   return in+"";
      }
	
	
}

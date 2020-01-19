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
		System.out.println("用户编号："+number+"\n"+"密码是："+password);
		//得到查询到的集合数据
		List<User> list = userService.findByNumber(number);
		//判断集合是否为空，，如果为空说明没有这个人
		if (list.size()==0) {
			System.out.println("没有这个人");
			model.addAttribute("loginfo","对不起，没有这个用户");
			return "index";
		}
		//如果不为空，判断密码
		if (list.get(0).getPassword().equals(password)) {
			System.out.println("登录成功");
			//如果登陆成功，将用户名保存到session域中
			session.setAttribute("user", list.get(0));
			return "main";
		} else {
			model.addAttribute("loginfo","密码错误");
			System.out.println("密码错误");
			return "index";

		}
	}
	
	
	
	
	
	//编码验证
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
			System.out.println("添加成功");
		} 
		return data;
		
	}
	
	@RequestMapping(value="/selectUser",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public String selectByPage(int page, int rows) {
		System.out.println("page=="+page+",rows==" +rows);
		//分页查询
		PageHelper.startPage(page,rows); 
		List<User> listPage  = userService.findByPage();
		listPage.forEach(li->System.out.println(li));
		PageInfo pageInfo = new PageInfo<>(listPage);
		//得到总记录数
		long total = pageInfo.getTotal();
		
		//将total和list构建成json格式数据
		//list集合封装成json数据
		  String listString = JSON.toJSONString(listPage);
		  //构建json数据：tatal，rows
		  String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
		  
		//将json数据返回前端
		return json;	
	}
	
	
	//修改
	@RequestMapping("/updataUser")
	@ResponseBody
	public String updataUser(User user) {
		System.out.println("user---->"+user);
		//完成修改操作
		int in = userService.updateUser(user);
		
		return in +"";
		
	}
	
	//删除
	@RequestMapping(value="/deleteUser",produces= {"application/text;charset=UTF-8"})
	@ResponseBody
	public String deleteUser(String number) {
		System.out.println("要删除的账号是===="+number);
		
		int in  =userService.deleteUser(number);
		String info = "删除失败";
		if (in>0) {
			info="删除成功";
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
   		   System.out.println("添加成功");
   		   System.out.println(data);
   	   }else {
   		   System.out.println("添加失败");
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
   		   System.out.println("添加成功");
   		   System.out.println(data);
   	   }else {
   		   System.out.println("添加失败");
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
   		   System.out.println("添加成功");
   		   System.out.println(data);
   	   }else {
   		   System.out.println("添加失败");
   	   }
   	   return data;
		
	}
      
      @RequestMapping(value="/selectJob",produces= {"application/json;charset=UTF-8"})
      @ResponseBody
      public String selectJobByPage(int page,int rows) {
   	   System.out.println("page=="+page+",rows=="+rows);
   	   
   	   //分页查询
   	   PageHelper.startPage(page, rows);
   	   List<Job> listPage = userService.findJobByPage();
   	   listPage.forEach(li->System.out.println(li));
   	   PageInfo pageInfo = new PageInfo<>(listPage);
   	   
   	   //得到总记录数
   	   long total = pageInfo.getTotal();
   	   
   	   //将total和list构建成json格式的数据
   	   //list集合封装成json数据
   	   String listString = JSON.toJSONString(listPage);
   	   
   	   //构建json数据:total,rows
   	   String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
   	   //将json数据返回前端
   	   return json;
		
	}
      
      @RequestMapping(value="/selectDept",produces= {"application/json;charset=UTF-8"})
      @ResponseBody
      public String selectDeptByPage(int page,int rows) {
   	   System.out.println("page=="+page+",rows=="+rows);
   	   
   	   //分页查询
   	   PageHelper.startPage(page, rows);
   	   List<Dept> listPage = userService.findDeptByPage();
   	   listPage.forEach(li->System.out.println(li));
   	   PageInfo pageInfo = new PageInfo<>(listPage);
   	   
   	   //得到总记录数
   	   long total = pageInfo.getTotal();
   	   
   	   //将total和list构建成json格式的数据
   	   //list集合封装成json数据
   	   String listString = JSON.toJSONString(listPage);
   	   
   	   //构建json数据:total,rows
   	   String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
   	   //将json数据返回前端
   	   return json;
		
	}
      
      @RequestMapping(value="/selectEmp",produces= {"application/json;charset=UTF-8"})
      @ResponseBody
      public String selectEmpByPage(int page,int rows) {
   	   System.out.println("page=="+page+",rows=="+rows);
   	   
   	   //分页查询
   	   PageHelper.startPage(page, rows);
   	   List<Employee> listPage = userService.findEmpByPage();
   	   listPage.forEach(li->System.out.println(li));
   	   PageInfo pageInfo = new PageInfo<>(listPage);
   	   
   	   //得到总记录数
   	   long total = pageInfo.getTotal();
   	   
   	   //将total和list构建成json格式的数据
   	   //list集合封装成json数据
   	   String listString = JSON.toJSONString(listPage);
   	   
   	   //构建json数据:total,rows
   	   String json = "{\"total\":"+total+",\"rows\":"+listString+"}";
   	   //将json数据返回前端
   	   return json;
		
	}
      
      @RequestMapping("/updateDept")
      @ResponseBody
      public String updateDept(Dept dept) {
   	   System.out.println("user---->"+dept);
   	   //完成修改的操作
   	   int in = userService.updateDept(dept);
   	   return in+"";
      }
      
      @RequestMapping("/updateEmp")
      @ResponseBody
      public String updateEmp(Employee emp) {
   	   System.out.println("user---->"+emp);
   	   //完成修改的操作
   	   int in = userService.updateEmp(emp);
   	   return in+"";
      }
	
	
}

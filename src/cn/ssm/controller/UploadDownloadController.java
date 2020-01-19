package cn.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import javax.servlet.annotation.MultipartConfig;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.ssm.pojo.FileBean;
@Controller

public class UploadDownloadController {

	@RequestMapping("/uploadFile")
	public  String uploadFile(@RequestParam("name")String name ,@RequestParam ("uploadfile") List<MultipartFile> uploadfile,Model model) {
		
		System.out.println("上传人 ："+name);
		String  uploadinfo = "0";
		
		
		//先判断list是否能为空
		if (!uploadfile.isEmpty()&&uploadfile.size()>0) {
			for (MultipartFile file:uploadfile) {
				String originalFilename = file.getOriginalFilename();
				//指定文件夹路径
				
				String dirPath="D://uploadfile//";
				
				System.out.println(dirPath);
				System.out.println("-----"+dirPath.length());
				File filePath = new File(dirPath);
				//判断是否文件夹存在，如果不存在要创建
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				
				//要给文件取名字:newname = 上传者+时间戳+文件名称
				String sd  = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
				String newFilename = name+"_"+sd+"_"+originalFilename;
				try {
					file.transferTo(new File(dirPath+newFilename));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("上传成功");
				
			}
			uploadinfo = "上传成功";
		
		} 
		
		model.addAttribute("uploadinfo",uploadinfo);
		return "upload";
	}
	
	/*
	 * 编写一个控制器，用来获取指定文件夹中的文件
	 */
	@RequestMapping("/download")
	public ModelAndView download()throws Exception{

		ModelAndView mv = new ModelAndView();
		//指定一个文件夹
		String filePath = "D:\\uploadfile";
		File root = new File(filePath);
		
		System.out.println(root.getName());
		//创建一个队列集合
		Queue<File> queue = new LinkedList<>();
		queue.offer(root);
		//将得到的文件用一个JavaBean封装起来
		List<FileBean> list = new LinkedList<>();
		//循环
		while(!queue.isEmpty()){
			//先获得根节点
			File file = queue.poll();
			//获得file文件下面的多有子节点
			File[] files = file.listFiles();

			//用增强的for循环遍历数组
			for(File f:files){
				//将得到的所有文件封装到filebean
				if(f.isFile()) {
					FileBean bean = new FileBean();
					bean.setFilepath(f.getCanonicalPath());//得到并设置文件的路径，放到filebean中
					bean.setFilename(f.getName());//得到并设置文件的名字
					list.add(bean);
				}else{

					queue.offer(f);
				}
			}
		}

		mv.addObject("list",list);
		mv.setViewName("download");

		return mv;
	}
	
	 @RequestMapping("/get")
		public ResponseEntity<byte[]> getfile(String filepath,String filename)throws Exception{
			System.out.println(1);
			System.out.println(filepath + filename);
			File file = new File(filepath);

			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment",filename);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
		}
	
	
}

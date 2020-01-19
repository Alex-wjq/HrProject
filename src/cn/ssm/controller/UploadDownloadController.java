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
		
		System.out.println("�ϴ��� ��"+name);
		String  uploadinfo = "0";
		
		
		//���ж�list�Ƿ���Ϊ��
		if (!uploadfile.isEmpty()&&uploadfile.size()>0) {
			for (MultipartFile file:uploadfile) {
				String originalFilename = file.getOriginalFilename();
				//ָ���ļ���·��
				
				String dirPath="D://uploadfile//";
				
				System.out.println(dirPath);
				System.out.println("-----"+dirPath.length());
				File filePath = new File(dirPath);
				//�ж��Ƿ��ļ��д��ڣ����������Ҫ����
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				
				//Ҫ���ļ�ȡ����:newname = �ϴ���+ʱ���+�ļ�����
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
				System.out.println("�ϴ��ɹ�");
				
			}
			uploadinfo = "�ϴ��ɹ�";
		
		} 
		
		model.addAttribute("uploadinfo",uploadinfo);
		return "upload";
	}
	
	/*
	 * ��дһ����������������ȡָ���ļ����е��ļ�
	 */
	@RequestMapping("/download")
	public ModelAndView download()throws Exception{

		ModelAndView mv = new ModelAndView();
		//ָ��һ���ļ���
		String filePath = "D:\\uploadfile";
		File root = new File(filePath);
		
		System.out.println(root.getName());
		//����һ�����м���
		Queue<File> queue = new LinkedList<>();
		queue.offer(root);
		//���õ����ļ���һ��JavaBean��װ����
		List<FileBean> list = new LinkedList<>();
		//ѭ��
		while(!queue.isEmpty()){
			//�Ȼ�ø��ڵ�
			File file = queue.poll();
			//���file�ļ�����Ķ����ӽڵ�
			File[] files = file.listFiles();

			//����ǿ��forѭ����������
			for(File f:files){
				//���õ��������ļ���װ��filebean
				if(f.isFile()) {
					FileBean bean = new FileBean();
					bean.setFilepath(f.getCanonicalPath());//�õ��������ļ���·�����ŵ�filebean��
					bean.setFilename(f.getName());//�õ��������ļ�������
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

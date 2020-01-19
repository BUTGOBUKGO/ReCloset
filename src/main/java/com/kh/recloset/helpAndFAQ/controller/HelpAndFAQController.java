package com.kh.recloset.helpAndFAQ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.recloset.common.util.Utils;
import com.kh.recloset.helpAndFAQ.model.service.HelpAndFAQService;
import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
import com.kh.recloset.helpAndFAQ.model.vo.Post;
import com.kh.recloset.product.model.vo.Attachment;


@Controller
public class HelpAndFAQController {
	
	@Autowired
	HelpAndFAQService helpService;
	
	@RequestMapping("/help.do")
	public String customerAnswer(Model model) {
		
		List<HelpAndFAQ> list = helpService.faq();
		  //List<Post> list = helpService.post(); 
		model.addAttribute("faqList", list);
		System.out.println(list);
		
		return "helpAndFAQ/help";
	}
	
	
	@RequestMapping("/help/helpInsert.do")
	   public String insertFAQ(HelpAndFAQ helpAndFAQ, Model model) {
	      
	   int result = 0;

	   result = helpService.insertFAO(helpAndFAQ);
	   
	   String msg = "";
	   String loc = "/help.do";

	   if (result > 0) {
	      msg = "게시글 작성 성공";
	   } else {
	      msg = " 게시글 작성 실패";
	   }

	   model.addAttribute("msg", msg).addAttribute("loc", loc);

	   return "common/msg";
	}
	   
	@RequestMapping("/post/postInsert.do")
	   public String insertPOST(Post post, Model model) {
	      
	   int result = 0;
	   System.out.println(post);
	   result = helpService.insertPOST(post);
	   
	   String msg = "";
	   String loc = "/help.do";

	   if (result > 0) {
	      msg = "게시글 작성 성공";
	   } else {
	      msg = " 게시글 작성 실패";
	   }

	   model.addAttribute("msg", msg).addAttribute("loc", loc);

	   return "common/msg";
	}
	
	
	   @RequestMapping("/helpForm.do")
	   public String nInsertForm() { 
	      return "helpAndFAQ/helpForm";
	   }
	   
	   @RequestMapping("/postForm.do")
	   public String pInsertForm() {
		   return "helpAndFAQ/postForm";
	   }
	   
	   @RequestMapping("/insert.tn")
	   @ResponseBody
	      public String fileUpload1(@RequestParam(value = "file", required = false)MultipartFile[] upFiles, HttpServletRequest request) {
	         
	      String savePath = 
	               request.getServletContext().getRealPath("/resources/bUpFiles/product");
	         
	         String renamedFileName = null;
	         
	         for(MultipartFile f : upFiles) {
	            if( !f.isEmpty() ) {
	               // 파일 이름 재생성해서 저장하기
	               String originalFileName = f.getOriginalFilename();
	               String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
	               // sample.jpg --> .jpg
	               
	               SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	               
	               int rndNum = (int)(Math.random()*1000);
	               
	               renamedFileName
	                = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+ext;  
	               // --> 20191230_154500_1.jpg
	               
	               try {
	                  
	                  f.transferTo(new File(savePath + renamedFileName));
	                  
	               } catch (IllegalStateException e) {
	                  e.printStackTrace();
	               } catch (IOException e) {
	                  e.printStackTrace();
	               }
	            }
	         }
	         String uploadPath = "";
	         
	         InetAddress inet = null;
             try {
                inet = InetAddress.getLocalHost();
             } catch (UnknownHostException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
             }
            // System.out.println(request.getServerPort());
       String serverPath = "http://"+  inet.getHostAddress()+":"+request.getServerPort()+"/recloset/resources/bUpFiles/product"; 
            //System.out.println(serverPath); 
	        
	         uploadPath = serverPath + renamedFileName;
	               
	         return uploadPath;
	         
	      }
	   
	   @RequestMapping("/insert1.tn")
	   @ResponseBody
	      public String fileUpload2(@RequestParam(value = "file", required = false)MultipartFile[] upFiles, HttpServletRequest request) {
	         
	      String savePath = 
	               request.getServletContext().getRealPath("/resources/bUpFiles/post");
	         
	         String renamedFileName = null;
	         
	         for(MultipartFile f : upFiles) {
	            if( !f.isEmpty() ) {
	               // 파일 이름 재생성해서 저장하기
	               String originalFileName = f.getOriginalFilename();
	               String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
	               // sample.jpg --> .jpg
	               
	               SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	               
	               int rndNum = (int)(Math.random()*1000);
	               
	               renamedFileName
	                = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+ext;  
	               // --> 20191230_154500_1.jpg
	               
	               try {
	                  
	                  f.transferTo(new File(savePath + renamedFileName));
	                  
	               } catch (IllegalStateException e) {
	                  e.printStackTrace();
	               } catch (IOException e) {
	                  e.printStackTrace();
	               }
	            }
	         }
	         String uploadPath = "";
	         InetAddress inet = null;
             try {
                inet = InetAddress.getLocalHost();
             } catch (UnknownHostException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
             }
             System.out.println(request.getServerPort());
       String serverPath = "http://"+  inet.getHostAddress()+":"+request.getServerPort()+"/recloset/resources/bUpFiles/post"; 
            //System.out.println(serverPath);
	         uploadPath = serverPath + renamedFileName;
	               
	         return uploadPath;
	         
	      }
	   

	   @RequestMapping("/help/faqList.do")
	   @ResponseBody
	   public List<HelpAndFAQ> gofaqList() {
		   
		   List<HelpAndFAQ> list = helpService.faq();
		  
		   return list;
		   
	   }
	   
	   
	   @RequestMapping("/post/postList.do")
	   @ResponseBody
	   public List<Post> gopostList(Model model){
	   
	   List<Post> list = helpService.post(); 
	  System.out.println(list); 
	  
	   return list;
	   }
	   
	   @RequestMapping("/help/helpView.do")
	   public String selectOneHelp(@RequestParam("no") int qnaNo, Model model) {
	   
	   HelpAndFAQ h = helpService.selectHelp(qnaNo);
	   
	   model.addAttribute("helpandfaq" , h);
	   		
	   return "helpAndFAQ/faqView";
	   }
	   
	   @RequestMapping("/post/postView.do")
	   public String selectOnePost(@RequestParam("no") int psnaNo, Model model) {
		   
		   Post p = helpService.selectPost(psnaNo);
		   
		   model.addAttribute("post", p);
		   
		   
		return "helpAndFAQ/postView";
	   }
	   
	   @RequestMapping("/help/faqUpdateView.do")
	   public String helpUpdateView(@RequestParam("qnaNo") int qnaNo, Model model)
	   {
		   model.addAttribute("help", helpService.selectHelp(qnaNo));
		   
		   return "helpAndFAQ/faqUpdateForm";
	   }
	   
	   @RequestMapping("/post/postUpdateView.do")
	   public String postUpdateView(@RequestParam("psnaNo") int psnaNo, Model model)
	   {
		   
		   model.addAttribute("post", helpService.selectPost(psnaNo));
		   
		   return "helpAndFAQ/postUpdateForm";
	   }
	   
	   
	   @RequestMapping("/help/faqUpdateForm.do")
	   public String helpUpdate(@RequestParam("qnaNo") int qnaNo,
			   					HelpAndFAQ helpAndFAQ, Model model, HttpServletRequest request) {
		   
		   HelpAndFAQ originHelp
		   = helpService.selectHelp(qnaNo);
		   originHelp.setqTitle(helpAndFAQ.getqTitle());
		   originHelp.setqContent(helpAndFAQ.getqContent());
		   
		   int result = helpService.updateHelp(originHelp);
		   
			String msg = "";
			String loc = "/help.do";
			
			if(result > 0)	{
				msg = "게시글 수정 성공!";
			} else {
				msg = "게시글 수정 실패!";
			}
			
			model.addAttribute("msg", msg)
			     .addAttribute("loc", loc);
		   
		   return "common/msg";
	   }
	   
	   @RequestMapping("/post/postUpdateForm.do")
	   public String postUpdate(@RequestParam("psnaNo") int psnaNo,
			   					Post post, Model model, HttpServletRequest request) {
		   Post originpost
		   = helpService.selectPost(psnaNo);
		   originpost.setPsTitle(post.getPsTitle());
		   originpost.setPsContent(post.getPsContent());
		   
		   int result = helpService.updatePost(originpost);
		   
		   String msg = "";
			String loc = "/help.do";
			
			if(result > 0)	{
				msg = "게시글 수정 성공!";
			} else {
				msg = "게시글 수정 실패!";
			}
			
			model.addAttribute("msg", msg)
			     .addAttribute("loc", loc);
		   
		   return "common/msg";
	   }
	   
	   
	   
	   @RequestMapping("/help/helpDelete.do")
	   public String helpDelete(@RequestParam("qnaNo")int qnaNo, Model model, HttpSession session) {
		   
		   int result = helpService.deleteHelp(qnaNo);
		   
		   String msg = "";
			String loc = "/help.do";
			
			if(result > 0)	{
				msg = "게시글 삭제 성공!";
			} else {
				msg = "게시글 삭제 실패!";
			}
			
			model.addAttribute("msg", msg)
			     .addAttribute("loc", loc);
		   
		   return "common/msg";
	   }
	   
	   @RequestMapping("/post/postDelete.do")
	   public String postDelete(@RequestParam("psnaNo") int psnaNo, Model model, HttpSession session) {
		   
		   	int result = helpService.deletePost(psnaNo);
		   
		   String msg = "";
			String loc = "/help.do";
			
			if(result > 0)	{
				msg = "게시글 삭제 성공!";
			} else {
				msg = "게시글 삭제 실패!";
			}
			
			model.addAttribute("msg", msg)
			     .addAttribute("loc", loc);
		   
		   return "common/msg";
		   
	   }

}

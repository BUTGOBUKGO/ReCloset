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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.recloset.common.util.Utils;
import com.kh.recloset.helpAndFAQ.model.service.HelpAndFAQService;
import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
import com.kh.recloset.helpAndFAQ.model.vo.Post;


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
	   
	/*
	 * @RequestMapping("/help.do") public String selectBoardList(
	 * 
	 * @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
	 * Model model) {
	 * 
	 * // 한 페이지당 보여줄 게시글 수 int numPerPage = 10;
	 * 
	 * // 페이지 처리된 리스트 가져오기 List<Map<String,String>> list =
	 * helpService.selectList(cPage, numPerPage);
	 * 
	 * // 전체 게시글 수 가져오기 int totalContents = helpService.selectTotalContents();
	 * 
	 * // 페이지 계산 HTML을 추가하기 String pageBar = Utils.getPageBar(totalContents, cPage,
	 * numPerPage, "help.do");
	 * 
	 * System.out.println(pageBar);
	 * 
	 * model.addAttribute("list", list) .addAttribute("totalContents",
	 * totalContents) .addAttribute("numPerPage", numPerPage)
	 * .addAttribute("pageBar", pageBar);
	 * 
	 * return "/helpAndFAQ/help"; }
	 */
	 
	   
	   

}

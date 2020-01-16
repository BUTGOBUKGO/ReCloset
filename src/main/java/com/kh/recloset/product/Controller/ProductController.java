package com.kh.recloset.product.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.recloset.product.model.service.ProductService;
import com.kh.recloset.product.model.vo.Attachment;
import com.kh.recloset.product.model.vo.Goods;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	/* Kim_D Filed */
	/* Product Controller */

	@RequestMapping("/product/productList.do")
	public String selectProuctList(Model model) {

		List<Goods> list = productService.selectList();

		model.addAttribute("goods", list);

		return "product/productList";
	}

	
	 @RequestMapping("/product/productView.do")
	 public String selectOneProduct(@RequestParam("goodsNo") int goodsNo, Model model) 
	 { 
		 Goods g = productService.selectOne(goodsNo);
	 
	  List<Attachment> list = productService.selectAttachment(goodsNo);
	  
	  model.addAttribute("goods", g) 
	  .addAttribute("attachmentList", list);
	  
	  System.out.println(g);
	  System.out.println(list);
	  
	  return "product/productView";
	  
	  
	 
	  }
	 

	/*
	 * @RequestMapping("/product/productList.do") public String selectList() {
	 * 
	 * 
	 * return "product/productList"; }
	 */

	@RequestMapping("/product/productForm.do")

	public String productForm() {

		return "product/productForm";

	}

	/*
	 * @RequestMapping("/product/productView.do") public String selectOneProduct() {
	 * 
	 * return "product/productView"; }
	 */

	@RequestMapping("/product/productInsert.do")
	public String insertProduct(@RequestParam("userNo") int userNo, Goods goods, Model model,
			@RequestParam(value = "productImgFile", required = false) MultipartFile[] upFiles,
			HttpServletRequest request) {
		
		

		goods.setUserNo(userNo);

		// 1. 저장할 폴더 설정
		String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadimg");
		System.out.println("저장경로 "+savePath);
		// 2. DB에 전달할 파일 정보를 담을 list 준비하기
		List<Attachment> list = new ArrayList();

		// 3. 만약 저장할 폴더가 없다면 직접 만들기
		File dir = new File(savePath);
		if (dir.exists() == false)
			dir.mkdirs();

		/********** Multipart 파일 업로드 시작 **********/

		for (MultipartFile f : upFiles) {
			if (!f.isEmpty()) {
				// 파일 이름 재생성해서 저장하기
				String originalFileName = f.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				// sample.jpg --> .jpg

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int rndNum = (int) (Math.random() * 1000);

				String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
				// --> 20191230_154500_1.jpg

				try {

					f.transferTo(new File(savePath + "/" + renamedFileName));

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				// 저장된 파일 정보를 list에 담기

				Attachment att = new Attachment();
				att.setOriginName(originalFileName);
				att.setChangeName(renamedFileName);

				list.add(att);

			}
		}
		/********** Multipart 파일 업로드 끝 **********/

		int result = productService.insertProduct(goods, list);

		if (result > 0) {
			return "redirect:/product/productList.do";
		} else {
			String loc = "/";
			String msg = "상품 둥록 실패";

			return "common/msg";
		}

	}


}

package com.kh.recloset.product.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

		int limit = 12;
		
		List<Goods> list = productService.selectList(limit);
	
		model.addAttribute("goods", list);

		return "product/productList";
	}
	
	@RequestMapping("/product/productLoadMore.do")
	@ResponseBody
	public List<Goods> selectProuctList(@RequestParam(value="currentPage", defaultValue = "1") int currentPage, Model model) {

		int limit = 12;
		
		List<Goods> list = productService.selectList4LoadMore(currentPage, limit);
	
		return list;
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
	
	@RequestMapping("/product/productUpdateForm.do")
	public String productUpdateView(@RequestParam("goodsNo") int goodsNo, Model model) {
		
		model.addAttribute("goods", productService.selectOne(goodsNo))
			.addAttribute("attachmentList", productService.selectAttachment(goodsNo));
		
		return "product/productUpdateForm";
		
	}
	
	@RequestMapping("/product/productUpdate.do")
	public String productUpdate(@RequestParam("goodsNo") int goodsNo, Goods goods, Model model,
								@RequestParam(value="productImgFile", required=false)
	MultipartFile[] upFiles,
	HttpServletRequest request) {
		
		// 원본 게시글 수정
		Goods originProduct
			= productService.selectOne(goodsNo);
		originProduct.setgName(goods.getgName());
		originProduct.setCategoryCode(goods.getCategoryCode());
		originProduct.setgPrice(goods.getgPrice());
		originProduct.setgColor(goods.getgColor());
		originProduct.setgSize(goods.getgSize());
		originProduct.setgSimple(goods.getgSimple());
		originProduct.setgDetail(goods.getgDetail());
				
				// 첨부파일 부분
				// 1. 저장할 폴더 설정
				String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadimg");
				System.out.println("저장경로 "+savePath);
				// 2. 예전 사진파일 정보 
				List<Attachment> list
				= productService.selectAttachment(goodsNo);
		
				// 만약 사진이 없다면 
				if(list == null) list = new ArrayList();
				
				// 첨부파일 저장 위치 존재 확인
				File dir = new File(savePath);
				
				// 현재 폴더가 생성 되어있는지 확인
				if(dir.exists() == false) dir.mkdirs();
				
				int idx = 0;
				for(MultipartFile f : upFiles) {
					Attachment att = null;
					
					if( ! f.isEmpty()) {
						// 원본 사진 삭제
						if(list.size() > idx) {
							boolean isDelete
							= new File(savePath + "/" + list.get(idx).getChangeName()).delete();
							
							System.out.println("원본 사진 삭제 되었읍니까? : " + isDelete);
							
							att = list.get(idx);
						}else {
							att = new Attachment();
							att.setGoodsNo(goodsNo);
							
							list.add(att);
							
						}
						// 정상적인 사진 추가 과정
						// 원본 사진 이름 가져오기
						
						String originalFileName = f.getOriginalFilename();
						String ext
						= originalFileName.substring(originalFileName.lastIndexOf(".")+1);
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
						
						int rndNum = (int)(Math.random() * 1000);
						
						String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
						// --> 20191230_154500_1.jpg

						try {

							f.transferTo(new File(savePath + "/" + renamedFileName));

						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						
						att.setOriginName(originalFileName);
						att.setChangeName(renamedFileName);
						
						list.set(idx, att);
					}
					
					idx++;
					
				}
				int result = productService.updateProduct(originProduct, list);
				
				String msg = "";
				String loc = "/product/productList.do";
				
				if(result > 0)	{
					msg = "게시글 수정 성공!";
				} else {
					msg = "게시글 수정 실패!";
				}
				
				model.addAttribute("msg", msg)
				     .addAttribute("loc", loc);
				
		
				return "common/msg";
		
	}
	
	
	@RequestMapping("/product/productDelete.do")
	public String GoodsDelete(@RequestParam("goodsNo")int goodsNo, Model model, HttpSession session) {
		
		// 게시글 삭제 시 게시글에 담긴 첨부파일도 삭제해야 한다.
		String savePath
		    = session.getServletContext().getRealPath("/resources/upload");
		
		List<Attachment> list = productService.selectAttachment(goodsNo);
		
		for(Attachment a : list) {
			new File(savePath + "/" + a.getChangeName()).delete();
		}
		
		int result = productService.deleteProduct(goodsNo);
		
		String msg = "";
		String loc = "/product/productList.do";
		
		if(result > 0) {
			msg = "게시글 삭제 성공!";
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("msg", msg)
		     .addAttribute("loc", loc);
		
		return "common/msg";
	}
	

	/* Lee_Y Filed */
	/* Order Controller */
	@RequestMapping("/product/orderView.do")
	public String orderView() {
		return "product/orderView";
	}

	@RequestMapping("/product/payGo.do")
	public String payGo() {
		return "product/payGo";
	}

	@RequestMapping("/product/orderSuccess.do")
	public String orderSuccess() {
		return "product/orderSuccess";
	}

	@RequestMapping("/product/orderHistory.do")
	public String orderHistory() {
		return "product/orderHistory";
	}

}

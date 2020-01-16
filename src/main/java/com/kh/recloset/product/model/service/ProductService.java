package com.kh.recloset.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.product.exception.ProductException;
import com.kh.recloset.product.model.dao.ProductDAO;
import com.kh.recloset.product.model.vo.Attachment;
import com.kh.recloset.product.model.vo.Goods;


@Service
public class ProductService {

	@Autowired
	ProductDAO productDAO;

	public int insertProduct(Goods goods, List<Attachment> list) {
		int result = 1;
				
		// 1. 게시글 추가
				result = productDAO.insertProduct(goods);
				if(result < 1) throw new ProductException("게시글 추가 중 에러 발생!");
				
				// 2. 추가된 게시글의 번호를 가져와
				//    첨부파일 추가하기
				if(list.size() > 0) {
					int idx = 0;
					for(Attachment a : list) {
						if(idx++ == 0) a.setaGrade(0);
						else a.setaGrade(1);
						System.out.println("변경된 AGrade 확인 : " + a.getaGrade());

						result = productDAO.insertAttachment(a);
						
						System.out.println("result 확인 : " + result);
						// 확인용 result 값 변경하기
					 
						if(result < 1) throw new ProductException("첨부파일 추가 중 에러 발생!");
					}
				}
				return result;
		
	}


	public List selectList() {
		
		return productDAO.selectList();
	}

	 public Goods selectOne(int goodsNo) {
	  
	  return productDAO.selectOne(goodsNo); 
	  }
	  
	 public List<Attachment> selectAttachment(int goodsNo) {
	  
	  return productDAO.selectAttachment(goodsNo); 
	  }


	public int updateProduct(Goods originProduct, List<Attachment> list) {
		int result = 0;
		
		List<Attachment> originList
		= productDAO.selectAttachment(originProduct.getGoodsNo());
		
		result = productDAO.updateProduct(originProduct);
		
		if(result > 0) {
		if(originList.size() > 0) {
			result = productDAO.deleteAttachment(originProduct.getGoodsNo());
			
		}
		
		if(list.size() > 0) {
			
			for(Attachment a : list) {
				result = productDAO.updateAttachment(a);
				}
			}
		}
		return result;
	}


	public int deleteProduct(int goodsNo) {
		
		return productDAO.deleteGoods(goodsNo);
	}

	
	
}

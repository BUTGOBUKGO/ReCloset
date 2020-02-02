package com.kh.recloset.mainProduct.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.mainProduct.model.dao.MainProductDAO;

@Service
public class MainProductService {

	@Autowired
	MainProductDAO mainProductDAO;
	
public List selectMainWomanGoods(int limit) {
		
		return mainProductDAO.selectMainWomanGoods(limit);
	}

public List selectMainManGoods(int limit) {
	
	return mainProductDAO.selectMainManGoods(limit);
}
public List selectMainAcGoods(int limit) {
	
	return mainProductDAO.selectMainAcGoods(limit);
}

public List selectMainAllGoods(int limit) {
	
	return mainProductDAO.selectMainAllGoods(limit);
}

}

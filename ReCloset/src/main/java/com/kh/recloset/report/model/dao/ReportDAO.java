package com.kh.recloset.report.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
	

	@Repository
	public class ReportDAO {

		@Autowired
		SqlSessionTemplate sqlSession;

}

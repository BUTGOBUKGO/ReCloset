package com.kh.recloset.report.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.admin.model.vo.Report;

@Repository
public class ReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int report(Report re) {

		return sqlSession.insert("admin-mapper.insertReport", re);
	}

	public List<Report> selectList() {

		return sqlSession.selectList("admin-mapper.selectList");
	}
}

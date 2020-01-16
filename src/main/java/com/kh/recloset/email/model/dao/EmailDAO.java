package com.kh.recloset.email.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.email.model.vo.Email;

@Repository
public class EmailDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int checkEmail(String Email) {
		return sqlSession.selectOne("email-mapper.checkEmail", Email);
	
	}

	public void createRandNum(Email Email) {
		sqlSession.insert("email-mapper.insertCheckNumber", Email);
	}

	public int emailConfirm(Email Email) {
		return sqlSession.selectOne("email-mapper.emailConfirm", Email);
	}

	public int emailConfirmDelete(Email Email) {
		return sqlSession.delete("email-mapper.emailConfirmDelete", Email);
	}

	public int deleteEmail(String Email) {
		return sqlSession.delete("email-mapper.deleteEmail", Email);
	}
	
	
	

}
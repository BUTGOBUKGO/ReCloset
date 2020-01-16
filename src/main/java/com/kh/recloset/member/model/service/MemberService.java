package com.kh.recloset.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.member.model.dao.MemberDAO;
import com.kh.recloset.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	public int insertMember(Member member) {
		
		System.out.println(member);
		
		return memberDAO.insertMember(member);
	}

	public Member selectOneMember(Member member) {
		return memberDAO.selectOneMember(member);
	}

	public Member memberView(String userId) {
		return memberDAO.selectMemberView(userId);
	}

	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	public int deleteMember(String userId) {
		return memberDAO.deleteMember(userId);
	}

	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = new HashMap();
//		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("userId", userId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}
}









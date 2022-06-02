package com.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.domain.MemberVO;
import com.team.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	@Override
	public int idCheck(String userId) throws Exception {
		
		return membermapper.idCheck(userId);
	}
	
	/* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }

	@Override
	public void updateMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		membermapper.updateMember(member);
		
	}

	@Override
	public void deleteMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		membermapper.deleteMember(member);
		
	}
}

package com.team.mapper;

import com.team.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String userId);
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member);
    
 // 회원 수정
    public void updateMember(MemberVO member);
    
    // 회원 탈퇴
    public void deleteMember(MemberVO member);
}

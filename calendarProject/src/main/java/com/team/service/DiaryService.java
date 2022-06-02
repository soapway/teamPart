package com.team.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.team.domain.CalendarVO;
import com.team.domain.Criteria;
import com.team.domain.CriteriaCal;
import com.team.domain.DiaryVO;

public interface DiaryService {
	
		//1. 로그인 후 화면에 목록 띄우기
		public List<DiaryVO> getListWithPaging(Criteria cri);
		
		//2. 하나 눌렀을 때 상세 화면 나오기
		public DiaryVO read(Long no);
		
		//3. 항목 삭제하기
		public boolean delete(Long no);
		
		//4. 항목 수정하기 > sysdate와 등록일이 같을 때
		public boolean update(DiaryVO diary);
		
		//5. 새 글 쓰기
		public boolean insert(DiaryVO diary);
		
		//6. 글 개수 세기
		public int countList(String userId);
		
		//7. 1 년전 글 꺼내기
		public DiaryVO oneYearAgo();
		
		//8. 달력 불러오기
		public List<CalendarVO> getCalList(CriteriaCal cal);
		
		//9. 로그아웃
		public void logout(HttpServletRequest request);

}

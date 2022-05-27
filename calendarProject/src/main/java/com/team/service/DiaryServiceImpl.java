package com.team.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.domain.CalendarVO;
import com.team.domain.Criteria;
import com.team.domain.CriteriaCal;
import com.team.domain.DiaryVO;
import com.team.mapper.DiaryMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DiaryServiceImpl implements DiaryService {

	private DiaryMapper mapper;

	@Override
	public List<DiaryVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("service get : ");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public DiaryVO read(Long no) {
		// TODO Auto-generated method stub
		log.info("service read : " + no);
		return mapper.read(no);
	}

	@Override
	public boolean delete(Long no) {
		// TODO Auto-generated method stub
		log.info("service delete : " + no);
		return mapper.delete(no) == 1;
	}

	@Override
	public boolean update(DiaryVO diary) {
		// TODO Auto-generated method stub
		log.info("service update : " + diary);
		return mapper.update(diary) == 1;
	}

	@Override
	public boolean insert(DiaryVO diary) {
		// TODO Auto-generated method stub
		log.info("service insert : " + diary);
		return mapper.insert(diary) == 1;
	}

	@Override
	public int countList(String userId) {
		// TODO Auto-generated method stub
		log.info("service countList : " + userId);
		return mapper.countList(userId);
	}

	@Override
	public DiaryVO oneYearAgo() {
		// TODO Auto-generated method stub
		log.info("service oneYearAgo : run");
		return mapper.oneYearAgo();
	}

	@Override
	public List<CalendarVO> getCalList(CriteriaCal cal) {
		// TODO Auto-generated method stub
		log.info("service getCalList : run");
		return mapper.getCalList(cal);
	}
	
	
	
	

}

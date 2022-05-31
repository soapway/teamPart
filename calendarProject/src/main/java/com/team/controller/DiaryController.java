package com.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.domain.Criteria;
import com.team.domain.CriteriaCal;
import com.team.domain.DiaryVO;
import com.team.service.DiaryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/diary/*")
@AllArgsConstructor
public class DiaryController {

	private final DiaryService service;

	// 목록보기
	@GetMapping("/list")
	public void list(@RequestParam("userId") String userId, Criteria criteria, Model model) {
		log.info("get into /list");
		criteria.setUserId(userId);
		
		model.addAttribute("list", service.getListWithPaging(criteria));
		model.addAttribute("total", service.countList(userId));
		model.addAttribute("cri", criteria);
		
		model.addAttribute("oldOne", service.oneYearAgo());
	}

	// 한 항목 보기
	@GetMapping("/readView")
	public void readView(@RequestParam("no") Long no, Model model) {
		log.info("get into /readView");
		model.addAttribute("view", service.read(no));
	}

	// 글쓰기 창에 접근
	@GetMapping("/writeDiary")
	public void writeDiary(@RequestParam("userId") String userId, Model model) {
		log.info("get into /writeDiary");
		model.addAttribute("userId", userId);
	}

	// 글쓰기 하고 제출 버튼 누름
	@PostMapping("/writeDiary")
	public String writeDiary(DiaryVO diary, RedirectAttributes attributes) {
		log.info("get out /writeDiary");
		if (service.insert(diary)) {
			attributes.addFlashAttribute("result", "success");
		}
		return "redirect:/diary/list?userId=" + diary.getUser_id() + "";
	}

	// 수정창에 접근
	@GetMapping("/updateDiary")
	public void updateDiary(@RequestParam("no") Long no, Model model) {
		log.info("get into /updateDiary");
		model.addAttribute("load", service.read(no));
	}

	// 수정하고 제출 버튼 누름
	@PostMapping("/updateDiary")
	public String updateDiary(DiaryVO diary, RedirectAttributes attributes) {
		log.info("get out /updateDiary");
		if (service.update(diary)) {
			attributes.addFlashAttribute("result", "success");
		}
		return "redirect:/diary/list?userId=" + diary.getUser_id() + "";
	}
	
	//삭제 버튼 누름
	@GetMapping("/deleteDiary")
	public String deleteDiary(@RequestParam("no") Long no, @RequestParam("userId") String userId, RedirectAttributes attributes) {
		log.info("get into /deleteDiary");
		if (service.delete(no)) {
			attributes.addFlashAttribute("result", "success");
		}
		return "redirect:/diary/list?userId=" + userId;
	}
	
	//달력보기
		@GetMapping("/calendar")
		public void calendar(@RequestParam("userId") String userId, Model model) {
			log.info("get into /calendar");
			model.addAttribute("userId", userId);
		}
		
		//달력에 JSON 객체 보내주기
		@PostMapping("/datas")
		@ResponseBody
		public String getCalList(CriteriaCal cal) {
			log.info("get into /datas");
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = "";
			try {
				jsonString = objectMapper.writeValueAsString(service.getCalList(cal));
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return jsonString;
		}
		
		/* 로그아웃 */
	    @GetMapping("/logout.do")
	    public String logoutGET(HttpServletRequest request) throws Exception{
	    	log.info("logoutMainGET메서드 진입");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        
	        return "redirect:/member/main";
	    }
}

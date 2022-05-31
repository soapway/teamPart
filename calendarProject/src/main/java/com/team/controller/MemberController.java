package com.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.domain.MemberVO;
import com.team.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	//메인 페이지 이동
	@GetMapping("/main")
	public void mainPageGET() {
		log.info("메인 페이지 진입");
	}

	//회원가입 페이지 이동
	@GetMapping("/join")
	public void loginGET() {
		log.info("회원가입 페이지 진입");
	}
	
	//회원가입
	@PostMapping("/join")
	public String joinPOST(MemberVO member) throws Exception {
		log.info("join 진입");
		
		memberservice.memberJoin(member);
		
		log.info("join Service 성공");
		
		return "redirect:/member/main";
	}
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public void joinGET() {
		log.info("로그인 페이지 진입");
	}
	
	/* 로그인 */
    @PostMapping("/login")
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
        
        HttpSession session = request.getSession();
        MemberVO lvo = memberservice.memberLogin(member);
        
        if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:login";
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:/diary/list?userId=" + member.getUserId();
    }
	
	// 아이디 중복 검사
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String userId) throws Exception{
		
		log.info("memberIdChk() 진입");
		
		int result = memberservice.idCheck(userId);
		
		log.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
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

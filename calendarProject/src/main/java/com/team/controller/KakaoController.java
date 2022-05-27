//package com.team.controller;
//
//import java.io.IOException;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.team.kakaodomain.MemberVO;
//import com.team.service.KakaoService;
////import com.team.service.MemberService;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;
////import site.levinni.security.domain.CustomUser;
////import site.levinni.service.MemberService;
//
//@Controller
//@Log4j
//@AllArgsConstructor
//public class KakaoController {
//    private KakaoService kakaoService;
//    private MemberService memberService;
//
//    @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
//    public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
//        System.out.println("code:: " + code);
//
//        // 접속토큰 get
//        String kakaoToken = kakaoService.getReturnAccessToken(code);
//
//        // 접속자 정보 get
//        Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
//        log.info("result:: " + result);
//        String snsId = (String) result.get("id");
//        String userName = (String) result.get("nickname");
//        String email = (String) result.get("email");
//        String userpw = snsId;
//
//        // 분기
//        MemberVO memberVO = new MemberVO();
//        // 일치하는 snsId 없을 시 회원가입
//        System.out.println(memberService.kakaoLogin(snsId));
//        if (memberService.kakaoLogin(snsId) == null) {
//            log.warn("카카오로 회원가입");
//            memberVO.setUserid(email);
//            memberVO.setUserpw(userpw);
//            memberVO.setUserName(userName);
//            memberVO.setSnsId(snsId);
//            memberVO.setEmail(email);
//            memberService.kakaoJoin(memberVO);
//        }
//
//        // 일치하는 snsId가 있으면 멤버객체에 담음.
//        log.warn("카카오로 로그인");
//        String userid = memberService.findUserIdBy2(snsId);
//        MemberVO vo = memberService.findByUserId(userid);
//        log.warn("member:: " + vo);
//            /*Security Authentication에 붙이는 과정*/
//        CustomUser user = new CustomUser(vo);
//        log.warn("user : " + user);
//        List<GrantedAuthority> roles = CustomUser.getList(vo);
//        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
//        log.warn("auth : " + auth);
//        SecurityContextHolder.getContext().setAuthentication(auth);
//
//        /* 로그아웃 처리 시, 사용할 토큰 값 */
//        session.setAttribute("kakaoToken", kakaoToken);
//
//        return "redirect:/";
//
//    }
//
//}

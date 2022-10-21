package pines.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pines.service.MemberService;
import pines.service.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	public String result = "";
	
	@Resource(name="memberService")
	public MemberService memberService;

	/*
	 * 회원 등록 프로그램
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() throws Exception{
		logger.info("회원가입창 진입");
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String memberWriteSave(MemberVO vo) throws Exception{
		String message = "";
		
		result = memberService.insertMember(vo);
		
		if(result == null){ // 성공
			message = "ok";
			logger.info("회원가입 성공");
		}
		else{
			logger.info("회원가입창 실패");
		}
		return message;
	}
	@RequestMapping("/loginWrite.do")
	public String loginWrite(){
		logger.info("로그인창 진입");
		return "member/loginWrite";
	}
	
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userId) throws Exception{
		String message = "";
		
		int count = memberService.selectMemberIdCheck(userId);
		if(count == 0){//성공
			message = "ok";
			logger.info("사용 가능한 아이디");
		}
		else{
			message = "fail";
			logger.info("이미 사용중인 아이디");
		}
		return message;
	}
	
	@RequestMapping("/loginWriteSub.do")
	@ResponseBody
	public String selectMemberCount(MemberVO vo , HttpSession session) throws Exception{
		String message = "";
		int count = memberService.selectMemberCount(vo);
		if(count == 1){
			// 세션 생성
			session.setAttribute("SessionUserID", vo.getUserId());
			// 세션 생성
			// 메세지 처리
			message = "ok";
			// 메세지 처리
			logger.info("로그인 성공");
		}
		else{
			logger.info("로그인 실패");
		}
		
		return message;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("SessionUserID");
		logger.info("로그아웃");
		return "redirect:/productList.do";
	}
	
	@RequestMapping("/idFind.do")
	public String memberIdFind() throws Exception{
		logger.info("아이디 찾기 창 진입");
		return "member/memberIdFind";
	}
	
	@RequestMapping("/idFindOk.do")
	public String memberIdFindOk(MemberVO vo, ModelMap model) throws Exception{
		MemberVO memberVO= memberService.selectIdFind(vo);
		model.addAttribute("memberVO",memberVO);
		return "member/findPopUp";
	}
	
	@RequestMapping("/pwFind.do")
	public String memberPwFind() throws Exception{
		return "member/memberPwFind";
	}

	@RequestMapping("/pwCheck.do")
	@ResponseBody
	public String memberPwFindSub(MemberVO vo, HttpSession session) throws Exception{
		String message = "";
		int count = memberService.selectPwFindCount(vo);
		if(count == 1){
			message = "ok";
			logger.info("비밀번호 변경1_정보일치");
		}
		else{
			logger.info("비밀번호 변경1_정보 불일치");
		}
		return message;
	}
	@RequestMapping("/pwSub.do")
	public String memberPwSub(HttpServletRequest httpServletRequest,ModelMap model) throws Exception{
		String userId = httpServletRequest.getParameter("userId");
        model.addAttribute("userId",userId);
		return "member/memberPwSub";
	}

	@RequestMapping("/pwCheck2.do")
	@ResponseBody
	public String memberPwCheck2(MemberVO vo) throws Exception{
		String message = "";
		int count = memberService.updateMemberPw(vo);
		if(count == 1){
			message = "ok";
			logger.info("비밀번호 변경 성공");
		}
		else{
			message = "fail";
		}
		System.out.println(count);
		return message;
	}
}

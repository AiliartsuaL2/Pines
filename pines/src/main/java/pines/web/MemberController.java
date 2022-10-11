package pines.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pines.service.MemberService;
import pines.service.MemberVO;

@Controller
public class MemberController {
	public String result = "";
	@Resource(name="memberService")
	public MemberService memberService;

	/*
	 * 회원 등록 프로그램
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() throws Exception{
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String memberWriteSave(MemberVO vo) throws Exception{
		String message = "";
		
		result = memberService.insertMember(vo);
		
		if(result == null){ // 성공
			message = "ok";
		}
		return message;
	}
	@RequestMapping("/loginWrite.do")
	public String loginWrite(){
		return "member/loginWrite";
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
		}
		
		return message;
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("SessionUserID");
		return "redirect:/productList.do";
	}
}

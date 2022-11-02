package pines.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pines.service.MainService;
import pines.service.MainVO;
import pines.service.MemberService;
import pines.service.MemberVO;
import pines.service.OrderVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name="memberService")
	public MemberService memberService;
	@Resource(name="mainService")
	public MainService mainService;
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
		String result = "";
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
		return "redirect:/mainList.do";
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
	@RequestMapping("/memberOrder.do")
	public String selectMemberOrder(MemberVO vo, ModelMap model) throws Exception{
		OrderVO orderVO = memberService.selectMemberOrder(vo);
		model.addAttribute("memberVO ",orderVO);
		return "myPage/memberOrder";
	}
	
	
	@RequestMapping("/sellerCheck.do")
	public String sellerCheck(MemberVO vo , HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		vo.setUserId((String) session.getAttribute("SessionUserID"));
		int tmp = 0;
		if(vo.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "member/loginWrite";
		}
		else{ // 로그인 된경우
			tmp = memberService.selectSellerCheck(vo);
			if(tmp == 1){ // 판매자일경우
				
				List<?> list = mainService.selectSellerProductList(vo);
				model.addAttribute("resultList",list);
				return "seller/sellerMain";
			}
			else{ // 판매자가 아닐경우
				return "seller/sellerWrite";	
			}		
		}
	}
}

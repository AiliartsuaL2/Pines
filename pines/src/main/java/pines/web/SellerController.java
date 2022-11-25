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
import org.springframework.web.servlet.ModelAndView;

import pines.service.MainService;
import pines.service.MainVO;
import pines.service.MemberService;
import pines.service.MemberVO;
import pines.service.SellerService;

@Controller
public class SellerController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Resource(name="sellerService")
	SellerService sellerService;
	
	@Resource(name="mainService")
	MainService mainService;
	
	@Resource(name="memberService")
	public MemberService memberService;
	
	
	@RequestMapping("/sellerOrderInquiry.do")
	public String selectSellerOrderInquiry(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			MemberVO vo = new MemberVO();
			vo.setUserId(mainVO.getUserId());
			int tmp = memberService.selectSellerCheck(vo);

			if(tmp == 1){ // 판매자일경우
				List<?> orderList = mainService.selectSellerOrderList(mainVO);
				model.addAttribute("orderList", orderList);
				return "seller/sellerOrderInquiry";
			}
			else{ // 판매자가 아닐경우
				model.addAttribute("msg", "판매자로 등록된 사용자만 사용 가능한 메뉴입니다.");
				model.addAttribute("url", "sellerWrite.do");
				return "main/alert";	
			}					
		}
	}

	@RequestMapping("sellerOrderListSearch.do")
	public ModelAndView selectSearchBySellerOrderList(MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		List<?> list = mainService.selectSearchBySellerOrderList(mainVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
	    mv.setViewName("jsonView");
	    return mv;
	}

	@RequestMapping("sellerRevenue.do")
	public String sellerRevenue(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			List<?> revenueList = mainService.selectSellerOrderNumberList(mainVO);
			model.addAttribute("revenueList", revenueList);
		    return "seller/sellerRevenue";
		}
	}

	@RequestMapping("/revenueDetail.do")
	public String selectRevenueDetail(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			String[] setDate = mainVO.getSalesDate().split("-"); // 연 월 일로 배열 생성
			int nextDay = Integer.parseInt(setDate[2])+1; // day에 하루 추가
			String nextDate = setDate[0]+"-"+setDate[1]+"-"; //연 -월 -로 데이터 생성
			nextDate+=Integer.toString(nextDay); // 일 추가
			mainVO.setSalesDateNext(nextDate);// 연-월-일 데이터 세팅
			List<?> revenueList = mainService.selectRevenueDetail(mainVO);
			model.addAttribute("revenueList", revenueList);
		    return "seller/revenueDetail";
		}
	}
	@RequestMapping("/revenueSub.do")
	@ResponseBody
	public String insertRevenue(MainVO mainVO , HttpSession session, ModelMap model) throws Exception{
		String message = "";
		String result = "";
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			String[] setDate = mainVO.getSalesDate().split("-"); // 연 월 일로 배열 생성
			int nextDay = Integer.parseInt(setDate[2])+1; // day에 하루 추가
			String nextDate = setDate[0]+"-"+setDate[1]+"-"; //연 -월 -로 데이터 생성
			nextDate+=Integer.toString(nextDay); // 일 추가
			mainVO.setSalesDateNext(nextDate);// 연-월-일 데이터 세팅
			result = mainService.insertRevenue(mainVO);
			if(result == null){ // 성공
				logger.info("revenue insert 성공,");
				int tmp = mainService.updateOrderRevenue(mainVO);
				System.out.println("tmp : "+tmp);
				if(tmp != 0){
					message = "ok";
					logger.info("order update 성공");
				}
				else{
					logger.info("정산 실패 (order테이블 status update 실패)");
				}
			}
			else{
				logger.info("정산 실패(revenue테이블 insert 실패)");
			}
			return message;
		}
	}

	@RequestMapping("sellerRevenueList.do")
	public String sellerRevenueList(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			List<?> revenueList = mainService.selectSellerRevenueList(mainVO);
			model.addAttribute("revenueList", revenueList);
		    return "seller/sellerRevenueList";
		}
	}

	@RequestMapping("/sellerWrite.do")
	public String sellerWrite(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
		    return "seller/sellerWrite";
		}
	}
	

	@RequestMapping("/storeNameCheck.do")
	@ResponseBody
	public String selectStoreNameCheck(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";

		int count = sellerService.selectStoreNameCheck(mainVO);

		if(count == 0){//성공
			message = "ok";
			logger.info("사용 가능한 상호명");
		}
		else{
			message = "fail";
			logger.info("이미 사용중인 상호명");
		}
		return message;
	}

	@RequestMapping("/storeBusNumCheck.do")
	@ResponseBody
	public String selectStoreBusNumCheck(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";

		int count = sellerService.selectStoreBusNumCheck(mainVO);

		if(count == 0){//성공
			message = "ok";
			logger.info("사용 가능한 사업자 등록번호");
		}
		else{
			message = "fail";
			logger.info("이미 등록된 사업자 등록번호");
		}
		return message;
	}

	@RequestMapping("/sellerWriteSub.do")
	@ResponseBody
	public String insertSellerWrite(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";
		String result = "";
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		
		result = sellerService.insertSellerWrite(mainVO);
		
		if(result == null){ // 성공
			message = "ok";
			logger.info("상점 가입 성공");
		}
		else{
			logger.info("상점 가입 실패");
		}
		return message;
	}
}

package pines.web;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.Cipher;
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
	
	
	
	public String decryptRsa(PrivateKey privateKey, String securedValue){
		String decryptedValue ="";
		try{
			Cipher cipher = Cipher.getInstance("RSA");
			/**
			 * 암호화된 값은 byte 배열,
			 * 이름 문자열 폼으로 전송하기위해 16진 문자열(hex)로 변경,
			 * 서버측에서 값을 받을 때 hex 문자열을 받아서 이를 다시 byte배열로 바꾼뒤 복호화 과정 수행
			 */
			byte[] encryptedBytes = hexToByteArray(securedValue);
			cipher.init(Cipher.DECRYPT_MODE,privateKey);
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			decryptedValue = new String(decryptedBytes,"utf-8"); // 문자열 인코딩
		}catch(Exception e){
			logger.info("암호화 에러 발생 : "+e.getMessage());
		}
		return decryptedValue;
	}
	
	
	public static byte[] hexToByteArray(String hex){
		if(hex == null || hex.length() % 2 != 0){
			return new byte[]{};
		}
		byte[] bytes = new byte[hex.length()/2];
		for(int i=0; i<hex.length(); i+=2){
			byte value = (byte)Integer.parseInt(hex.substring(i,i+2),16);//16진법으로
			bytes[(int)Math.floor(i/2)] = value;	
		}
		return bytes;
	}
	
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
			int tmp = memberService.selectSellerCheck(mainVO);
			if(tmp == 1){ // 판매자일경우
				int unit = 5;
				//총 데이터 개수 
				int total = sellerService.selectSellerOrderInquiryTotal(mainVO);
								
				int totalPage = (int) Math.ceil((double)total/unit);
				
				int viewPage = mainVO.getViewPage();
				if(viewPage > totalPage || viewPage < 1){
					viewPage = 1;
				}
				// 1-> 1 ,10 // 2->11,20 // 3->21,30
				int startIndex = (viewPage-1)*unit + 1;
				int endIndex = startIndex+(unit-1);
				//total -> 34
				// 1 : 34~25, 2:24~15 , 3:14~5, 4:4~1
				int startRowNo = total- (viewPage-1)*unit;
				
				//VO에 태워서 넘김
				mainVO.setStartIndex(startIndex);
				mainVO.setEndIndex(endIndex);

				model.addAttribute("rowNumber",startRowNo);
				model.addAttribute("total",total);
				model.addAttribute("totalPage",totalPage);
				
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

	@RequestMapping("sellerOrderDetail.do")
	public String selectSellerOrderDetail(ModelMap model, MainVO mainVO, HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			List<?> orderList = sellerService.selectSellerOrderDetail(mainVO);
			model.addAttribute("orderList",orderList);
			return "seller/sellerOrderDetail";
		}
	}

	@RequestMapping("updateDeliveryStatus.do")
	public String updateDeliveryStatus(ModelMap model, MainVO mainVO, HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			int cnt = 0;
			if(mainVO.getDeliveryStatus().equals("배송 전")){
				mainVO.setDeliveryStatus("배송완료");
			}
			else{ //배송 후 상태인경우
				mainVO.setDeliveryStatus("배송 전");
			}
			
			cnt = sellerService.updateDeliveryStatus(mainVO);
			
			if(cnt == 1){
				logger.info("배송상태 변경 성공");
				model.addAttribute("msg", "배송상태 변경이 완료되었습니다.");
				model.addAttribute("url", "sellerOrderDetail.do?orderId="+mainVO.getOrderId());
				return "main/alert";
				
				//return "seller/sellerOrderInquiry";
			}
			else{
				logger.info("배송상태 변경 실패");
				model.addAttribute("msg", "배송 상태 변경에 실패하였습니다. 관리자에게 연락 바랍니다.");
				model.addAttribute("url", "sellerOrderInquiry.do");
				return "main/alert";
				//return "seller/sellerOrderInquiry";
			}
			
			
		}
	}
	
	
	
	@RequestMapping("sellerOrderListSearch.do")
	public ModelAndView selectSearchBySellerOrderList(MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		
		int unit = 5;
		//총 데이터 개수 


		String startOrderPeriod = mainVO.getStartOrderPeriod();
		String[] startDate = startOrderPeriod.split("-");
		
		String startOrderDay = startDate[0]+startDate[1]+startDate[2]+"00"+"00"+"00";
		mainVO.setStartOrderPeriod(startOrderDay);
		
		
		String endOrderPeriod = mainVO.getEndOrderPeriod();
		String[] endDate = endOrderPeriod.split("-");
		
		String endOrderDay = endDate[0]+endDate[1]+endDate[2]+"23"+"59"+"59";
		mainVO.setEndOrderPeriod(endOrderDay);
		
		int total = sellerService.selectSearchBySellerOrderListTotal(mainVO);
		
		int totalPage = (int) Math.ceil((double)total/unit);
		
		
		
		int viewPage = mainVO.getViewPage();
		if(viewPage > totalPage || viewPage < 1){
			viewPage = 1;
		}
		// 1-> 1 ,10 // 2->11,20 // 3->21,30
		int startIndex = (viewPage-1)*unit + 1;
		int endIndex = startIndex+(unit-1);
		//total -> 34
		// 1 : 34~25, 2:24~15 , 3:14~5, 4:4~1
		int startRowNo = total- (viewPage-1)*unit;
		
		//VO에 태워서 넘김
		mainVO.setStartIndex(startIndex);
		mainVO.setEndIndex(endIndex);
		
		HashMap<String,Integer> cntMap = new HashMap<>();
		cntMap.put("rowNumber", startRowNo);
		cntMap.put("total", total);
		cntMap.put("totalPage", totalPage);

		List<?> list = mainService.selectSearchBySellerOrderList(mainVO);
		List<HashMap<String,Integer>> list2 = new LinkedList<>();
		list2.add(cntMap);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
		mv.addObject("obj2", list2); 
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
			if(Integer.parseInt(setDate[1])<10){
				setDate[1] = "0"+setDate[1];
			}
			if(Integer.parseInt(setDate[2])<10){
				setDate[2] = "0"+setDate[2];
			}
			
			String today =  setDate[0]+setDate[1]+setDate[2]+"00"+"00"+"00";
			String nextDay = setDate[0]+setDate[1]+setDate[2]+"23"+"59"+"59";
			
			mainVO.setSalesDate(today);
			mainVO.setSalesDateNext(nextDay);
			
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
			if(Integer.parseInt(setDate[1])<10){
				setDate[1] = "0"+setDate[1];
			}
			if(Integer.parseInt(setDate[2])<10){
				setDate[2] = "0"+setDate[2];
			}
			
			String today =  setDate[0]+setDate[1]+setDate[2]+"00"+"00"+"00";
			String nextDay = setDate[0]+setDate[1]+setDate[2]+"23"+"59"+"59";
			
			mainVO.setSalesDate(today);
			mainVO.setSalesDateNext(nextDay);
			
			
			
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
			int unit = 3;
			//총 데이터 개수 
			int total = sellerService.selectSellerRevenueTotal(mainVO);
			
			int totalPage = (int) Math.ceil((double)total/unit);
			
			int viewPage = mainVO.getViewPage();
			if(viewPage > totalPage || viewPage < 1){
				viewPage = 1;
			}
			// 1-> 1 ,10 // 2->11,20 // 3->21,30
			int startIndex = (viewPage-1)*unit + 1;
			int endIndex = startIndex+(unit-1);
			//total -> 34
			// 1 : 34~25, 2:24~15 , 3:14~5, 4:4~1
			int startRowNo = total- (viewPage-1)*unit;
			
			//VO에 태워서 넘김
			mainVO.setStartIndex(startIndex);
			mainVO.setEndIndex(endIndex);

			model.addAttribute("rowNumber",startRowNo);
			model.addAttribute("total",total);
			model.addAttribute("totalPage",totalPage);
			
			
			List<?> revenueList = mainService.selectSellerRevenueList(mainVO);
			model.addAttribute("revenueList", revenueList);
		    return "seller/sellerRevenueList";
		}
	}
	
	@RequestMapping("sellerRevenueListSearch.do")
	public ModelAndView selectSearchBySellerRevenueList(MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		int unit = 3;
		//총 데이터 개수 
		String startOrderPeriod = mainVO.getStartOrderPeriod();
		String[] startDate = startOrderPeriod.split("-");

		String startOrderDay = startDate[0]+startDate[1]+startDate[2]+"00"+"00"+"00";
		mainVO.setStartOrderPeriod(startOrderDay);
		
		
		String endOrderPeriod = mainVO.getEndOrderPeriod();
		String[] endDate = endOrderPeriod.split("-");

		
		String endOrderDay = endDate[0]+endDate[1]+endDate[2]+"23"+"59"+"59";
		mainVO.setEndOrderPeriod(endOrderDay);
		
		int total = sellerService.selectSearchBySellerRevenueListTotal(mainVO);
		
		int totalPage = (int) Math.ceil((double)total/unit);
		
		
		
		int viewPage = mainVO.getViewPage();
		if(viewPage > totalPage || viewPage < 1){
			viewPage = 1;
		}
		// 1-> 1 ,10 // 2->11,20 // 3->21,30
		int startIndex = (viewPage-1)*unit + 1;
		int endIndex = startIndex+(unit-1);
		//total -> 34
		// 1 : 34~25, 2:24~15 , 3:14~5, 4:4~1
		int startRowNo = total- (viewPage-1)*unit;
		
		//VO에 태워서 넘김
		mainVO.setStartIndex(startIndex);
		mainVO.setEndIndex(endIndex);
		
		HashMap<String,Integer> cntMap = new HashMap<>();
		cntMap.put("rowNumber", startRowNo);
		cntMap.put("total", total);
		cntMap.put("totalPage", totalPage);

		List<?> list = sellerService.selectSearchBySellerRevenueList(mainVO);
		List<HashMap<String,Integer>> list2 = new LinkedList<>();
		list2.add(cntMap);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
		mv.addObject("obj2", list2); 
	    mv.setViewName("jsonView");
	    
	    return mv;
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
			int tmp = memberService.selectSellerCheck(mainVO);
			if(tmp == 1){ // 판매자일경우
				return "seller/sellerRemove";
			}
			else{ // 판매자가 아닐경우
			    return "seller/sellerWrite";
			}					
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
	
	@RequestMapping("/sellerDeleteCheck.do")
	@ResponseBody
	public String selectSellerDeleteCheck(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";
		String tmp = (String) session.getAttribute("SessionUserID");
		if(!tmp.equals(mainVO.getUserId())){
			logger.info("로그인 ID, 입력 ID 불일치");
			return "notEqualId";
		}
		
		int count = sellerService.selectSellerDeleteCheck(mainVO);
		
		
		if(count == 1){ // 성공
			message = "ok";
			logger.info("본인확인 성공");
		}
		else{
			logger.info("본인확인 실패");
		}
		return message;
	}
	
	@RequestMapping("/sellerDeleteSub.do")
	@ResponseBody
	public String updateSellerDeleteSub(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";
		
		int count = sellerService.updateSellerDeleteSub(mainVO);
		
		if(count == 1){ // 성공
			message = "ok";
			logger.info("판매자 탈퇴 성공");
		}
		else{
			logger.info("판매자 탈퇴 실패");
		}
		return message;
	}
	@RequestMapping("/sellerInfoCheck.do")
	public String selectSellerInfoCheck(ModelMap model, MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			int tmp = memberService.selectSellerCheck(mainVO);
			if(tmp == 1){
				KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
				generator.initialize(1024);
				KeyPair keyPair = generator.genKeyPair();
				KeyFactory keyFactory = KeyFactory.getInstance("RSA");
				PublicKey publicKey = keyPair.getPublic();
				PrivateKey privateKey = keyPair.getPrivate();
				
				session.setAttribute("_RSA_WEB_key_", privateKey); // 세션에 RSA 개인키를 세션에 저장
				RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
				String publicKeyModulus = publicSpec.getModulus().toString(16);
				String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
				
				request.setAttribute("RSAModulus", publicKeyModulus);
				request.setAttribute("RSAExponent", publicKeyExponent);
				
				model.addAttribute("mainVO", mainVO);
				return "seller/sellerInfoCheck";
			}
			else{
				model.addAttribute("msg", "판매자로 등록된 사용자만 사용 가능한 메뉴입니다.");
				model.addAttribute("url", "sellerWrite.do");
				return "main/alert";	
			}
			
		}
	}
	@RequestMapping("/sellerInfo.do")
	public String selectSellerInfo(ModelMap model, MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			generator.initialize(1024);
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			
			session.setAttribute("_RSA_WEB_key_", privateKey); // 세션에 RSA 개인키를 세션에 저장
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			
			request.setAttribute("RSAModulus", publicKeyModulus);
			request.setAttribute("RSAExponent", publicKeyExponent);
			
			List<?> list = sellerService.selectSellerInfo(mainVO);
			model.addAttribute("sellerList", list);			
			return "seller/sellerInfo";
		}
	}
	@RequestMapping("/sellerInfoModify.do")
	@ResponseBody
	public String updateSellerInfoModify(ModelMap model, MainVO mainVO, HttpSession session) throws Exception{
		String message = "";
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		
		String bankName = mainVO.getBankName();
		String accountNumber = mainVO.getAccountNumber();
		String accountHolder = mainVO.getAccountHolder();
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_key_");//개인키를 다시 세션에서  받아옴
		
		if(privateKey == null){
			logger.info("rsa 체크 실패");
			message = "failCheck";
		}
		else{
			try{
				String _bankName = decryptRsa(privateKey,bankName); // 복호화
				String _accountNumber = decryptRsa(privateKey,accountNumber); // 복호화
				String _accountHolder = decryptRsa(privateKey,accountHolder); // 복호화 
				
				mainVO.setBankName(_bankName);
				mainVO.setAccountNumber(_accountNumber);
				mainVO.setAccountHolder(_accountHolder);

				int count = sellerService.updateSellerModify(mainVO);
				if(count == 1){ // 성공
					message = "ok";
					logger.info("판매처 정보 수정 성공");
				}
				else{
					message = "false";
					logger.info("판매처 정보 수정 실패");
				}
				
			}catch(Exception e){
				message = "error";
				logger.info("로그인 체크 에러"+e.getMessage());
			}	
		}
		return message;
	}
}

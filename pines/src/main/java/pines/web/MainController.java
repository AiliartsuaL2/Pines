package pines.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.coobird.thumbnailator.Thumbnails;
import pines.service.ImageVO;
import pines.service.MainService;
import pines.service.MainVO;
import pines.service.MemberService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Resource(name="mainService")
	MainService mainService;
	
	@Resource(name="memberService")
	MemberService memberService;

	@RequestMapping("/mainList.do")
	public String selectMainList(MainVO vo , ModelMap model) throws Exception{
		List<?> list = mainService.selectMainList(vo);
		model.addAttribute("resultList",list);
			
		
		return "main/mainList";
	}
	
	@RequestMapping("/productList.do")
	public String selectProductList(MainVO vo , ModelMap model) throws Exception{

		int unit = 5;
		//총 데이터 개수 
		int total = mainService.selectProductTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
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
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		MainVO mainVO = vo;
		List<?> list = mainService.selectProductList(vo);
		mainVO.setSearchGubun(vo.getSearchGubun());
		mainVO.setSearchText(vo.getSearchText());
		
		model.addAttribute("search",mainVO);
		model.addAttribute("rowNumber",startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
		
		return "main/productList";
	}
	
	@RequestMapping("/plantList.do")
	public String selectPlantList(MainVO vo, ModelMap model) throws Exception{
		int unit = 6;
		//총 데이터 개수 
		int total = mainService.selectPlantTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
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
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = mainService.selectPlantList(vo);

		

		String categoryId = "";
		if(vo.getCategoryId() != null){
			
			switch(vo.getCategoryId()){
				case "seed": categoryId="묘목 / 묘종";
					break;
				case "airplant": categoryId="식물 / 공중식물";
					break;
				case "potted": categoryId="관엽 / 공기정화";
					break;
				case "succulents": categoryId="다육 / 선인장";
					break;
				case "orchid": categoryId="동양란 / 서양란";
					break;
				case "herb": categoryId="야생 / 허브 / 분재";
				break;
			}
			
		}
		
		model.addAttribute("categoryId",categoryId);
		model.addAttribute("rowNumber",startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("plantList",list);
		model.addAttribute("parentCategoryId",vo);
		
		return "product/plantList";
	}
	
	@RequestMapping("/flowerList.do")
	public String selectFlowerList(MainVO vo, ModelMap model) throws Exception{
		int unit = 6;
		//총 데이터 개수 
		int total = mainService.selectFlowerTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
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
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = mainService.selectFlowerList(vo);

		String categoryId = "";
		if(vo.getCategoryId() != null){
			
			switch(vo.getCategoryId()){
				case "anniversary": categoryId="생일 / 기념일";
					break;
				case "opening": categoryId="개업 / 이전";
					break;
				case "promotion": categoryId="승진 / 취임";
					break;
				case "remembrance": categoryId="추모 / 근조";
					break;
			}
		}
		
		model.addAttribute("categoryId",categoryId);
		model.addAttribute("rowNumber",startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("flowerList",list);
		model.addAttribute("parentCategoryId",vo);
		
		return "product/flowerList";
	}
	
	
	@RequestMapping("/discountList.do")
	public String selectDiscountList(MainVO vo, ModelMap model) throws Exception{
		int unit = 6;
		//총 데이터 개수 
		int total = mainService.selectDiscountTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
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
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = mainService.selectDiscountList(vo);
		model.addAttribute("rowNumber",startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("discountList",list);
		return "product/discountList";
	}

	@RequestMapping("sellerProductSearch.do")
	public ModelAndView selectProductSearchList(MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));

		int unit = 5;
		//총 데이터 개수 
		int total = mainService.selectProductSearchTotal(mainVO);
		
		
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
		
		List<?> list = mainService.selectProductSearchList(mainVO);
		List<HashMap<String,Integer>> list2 = new LinkedList<>();
		list2.add(cntMap);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
	    mv.addObject("obj2",list2);
		mv.setViewName("jsonView");
	    return mv;
	}
	
	
	@RequestMapping("productWrite.do")
	public String productWrite(MainVO mainVO,HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
			
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			String sellerType = mainService.selectSellerType(mainVO);
			List<?> list = mainService.selectParentCategory(mainVO);
			
			model.addAttribute("sellerType",sellerType);
			model.addAttribute("resultList",list);
			return "seller/productWrite";
			
		}
	}
	
	
	
	@RequestMapping("selectCategory.do")
	public ModelAndView selectParentCategory(MainVO mainVO) throws Exception{
		List<?> list = mainService.selectCategoryList(mainVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
	    mv.setViewName("jsonView");
	    
	    return mv;
	}
	
	@RequestMapping("uploadAjaxAction.do")
	public ModelAndView uploadAjaxActionPost(@RequestParam List<MultipartFile> uploadFile){
		logger.info("uploadAjaxActionPOST..........");		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(type == null){
				break;
			}	
			if(!type.startsWith("image")) {
				ModelAndView mv = new ModelAndView();
				mv.addObject("obj1", HttpStatus.BAD_REQUEST); 
			    mv.setViewName("jsonView");
			    return mv;
			}
			
		}// for
		//String uploadFolder = "C:\\Users\\장호성\\AppData\\Roaming\\SPB_Data\\git\\Pines\\pines\\src\\main\\webapp\\product_image"; // 서버 원래 경로
		//String uploadFolder = "C:\\Users\\장호성\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pines\\product_image"; // 톰캣 실행시 서버에 올라가는 경로
		String linuxUploadFolder = "/var/webapps/upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		File uploadPath = new File(linuxUploadFolder, datePath);
		//File uploadPath = new File(linuxUploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		List<ImageVO> list = new ArrayList();

		int i=0;
		for(MultipartFile multipartFile : uploadFile) {
			// 널값 들어오면 (4개중 1~3개 이미지만 등록시)
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(type == null){
				continue;
			}	
			// 루프 끝냄
			
			logger.info("파일 추가1");
			
			/* 이미지 정보 객체*/
			ImageVO vo = new ImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();	
			System.out.println("uploadFile "+i+" = "+uploadFileName + " list size = "+uploadFile.size());
			i++;
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;	
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile); // 파일 저장
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				BufferedImage bo_image = ImageIO.read(saveFile);
				/* 비율 */
				double ratio = 3;
				/*넓이 높이*/
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				
				Thumbnails.of(saveFile) // 사이즈 작은 파일로 만들고서 
		        .size(width, height)
		        .toFile(thumbnailFile); 
				
				saveFile.delete(); // 원본파일은 다시 삭제함
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		} // for
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
	    mv.setViewName("jsonView");
	    return mv;
	}
	
	@RequestMapping("/productWriteSub.do")
	@ResponseBody
	public String insertProductWrite(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";
		String result = "";
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		String[] DiscountDate = mainVO.getDiscountPeriod().split("-");
		String discountPeriod = DiscountDate[0]+DiscountDate[1]+DiscountDate[2]+"23"+"59"+"59";
		mainVO.setDiscountPeriod(discountPeriod);
		
		result = mainService.insertProduct(mainVO);
		
		if(result == null){ // 성공
			message = "ok";
			logger.info("상품 등록 성공");
		}
		else{
			logger.info("상품 등록 실패");
		}
		return message;
	}
	

	@RequestMapping("/productModify.do")
	public String selectProductModify(MainVO vo,HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		vo.setUserId((String) session.getAttribute("SessionUserID"));
			
		if(vo.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{		
			List<?> list = mainService.selectProductModify(vo.getProductId()); //unq를 받아와서 sql까지 전달시켜야함
			model.addAttribute("productList",list);
			return "seller/productModify";
		}
	}
	@RequestMapping("/productDelete")
	@ResponseBody
	public String deleteProduct(MainVO mainVO, ModelMap model, HttpSession session) throws Exception{
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));

		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "권한이 없습니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			String message = "";
			int cnt = mainService.selectDeleteProductCheck(mainVO);
			if(cnt > 0){ // 배송 전 상품이 있는경우
				message = "noneDelivery";
			}
			else{
				int result = mainService.deleteProduct(mainVO);
				if(result == 1){
					message = "ok";
					logger.info("상품 삭제 성공"); // update시켜서 스토어 아이디만 0으로 바꿔버림
				}
				else{
					message = "insertErr";
					logger.info("상품 삭제 실패");
				}
			}
			return message;
		}
	}
	
	@RequestMapping("/productModifySub.do")
	@ResponseBody // ajax에 보내줄 수 있는 어노테이션
	public String updateProductModifySub(MainVO mainVO, HttpSession session) throws Exception{
		int result = 0;
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		String[] dp = mainVO.getDiscountPeriod().split("-");
		String discountPeriod = dp[0]+dp[1]+dp[2]+"23"+"59"+"59";
		mainVO.setDiscountPeriod(discountPeriod);
		result = mainService.updateProduct(mainVO);
		
		return result+"";
	}

	@RequestMapping("/productDetail.do")
	public String selectProductDetail(MainVO vo, ModelMap model) throws Exception{
		List<?> list = mainService.selectProductDetail(vo.getProductId()); //unq를 받아와서 sql까지 전달시켜야함
		EgovMap value = (EgovMap) list.get(0);
		
		
		if(value.get("signStore").equals("N")){ // signStore가 N인 상품은 탈퇴한 상점의 상품
			model.addAttribute("msg", "판매 중지된 상품입니다.");
			model.addAttribute("url", "mainList.do");
			return "main/alert";
		}
		if(value.get("regYN").equals("N")){ //storeId가 0인 상품은 삭제된 상품
			model.addAttribute("msg", "삭제된 상품입니다.");
			model.addAttribute("url", "mainList.do");
			return "main/alert";
		}
		if(value.get("regState").equals("품절")){ // 품절된 상품,,
			model.addAttribute("msg", "품절된 상품입니다.");
			model.addAttribute("url", "mainList.do");
			return "main/alert";
		}
		model.addAttribute("productList",list);
		return "main/productDetail";
	}
	
	
	@RequestMapping("/orderLoginCheck.do")
	public String orderLoginCheck(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			String referer = request.getHeader("Referer"); // 이전페이지의 uri 받아옴		
			request.getSession().setAttribute("redirectURI", referer);
			
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{ // 로그인 된경우				
				int count = mainService.selectMemberProductCheck(mainVO);
				if(count != 0){ // 본인 물건 구매시
					model.addAttribute("msg", "본인 제품은 구매 할 수 없습니다.");
					model.addAttribute("url", "productDetail.do?productId="+mainVO.getProductId());
					return "main/alert";
				}
				else{
					List<?> memberList = memberService.selectMemberInfo(mainVO);
					model.addAttribute("productList",mainVO);
					model.addAttribute("memberList",memberList);
					return "order/orderWrite";		
				}
			}
	}
	
	@RequestMapping("/orderWriteSub.do")
	@ResponseBody
	public String insertOrderWrite(MainVO mainVO , HttpSession session) throws Exception{
		String message = "";
		String result = "";
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		result = mainService.insertOrder(mainVO);
		
		if(result == null){ // 성공
			int tmp = memberService.updateMemberPoint(mainVO);
			message = "ok";
			logger.info("주문 성공");
		}
		else{
			logger.info("주문 실패");
		}
		return message;
	}
	
	@RequestMapping("/orderInquiry.do")
	public String selectOrderInquiry(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			
			int unit = 5;
			//총 데이터 개수 
			int total = mainService.selectMyOrderListTotal(mainVO);
			
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
			
			
			List<?> orderList = mainService.selectMyOrderList(mainVO);
			model.addAttribute("orderList", orderList);
			return "myPage/orderInquiry";
		}
	}

	@RequestMapping("orderListSearch.do")
	public ModelAndView selectOrderListSearch(MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));

		int unit = 5;
		//총 데이터 개수 
		
		//오늘 데이터까지 조회하도록 데이터 설정
		String startOrderPeriod = mainVO.getStartOrderPeriod();
		String[] startDate = startOrderPeriod.split("-");
		
		String startOrderDay = startDate[0]+startDate[1]+startDate[2]+"00"+"00"+"00";
		mainVO.setStartOrderPeriod(startOrderDay);
		
		
		String endOrderPeriod = mainVO.getEndOrderPeriod();
		String[] endDate = endOrderPeriod.split("-");
		
		String endOrderDay = endDate[0]+endDate[1]+endDate[2]+"23"+"59"+"59";
		mainVO.setEndOrderPeriod(endOrderDay);
		//오늘 데이터까지 조회하도록 데이터 설정
		
		
		int total = mainService.selectOrderListSearchTotal(mainVO);
		
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

		List<?> list = mainService.selectSearchByMyOrderList(mainVO);
		List<HashMap<String,Integer>> list2 = new LinkedList<>();
		list2.add(cntMap);
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
		mv.addObject("obj2", list2); 
	    mv.setViewName("jsonView");
	    return mv;
	}
	
	
	@RequestMapping("/paymentManage.do")
	public String selectPaymentManage(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			List<?> memberList = memberService.selectMemberInfo(mainVO);
			model.addAttribute("memberList",memberList);
			return "myPage/paymentManage";
		}
	}
	@RequestMapping("/orderDetail.do")
	public String selectOrderDetail(MainVO mainVO, HttpServletRequest request, ModelMap model) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		if(mainVO.getUserId() == null){ // 로그인 안된경우
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "loginWrite.do");
			return "main/alert";
		}
		else{
			List<?> orderList = mainService.selectOrderDetailList(mainVO);
			model.addAttribute("orderList",orderList);
			return "myPage/orderDetail";
		}
	}
	
	
	
	
}

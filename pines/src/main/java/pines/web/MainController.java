package pines.web;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;
import pines.service.ImageVO;
import pines.service.MainService;
import pines.service.MainVO;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Resource(name="mainService")
	MainService mainService;

	@RequestMapping("/mainList.do")
	public String selectMainList(MainVO vo , ModelMap model) throws Exception{
		List<?> list = mainService.selectMainList(vo);
		model.addAttribute("resultList",list);
		System.out.println("list : "+ list);
		
		
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
		
		
		List<?> list = mainService.selectProductList(vo);

		model.addAttribute("rowNumber",startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
		
		return "main/productList";
	}
	
	@RequestMapping("/plantList.do")
	public String selectPlantList(MainVO vo, ModelMap model) throws Exception{
		List<?> list = mainService.selectPlantList(vo);
		model.addAttribute("plantList",list);
		System.out.println("list : "+ list);
		return "product/plantList";
	}
	
	@RequestMapping("/flowerList.do")
	public String selectFlowerList(MainVO vo, ModelMap model) throws Exception{
		List<?> list = mainService.selectFlowerList(vo);
		model.addAttribute("flowerList",list);
		System.out.println("list : "+ list);
		return "product/flowerList";
	}
	@RequestMapping("/discountList.do")
	public String selectDiscountList(MainVO vo, ModelMap model) throws Exception{
		List<?> list = mainService.selectDiscountList(vo);
		model.addAttribute("discountList",list);
		System.out.println("list : "+ list);
		return "product/discountList";
	}

	@RequestMapping("sellerProductSearch.do")
	public ModelAndView selectProductSearchList(MainVO mainVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(true);
		mainVO.setUserId((String) session.getAttribute("SessionUserID"));
		List<?> list = mainService.selectProductSearchList(mainVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", list); 
	    mv.setViewName("jsonView");
	    return mv;
	}
	@RequestMapping("productWrite.do")
	public String productWrite(MainVO mainVO, ModelMap model) throws Exception{
		List<?> list = mainService.selectParentCategory(mainVO);
		model.addAttribute("resultList",list);
		return "seller/productWrite";
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
	public ModelAndView uploadAjaxActionPost(@RequestParam MultipartFile[] uploadFile){
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
			
			if(!type.startsWith("image")) {
				ModelAndView mv = new ModelAndView();
				mv.addObject("obj1", HttpStatus.BAD_REQUEST); 
			    mv.setViewName("jsonView");
			    return mv;
			}
			
		}// for
		String uploadFolder = "C:\\Users\\장호성\\AppData\\Roaming\\SPB_Data\\git\\Pines\\pines\\src\\main\\webapp\\product_image";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		List<ImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			/* 이미지 정보 객체*/
			ImageVO vo = new ImageVO();
			
			
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();	
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
}

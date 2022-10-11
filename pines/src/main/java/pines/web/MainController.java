package pines.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pines.service.MainService;
import pines.service.MainVO;

@Controller
public class MainController {
	@Resource(name="mainService")
	MainService mainService;
	
	@RequestMapping("/productList.do")
	public String selectProductList(MainVO vo , ModelMap model) throws Exception{
		List<?> list = mainService.selectProductList(vo);
		model.addAttribute("resultList",list);
		System.out.println("list : "+ list);
		return "main/productList";
	}
	@RequestMapping("/plantList.do")
	public String selectPlantList(MainVO vo, ModelMap model) throws Exception{
		List<?> list = mainService.selectProductList(vo);
		model.addAttribute("resultList",list);
		System.out.println("list : "+ list);
		return "product/plantList";
	}
}

package pines.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pines.service.MainService;
import pines.service.MainVO;
import pines.service.MemberVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	@Resource(name="mainDAO")
	public MainDAO mainDAO;
	
	@Override
	public List<?> selectProductList(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectProductList(vo);
	}

	@Override
	public List<?> selectPlantList(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectPlantList(vo);
	}

	@Override
	public List<?> selectFlowerList(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectFlowerList(vo);
	}

	@Override
	public List<?> selectMainList(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  mainDAO.selectMainList(vo);
	}

	@Override
	public List<?> selectDiscountList(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  mainDAO.selectDiscountList(vo);
	}

	@Override
	public List<?> infiniteScrollDown(Integer bnoToStart) {
		// TODO Auto-generated method stub
		return  mainDAO.infiniteScrollDown(bnoToStart);
	}

	@Override
	public int selectProductTotal(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectProductTotal(vo);
	}

	@Override
	public List<?> selectSellerProductList(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerProductList(vo);
	}

	@Override
	public List<?> selectProductSearchList(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectProductSearchList(vo);
	}

	@Override
	public List<?> selectParentCategory(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectParentCategory(mainVO);
	}

	@Override
	public List<?> selectCategoryList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectCategoryList(mainVO);
	}

	@Override
	public String insertProduct(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return (String) mainDAO.insertProduct(mainVO);
	}

	@Override
	public List<?> selectProductModify(String productId) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectProductModify(productId);
	}

	@Override
	public int updateProduct(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.updateProduct(mainVO);
	}




}

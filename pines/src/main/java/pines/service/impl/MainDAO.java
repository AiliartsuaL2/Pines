package pines.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import pines.service.MainVO;
import pines.service.MemberVO;

@Repository("mainDAO")
public class MainDAO extends EgovAbstractDAO{
	
	public List<?> selectProductList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectProductList",vo);
	}

	public List<?> selectPlantList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectPlantList",vo);
	}

	public List<?> selectFlowerList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectFlowerList",vo);
	}

	public List<?> selectMainList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectMainList",vo);
	}

	public List<?> selectDiscountList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectDiscountList",vo);
	}

	public List<?> infiniteScrollDown(Integer bnoToStart) {
		// TODO Auto-generated method stub
		return list("mainDAO.infiniteScrollDown",bnoToStart);
	}

	public int selectProductTotal(MainVO vo) {
		// TODO Auto-generated method stub
		return (int) select("mainDAO.selectProductTotal",vo);
	}

	public List<?> selectSellerProductList(MemberVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectSellerProductList",vo);
	}

	public List<?> selectProductSearchList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectProductSearchList",vo);
	}

	public List<?> selectParentCategory(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectParentCategory", mainVO);
	}

	public List<?> selectCategoryList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectCategoryList", mainVO);
	}

}

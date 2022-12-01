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

	public String insertProduct(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (String) insert("mainDAO.insertProduct", mainVO);
	}

	public List<?> selectProductModify(String productId) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectProductModify",productId);
	}
	

	public int deleteProduct(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) delete("mainDAO.deleteProduct", mainVO);
	}

	public int updateProduct(MainVO mainVO) {
		// TODO Auto-generated method stub
		return update("mainDAO.updateProduct", mainVO);
	}

	public List<?> selectProductDetail(String productId) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectProductDetail",productId);
	}

	public List<?> selectProductInfo(String productId) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectProductInfo", productId);
	}

	public String insertOrder(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (String) insert("mainDAO.insertOrder",mainVO);
	}

	public List<?> selectMyOrderList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectMyOrderList", mainVO);
	}

	public List<?> selectOrderDetailList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectOrderDetailList", mainVO);
	}

	public List<?> selectSearchByMyOrderList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectSearchByMyOrderList", mainVO);
	}

	public List<?> selectSellerOrderList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectSellerOrderList", mainVO);
	}

	public List<?> selectSearchBySellerOrderList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectSearchBySellerOrderList", mainVO);
	}

	public List<?> selectSellerOrderNumberList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectSellerOrderNumberList",mainVO);
	}

	public List<?> selectRevenueDetail(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectRevenueDetail", mainVO);
	}

	public String insertRevenue(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (String) insert("mainDAO.insertRevenue", mainVO);
	}

	public int updateOrderRevenue(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) update("mainDAO.updateOrderRevenue", mainVO);
	}

	public List<?> selectSellerRevenueList(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectSellerRevenueList", mainVO);
	}

	public int selectMemberProductCheck(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) select("mainDAO.selectMemberProductCheck",mainVO);
	}

	public String selectSellerType(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (String) select("mainDAO.selectSellerType",mainVO);
	}
}

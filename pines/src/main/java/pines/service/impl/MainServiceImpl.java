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
	public List<?> selectSellerProductList(MainVO vo) throws Exception {
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
	public int deleteProduct(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) mainDAO.deleteProduct(mainVO);
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

	@Override
	public List<?> selectProductDetail(String productId) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectProductDetail(productId);
	}

	@Override
	public List<?> selectProductInfo(String productId) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectProductInfo(productId);
	}

	@Override
	public String insertOrder(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.insertOrder(mainVO);
	}

	@Override
	public List<?> selectMyOrderList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectMyOrderList(mainVO);
	}

	@Override
	public List<?> selectOrderDetailList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectOrderDetailList(mainVO);
	}

	@Override
	public List<?> selectSearchByMyOrderList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSearchByMyOrderList(mainVO);
	}

	@Override
	public List<?> selectSellerOrderList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerOrderList(mainVO);
	}

	@Override
	public List<?> selectSearchBySellerOrderList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSearchBySellerOrderList(mainVO);
	}

	@Override
	public List<?> selectSellerOrderNumberList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerOrderNumberList(mainVO);
	}

	@Override
	public List<?> selectRevenueDetail(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectRevenueDetail(mainVO);
	}

	@Override
	public String insertRevenue(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.insertRevenue(mainVO);
	}

	@Override
	public int updateOrderRevenue(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.updateOrderRevenue(mainVO);
	}

	@Override
	public List<?> selectSellerRevenueList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerRevenueList(mainVO);
	}

	@Override
	public int selectMemberProductCheck(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectMemberProductCheck(mainVO);
	}

	@Override
	public String selectSellerType(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerType(mainVO);
	}

	@Override
	public int selectPlantTotal(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectPlantTotal(vo);
	}

	@Override
	public int selectFlowerTotal(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectFlowerTotal(vo);
	}

	@Override
	public int selectDiscountTotal(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectDiscountTotal(vo);
	}

	@Override
	public int selectSellerProductTotal(MainVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerProductTotal(vo);
	}

	@Override
	public int selectProductSearchTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSellerSearchProductTotal(mainVO);
	}

	@Override
	public int selectMyOrderListTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectMyOrderListTotal(mainVO);
	}

	@Override
	public int selectOrderListSearchTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectOrderListSearchTotal(mainVO);
	}


}

package pines.service;

import java.util.List;


public interface MainService {
	public List<?> selectProductList(MainVO vo) throws Exception;  // 화면목록
	public List<?> selectPlantList(MainVO vo) throws Exception;  // 화면목록
	public List<?> selectFlowerList(MainVO vo) throws Exception;
	public List<?> selectMainList(MainVO vo) throws Exception;
	public List<?> selectDiscountList(MainVO vo) throws Exception;
	public List<?> infiniteScrollDown(Integer bnoToStart);
	public int selectProductTotal(MainVO vo) throws Exception; // Total 개수 얻기
	public List<?> selectSellerProductList(MemberVO vo) throws Exception;
	public List<?> selectProductSearchList(MainVO vo) throws Exception;
	public List<?> selectParentCategory(MainVO mainVO) throws Exception;
	public List<?> selectCategoryList(MainVO mainVO) throws Exception;
	public String insertProduct(MainVO mainVO) throws Exception;
	public List<?> selectProductModify(String productId) throws Exception;
	public int updateProduct(MainVO mainVO) throws Exception;
	public List<?> selectProductDetail(String productId) throws Exception;
	public List<?> selectProductInfo(String productId) throws Exception;
	public String insertOrder(MainVO mainVO) throws Exception;
	public List<?> selectMyOrderList(MainVO mainVO) throws Exception;
	public List<?> selectOrderDetailList(MainVO mainVO) throws Exception;
	public int deleteProduct(MainVO mainVO) throws Exception;
	public List<?> selectSearchByMyOrderList(MainVO mainVO) throws Exception;
	public List<?> selectSellerOrderList(MainVO mainVO) throws Exception;
	public List<?> selectSearchBySellerOrderList(MainVO mainVO) throws Exception;
	public List<?> selectSellerOrderNumberList(MainVO mainVO) throws Exception;
	public List<?> selectRevenueDetail(MainVO mainVO) throws Exception;
	public String insertRevenue(MainVO mainVO) throws Exception;
	public int updateOrderRevenue(MainVO mainVO) throws Exception;
	public List<?> selectSellerRevenueList(MainVO mainVO) throws Exception;
	public int selectMemberProductCheck(MainVO mainVO) throws Exception;
	public String selectSellerType(MainVO mainVO) throws Exception;
	}

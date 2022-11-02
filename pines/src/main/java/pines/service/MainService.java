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
	}

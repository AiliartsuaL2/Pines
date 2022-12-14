package pines.service;

import java.util.List;

public interface SellerService {

	int selectStoreNameCheck(MainVO mainVO) throws Exception;

	int selectStoreBusNumCheck(MainVO mainVO) throws Exception;

	String insertSellerWrite(MainVO mainVO) throws Exception;

	int selectSellerDeleteCheck(MainVO mainVO) throws Exception;

	int updateSellerDeleteSub(MainVO mainVO) throws Exception;

	List<?> selectSellerOrderDetail(MainVO mainVO) throws Exception;

	int updateDeliveryStatus(MainVO mainVO) throws Exception;

	int selectSellerOrderInquiryTotal(MainVO mainVO) throws Exception;

	int selectSearchBySellerOrderListTotal(MainVO mainVO) throws Exception;

	List<?> selectSellerInfo(MainVO mainVO) throws Exception;

	int updateSellerModify(MainVO mainVO) throws Exception;

	int selectSearchBySellerRevenueListTotal(MainVO mainVO) throws Exception;

	List<?> selectSearchBySellerRevenueList(MainVO mainVO) throws Exception;

	int selectSellerRevenueTotal(MainVO mainVO) throws Exception;
	

}

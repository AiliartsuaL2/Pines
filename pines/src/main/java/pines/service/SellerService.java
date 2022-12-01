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
	

}

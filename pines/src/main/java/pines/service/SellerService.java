package pines.service;

public interface SellerService {

	int selectStoreNameCheck(MainVO mainVO) throws Exception;

	int selectStoreBusNumCheck(MainVO mainVO) throws Exception;

	String insertSellerWrite(MainVO mainVO) throws Exception;
	

}

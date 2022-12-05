package pines.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import pines.service.MainVO;

@Repository("sellerDAO")
public class SellerDAO extends EgovAbstractDAO{

	public int selectStoreNameCheck(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) select("sellerDAO.selectStoreNameCheck",mainVO);
	}

	public int selectStoreBusNumCheck(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) select("sellerDAO.selectStoreBusNumCheck",mainVO);
	}

	public String insertSellerWrite(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (String) insert("sellerDAO.insertSellerWrite",mainVO);
	}

	public int selectSellerDeleteCheck(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) select("sellerDAO.selectSellerDeleteCheck", mainVO);
	}

	public int updateSellerDeleteSub(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) update("sellerDAO.updateSellerDeleteSub",mainVO);
	}

	public List<?> selectSellerOrderDetail(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("sellerDAO.selectSellerOrderDetail", mainVO);
	}

	public int updateDeliveryStatus(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) update("sellerDAO.updateDeliveryStatus",mainVO);
	}

	public int selectSellerOrderInquiryTotal(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) select("sellerDAO.selectSellerOrderInquiryTotal",mainVO);
	}

}

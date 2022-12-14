package pines.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pines.service.MainVO;
import pines.service.SellerService;


@Service("sellerService")
public class SellerServiceImpl implements SellerService{
	@Resource(name="sellerDAO")
	public SellerDAO sellerDAO;

	@Override
	public int selectStoreNameCheck(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectStoreNameCheck(mainVO);
	}

	@Override
	public int selectStoreBusNumCheck(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectStoreBusNumCheck(mainVO);
	}

	@Override
	public String insertSellerWrite(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.insertSellerWrite(mainVO);
	}

	@Override
	public int selectSellerDeleteCheck(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSellerDeleteCheck(mainVO);
	}

	@Override
	public int updateSellerDeleteSub(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.updateSellerDeleteSub(mainVO);
	}

	@Override
	public List<?> selectSellerOrderDetail(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSellerOrderDetail(mainVO);
	}

	@Override
	public int updateDeliveryStatus(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.updateDeliveryStatus(mainVO);
	}

	@Override
	public int selectSellerOrderInquiryTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSellerOrderInquiryTotal(mainVO);
	}

	@Override
	public int selectSearchBySellerOrderListTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSearchBySellerOrderListTotal(mainVO);
	}

	@Override
	public List<?> selectSellerInfo(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSellerInfo(mainVO);
	}

	@Override
	public int updateSellerModify(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.updateSellerModify(mainVO);
	}

	@Override
	public int selectSearchBySellerRevenueListTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSearchBySellerRevenueListTotal(mainVO);
	}

	@Override
	public List<?> selectSearchBySellerRevenueList(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSearchBySellerRevenueList(mainVO);
	}

	@Override
	public int selectSellerRevenueTotal(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return sellerDAO.selectSellerRevenueTotal(mainVO);
	}

}

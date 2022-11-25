package pines.service.impl;

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

}

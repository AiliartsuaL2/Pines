package pines.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pines.service.MainService;
import pines.service.MainVO;

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

}

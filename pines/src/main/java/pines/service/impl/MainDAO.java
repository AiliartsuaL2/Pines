package pines.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import pines.service.MainVO;

@Repository("mainDAO")
public class MainDAO extends EgovAbstractDAO{
	
	public List<?> selectProductList(MainVO vo) {
		// TODO Auto-generated method stub
		return list("mainDAO.selectProductList",vo);
	}

}

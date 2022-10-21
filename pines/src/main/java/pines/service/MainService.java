package pines.service;

import java.util.List;


public interface MainService {
	public List<?> selectProductList(MainVO vo) throws Exception;  // 화면목록
	public List<?> selectPlantList(MainVO vo) throws Exception;  // 화면목록
	public List<?> selectFlowerList(MainVO vo) throws Exception;
	
}

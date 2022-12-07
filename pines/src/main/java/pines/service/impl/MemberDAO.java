package pines.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import pines.service.MainVO;
import pines.service.MemberVO;
import pines.service.OrderVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectMemberCount",vo);
	}

	public int selectIdFindCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectIdFindCount",vo);
	}

	public String selectIdFind(MemberVO vo) {
		// TODO Auto-generated method stub
		return (String) select("memberDAO.selectIdFind",vo);
	}

	public int selectMemberIdCheck(String userId) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectMemberIdCheck",userId);
	}

	public int selectPwFindCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectPwFindCount",vo);
	}

	public int updateMemberPw(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) update("memberDAO.updateMemberPw",vo);
	}

	public OrderVO selectMemberOrder(MemberVO vo) {
			
		return (OrderVO) select("memberDAO.selectMemberOrder");
	}

	public int selectSellerCheck(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectSellerCheck",mainVO);
	}

	public List<?> selectMemberInfo(MainVO mainVO) {
		// TODO Auto-generated method stub
		return list("memberDAO.selectMemberInfo", mainVO);
	}

	public int updateMemberPoint(MainVO mainVO) {
		// TODO Auto-generated method stub
		return (int) update("memberDAO.updateMemberPoint",mainVO);
	}

	public int updateMemberModify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return (int) update("memberDAO.updateMemberModify",memberVO);
	}

	public int updateMemberPointModify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return (int) update("memberDAO.updateMemberPointModify",memberVO);
	}

	public int deleteMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return (int) update("memberDAO.deleteMember",memberVO);
	}
}

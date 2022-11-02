package pines.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
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

	public MemberVO selectIdFind(MemberVO vo) {
		// TODO Auto-generated method stub
		return (MemberVO) select("memberDAO.selectIdFind",vo);
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

	public int selectSellerCheck(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectSellerCheck",memberVO);
	}
}

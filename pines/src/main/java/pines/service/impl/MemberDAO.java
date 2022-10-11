package pines.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import pines.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectMemberCount",vo);
	}
}

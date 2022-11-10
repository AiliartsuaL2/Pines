package pines.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pines.service.MainVO;
import pines.service.MemberService;
import pines.service.MemberVO;
import pines.service.OrderVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDAO")
	MemberDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (String) memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) memberDAO.selectMemberCount(vo);
	}

	@Override
	public int selectIdFindCount(MemberVO vo) throws Exception {
		return (int) memberDAO.selectIdFindCount(vo);
	}
	
	@Override
	public MemberVO selectIdFind(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub	
		return (MemberVO) memberDAO.selectIdFind(vo);
	}

	@Override
	public int selectMemberIdCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return  (int) memberDAO.selectMemberIdCheck(userId);
	}

	@Override
	public int selectPwFindCount(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  (int) memberDAO.selectPwFindCount(vo);
	}

	@Override
	public int updateMemberPw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) memberDAO.updateMemberPw(vo);
	}

	@Override
	public OrderVO selectMemberOrder(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (OrderVO) memberDAO.selectMemberOrder(vo);
	}

	@Override
	public int selectSellerCheck(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) memberDAO.selectSellerCheck(memberVO);
	}

	@Override
	public List<?> selectMemberInfo(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberInfo(mainVO);
	}

	@Override
	public int updateMemberPoint(MainVO mainVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) memberDAO.updateMemberPoint(mainVO);
	}
}

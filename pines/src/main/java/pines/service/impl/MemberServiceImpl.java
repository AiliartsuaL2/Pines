package pines.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pines.service.MemberService;
import pines.service.MemberVO;

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
	public int selectMemberCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) memberDAO.selectMemberCount(vo);
	}

}

package pines.service;

import java.util.List;

public interface MemberService {
	public String insertMember(MemberVO vo) throws Exception;

	public int selectMemberCount(MemberVO vo) throws Exception;

	public int selectIdFindCount(MemberVO vo) throws Exception;

	public MemberVO selectIdFind(MemberVO vo) throws Exception;

	public int selectMemberIdCheck(String userId) throws Exception;

	public int selectPwFindCount(MemberVO vo) throws Exception;

	public int updateMemberPw(MemberVO vo) throws Exception;

	public OrderVO selectMemberOrder(MemberVO vo) throws Exception;

	public int selectSellerCheck(MemberVO memberVO) throws Exception;

	public List<?> selectMemberInfo(MainVO mainVO) throws Exception;

	public int updateMemberPoint(MainVO mainVO) throws Exception;

	public int updateMemberModify(MemberVO memberVO) throws Exception;

	public int updateMemberPointModify(MemberVO memberVO) throws Exception;


}

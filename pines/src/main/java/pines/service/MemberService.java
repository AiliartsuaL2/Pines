package pines.service;

public interface MemberService {
	public String insertMember(MemberVO vo) throws Exception;

	public int selectMemberCount(MemberVO vo) throws Exception;

	public int selectIdFindCount(MemberVO vo) throws Exception;

	public MemberVO selectIdFind(MemberVO vo) throws Exception;

	public int selectMemberIdCheck(String userId) throws Exception;

	public int selectPwFindCount(MemberVO vo) throws Exception;

	public int updateMemberPw(MemberVO vo) throws Exception;
}

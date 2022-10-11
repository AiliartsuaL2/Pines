package pines.service;

public interface MemberService {
	public String insertMember(MemberVO vo) throws Exception;

	public int selectMemberCount(MemberVO vo);
}

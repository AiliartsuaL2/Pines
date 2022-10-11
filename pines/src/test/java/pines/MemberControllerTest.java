package pines;

import static org.junit.Assert.*;

import org.junit.Test;

import pines.service.MemberService;
import pines.service.MemberVO;
import pines.service.impl.MemberServiceImpl;
import pines.web.MemberController;

public class MemberControllerTest {
	@Test
	public void testMemberWrite() throws Exception {
		MemberVO vo = new MemberVO();
		MemberController mc = new MemberController();
		MemberServiceImpl ms = new MemberServiceImpl();
		vo.setName("name");
		vo.setUserId("ui");
		vo.setPass("pass");
		vo.setZipCode("12345");
		vo.setAddress("asdf");
		vo.setBirth("19970327");
		vo.setPhone("010-2112-8406");
		mc.result = ms.insertMember(vo);
		assertEquals(null,mc.result);
	}
}

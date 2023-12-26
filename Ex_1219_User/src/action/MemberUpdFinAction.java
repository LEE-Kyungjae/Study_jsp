package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import VO.MemberVO;

/**
 * Servlet implementation class MemberUpdFinAction
 */
@WebServlet("/member_upd_fin.do")
public class MemberUpdFinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String addr= request.getParameter("addr");
		MemberVO vo =new MemberVO();
		vo.setAddr(addr);
		vo.setEmail(email);
		vo.setId(id);
		vo.setIdx(idx);
		vo.setName(name);
		vo.setPwd(pwd);
		int res = MemberDAO.getInstance().update(vo);
	}
}

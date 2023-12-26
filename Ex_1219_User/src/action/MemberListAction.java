package action;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.MemberDAO;
import VO.MemberVO;

/**
 * Servlet implementation class MemberListAction
 */
@WebServlet("/member_list.do")//URL매핑:현재 서블릿을 실행하기 위한 경로
public class MemberListAction extends HttpServlet {
	//Servlet(server + let) : 
	//1.웹 응용프로그램을 만드는 자바 기술이며, 실행 결과값을 html로 돌려준다
	//2.자바 언어로 작성되어 일반적인 자바의 특성을 모두 갖는다
	//3.자동으로 스레딩 처리를 지원
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getInstance();
		List<MemberVO> list = dao.selectList();
		//list를 request영역에 '바인딩'
		request.setAttribute("list", list); ;
		//member_list.jsp에서 바인딩된 list정보를 가져다 쓸 수 있도록 '포워딩'
		RequestDispatcher disp = request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
	}
}

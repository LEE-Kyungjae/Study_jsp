package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAct
 */
@WebServlet("/view.do")
public class BoardViewAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//view.do?idx=5
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = BoardDAO.getInstance();
		
		//idx에 해당되는 게시글 한 건 가져오기
		BoardVO vo = dao.selectOne(idx);
		
		//조회수 증가
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");
		
		if(show == null) {
			dao.update_readhit(idx);
			session.setAttribute("show", "aaa");
		}
		
		request.setAttribute("vo", vo);
		RequestDispatcher disp = 
				request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
	}

}













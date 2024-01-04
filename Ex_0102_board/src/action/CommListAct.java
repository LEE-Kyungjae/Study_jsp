package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import vo.CommentVO;

@WebServlet("/comm_list.do")
public class CommListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		List<CommentVO> list = CommentDAO.getInstance().selectList(b_idx);
		request.setAttribute("list", list);//바인딩
		RequestDispatcher disp = request.getRequestDispatcher("comment_list.jsp");
		disp.forward(request, response);
		
	}
}

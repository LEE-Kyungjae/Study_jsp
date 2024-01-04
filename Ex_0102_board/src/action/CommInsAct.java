package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import vo.CommentVO;

@WebServlet("/comment_insert.do")
public class CommInsAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		CommentVO vo = new CommentVO();
		vo.setB_idx(b_idx);
		vo.setPwd(pwd);
		vo.setContent(content);
		vo.setIp(ip);
		vo.setName(name);
		int res = CommentDAO.getInstance().insert(vo);
		response.getWriter().print(res);

	}
}
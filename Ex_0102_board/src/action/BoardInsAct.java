package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardInsAct
 */
@WebServlet("/insert.do")
public class BoardInsAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// insert.do?subject=제목&name=홍길동&content=내용&pwd=1111

		request.setCharacterEncoding("utf-8");

		String ip = request.getRemoteAddr();
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");

		BoardVO vo = new BoardVO();
		vo.setIp(ip);
		vo.setSubject(subject);
		vo.setName(name);
		vo.setContent(content);
		vo.setPwd(pwd);

		BoardDAO.getInstance().insert(vo);

		response.sendRedirect("list.do");

	}

}

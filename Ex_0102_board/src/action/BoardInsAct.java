package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/insert.do")
public class BoardInsAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//insert.do?subject=제목&name=홍길동&content=내용 &pwd=1111
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
		
		int res= BoardDAO.getInstance().insert(vo);
		if (res>0) {
			System.out.println("정상 작성되었습니다.");
			
		}else {
			System.out.println("새글 작성오류");
		}
		response.sendRedirect("list.do");
	}
}

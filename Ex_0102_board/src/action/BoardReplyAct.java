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
 * Servlet implementation class BoardReplyAct
 */
@WebServlet("/reply.do")
public class BoardReplyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//기준글의 정보를 얻어오기
		BoardVO baseVO = dao.selectOne(idx);
		
		//기준글의 step보다 큰 값을 가진 게시글은 모두 step+1
		dao.update_step(baseVO);
		
		//댓글로 작성될 vo준비
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep() + 1);
		vo.setDepth(baseVO.getDepth() + 1);
		
		//댓글작성
		dao.reply(vo);
		response.sendRedirect("list.do");
	}

}












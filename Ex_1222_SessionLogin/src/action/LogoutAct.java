package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutAct
 */
@WebServlet("/logout.do")
public class LogoutAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그아웃을 위한 세션
		HttpSession session = request.getSession();
		session.removeAttribute("vo");//세션 삭제
		response.sendRedirect("login_form.jsp");
	}
}

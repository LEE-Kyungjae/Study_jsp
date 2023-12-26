package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/login.do")
public class LoginAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Ajax로 넘겨받은 파라미터 조회
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		String param = "";
		//db에 아이디가 존재하지 않는경우
		if(vo == null) {
			param="no_id";
			response.getWriter().print(param);;
			return;
		}
		//비밀번호가 일치하지 않는 경우
		if(!vo.getPwd().equals(pwd)) {
			param = "no_pwd";
			response.getWriter().print(param);
			return;
		}
		//세션(session) : 서버에 직접 데이터를 저장하여 사용자와 웹사이트 사이를 연결하는 정보
		//	세션은 브라우저 종료와 함께 메모리에서 날아간다
		//세션은 서버의 메모리(RAM)를 직접 사용하기 떄문에 많이 생성하고 많이 사용할수록 브라우저를
		//느리게 만드므로 꼭 필요한 경우에만 사용한다
		//로그인이 가능한 경우
		//vo객체를 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("vo", vo);
		//세션 유지시간 24시간으로 늘려보기(기본값 30분)
		session.setMaxInactiveInterval(3600*24);//초단위
		
		param="success";
		response.getWriter().print(param);
	}
}

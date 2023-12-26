package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawonlist.do")
public class SawonListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//sawonlist.do?deptno=0
		int deptno = 0;
		String str_deptno = request.getParameter("deptno");
		//sawonlist.do?deptno=	<--empty
		//sawonlist.do? 		<--null

		//null check
		if(str_deptno !=null && !str_deptno.isEmpty( ) ) {
			deptno = Integer.parseInt(str_deptno);
		}
		List<SawonVO> list =null;
		if(deptno == 0) {
			//전체 리스트 가져오기
			list =SawonDAO.getInstance().select();
		}else {
			//부서목록에 해당하는 리스트 가져오기
			list = SawonDAO.getInstance().select(deptno);
		}
		//전체목록 가져오기
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}
}

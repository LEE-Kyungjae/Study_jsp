package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

@WebServlet("/gogek.do")
public class GogekListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search="all";
		String str_goaddr = request.getParameter("search");
		//파라미터가 정상적으로 넘어온 경우
		if(str_goaddr!=null && !str_goaddr.isEmpty()) {
			search = str_goaddr;
		}
		List<GogekVO> list =null;
		
		//고객목록 가져오기
		if(search.equalsIgnoreCase("all")){
		list = GogekDAO.getInstance().selectGogek();
		}else {
		list = GogekDAO.getInstance().selectGogek(search);
		}
		
		request.setAttribute("list",list);
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);
	}
}
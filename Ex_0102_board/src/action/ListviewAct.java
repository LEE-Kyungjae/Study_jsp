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

@WebServlet("/view.do")
public class ListviewAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//view.do?idx=${vo.idx}
	int idx= Integer.parseInt(request.getParameter("idx"));
	System.out.println(idx);
	BoardVO vo=BoardDAO.getInstance().selectone(idx);
	if(vo!=null) {
		System.out.println("상세보기데이터 정상 획득");
	}else {
		System.out.println("상세보기 데이터 획득 실패");
	}
	//binding
	request.setAttribute("subject", vo.getSubject());
	request.setAttribute("name",vo.getName());
	request.setAttribute("regdate", vo.getRegdate());
	request.setAttribute("ip", vo.getIp());
	request.setAttribute("content", vo.getContent());
	RequestDispatcher disp = request.getRequestDispatcher("list_info.jsp");
	disp.forward(request, response);
	}
}

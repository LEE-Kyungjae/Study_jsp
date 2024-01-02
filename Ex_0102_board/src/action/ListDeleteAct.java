package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

@WebServlet("/delete.do")
public class ListDeleteAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int res=BoardDAO.getInstance().delete(idx);
		if(res>0) {
			System.out.println("정상삭제되었습니다");
		}else{
			System.out.println("삭제오류");
		}	
		response.sendRedirect("list.do");
	}
}

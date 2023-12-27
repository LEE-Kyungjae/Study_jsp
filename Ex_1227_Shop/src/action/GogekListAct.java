package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ProductVO;

@WebServlet("/list.do")
public class GogekListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//list.do?category=com001
		//list.do?category=
		//list.do?
		String category = request.getParameter("category");
		List<ProductVO> list=null;
		if(category == null || category.isEmpty()) {
			category = "com001";// 첫실행시 보여질 카테고리는 컴퓨터 카테고리
		}
		
		list = ProductDAO.getInstance().select(category);
		//DB조회
		request.setAttribute("list", list);
		RequestDispatcher disp =request.getRequestDispatcher("product_list.jsp");
		disp.forward(request, response);
	}
}
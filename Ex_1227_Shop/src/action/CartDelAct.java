package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

@WebServlet("/cart_delete.do")
public class CartDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int m_idx = 1;//회원번호
		CartDAO.getInstance().delete(c_idx);
		//목록조회
		List<CartVO> list = CartDAO.getInstance().select(m_idx);
		//총계
		int total_amount=CartDAO.getInstance().selecTotalAmount(m_idx);
		request.setAttribute("list", list);
		request.setAttribute("tot_amt", total_amount);
		
		RequestDispatcher disp = request.getRequestDispatcher("cartList.jsp");
		disp.forward(request, response);
		
		//response.sendRedirect("cart_update.do");
	}
}

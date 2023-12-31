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

@WebServlet("/cart_list.do")
public class CartListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원번호는 1이라고 가정
		int m_idx = 1;

		//장바구니 목록
		List<CartVO> list = CartDAO.getInstance().select(m_idx);
		
		//총계
		int total_amount= CartDAO.getInstance().selecTotalAmount(m_idx);
		request.setAttribute("list", list);
		request.setAttribute("tot_amt", total_amount);
		
		//int m_idx = (int)request.getSession().getAttribute("m_idx");
		RequestDispatcher disp = request.getRequestDispatcher("cartList.jsp");
		disp.forward(request, response);
	}
}
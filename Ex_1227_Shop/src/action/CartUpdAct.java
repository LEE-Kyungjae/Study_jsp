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

@WebServlet("/cart_update.do")
public class CartUpdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int c_cnt = Integer.parseInt(request.getParameter("c_cnt"));
		int m_idx = 1;//회원번호
		//수량 업데이트
		CartDAO.getInstance().update_cnt(c_idx, c_cnt);
		List<CartVO> list = CartDAO.getInstance().select(m_idx);
		int tot_amt = CartDAO.getInstance().selecTotalAmount(m_idx);
		request.setAttribute("list",list);
		request.setAttribute("tot_amt",tot_amt);
		RequestDispatcher disp = request.getRequestDispatcher("cartList.jsp");
		disp.forward(request, response);
	}
}

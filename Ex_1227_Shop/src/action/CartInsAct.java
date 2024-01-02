package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

@WebServlet("/cart_insert.do")
public class CartInsAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx= Integer.parseInt(request.getParameter("idx"));
		int m_idx= Integer.parseInt(request.getParameter("m_idx"));
		//장바구니에 상품을 등록하기 위한 vo
		CartVO vo = new CartVO();
		vo.setIdx(idx);
		vo.setM_idx(m_idx);
		
		//이미 장바구니에 idx에 해당하는 상품이 등록되어 있는지를 확인
		CartVO res_vo = CartDAO.getInstance().selectOne(vo);
		String result ="no";
		if(res_vo == null) {
			result = "yes";
			//장바구니에 등록
			CartDAO.getInstance().insert(vo);
		}
		response.getWriter().print(result);
		
	}
}

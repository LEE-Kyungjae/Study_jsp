package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

@WebServlet("/list.do")
public class BoardListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// list.do
		// list.do?page=
		// list.do?page=2
		int nowPage = 1;
		String page = request.getParameter("page");
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}

		// 한 페이지에 표시되는 게시물의 시작과 끝 번호를 계산
		// 1page는 1 ~ 5번 게시글이 보여져야 하고
		// 2psge는 6 ~ 10번 게시글이 보여져야 한다
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;

		// map에 start, end를 저장하여 DB로 보낸다
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		// 세션에 저장되어 있던 show정보를 삭제
		request.getSession().removeAttribute("show");

		// 게시글 전체목록 보기
		List<BoardVO> list = BoardDAO.getInstance().selectList(map);
		// 전체 게시글 수 구하기
		int row_total = BoardDAO.getInstance().getRowTotal();

		// 하단의 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("list.do", nowPage, row_total, Common.Board.BLOCKLIST,
				Common.Board.BLOCKPAGE);

		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);

	}

}
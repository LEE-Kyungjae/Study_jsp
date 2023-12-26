package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

import DAO.MemberDAO;

/**
 * Servlet implementation class MemberDeletAction
 */
@WebServlet("/delete.do")
public class MemberDeletAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int res=MemberDAO.getInstance().delete(idx);
		String param="삭제실패";
		if(res>0) {
			param="삭제성공";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("param", param);
		JSONObject jObj = new JSONObject();
		jObj.put("map", map);
		response.setContentType("application/x-json;text/plain;charset=UTF-8");
		//String resultStr = String.format("[{'param':'%s'}]",param);
		response.getWriter().print(jObj);
	}
}

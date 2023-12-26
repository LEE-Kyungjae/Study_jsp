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
import VO.MemberVO;

/**
 * Servlet implementation class MemberCheckAction
 */
@WebServlet("/check_id.do")
public class MemberCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=aaa
		String id = request.getParameter("id");
		MemberVO vo=MemberDAO.getInstance().selectOne(id);
		String res = "no";
		if(vo == null) {
			//중복되는 아이디가 검색되지 않은경우(가입가능)
			res="yes";
		}
		//json 형식으로 전달될 데이터에 한글이 포함되어 있는경우
		//텍스트가 깨져서 전송되는 것을 방지하는 코드
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		map.put("id", id);
		JSONObject jObj = new JSONObject();
		jObj.put("map", map);
		response.setContentType("application/x-json;text/plain;charset=UTF-8");
//		String resultStr = String.format(
//				"[{'result':'%s'},{'id':'%s'}]", res, id);
		//resultStr을 콜백메서드로 보낸다
		response.getWriter().print(jObj);
	}
}
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
 * Servlet implementation class MemberUpdateAction
 */
@WebServlet("/member_update_form.do")
public class MemberUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//member_update.do?idx=1
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberVO vo = MemberDAO.getInstance().selectOne(idx);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", vo.getIdx());
		map.put("name",vo.getName());
		map.put("id",vo.getId());
		map.put("pwd",vo.getPwd());
		map.put("addr",vo.getAddr());
		map.put("email",vo.getEmail());
		JSONObject jObj = new JSONObject();
		jObj.put("map", map);
		response.setContentType("application/json;text/plain;charset=UTF-8");
		/*
		 * String resultStr = String.format(
		 * "[{\"\":\"%d\",\"name\":\"%s\",\"id\":\"%s\",\"pwd\":\"%s\",\"email\":\"%s\",\"addr\":"
		 * %s\"}]" ,vo.getIdx(),vo.getName(),vo.getId(),vo.getPwd());
		 */
		response.getWriter().print(map);
	}
}

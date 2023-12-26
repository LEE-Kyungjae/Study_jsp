package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PhotoDAO;

/**
 * Servlet implementation class PhotoDelAct
 */
@WebServlet("/photo_del.do")
public class PhotoDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//삭제하고싶은 idx와 filename을 받아온다
		int idx = Integer.parseInt(request.getParameter("idx"));
		String filename = request.getParameter("filename");
		//파일들이 저장되어 있는 절대경로를 가져온다
		ServletContext app = request.getServletContext();
		String path = app.getRealPath("/upload/");
		System.out.println("절대경로 :" + path);
		
		//DB에서 정보 삭제
		int res=PhotoDAO.getInstance().delete(idx);
		if(res>0) {
			File f = new File(path, filename);
			if(f.exists()) {
				f.delete();//경로상의 파일을 실제로 삭제
			}
		}
		response.sendRedirect("list.do");
	}
}
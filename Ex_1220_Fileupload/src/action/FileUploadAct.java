package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAct
 */
@WebServlet("/upload.do")
public class FileUploadAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		//String path = "C:\\upload";
		String web_path="/upload/";
		
		//현재 프로젝트의 속성이나 경로등을 관리하는 객체
		ServletContext app = request.getServletContext();
		
		//web path(상대경로) -> real path(절대경로)
		String path = app.getRealPath(web_path);
		System.out.println("절대경로 : " +path);
		
		int max_size = 1024 * 1024 * 100;//최대 업로드 용량(현재 100MB)

		//파일을 포함하고 있는 파라미터 수신을 위한 클래스
		MultipartRequest mr = new MultipartRequest(
				request,
				path,
				max_size,
				"utf-8",//수신할때 필요한 인코딩 타입
				new DefaultFileRenamePolicy()//동일파일명 정책
				);
		String filename = "no_file";
		File f = mr.getFile("photo");
		if(f != null) {
			filename = f.getName();
		}
		//파일구조가 아닌 일반 파라미터도 mr을 통해서 받아야한다
		String title = mr.getParameter("title");
		//바인딩
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}
}








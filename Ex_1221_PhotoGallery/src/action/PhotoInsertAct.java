package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/insert.do")
public class PhotoInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//저장을 위한 상대경로
		String web_path="\\upload\\";

		//위의 상대경로를 가지고 절대경로를 찾아낸다
		ServletContext app= request.getServletContext();
		String path = app.getRealPath(web_path);
		System.out.println("절대경로: "+path);
		//최대 업로드 용량
		int max_size = 1024*1024*10;
		//파일을 포함하고 있는 파라미터 수신 및 파일정보를 가져오는 클래스
		MultipartRequest mr = new MultipartRequest(
				request, 
				path,
				max_size,
				new DefaultFileRenamePolicy());
		//업로드 된 파일정보 얻어오기
		String filename = "no_file";
		File f = mr.getFile("photo");
		if(f != null) {
			filename=f.getName();//업로드된 파일명(aa.jpg)
			System.out.println(filename);
		}
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		String ip= request.getRemoteAddr();
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setPwd(pwd);
		vo.setIp(ip);
		PhotoDAO.getInstance().insert(vo);
		response.sendRedirect("list.do");
	}
}
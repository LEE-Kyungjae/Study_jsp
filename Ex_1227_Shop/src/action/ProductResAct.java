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

import dao.ProductDAO;
import vo.ProductVO;

@WebServlet("/insert.do")
public class ProductResAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이미지 저장을 위한 절대경로 
		String web_path = "/images/";
		ServletContext app = request.getServletContext();
		String path = app.getRealPath(web_path);
		System.out.println("절대경로 : " + path);
		//파일타입을 포함한 파라미터를 수신하기 위한 클래스
		MultipartRequest mr =new MultipartRequest(
				request,
				path,
				1024*1024*100,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		String p_image_s = "no_file";
		String p_image_l = "no_file";
		File f = mr.getFile("p_image_s");
		if(f != null) {
			p_image_s= f.getName();
		}
		f = mr.getFile("p_image_l");
		if( f != null ) {
			p_image_l = f.getName();
		}
		//파일 형식이 아닌 일반 파라미터를 수신
		String category = mr.getParameter("category");
		String p_num = mr.getParameter("p_num");
		String p_name = mr.getParameter("p_name");
		String p_company = mr.getParameter("p_company");
		String p_content = mr.getParameter("p_content");
		int p_price = Integer.parseInt( mr.getParameter("p_price") );
		int p_saleprice = Integer.parseInt( mr.getParameter("p_saleprice") );
		
		ProductVO vo = new ProductVO();
		vo.setCategory(category);
		vo.setP_num(p_num);
		vo.setP_name(p_name);
		vo.setP_company(p_company);
		vo.setP_price(p_price);
		vo.setP_saleprice(p_saleprice);
		vo.setP_content(p_content);
		vo.setP_image_s(p_image_s);
		vo.setP_image_l(p_image_l);
		ProductDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do?category="+category);		
	}
}












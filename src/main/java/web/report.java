package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReportDAO;

@WebServlet("/report")
public class report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public report() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String s_email = (request.getParameter("m_email") == null || request.getParameter("m_email").length()==0)?null:request.getParameter("m_email");
		//이상하게 null값이여도 공백이 넘어옴. 그래서 공백일경우 null로 처리해줌.
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String rb_reason = request.getParameter("rb_reason");
		
		System.out.println(s_email);
		ReportDAO dao = new ReportDAO();
		
		if(s_email != null) {
			
			dao.reportBoard(b_no, s_email, rb_reason);
		}else {
			
			response.sendError(b_no, "실패");;
		}
		
	}

}

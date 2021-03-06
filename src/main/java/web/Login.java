package web;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import dto.LoginDTO;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("m_email") != null && request.getParameter("m_password") != null) {
			String id = request.getParameter("m_email");
			String pw = request.getParameter("m_password");
			String id_rem = request.getParameter("id_rem");
			
			LoginDTO dto = new LoginDTO();
			dto.setM_email(id);
			dto.setM_password(pw);
			LoginDAO dao = new LoginDAO();
			dto = dao.login(dto);
			
			if (dto.getCount() == 1 && dto.getM_del() == 0)  {

				HttpSession session = request.getSession();
				session.setAttribute("m_nickname", dto.getM_nickname());
				session.setAttribute("m_email", dto.getM_email());
				session.setAttribute("m_authority", dto.getM_authority());
				
				if(id_rem != null) {
					StringTokenizer st = new StringTokenizer(id, "@");
					String temp = st.nextToken();
					Cookie cookie = new Cookie("id", temp);
					response.addCookie(cookie);
					String temp2 = st.nextToken();
					cookie = new Cookie("domain", temp2);
					response.addCookie(cookie);
					cookie = new Cookie("id_rem", "checked");
					response.addCookie(cookie);
				} else {
					Cookie cookie = new Cookie("id_rem", "");
					response.addCookie(cookie);
					cookie = new Cookie("id", "");
					response.addCookie(cookie);
					cookie = new Cookie("domain","");
					response.addCookie(cookie);
				}
				if(dto.getM_authority() < 5) {
					response.sendRedirect("./main");
				}else {
					response.sendRedirect("./adminMain");
				}
			} else if( dto.getM_del() == 1 && dto.getCount() == 1) {
				response.sendRedirect("./login.jsp?error=deleted");
			}else {
				response.sendRedirect("./login.jsp?error=notexist");
			} 

		} else {
			response.sendRedirect("./login.jsp");
		}

	}
}
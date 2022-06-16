package view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.controller.LoginController;
import model.Login;



/**
 * Servlet implementation class ExecutaAlteraLogin
 */
@WebServlet("/ExecutaAlteraLogin")
public class ExecutaAlteraLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecutaAlteraLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String nome = request.getParameter("nomelogin");
		String login = request.getParameter("loginlogin");
		String senha = request.getParameter("senhalogin");		
		String strid = request.getParameter("idlogin");
		
		long id = 0;
		
		try {
			
			id = Long.parseLong(strid);
			
		} catch (Exception e) {
			System.out.println("Erro na conversão");
		}
		
		Login l = new Login();
		l.setId(id);
		l.setNome(nome);
		l.setLogin(login);
		l.setSenha(senha);	
		
		LoginController controller = new LoginController();
		controller.alterar(l);
		
		RequestDispatcher rd = request.getRequestDispatcher("listarlogin.jsp");
		rd.forward(request, response);
	}

}

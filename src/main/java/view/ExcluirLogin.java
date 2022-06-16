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
 * Servlet implementation class ExcluirLogin
 */
@WebServlet("/ExcluirLogin")
public class ExcluirLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcluirLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				//response.getWriter().append("Served at: ").append(request.getContextPath());
				
				String strid = request.getParameter("id");
				
				long id = 0;
				
				try {
					id = Long.parseLong(strid);
					
				} catch (Exception e) {
					System.out.println("Erro na exclusão");
				}
				
				LoginController controller = new LoginController();
				Login l = new Login();
				l.setId(id);
				
				controller.excluir(l);
				
				RequestDispatcher rd = request.getRequestDispatcher("listarlogin.jsp");
				rd.forward(request, response);
				
				
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

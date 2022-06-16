package view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.controller.ControleSaidaController;
import model.ControleSaida;



/**
 * Servlet implementation class ExcluirControleSaida
 */
@WebServlet("/ExcluirControleSaida")
public class ExcluirControleSaida extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcluirControleSaida() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
String stridSaida = request.getParameter("idSaida");
		
		long idSaida = 0;
		
		try {
			idSaida = Long.parseLong(stridSaida);
			
		} catch (Exception e) {
			System.out.println("Erro na exclusão");
		}
		
		ControleSaidaController controller = new ControleSaidaController();
		ControleSaida saida = new ControleSaida();
		saida.setIdSaida(idSaida);
		
		controller.excluir(saida);
		
		RequestDispatcher rd = request.getRequestDispatcher("listarcontrolesaida.jsp");
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

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
 * Servlet implementation class InicioAlteraControleSaida
 */
@WebServlet("/InicioAlteraControleSaida")
public class InicioAlteraControleSaida extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioAlteraControleSaida() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		long idSaida = 0;
		
		try {
			idSaida = Long.parseLong(request.getParameter("idSaida"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		ControleSaidaController controller = new ControleSaidaController();
		ControleSaida saida = controller.buscar(idSaida);
		
		System.out.println(saida.getDataSaida());
		
		request.setAttribute("controleSaida", saida);
		RequestDispatcher rd = request.getRequestDispatcher("alterarcontrolesaida.jsp");
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

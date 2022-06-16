package view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.controller.ControleEntradaaController;
import model.ControleEntrada;



/**
 * Servlet implementation class InicioAlteraControleEntrada
 */
@WebServlet("/InicioAlteraControleEntrada")
public class InicioAlteraControleEntrada extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioAlteraControleEntrada() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
long idEntrada = 0;
		
		try {
			idEntrada = Long.parseLong(request.getParameter("idEntrada"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		ControleEntradaaController controller = new ControleEntradaaController();
		ControleEntrada entrada = controller.buscar(idEntrada);
		
		System.out.println(entrada.getNomeProdutoEntrada());
		
		request.setAttribute("controleEntrada", entrada);
		RequestDispatcher rd = request.getRequestDispatcher("alterarcontroleentrada.jsp");
		rd.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

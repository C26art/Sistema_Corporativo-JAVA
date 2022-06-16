package view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.controller.FornecedorController;
import model.Fornecedor;


/**
 * Servlet implementation class InicioAlteraFornecedor
 */
@WebServlet("/InicioAlteraFornecedor")
public class InicioAlteraFornecedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioAlteraFornecedor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				//response.getWriter().append("Served at: ").append(request.getContextPath());
				
		long idfornecedor = 0;
				
				try {
					idfornecedor = Long.parseLong(request.getParameter("idfornecedor"));
					
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				FornecedorController controller = new FornecedorController();
				Fornecedor d = controller.buscar(idfornecedor);
				
				System.out.println(d.getNome());
				
				request.setAttribute("fornecedor", d);
				RequestDispatcher rd = request.getRequestDispatcher("alterarfornecedor.jsp");
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

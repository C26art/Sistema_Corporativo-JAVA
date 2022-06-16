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
 * Servlet implementation class ExcluirFornecedor
 */
@WebServlet("/ExcluirFornecedor")
public class ExcluirFornecedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcluirFornecedor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				//response.getWriter().append("Served at: ").append(request.getContextPath());
				
				String strid = request.getParameter("idfornecedor");
				
				long idfornecedor = 0;
				
				try {
					idfornecedor = Long.parseLong(strid);
					
				} catch (Exception e) {
					System.out.println("Erro na exclusão");
				}
				
				FornecedorController controller = new FornecedorController();
				Fornecedor d = new Fornecedor();
				d.setIdfornecedor(idfornecedor);
				
				controller.excluir(d);
				
				RequestDispatcher rd = request.getRequestDispatcher("listarfornecedor.jsp");
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

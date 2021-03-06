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
 * Servlet implementation class FornecedorServlet
 */
@WebServlet("/FornecedorServlet")
public class FornecedorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FornecedorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cnpj = request.getParameter("cnpjfornecedor");
		String produto = request.getParameter("produtofornecedor");
		String nome = request.getParameter("nomefornecedor");
		String telefone = request.getParameter("telefonefornecedor");
		String email = request.getParameter("emailfornecedor");
		String endereco = request.getParameter("enderecofornecedor");
		
		Fornecedor d = new Fornecedor();
		d.setCnpj(cnpj);
		d.setProduto(produto);
		d.setNome(nome);
		d.setTelefone(telefone);
		d.setEmail(email);
		d.setEndereco(endereco);
		
		FornecedorController controller = new FornecedorController();
		controller.cadastrar(d);
		
		RequestDispatcher rd = request.getRequestDispatcher("listarfornecedor.jsp");
		rd.forward(request, response);
		
	}
}
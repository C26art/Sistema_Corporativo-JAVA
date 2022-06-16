package view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.controller.FuncionariosController;
import model.Funcionarios;

/**
 * Servlet implementation class FuncionariosServlet
 */
@WebServlet("/FuncionariosServlet")
public class FuncionariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuncionariosServlet() {
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
		String nome = request.getParameter("nomefuncionario");
		String cpf = request.getParameter("cpffuncionario");
		String email = request.getParameter("emailfuncionario");
		String endereco = request.getParameter("enderecofuncionario");
		String telefone = request.getParameter("telefonefuncionario");
		String sexo = request.getParameter("sexofuncionario");
		
		Funcionarios f = new Funcionarios();
		f.setNome(nome);
		f.setCpf(cpf);
		f.setEmail(email);
		f.setEndereco(endereco);
		f.setTelefone(telefone);
		f.setSexo(sexo);
		
		FuncionariosController controller = new FuncionariosController();
		controller.cadastrar(f);
		
		RequestDispatcher rd = request.getRequestDispatcher("listarfuncionarios.jsp");
		rd.forward(request, response);
		
	}
}
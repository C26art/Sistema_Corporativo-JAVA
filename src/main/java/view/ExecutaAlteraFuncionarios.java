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
 * Servlet implementation class ExecutaAlteraFuncionarios
 */
@WebServlet("/ExecutaAlteraFuncionarios")
public class ExecutaAlteraFuncionarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecutaAlteraFuncionarios() {
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
				String nome = request.getParameter("nomefuncionarios");
				String cpf = request.getParameter("cpffuncionarios");
				String email = request.getParameter("emailfuncionarios");
				String endereco = request.getParameter("enderecofuncionarios");
				String telefone = request.getParameter("telefonefuncionarios");
				String sexo = request.getParameter("sexofuncionarios");
				String strid = request.getParameter("idfuncionarios");
				
				long id = 0;
				
				try {
					
					id = Long.parseLong(strid);
					
				} catch (Exception e) {
					System.out.println("Erro na conversão");
				}
				
				Funcionarios f = new Funcionarios();
				f.setId(id);
				f.setNome(nome);
				f.setCpf(cpf);
				f.setEmail(email);
				f.setEndereco(endereco);
				f.setTelefone(telefone);
				f.setSexo(sexo);
				
				FuncionariosController controller = new FuncionariosController();
				controller.alterar(f);
				
				RequestDispatcher rd = request.getRequestDispatcher("listarfuncionarios.jsp");
				rd.forward(request, response);
			}

		}


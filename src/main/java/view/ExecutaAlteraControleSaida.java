package view;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.controller.ControleSaidaController;
import model.ControleSaida;
import model.Produtos;

/**
 * Servlet implementation class ExecutaAlteraControleSaida
 */
@WebServlet("/ExecutaAlteraControleSaida")
public class ExecutaAlteraControleSaida extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExecutaAlteraControleSaida() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String strquantidadeSaida = request.getParameter("quantidadesaidacontrolesaida");
		String strdataSaida = request.getParameter("datasaidacontrolesaida");
		String estoque = request.getParameter("estoquecontrolesaida");
		String produtos = request.getParameter("idprodutocontrolesaida");
		String valor = request.getParameter("valorcontrolesaida");
		String strid = request.getParameter("idSaida");

		int quantidadeSaida = 0;
		Date dateSaida = new Date();
		long idSaida = 0;

		try {

			idSaida = Long.parseLong(strid);
			quantidadeSaida = Integer.parseInt(strquantidadeSaida);
			dateSaida = new SimpleDateFormat("yyyy-MM-dd").parse(strdataSaida);

		} catch (Exception e) {
			System.out.println("Erro na conversão");
		}

		Produtos produto = new Produtos();
		produto.setIdProduto(produtos);
		ControleSaida saida = new ControleSaida();
		saida.setIdSaida(idSaida);
		saida.setQuantidadeSaida(quantidadeSaida);
		saida.setEstoque(estoque);
		saida.setProdutos(produto);
		produto.setIdProduto(produtos);
		saida.setValor(valor);
		saida.setDataSaida(dateSaida);

		ControleSaidaController controller = new ControleSaidaController();
		controller.alterar(saida);

		RequestDispatcher rd = request.getRequestDispatcher("listarcontrolesaida.jsp");
		rd.forward(request, response);
	}

}

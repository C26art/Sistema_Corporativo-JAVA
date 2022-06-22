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
		String dataSaida = request.getParameter("datasaidacontrolesaida");
		String estoque = request.getParameter("estoquecontrolesaida");		
		String strvalor = request.getParameter("valorcontrolesaida");
		String desconto = request.getParameter("descontocontrolesaida");
		String preco_total = request.getParameter("precototalcontrolesaida");
		String preco_desconto = request.getParameter("precodescontocontrolesaida");
		String estoque_atual = request.getParameter("estoqueatualcontrolesaida");
		String strid = request.getParameter("idSaida");

		int quantidadeSaida = 0;		
		long idSaida = 0;
		int valor = 0;

		try {

			idSaida = Long.parseLong(strid);
			quantidadeSaida = Integer.parseInt(strquantidadeSaida);			
			valor = Integer.parseInt(strvalor);

		} catch (Exception e) {
			System.out.println("Erro na conversão");
		}

		Produtos produto = new Produtos();
		
		ControleSaida saida = new ControleSaida();
		saida.setIdSaida(idSaida);
		saida.setQuantidadeSaida(quantidadeSaida);
		saida.setEstoque(estoque);			
		saida.setValor(valor);
		saida.setDesconto(desconto);
		saida.setPreco_total(preco_total);
		saida.setPreco_desconto(preco_desconto);
		saida.setEstoque_atual(estoque_atual);
		saida.setDataSaida(dataSaida);

		ControleSaidaController controller = new ControleSaidaController();
		controller.alterar(saida);

		RequestDispatcher rd = request.getRequestDispatcher("listarcontrolesaida.jsp");
		rd.forward(request, response);
	}

}

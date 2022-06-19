package view;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import br.com.controller.ControleSaidaController;
import model.ControleSaida;
import model.Produtos;


/**
 * Servlet implementation class ControleSaidaServlet
 */
@WebServlet("/ControleSaidaServlet")
public class ControleSaidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleSaidaServlet() {
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
		String strquantidadeSaida = request.getParameter("quantidadesaidacontrolesaida");
		String strdataSaida = request.getParameter("datasaidacontrolesaida");
		String estoque = request.getParameter("estoquecontrolesaida");
		String produtos = request.getParameter("idproduto");
		String strvalor = request.getParameter("valorcontrolesaida");
		String desconto = request.getParameter("descontocontrolesaida");
		String preco_total = request.getParameter("precototalsaidacontrolesaida");
		String preco_desconto = request.getParameter("precodescontocontrolesaida");
		String estoque_atual = request.getParameter("estoqueatualcontrolesaida");
		
		
		int quantidadeSaida = 0;		
		Date dateSaida = new Date();		
		int valor = 0;	
		
		
		 try {
			 quantidadeSaida = Integer.parseInt(strquantidadeSaida);			 
			 dateSaida = new SimpleDateFormat("yyyy-MM-dd").parse(strdataSaida);			 
			 valor = Integer.parseInt(strvalor);			
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 Produtos produto = new Produtos();
		 produto.setIdProduto(produtos);
		 ControleSaida saida = new ControleSaida();
		 saida.setQuantidadeSaida(quantidadeSaida);
		 saida.setEstoque(estoque);
		 saida.setProdutos(produto);
		 produto.setIdProduto(produtos);
		 saida.setValor(valor);
		 saida.setDesconto(desconto);
		 saida.setPreco_total(preco_total);
		 saida.setPreco_desconto(preco_desconto);
		 saida.setEstoque_atual(estoque_atual);
		 saida.setDataSaida(dateSaida);
		 
		 ControleSaidaController controller = new ControleSaidaController();		
		 controller.cadastrar(saida);
		 
		 RequestDispatcher rd = request.getRequestDispatcher("listarcontrolesaida.jsp");
		 rd.forward(request, response);
		 
		
	}
}

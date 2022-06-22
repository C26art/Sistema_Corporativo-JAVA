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

import br.com.controller.ControleEntradaaController;
import model.ControleEntrada;
import model.Fornecedor;
import model.Produtos;

/**
 * Servlet implementation class ControleEntradaServlet
 */
@WebServlet("/ControleEntradaServlet")
public class ControleEntradaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleEntradaServlet() {
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
		String strquantidadeEntrada = request.getParameter("quantidadeentradacontroleentrada");
		String strdataEntrada = request.getParameter("dataentradacontroleentrada");		
		String valorProduto = request.getParameter("valorprodutocontroleentrada");
		String nomeProdutoEntrada = request.getParameter("nomeprodutoentradacontroleentrada");
		String produtos = request.getParameter("idProduto");
		String strfornecedor = request.getParameter("idfornecedor");
		
		
		int quantidadeEntrada = 0;		
		Date dateEntrada = new Date();
		long idfornecedor = 0;
		
		
		 try {
			 quantidadeEntrada = Integer.parseInt(strquantidadeEntrada);			 
			 dateEntrada = new SimpleDateFormat("yyyy-MM-dd").parse(strdataEntrada);
			 idfornecedor = Long.parseLong(strfornecedor);
			
			
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 Produtos produto = new Produtos();
		 produto.setIdProduto(produtos);
		 Fornecedor fornecedor = new Fornecedor();
		 fornecedor.setIdfornecedor(idfornecedor);
		 ControleEntrada entrada = new ControleEntrada();
		 entrada.setQuantidadeEntrada(quantidadeEntrada);
		 entrada.setNomeProdutoEntrada(nomeProdutoEntrada);
		 entrada.setProdutos(produto);
		 produto.setIdProduto(produtos);
		 entrada.setFornecedor(fornecedor);
		 fornecedor.setIdfornecedor(idfornecedor);
		 entrada.setValorProduto(valorProduto);
		 entrada.setDataEntrada(dateEntrada);
		 
		 
		 
		 
		 ControleEntradaaController controller = new ControleEntradaaController();		
		 controller.cadastrar(entrada);
		 
		 RequestDispatcher rd = request.getRequestDispatcher("listarcontroleentrada.jsp");
		 rd.forward(request, response);
		 
		
	}
}
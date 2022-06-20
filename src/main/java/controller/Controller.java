package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import model.DAO;
import model.Produtos;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = { "/Controller", "/main", "/insert", "/select", "/update", "/delete", "/report" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	Produtos cadastro = new Produtos();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();

	}

	/**
	 * Do get.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.println(action);

		if (action.equals("/main")) {
			cadastros(request, response);
		} else if (action.equals("/insert")) {
			adicionarCadastro(request, response);
		} else if (action.equals("/select")) {
			listarCadastro(request, response);
		} else if (action.equals("/update")) {
			editarCadastro(request, response);
		} else if (action.equals("/delete")) {
			removerCadastro(request, response);
		} else if (action.equals("/report")) {
			gerarRelatorio(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * Cadastro.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void cadastros(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Produtos> lista = dao.listarCadastro();
		request.setAttribute("cadastros", lista);
		RequestDispatcher rd = request.getRequestDispatcher("listarproduto.jsp");
		rd.forward(request, response);
	}

	/**
	 * Adicionar cadastro.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void adicionarCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cadastro.setNome(request.getParameter("nomeproduto"));
		cadastro.setDescricao(request.getParameter("descricaoproduto"));
		cadastro.setQuantidade(request.getParameter("quantidadeproduto"));
		cadastro.setCategoria(request.getParameter("categoriaproduto"));
		cadastro.setMarca(request.getParameter("marcaproduto"));
		cadastro.setValor(request.getParameter("valorproduto"));
		dao.inserirCadastro(cadastro);
		response.sendRedirect("main");
	}

	/**
	 * Listar cadastro.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void listarCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idProduto = request.getParameter("idProduto");
		cadastro.setIdProduto(idProduto);
		dao.selecionarCadastro(cadastro);
		request.setAttribute("idProduto", cadastro.getIdProduto());
		request.setAttribute("nome", cadastro.getNome());
		request.setAttribute("descricao", cadastro.getDescricao());
		request.setAttribute("quantidade", cadastro.getQuantidade());
		request.setAttribute("categoria", cadastro.getCategoria());
		request.setAttribute("marca", cadastro.getMarca());
		request.setAttribute("valor", cadastro.getValor());
		RequestDispatcher rd = request.getRequestDispatcher("alterarproduto.jsp");
		rd.forward(request, response);
	}

	/**
	 * Editar cadastro.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void editarCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cadastro.setIdProduto(request.getParameter("idProduto"));
		cadastro.setNome(request.getParameter("nome"));
		cadastro.setDescricao(request.getParameter("descricao"));
		cadastro.setQuantidade(request.getParameter("quantidade"));
		cadastro.setCategoria(request.getParameter("categoria"));
		cadastro.setMarca(request.getParameter("marca"));
		cadastro.setValor(request.getParameter("valor"));
		dao.alterarCadastro(cadastro);
		response.sendRedirect("main");
	}

	/**
	 * Remover cadastro.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void removerCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idProduto = request.getParameter("idProduto");
		cadastro.setIdProduto(idProduto);
		dao.deletarCadastro(cadastro);
		response.sendRedirect("main");
	}

	/**
	 * Gerar relatorio.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void gerarRelatorio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Document documento = new Document();
		Image imgTitulo = null;

		Font BOLD_UNDERLINED = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE);
		Font NORMAL = new Font(FontFamily.TIMES_ROMAN, 12);

		Font tamanho = new Font(FontFamily.TIMES_ROMAN, 8, Font.BOLD, BaseColor.BLUE);

		try {
			response.setContentType("apllication/pdf");
			response.addHeader("Content-Disposition", "inline; filename=" + "cadastros.pdf");
			PdfWriter.getInstance(documento, response.getOutputStream());
			documento.open();
			Paragraph paragrafoTitulo = new Paragraph();
			paragrafoTitulo.setAlignment(Element.ALIGN_CENTER);
			Chunk cTitulo = new Chunk("RELATÓRIO DE VENDAS PRODUTOS:");
			cTitulo.setFont(new Font(FontFamily.COURIER, 24, 0, BaseColor.RED));
			cTitulo.setBackground(BaseColor.LIGHT_GRAY, 2, 2, 2, 2);
			paragrafoTitulo.add(cTitulo);
			documento.add(paragrafoTitulo);
			documento.add(new Paragraph(" "));
			imgTitulo = Image.getInstance("D:\\TI\\TESTE\\img\\Logo.png");
			imgTitulo.scaleAbsolute(120, 90);
			imgTitulo.setAbsolutePosition(10, 720);
			imgTitulo.setBorder(Image.BOX);
			imgTitulo.setBorderWidth(10);
			imgTitulo.setBorderColor(BaseColor.WHITE);
			imgTitulo.scaleToFit(1000, 72);
			documento.add(imgTitulo);
			documento.add(new Paragraph(" "));
			documento.add(new Paragraph(" "));
			documento.add(new Paragraph(" "));
			PdfPTable tabela = new PdfPTable(new float[] { 4, 4, 2, 2, 3, 2 });
			tabela.setWidthPercentage(100);
			tabela.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell col1 = new PdfPCell(new Paragraph("Nome", tamanho));
			PdfPCell col2 = new PdfPCell(new Paragraph("Descrição", tamanho));
			PdfPCell col3 = new PdfPCell(new Paragraph("Quantidade", tamanho));
			PdfPCell col4 = new PdfPCell(new Paragraph("Categoria", tamanho));
			PdfPCell col5 = new PdfPCell(new Paragraph("Marca", tamanho));
			PdfPCell col6 = new PdfPCell(new Paragraph("Valor", tamanho));
			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			tabela.addCell(col4);
			tabela.addCell(col5);
			tabela.addCell(col6);

			ArrayList<Produtos> lista = dao.listarCadastro();
			for (int i = 0; i < lista.size(); i++) {
				tabela.addCell(lista.get(i).getNome());
				tabela.addCell(lista.get(i).getDescricao());
				tabela.addCell(lista.get(i).getQuantidade());
				tabela.addCell(lista.get(i).getCategoria());
				tabela.addCell(lista.get(i).getMarca());
				tabela.addCell(lista.get(i).getValor());
			}
			documento.add(tabela);
			documento.close();

		} catch (Exception e) {
			System.out.println(e);
			documento.close();
		}

	}
}
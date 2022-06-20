package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
 * Servlet implementation class Relatorio
 */
@WebServlet("/Relatorio")
public class Relatorio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	Produtos cadastro = new Produtos();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Relatorio() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

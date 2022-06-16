package controller;

import java.awt.BasicStroke;
import java.awt.Font;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartColor;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.RectangleEdge;

import model.Conexao;

/**
 * Servlet implementation class graficoVertical
 */
@WebServlet("/graficoVertical")
public class graficoVertical extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public graficoVertical() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/PNG");
		OutputStream out = response.getOutputStream();
		
		try {
			Conexao conec = new Conexao();
			Connection conn = conec.getConexion();
			
			ResultSet rs = null;
			PreparedStatement ps = null;
			
		try {
			DefaultCategoryDataset data = new DefaultCategoryDataset();
			ps = conn.prepareStatement("SELECT marca, SUM(quantidade) AS total FROM produto_quantidade GROUP BY marca");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				data.setValue(rs.getInt(2), rs.getString("marca"), rs.getString("marca") + "-" + rs.getInt(2));
			}
			
			JFreeChart cha = ChartFactory.createBarChart("Gráfico Produtos","Produto", "Estatística", data, PlotOrientation.VERTICAL, true, true, true);
			
			
			  cha.setBackgroundPaint(ChartColor.white);
	             CategoryPlot plot = (CategoryPlot) cha.getPlot();
	             plot.setBackgroundPaint(ChartColor.lightGray);
	             plot.setRangeGridlinePaint(ChartColor.BLACK);
	             plot.setRangeGridlineStroke( new BasicStroke(0.2F) );
	            
	             cha.getLegend().setPosition( RectangleEdge.RIGHT );
	             cha.getLegend().setItemFont( new Font("Arial", Font.PLAIN, 10) );
	             cha.getLegend().setBorder(2, 2, 2, 0); 
	            
	            
	         
	             
	             
			 int ancho = 1000;
             int alto = 720;
             
           
             
             ChartUtilities.writeChartAsPNG(out, cha, ancho, alto);
             
             ps.close();
             rs.close();
             conec.deconectar();
		
			
		} catch (Exception ex) {				
		}			
} finally {
	
}
	out.close();
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}

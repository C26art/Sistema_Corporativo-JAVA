package controller;

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
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;

import model.Conexao;

/**
 * Servlet implementation class graficoPie
 */
@WebServlet("/graficoPie")
public class graficoPie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public graficoPie() {
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
			DefaultPieDataset data = new DefaultPieDataset();
			ps = conn.prepareStatement("SELECT marca, SUM(quantidade) AS total FROM produto_quantidade GROUP BY marca");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				data.setValue(rs.getString("marca"), rs.getInt(2));
			}
			JFreeChart cha = ChartFactory.createPieChart3D("Quantidade Produtos",data, true, true, true);
            
            int ancho = 1000;
            int alto = 720;
            
            final PiePlot3D plot = (PiePlot3D)cha.getPlot();
            plot.setStartAngle(270);
            plot.setForegroundAlpha(0.80f);
            plot.setInteriorGap(0.03);
            plot.setBackgroundPaint(ChartColor.white);              
            plot.setOutlinePaint(new ChartColor(230, 230, 230));              
           
            
            ChartUtilities.writeChartAsPNG(out, cha, ancho, alto);
            
            ps.close();
            rs.close();
            conec.deconectar();
		
			
		} catch (Exception ex) {				
			}			
	} finally {
		out.close();
	}
}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}

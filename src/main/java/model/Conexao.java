package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private String caminho = "jdbc:mysql://localhost:3306/projetointegrador";
	private String usuario = "root";
	private String senha = "";
	
		Connection conn = null;
		
		public Conexao() {
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(caminho, usuario, senha);
				
			} catch (Exception e) {
				System.out.println("Não encontrou o Driver");
				e.printStackTrace();		
			
			}
		}
		
		public Connection getConexion() {
			
			return conn;
		}
		
		public void deconectar() {
			conn = null;
		}
		
		public void  fecharConexao() {
			try {
				conn.close();
				System.out.println("Conexão fechada");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Erro ao acessar o banco de dados");
				e.printStackTrace();
			}
		}

	}

package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Conexao;
import model.Produtos;

public class ProdutoDao extends Conexao {
	public ArrayList<Produtos> listarProdutos(){

		ArrayList<Produtos> lista = new ArrayList<Produtos>();
		Produtos p = null;
		String sql = "SELECT idProduto, nome FROM produto";
		try{
			PreparedStatement ps = getConexion().prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()){
				p = new Produtos();
				p.setIdProduto(rs.getString(1));
				p.setNome(rs.getString(2));

				lista.add(p);
			}
		
		}catch (SQLException e) {
			e.printStackTrace();



		}finally{
			fecharConexao();
		}
		return lista;
	}

}

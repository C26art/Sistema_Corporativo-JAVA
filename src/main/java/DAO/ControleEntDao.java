package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Conexao;
import model.Fornecedor;


public class ControleEntDao extends Conexao{
	public ArrayList<Fornecedor> procurarFornecedor(){

		ArrayList<Fornecedor> procura = new ArrayList<Fornecedor>();
		Fornecedor f = null;
		String sql = "SELECT idfornecedor, nome FROM fornecedor";
		try{
			PreparedStatement ps = getConexion().prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()){
				f = new Fornecedor();
				f.setIdfornecedor(rs.getLong(1));
				f.setNome(rs.getString(2));

				procura.add(f);
			}
		
		}catch (SQLException e) {
			e.printStackTrace();



		}finally{
			fecharConexao();
		}
		return procura;
	}

}




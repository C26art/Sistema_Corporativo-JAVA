package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Conexao;
import model.ControleSaida;
import model.Produtos;
import model.DAO;
import model.Fornecedor;


public class ControleSaidaDao extends Conexao {

	public void cadastrar(ControleSaida saida) {

		String sql = "insert into controle_saida " + "(quantidadeSaida, dataSaida, estoque, idProduto, valor) values "
				+ "( ?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setInt(1, saida.getQuantidadeSaida());
			ps.setDate(2, new Date(saida.getDataSaida().getTime()));
			ps.setString(3, saida.getEstoque());
			ps.setString(4, saida.getProdutos().getIdProduto());
			ps.setString(5, saida.getValor());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Deu problema no Insert ");
			e.printStackTrace();
		} finally {
			fecharConexao();
		}

	}

	public void alterar(ControleSaida saida) {
		String sql = "update controle_saida set " + "quantidadeSaida = ?, " + "dataSaida = ?, " + "estoque = ?, "
				+ "idProduto = ?, " + "valor = ? " + "where idSaida =? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setInt(1, saida.getQuantidadeSaida());
			ps.setDate(2, new Date(saida.getDataSaida().getTime()));
			ps.setString(3, saida.getEstoque());
			ps.setString(4, saida.getProdutos().getIdProduto());
			ps.setString(5, saida.getValor());
			ps.setLong(6, saida.getIdSaida());
			ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Erro no Update");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

	public ArrayList<ControleSaida> listar() {
		ArrayList<ControleSaida> lista = new ArrayList<ControleSaida>();

		try {
			String sql =  "select * from controle_saida ";
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			ControleSaida saida = null;
			Produtos produto = null;
			while (rs.next()) {
				saida = new ControleSaida();
				saida.setIdSaida(rs.getLong("idSaida"));
				saida.setQuantidadeSaida(rs.getInt("quantidadeSaida"));
				saida.setDataSaida(rs.getDate("dataSaida"));
				saida.setEstoque(rs.getString("estoque"));
				saida.setValor(rs.getString("valor"));
				produto = new Produtos();
				produto.setIdProduto(rs.getString("idProduto"));				
				saida.setProdutos(produto);

				lista.add(saida);
			}

		} catch (Exception e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return lista;
	}	

	public ControleSaida buscar(long idSaida) {

		ControleSaida saida = null;
		Produtos produto = null;

		String sql = "select * from controle_saida " +
				"where idSaida = ? ";
		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, idSaida);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				saida = new ControleSaida();
				saida.setIdSaida(rs.getLong("idSaida"));
				saida.setQuantidadeSaida(rs.getInt("quantidadeSaida"));
				saida.setDataSaida(rs.getDate("dataSaida"));
				saida.setEstoque(rs.getString("estoque"));
				saida.setValor(rs.getString("valor"));

				produto = new Produtos();
				produto.setIdProduto(rs.getString("idProduto"));								
				saida.setProdutos(produto);
			}

		} catch (SQLException e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return saida;
	}

	public void excluir(ControleSaida saida) {
		String sql = "delete  from controle_saida where idSaida = ? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, saida.getIdSaida());

			ps.execute();

		} catch (SQLException e) {
			System.out.println("Erro na exclusão");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

}

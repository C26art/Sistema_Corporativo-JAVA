package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Conexao;
import model.ControleEntrada;
import model.Fornecedor;
import model.Produtos;

public class ControleEntradaDao extends Conexao {
	public void cadastrar(ControleEntrada entrada) {

		String sql = "insert into controle_entrada "
				+ "(quantidadeEntrada, dataEntrada, valorProduto, nomeProdutoEntrada, idProduto, idfornecedor) values "
				+ "( ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setInt(1, entrada.getQuantidadeEntrada());
			ps.setDate(2, new Date(entrada.getDataEntrada().getTime()));
			ps.setString(3, entrada.getValorProduto());
			ps.setString(4, entrada.getNomeProdutoEntrada());
			ps.setString(5, entrada.getProdutos().getIdProduto());
			ps.setLong(6, entrada.getFornecedor().getIdfornecedor());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Deu problema no Insert ");
			e.printStackTrace();
		} finally {
			fecharConexao();
		}
	}

	public void alterar(ControleEntrada entrada) {
		String sql = "update controle_entrada set " + "quantidadeEntrada = ?, " + "dataEntrada = ?, "
				+ "valorProduto = ?, " + "nomeProdutoEntrada = ?, " + "idProduto = ?, " + "idfornecedor = ? "
				+ "where idEntrada =? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setInt(1, entrada.getQuantidadeEntrada());
			ps.setDate(2, new Date(entrada.getDataEntrada().getTime()));
			ps.setString(3, entrada.getValorProduto());
			ps.setString(4, entrada.getNomeProdutoEntrada());
			ps.setString(5, entrada.getProdutos().getIdProduto());
			ps.setLong(6, entrada.getFornecedor().getIdfornecedor());
			ps.setLong(7, entrada.getIdEntrada());
			ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Erro no Update");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

	public ArrayList<ControleEntrada> listar() {
		ArrayList<ControleEntrada> lista = new ArrayList<ControleEntrada>();

		try {
			String sql = "select * from controle_entrada ";
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			ControleEntrada entrada = null;
			Produtos produto = null;
			Fornecedor f = null;
			while (rs.next()) {
				entrada = new ControleEntrada();
				entrada.setIdEntrada(rs.getLong("idEntrada"));
				entrada.setQuantidadeEntrada(rs.getInt("quantidadeEntrada"));
				entrada.setDataEntrada(rs.getDate("dataEntrada"));
				entrada.setValorProduto(rs.getString("valorProduto"));
				entrada.setNomeProdutoEntrada(rs.getString("nomeProdutoEntrada"));
				produto = new Produtos();
				produto.setIdProduto(rs.getString("idProduto"));
				entrada.setProdutos(produto);
				f = new Fornecedor();
				f.setIdfornecedor(rs.getLong("idfornecedor"));

				lista.add(entrada);
			}

		} catch (Exception e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return lista;
	}

	public ControleEntrada buscar(long idEntrada) {

		ControleEntrada entrada = null;
		Produtos produto = null;
		Fornecedor f = null;

		String sql = "select * from controle_entrada " + "where idEntrada = ? ";
		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, idEntrada);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				entrada = new ControleEntrada();
				entrada.setIdEntrada(rs.getLong("idEntrada"));
				entrada.setQuantidadeEntrada(rs.getInt("quantidadeEntrada"));
				entrada.setDataEntrada(rs.getDate("dataEntrada"));
				entrada.setValorProduto(rs.getString("valorProduto"));
				entrada.setNomeProdutoEntrada(rs.getString("nomeProdutoEntrada"));

				produto = new Produtos();
				produto.setIdProduto(rs.getString("idProduto"));

				f = new Fornecedor();
				f.setIdfornecedor(rs.getLong("idfornecedor"));
				entrada.setProdutos(produto);
				entrada.setFornecedor(f);
			}

		} catch (SQLException e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return entrada;
	}

	public void excluir(ControleEntrada entrada) {
		String sql = "delete  from controle_entrada where idEntrada = ? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, entrada.getIdEntrada());

			ps.execute();

		} catch (SQLException e) {
			System.out.println("Erro na exclusão");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

}

package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Conexao;
import model.Fornecedor;

public class FornecedorDao extends Conexao {

	public void cadastrar(Fornecedor d) {
		String sql = "insert into fornecedor " + "(cnpj, produto, nome, telefone, email, endereco) values "
				+ "(?, ?, ?, ?, ?, ?)";

		try {

			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, d.getCnpj());
			ps.setString(2, d.getProduto());
			ps.setString(3, d.getNome());
			ps.setString(4, d.getTelefone());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getEndereco());
			ps.execute();

		} catch (Exception e) {
			System.out.println("Deu problema no Insert ");
			e.printStackTrace();
		} finally {
			fecharConexao();
		}

	}

	public void alterar(Fornecedor d) {
		String sql = "update fornecedor set " + "cnpj = ?, " + "produto = ?, " + "nome = ?, " + "telefone = ?, "
				+ "email = ?, " + "endereco = ? " + "where idfornecedor =? ";
		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, d.getCnpj());
			ps.setString(2, d.getProduto());
			ps.setString(3, d.getNome());
			ps.setString(4, d.getTelefone());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getEndereco());
			ps.setLong(7, d.getIdfornecedor());
			ps.execute();

		} catch (SQLException e) {
			System.out.println("Erro no Update");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

	public ArrayList<Fornecedor> listar(String nomeBusca) {
		ArrayList<Fornecedor> lista = new ArrayList<Fornecedor>();

		String sql = "select * from fornecedor " + "where nome like? " + "order by nome";
		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, "%" + nomeBusca + "%");

			ResultSet rs = ps.executeQuery();
			Fornecedor d;
			while (rs.next()) {
				d = new Fornecedor();
				d.setIdfornecedor(rs.getLong("idfornecedor"));
				d.setCnpj(rs.getString("cnpj"));
				d.setProduto(rs.getString("produto"));
				d.setNome(rs.getString("nome"));
				d.setTelefone(rs.getString("telefone"));
				d.setEmail(rs.getString("email"));
				d.setEndereco(rs.getString("endereco"));
				lista.add(d);
			}

		} catch (SQLException e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return lista;

	}

	public Fornecedor buscar(long idfornecedor) {
		Fornecedor fornecedor = null;

		String sql = "select * from fornecedor " + "where idfornecedor = ? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, idfornecedor);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				fornecedor = new Fornecedor();
				fornecedor.setIdfornecedor(rs.getLong("idfornecedor"));
				fornecedor.setCnpj(rs.getString("cnpj"));
				fornecedor.setProduto(rs.getString("produto"));
				fornecedor.setNome(rs.getString("nome"));
				fornecedor.setTelefone(rs.getString("telefone"));
				fornecedor.setEmail(rs.getString("email"));
				fornecedor.setEndereco(rs.getString("endereco"));
			}

		} catch (SQLException e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return fornecedor;
	}

	public void excluir(Fornecedor d) {
		String sql = "delete  from fornecedor where idfornecedor = ? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, d.getIdfornecedor());

			ps.execute();

		} catch (SQLException e) {
			System.out.println("Erro na exclusão");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

}

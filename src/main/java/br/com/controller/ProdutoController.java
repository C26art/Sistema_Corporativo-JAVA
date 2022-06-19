package br.com.controller;

import java.util.ArrayList;

import DAO.ProdutoDao;
import model.Produtos;

public class ProdutoController {
	ProdutoDao dao = new ProdutoDao();

	public ArrayList<Produtos> listar() {
		return dao.listarProdutos();
	}
}

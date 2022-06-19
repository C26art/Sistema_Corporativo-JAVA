package br.com.controller;

import java.util.ArrayList;

import DAO.ControleEntDao;
import DAO.ControleEntradaDao;
import model.ControleEntrada;
import model.Fornecedor;

public class ControleEntradaController {
	ControleEntDao dao = new ControleEntDao();

	public ArrayList<Fornecedor> listar() {
		return dao.procurarFornecedor();
	}

}

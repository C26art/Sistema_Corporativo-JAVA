package br.com.controller;

import java.util.ArrayList;

import DAO.ControleEntradaDao;
import model.ControleEntrada;

public class ControleEntradaaController {
	ControleEntradaDao dao = new ControleEntradaDao();

	public void cadastrar(ControleEntrada entrada) {
		dao.cadastrar(entrada);
	}

	public void alterar(ControleEntrada entrada) {
		dao.alterar(entrada);
	}

	public ArrayList<ControleEntrada> listar() {
		return dao.listar();
	}

	public ControleEntrada buscar(long idEntrada) {
		return dao.buscar(idEntrada);
	}

	public void excluir(ControleEntrada entrada) {
		dao.excluir(entrada);
	}

}

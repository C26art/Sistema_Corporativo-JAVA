package br.com.controller;

import java.util.ArrayList;

import DAO.ControleSaidaDao;
import model.ControleSaida;


public class ControleSaidaController {
	ControleSaidaDao dao = new ControleSaidaDao();
	
	public void cadastrar(ControleSaida saida) {
		dao.cadastrar(saida);
	}
	
	public void alterar(ControleSaida saida) {
		dao.alterar(saida);
	}
	
	public ArrayList<ControleSaida>listar(){
		return dao.listar();
	}
	
	public ControleSaida buscar(long idSaida) {
		return dao.buscar(idSaida);
	}
	
	public void excluir(ControleSaida saida) {
		dao.excluir(saida);
	}


}

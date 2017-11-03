package controller;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dominio.Bandeirada;
import dominio.Cliente;
import dominio.Chamado;
import servico.BandeiradaServico;
import servico.ChamadoServico;
import servico.ClienteServico;
import servico.MotoTaxistaServico;
import servico.ServicoException;
import servico.ServicoFactory;

@WebServlet("/administrador/ChamadoCRUD")
public class ChamadoCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static String INSERIR_OU_ALTERAR = "/administrador/chamadoForm.jsp";
	private static String LISTAR = "/administrador/chamadoListar.jsp";
	private static String ESCOLHER_BANDEIRADA = "/administrador/chamadoEscolherBandeirada.jsp";
	private static String ESCOLHER_CLIENTE = "/administrador/chamadoEscolherCliente.jsp";
	private static String ESCOLHER_MOTOTAXISTA = "/administrador/chamadoEscolherMototaxista.jsp";
	private static String ERRO = "/administrador/erro.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ChamadoServico chamadoServico = ServicoFactory.criarChamadoServico();
		BandeiradaServico bandeiradaServico = ServicoFactory.criarBandeiradaServico();
		ClienteServico clienteServico = ServicoFactory.criarClienteServico();
		MotoTaxistaServico motoTaxistaServico = ServicoFactory.criarMotoTaxistaServico();

		String forward = "";
		String cmd = request.getParameter("cmd");
		
		if (cmd == null || cmd.equalsIgnoreCase(""))
			cmd = "listar";
		if (cmd.equalsIgnoreCase("deletar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Chamado cha = chamadoServico.buscar(cod);
				if (cha != null) {
					chamadoServico.excluir(cha);
				}
				request.setAttribute("lista", chamadoServico.buscarTodos());
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		} else if (cmd.equalsIgnoreCase("editar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			try {
				Chamado cha = chamadoServico.buscar(cod);
				if (cha != null) {
					request.setAttribute("cha", cha);
					forward = INSERIR_OU_ALTERAR;
				} else {
					request.setAttribute("lista", chamadoServico.buscarTodos());
					forward = LISTAR;
				}
			} catch (RuntimeException e) {
				request.setAttribute("Erro de execução: ", e.getMessage());
				forward = ERRO;
			}
		} else if (cmd.equalsIgnoreCase("listar")) {
			try {
				request.setAttribute("lista", chamadoServico.buscarTodos());
				forward = LISTAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		} else if (cmd.equalsIgnoreCase("novo")) {
			int codBandeirada = Integer.parseInt(request.getParameter("codBandeirada"));
			int codCliente = Integer.parseInt(request.getParameter("codCliente"));
			int codMototaxista = Integer.parseInt(request.getParameter("codMototaxista"));
			try {
				Chamado cha = new Chamado();
				cha.setBandeirada(bandeiradaServico.buscar(codBandeirada));
				cha.setCliente(clienteServico.buscar(codCliente));
				cha.setMotoTaxista(motoTaxistaServico.buscar(codMototaxista));
				request.setAttribute("cha", cha);
				forward = INSERIR_OU_ALTERAR;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		} else if (cmd.equalsIgnoreCase("escolherCliente")) {
			int codBandeirada = Integer.parseInt(request.getParameter("codBandeirada"));
			try {
				Bandeirada ban = bandeiradaServico.buscar(codBandeirada);
				request.setAttribute("lista", clienteServico.buscarTodos());
				request.setAttribute("codBandeirada", ban);
				forward = ESCOLHER_CLIENTE;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		} else if (cmd.equalsIgnoreCase("escolherMototaxista")) {
			int codBandeirada = Integer.parseInt(request.getParameter("codBandeirada"));
			int codCliente = Integer.parseInt(request.getParameter("codCliente"));
			try {
				Bandeirada ban = bandeiradaServico.buscar(codBandeirada);
				Cliente cli = clienteServico.buscar(codCliente);
				request.setAttribute("lista", motoTaxistaServico.buscarTodos());
				request.setAttribute("codBandeirada", ban);
				request.setAttribute("codCliente", cli);
				forward = ESCOLHER_MOTOTAXISTA;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		} else if (cmd.equalsIgnoreCase("escolherBandeirada")) {
			try {
				request.setAttribute("lista", bandeiradaServico.buscarTodos());
				forward = ESCOLHER_BANDEIRADA;
			} catch (RuntimeException e) {
				request.setAttribute("erro", "Erro de execução: " + e.getMessage());
				forward = ERRO;
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ChamadoServico chamadoServico = ServicoFactory.criarChamadoServico();
		String forward = "";

		Chamado cha = instanciar(request);
		try {
			chamadoServico.inserirChamado(cha);
		} catch (ServicoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("lista", chamadoServico.buscarTodos());
		forward = LISTAR;

		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

	private Chamado instanciar(HttpServletRequest req) {
		BandeiradaServico bandeiradaServico = ServicoFactory.criarBandeiradaServico();
		ClienteServico clienteServico = ServicoFactory.criarClienteServico();
		MotoTaxistaServico motoTaxistaServico = ServicoFactory.criarMotoTaxistaServico();
		String aux;
	
		Date minhaData = new Date();	
		
		Random gerador = new Random();
        double distancia = gerador.nextInt(10) * 10;
        
        
		Chamado x = new Chamado();

		aux = req.getParameter("codChamado");
		if (aux != null && !aux.isEmpty())
			x.setCodChamado(Integer.parseInt(aux));
		aux = req.getParameter("origem");
		x.setOrigem(aux);
		aux = req.getParameter("destino");
		x.setDestino(aux);
		x.setDataHora(minhaData);
		x.setDistancia(distancia);
		
		aux = req.getParameter("motoTaxista");
		x.setMotoTaxista(motoTaxistaServico.buscar(Integer.parseInt(aux)));
		
		aux = req.getParameter("cliente");
		x.setCliente(clienteServico.buscar(Integer.parseInt(aux)));
		
		aux = req.getParameter("bandeirada");
		x.setBandeirada(bandeiradaServico.buscar(Integer.parseInt(aux)));
		return x;
	}
}

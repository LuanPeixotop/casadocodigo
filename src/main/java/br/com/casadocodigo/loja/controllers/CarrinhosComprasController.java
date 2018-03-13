package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.CarrinhoItem;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhosComprasController {
	
	@Autowired
	private ProdutoDAO produtoDAO;
	
	@Autowired
	private CarrinhoCompras carrinhoCompras;
	
	@RequestMapping("/add")
	public ModelAndView add(Integer produtoId, TipoPreco tipo) {
		ModelAndView modelAndView = new ModelAndView("redirect:/produtos");
		CarrinhoItem carrinhoItem = criaItem(produtoId, tipo);
		carrinhoCompras.add(carrinhoItem);
		return modelAndView;
	}
	
	public CarrinhoItem criaItem(Integer produtoId, TipoPreco tipo) {
		Produto produto = produtoDAO.find(produtoId);
		CarrinhoItem carrinhoItem = new CarrinhoItem(produto, tipo);
		return carrinhoItem;
	}
}

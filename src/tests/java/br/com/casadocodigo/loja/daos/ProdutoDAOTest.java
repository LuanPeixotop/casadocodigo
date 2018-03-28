package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import br.com.casadocodigo.loja.builders.ProdutoBuilder;
import br.com.casadocodigo.loja.conf.JPAConfiguration;
import br.com.casadocodigo.loja.confs.DataSourceConfigurationTest;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;

@ActiveProfiles("test")
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class,ProdutoDAO.class, DataSourceConfigurationTest.class})
public class ProdutoDAOTest {
	
	@Autowired
	private ProdutoDAO produtoDAO;

	@Test
	@Transactional
	public void deveSomarTodosOsPrecosPorTipoPreco() {
		List<Produto> livrosImpressos = ProdutoBuilder.newProduto(TipoPreco.Impresso, BigDecimal.TEN).more(3).buildAll();
	    List<Produto> livrosEbook = ProdutoBuilder.newProduto(TipoPreco.Ebook, BigDecimal.TEN).more(3).buildAll();

	    livrosImpressos.stream().forEach(produtoDAO::gravar);
	    livrosEbook.stream().forEach(produtoDAO::gravar);
	    
	    BigDecimal valor = produtoDAO.somaPrecosPorTipo(TipoPreco.Ebook);
	    Assert.assertEquals(new BigDecimal(40).setScale(2), valor);
		
	}
}

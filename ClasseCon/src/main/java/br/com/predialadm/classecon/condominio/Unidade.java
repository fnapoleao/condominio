package br.com.predialadm.classecon.condominio;

import br.com.predialadm.classecon.condominio.enums.TipoEntregaEnum;
import br.com.predialadm.classecon.condominio.enums.TipoEnvioCobrancaEnum;

/**
 * 
 * Classe responsável por
 * 
 * @author Idelvane 22/02/2011
 * 
 */
public class Unidade {

	private Long id;
	private String nome;
	private TipoEnvioCobrancaEnum meioEnvio;
	private TipoEntregaEnum tipoEntrega;
	private String fone;
	private String fax;
	private Unidade veiculacaoCobranca;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public TipoEnvioCobrancaEnum getMeioEnvio() {
		return meioEnvio;
	}

	public void setMeioEnvio(TipoEnvioCobrancaEnum meioEnvio) {
		this.meioEnvio = meioEnvio;
	}

	public TipoEntregaEnum getTipoEntrega() {
		return tipoEntrega;
	}

	public void setTipoEntrega(TipoEntregaEnum tipoEntrega) {
		this.tipoEntrega = tipoEntrega;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public Unidade getVeiculacaoCobranca() {
		return veiculacaoCobranca;
	}

	public void setVeiculacaoCobranca(Unidade veiculacaoCobranca) {
		this.veiculacaoCobranca = veiculacaoCobranca;
	}

}

/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.util.Date;

/**
 * 
 * @author Idelvane 22/02/2011
 * 
 */
public class Condominio {

	private Long id;
	private String nome;
	private String sigla;
	private Pessoa pessoaRelacionada;
	private Date dataContrato;
	private Date dataVencimentoContrato;

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

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public Pessoa getPessoaRelacionada() {
		return pessoaRelacionada;
	}

	public void setPessoaRelacionada(Pessoa pessoaRelacionada) {
		this.pessoaRelacionada = pessoaRelacionada;
	}

	public Date getDataContrato() {
		return dataContrato;
	}

	public void setDataContrato(Date dataContrato) {
		this.dataContrato = dataContrato;
	}

	public Date getDataVencimentoContrato() {
		return dataVencimentoContrato;
	}

	public void setDataVencimentoContrato(Date dataVencimentoContrato) {
		this.dataVencimentoContrato = dataVencimentoContrato;
	}

}

/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.util.Date;

/**
 * Classe responsável por
 * 
 * @author Idelvane 22/02/2011
 * 
 */
public class Condomino {

	private Long id;
	private Pessoa pessoa;
	private Date dataInicioContrato;
	private Date dataTerminoContrato;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Date getDataInicioContrato() {
		return dataInicioContrato;
	}

	public void setDataInicioContrato(Date dataInicioContrato) {
		this.dataInicioContrato = dataInicioContrato;
	}

	public Date getDataTerminoContrato() {
		return dataTerminoContrato;
	}

	public void setDataTerminoContrato(Date dataTerminoContrato) {
		this.dataTerminoContrato = dataTerminoContrato;
	}

}

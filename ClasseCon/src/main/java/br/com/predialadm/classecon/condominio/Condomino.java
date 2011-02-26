/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Classe responsável por
 * 
 * @author Idelvane 22/02/2011
 * 
 */
@Entity
public class Condomino implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Embedded
	private Pessoa pessoa;
	
	@Temporal(TemporalType.DATE)
	private Date dataInicioContrato;
	
	@Temporal(TemporalType.DATE)
	private Date dataTerminoContrato;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="idCondominio")
	private Set<ContratoServico> contratosServico;

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
	
	public Set<ContratoServico> getContratosServico() {
		return contratosServico;
	}
	
	public void setContratosServico(Set<ContratoServico> contratosServico) {
		this.contratosServico = contratosServico;
	}

}

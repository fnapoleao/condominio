package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Classe que representa um conselho de condomínio.
 * 
 * @author Idelvane 22/02/2011
 * 
 */
@Entity
public class Conselho implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue( strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn (name = "idSindico")
	private Condomino sindico;
	
	@ManyToOne (fetch=FetchType.LAZY)
	@JoinColumn(name="idSubSindico")
	private Condomino subSindico;

	/**
	 * Conselheiros do conselho;
	 */
	@ManyToMany
	@JoinTable(name="Condomino_Conselho",joinColumns=@JoinColumn(columnDefinition="idConselheiro"),
			inverseJoinColumns=@JoinColumn(columnDefinition="idConselho"))
	private Set<Condomino> conselheiros;

	/**
	 * Data de inicio do mandato do conselho.
	 */
	@Temporal (TemporalType.DATE)
	private Date dataInicioMandato;
	/**
	 * Data de término do mandato do conselho vigente;
	 */
	@Temporal (TemporalType.DATE)
	private Date dataVencimentoMandato;

	/**
	 * Condomínio ao qual o conselho pertence.
	 */
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn (name = "idCondominio")
	private Condominio condominio;
	
	/**
	 * Empresa de contabilidade responsável pela Contabilidade do condomínio.
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn (name = "idEmpresa")
	private EmpresaContabilidade empresaContabilidade;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Condomino getSindico() {
		return sindico;
	}

	public void setSindico(Condomino sindico) {
		this.sindico = sindico;
	}

	public Condomino getSubSindico() {
		return subSindico;
	}

	public void setSubSindico(Condomino subSindico) {
		this.subSindico = subSindico;
	}

	public Set<Condomino> getConselheiros() {
		return conselheiros;
	}

	public void setConselheiros(Set<Condomino> conselheiros) {
		this.conselheiros = conselheiros;
	}

	public Date getDataInicioMandato() {
		return dataInicioMandato;
	}

	public void setDataInicioMandato(Date dataInicioMandato) {
		this.dataInicioMandato = dataInicioMandato;
	}

	public Date getDataVencimentoMandato() {
		return dataVencimentoMandato;
	}

	public void setDataVencimentoMandato(Date dataVencimentoMandato) {
		this.dataVencimentoMandato = dataVencimentoMandato;
	}

	public Condominio getCondominio() {
		return condominio;
	}

	public void setCondominio(Condominio condominio) {
		this.condominio = condominio;
	}

	public EmpresaContabilidade getEmpresaContabilidade() {
		return empresaContabilidade;
	}

	public void setEmpresaContabilidade(EmpresaContabilidade empresaContabilidade) {
		this.empresaContabilidade = empresaContabilidade;
	}

}

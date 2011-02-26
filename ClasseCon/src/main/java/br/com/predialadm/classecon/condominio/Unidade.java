package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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

import br.com.predialadm.classecon.condominio.enums.TipoEntregaEnum;
import br.com.predialadm.classecon.condominio.enums.TipoEnvioCobrancaEnum;

/**
 * 
 * Classe que representa uma Unidade no sistema ClasseCon. Uma unidade está
 * vinculada a 1 ou mais condominos.
 * 
 * @author Idelvane 22/02/2011
 * 
 */

@Entity
public class Unidade implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nome;

	/**
	 * Meio de envio da cobrança.
	 */
	@Enumerated(EnumType.STRING)
	private TipoEnvioCobrancaEnum meioEnvio;

	/**
	 * Tipo de entrega da cobrança.
	 */
	@Enumerated(EnumType.STRING)
	private TipoEntregaEnum tipoEntrega;

	private String fone;
	private String fax;

	/**
	 * Unidade de veiculação de cobrança. Caso a cobrança da unidade deva ser
	 * encaminhada para outra unidade.
	 */
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUnidadeCobranca")
	private Unidade veiculacaoCobranca;

	/**
	 * Condôminos vinculados a unidade. Pode ser vários com o passar do tempo.
	 */
	@ManyToMany
	@JoinTable (name = "Unidade_Condomino",  
			joinColumns = @JoinColumn (name = "idUnidade"), 
			inverseJoinColumns = @JoinColumn (name = "idCondomino"))
	private Set<Condomino> condominos;

	/**
	 * Ocorrência vinculada a unidade. Pode ter 0 ou várias ocorrências com o
	 * passar do tempo.
	 */
	@OneToMany (fetch = FetchType.LAZY, mappedBy ="unidade")
	private Set<Ocorrencia> ocorrencias;

	/**
	 * Condomíno ao qual a unidade está vinculada.
	 */
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn (name = "idCondominio", nullable = false)
	private Condominio condominio;

	/**
	 * Consumos associados às unidades.
	 */
	@OneToMany (fetch = FetchType.LAZY, mappedBy ="unidade")
	private Set<Consumo> consumos;

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

	public Set<Condomino> getCondominos() {
		return condominos;
	}

	public void setCondominos(Set<Condomino> condominos) {
		this.condominos = condominos;
	}

	public Set<Ocorrencia> getOcorrencias() {
		return ocorrencias;
	}

	public void setOcorrencias(Set<Ocorrencia> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}

	public Condominio getCondominio() {
		return condominio;
	}

	public void setCondominio(Condominio condominio) {
		this.condominio = condominio;
	}

	public Set<Consumo> getConsumos() {
		return consumos;
	}

	public void setConsumos(Set<Consumo> consumos) {
		this.consumos = consumos;
	}

}

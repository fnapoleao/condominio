/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import br.com.predialadm.classecon.condominio.historico.Historico;

/**
 * Classe que representa um condomínio, entidade principal do sistema.
 * 
 * @author Idelvane 22/02/2011
 * 
 */

@Entity
public class Condominio implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String sigla;
	
	/**
	 * Um condomínio e relacionado a uma pessoa jurídica.
	 */
	@Embedded
	private Pessoa pessoaRelacionada;
	
	@Embedded
	private DadosContrato dadosContratuais;
	
	/**
	 * Unidades do condomínio.
	 */
	@OneToMany (fetch = FetchType.LAZY, mappedBy ="condominio")
	private Set<Unidade> unidades;

	/**
	 * Documentos que podem ser publicáveis: atas, convenções, etc. Essa classe
	 * servirá para conter o arquivo a ser feito o upload.
	 */
	@OneToMany (fetch = FetchType.LAZY, mappedBy ="condominio") 
	private Set<Documento> documentosPublicaveis;

	/**
	 * Conselhos do condomínio, pode ter 1 ou mais com o passar do tempo.
	 */
	@OneToMany (fetch = FetchType.LAZY, mappedBy = "condominio") 
	private Set<Conselho> conselhos;

	/**
	 * Informações financeiras do condominio. Mesmo que o condominio não
	 * apresente uma conta criada, ele poderá ter uma conta criada pelo
	 * ClasseCon que será administrada pela Predial ou outra administradora de
	 * condomínio.
	 */
	@OneToOne
	@JoinColumn (name = "idInformacaoFinanceira")
	private InformacaoFinanceira informacaoFinanceira;

	/**
	 * Areas de lazer de um condomínio.
	 */
	@OneToMany (fetch = FetchType.LAZY)
	private Set<AreaLazer> areasDeLazer;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="idCondominio")
	private Set<ContratoServico> contratosServico;
	
	@OneToOne (fetch = FetchType.LAZY)
	@JoinColumn (name = "idHistorico")
	private Historico historico;
	
	@OneToMany (fetch = FetchType.LAZY, mappedBy = "condominio")
	private Set<Regimento> regimentos;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public DadosContrato getDadosContratuais() {
		return dadosContratuais;
	}

	public void setDadosContratuais(DadosContrato dadosContratuais) {
		this.dadosContratuais = dadosContratuais;
	}

	public Set<Unidade> getUnidades() {
		return unidades;
	}

	public void setUnidades(Set<Unidade> unidades) {
		this.unidades = unidades;
	}

	public Set<Documento> getDocumentosPublicaveis() {
		return documentosPublicaveis;
	}

	public void setDocumentosPublicaveis(Set<Documento> documentosPublicaveis) {
		this.documentosPublicaveis = documentosPublicaveis;
	}

	public Set<Conselho> getConselhos() {
		return conselhos;
	}

	public void setConselhos(Set<Conselho> conselhos) {
		this.conselhos = conselhos;
	}

	public InformacaoFinanceira getInformacaoFinanceira() {
		return informacaoFinanceira;
	}

	public void setInformacaoFinanceira(InformacaoFinanceira informacaoFinanceira) {
		this.informacaoFinanceira = informacaoFinanceira;
	}

	public Set<AreaLazer> getAreasDeLazer() {
		return areasDeLazer;
	}

	public void setAreasDeLazer(Set<AreaLazer> areasDeLazer) {
		this.areasDeLazer = areasDeLazer;
	}
	
	public Set<ContratoServico> getContratosServico() {
		return contratosServico;
	}
	
	public void setContratosServico(Set<ContratoServico> contratosServico) {
		this.contratosServico = contratosServico;
	}
	
	public Set<Regimento> getRegimentos() {
		return regimentos;
	}

	public void setRegimentos(Set<Regimento> regimentos) {
		this.regimentos = regimentos;
	}

	public Historico getHistorico() {
		return historico;
	}

	public void setHistorico(Historico historico) {
		this.historico = historico;
	}
		
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Condominio)) {
			return false;
		}
		
		Condominio otherObject = (Condominio) object;
		return new EqualsBuilder()
			.append(this.getPessoaRelacionada(), otherObject.getPessoaRelacionada())
			.append(this.getDadosContratuais(), otherObject.getDadosContratuais())
			.append(this.getSigla(), otherObject.getSigla())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
		.append(this.getPessoaRelacionada())
		.append(this.getDadosContratuais())
		.append(this.getSigla())
		.toHashCode();
	}
}

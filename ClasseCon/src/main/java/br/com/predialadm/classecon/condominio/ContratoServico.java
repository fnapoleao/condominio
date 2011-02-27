package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

@Entity
public class ContratoServico implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idContrato;
	
	@Temporal(TemporalType.DATE)
	private Date dataContratacao;
	
	@Temporal(TemporalType.DATE)
	private Date inicioServico;
	
	@Temporal(TemporalType.DATE)
	private Date terminoServico;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idServico", nullable=false)
	private Servico servico;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idFornecedor", nullable=false)
	private Fornecedor fornecedor;
	
	public Long getIdContrato() {
		return idContrato;
	}

	public void setIdContrato(Long idContrato) {
		this.idContrato = idContrato;
	}

	public Date getDataContratacao() {
		return dataContratacao;
	}

	public void setDataContratacao(Date dataContratacao) {
		this.dataContratacao = dataContratacao;
	}

	public Date getInicioServico() {
		return inicioServico;
	}

	public void setInicioServico(Date inicioServico) {
		this.inicioServico = inicioServico;
	}

	public Date getTerminoServico() {
		return terminoServico;
	}

	public void setTerminoServico(Date terminoServico) {
		this.terminoServico = terminoServico;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof ContratoServico)) {
			return false;
		}
		
		ContratoServico otherObject = (ContratoServico) object;
		return new EqualsBuilder()
			.append(this.getServico(), otherObject.getServico())
			.append(this.getFornecedor(), otherObject.getFornecedor())
			.append(this.getDataContratacao(), otherObject.getDataContratacao())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getServico())
			.append(this.getFornecedor())
			.append(this.getDataContratacao())
			.toHashCode();
	}
	
}

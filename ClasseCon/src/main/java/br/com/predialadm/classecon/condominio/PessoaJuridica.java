package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * 
 * @author Rondinele
 * 25/02/2011
 */
@Entity
public class PessoaJuridica implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idPessoaJuridica;
	private String fantasia;
	
	@Column(name="cnpj", nullable=false)
	private String cnpj;
	private String inscricaoEstadual;
	private String inscricaoMunicipal;
	private String razaoSocial;
	
	public Long getIdPessoaJuridica() {
		return idPessoaJuridica;
	}

	public String getFantasia() {
		return fantasia;
	}

	public void setFantasia(String fantasia) {
		this.fantasia = fantasia;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getInscricaoEstadual() {
		return inscricaoEstadual;
	}

	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

	public String getInscricaoMunicipal() {
		return inscricaoMunicipal;
	}

	public void setInscricaoMunicipal(String inscricaoMunicipal) {
		this.inscricaoMunicipal = inscricaoMunicipal;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public void setIdPessoaJuridica(Long idPessoaJuridica) {
		this.idPessoaJuridica = idPessoaJuridica;
	}
	
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof PessoaJuridica)) {
			return false;
		}
		PessoaJuridica otherObject = (PessoaJuridica) object;
		return new EqualsBuilder()
			.append(this.getCnpj(), otherObject.getCnpj())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getCnpj())
			.toHashCode();
	}

}

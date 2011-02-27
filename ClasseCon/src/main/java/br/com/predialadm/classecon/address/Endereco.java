package br.com.predialadm.classecon.address;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Representa um endereço no sistema.
 * @author Idelvane 22/02/2011
 */

@Embeddable
public class Endereco implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long idEndereco;
	private String numero;
	private String complemento;
	private String logradouro;
	private String cep;
	private String bairro;
	private String pontoDeReferencia;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idMunicipio")
	private Municipio municipio;
	

	public Long getIdEndereco() {
		return idEndereco;
	}

	public void setIdEndereco(Long idEndereco) {
		this.idEndereco = idEndereco;
	}

	public String getBairro() {
		return this.bairro;
	}
	
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public String getCep() {
		return this.cep;
	}
	
	public void setCep(String cep) {
		this.cep = cep;
	}
	
	public String getComplemento() {
		return this.complemento;
	}
	
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	
	public String getLogradouro() {
		return this.logradouro;
	}
	
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	
	public Municipio getMunicipio() {
		return this.municipio;
	}
	
	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}
	
	public String getNumero() {
		return this.numero;
	}
	
	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	public String getPontoDeReferencia() {
		return this.pontoDeReferencia;
	}
	
	public void setPontoDeReferencia(String pontoDeReferencia) {
		this.pontoDeReferencia = pontoDeReferencia;
	}
	
	
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Endereco)) {
			return false;
		}
		Endereco otherObject = (Endereco) object;
		return new EqualsBuilder()
			.append(this.idEndereco, otherObject.getIdEndereco())
			.append(this.cep, otherObject.getCep())
			.append(this.bairro, otherObject.getBairro())
			.append(this.logradouro, otherObject.getLogradouro())
			.append(this.complemento, otherObject.getComplemento())
			.append(this.pontoDeReferencia, otherObject.getPontoDeReferencia())
			.append(this.numero, otherObject.getNumero())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.idEndereco)
			.append(this.cep)
			.append(this.bairro)
			.append(this.logradouro)
			.append(this.complemento)
			.append(this.pontoDeReferencia)
			.append(this.numero)
			.toHashCode();
	}
}
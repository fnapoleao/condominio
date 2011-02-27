package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Embeddable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import br.com.predialadm.classecon.address.Endereco;

/**
 * 
 * @author Rondinele
 * 25/02/2011
 */
@Embeddable
public class Contato implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String celular;
	private String telefoneResidencial;
	private String telefoneTrabalho;
	private String fax;
	private String celular2;
	private String email;
	private String site;
	
	public String getCelular() {
		return celular;
	}

	public String getTelefoneResidencial() {
		return telefoneResidencial;
	}

	public void setTelefoneResidencial(String telefoneResidencial) {
		this.telefoneResidencial = telefoneResidencial;
	}

	public String getTelefoneTrabalho() {
		return telefoneTrabalho;
	}

	public void setTelefoneTrabalho(String telefoneTrabalho) {
		this.telefoneTrabalho = telefoneTrabalho;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getCelular2() {
		return celular2;
	}

	public void setCelular2(String celular2) {
		this.celular2 = celular2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}
		
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Contato)) {
			return false;
		}
		Contato otherObject = (Contato) object;
		return new EqualsBuilder()
			.append(this.getEmail(), otherObject.getEmail())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getEmail())
			.toHashCode();
	}
	
}

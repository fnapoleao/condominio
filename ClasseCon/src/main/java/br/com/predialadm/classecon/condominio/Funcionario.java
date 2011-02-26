package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

@Entity
public class Funcionario implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idFuncionario;
	
	@Embedded
	private Pessoa pessoa;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idCondominio")
	private Condominio condominio;

	public Long getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(Long idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Condominio getCondominio() {
		return condominio;
	}
	
	public void setCondominio(Condominio condominio) {
		this.condominio = condominio;
	}
	
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Funcionario)) {
			return false;
		}
		
		Funcionario otherObject = (Funcionario) object;
		return new EqualsBuilder()
			.append(this.getPessoa(), otherObject.getPessoa())
			.append(this.getCondominio(), otherObject.getCondominio())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getCondominio())
			.toHashCode();
	}

}

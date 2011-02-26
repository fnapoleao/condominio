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

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

@Entity
public class Empresa implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idEmpresa;
	
	@Embedded
	private Pessoa pessoa;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="idEmpresa")
	private Set<ContratoServico> contratosServico;

	public Long getIdEmpresa() {
		return idEmpresa;
	}

	public void setIdEmpresa(Long idEmpresa) {
		this.idEmpresa = idEmpresa;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
	public Set<ContratoServico> getContratosServico() {
		return contratosServico;
	}
	
	public void setContratosServico(Set<ContratoServico> contratosServico) {
		this.contratosServico = contratosServico;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Empresa)) {
			return false;
		}
		
		Empresa otherObject = (Empresa) object;
		return new EqualsBuilder()
			.append(this.getPessoa(), otherObject.getPessoa())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getPessoa())
			.toHashCode();
	}

}

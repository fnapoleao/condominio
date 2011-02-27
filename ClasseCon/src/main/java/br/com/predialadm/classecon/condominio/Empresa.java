package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Classe que representa uma empresa que utiliza o sistema ClasseCon.
 * 
 * @author Rondinele/ Idelvane
 */
@Entity
@Inheritance (strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn (name = "tipoEmpresa", discriminatorType = DiscriminatorType.STRING, length = 3)
@DiscriminatorValue ("MAT")
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
	
	/**
	 * Uma empresa possui 1 ou vários usuários associados a ela.
	 */
	@OneToMany (fetch = FetchType.LAZY, mappedBy ="empresa")
	@JoinColumn (name ="idEmpresa")
	private Set<Usuario> usuarios;
	
	@OneToMany (fetch = FetchType.LAZY, mappedBy ="matriz")
	private Set<Filial> filiais;

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
	
	public Set<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	
	public Set<Filial> getFiliais() {
		return filiais;
	}

	public void setFiliais(Set<Filial> filiais) {
		this.filiais = filiais;
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

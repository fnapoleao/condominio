package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
/**
 * 
 * Classe que representa um fornecedor do sistema ClasseCon. Um fornecedor pode ser cadastrado em cada filial
 * que presta serviço e poderá ser avaliado pelo sindico. 	
 * @author Rondinele/ Idelvane
 *  27/02/2011
 *
 */
@Entity
public class Fornecedor implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idFornecedor;
	
	@Embedded
	private Pessoa pessoa;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="fornecedor")
	private Set<ContratoServico> contratosServico;

	public Long getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(Long idFornecedor) {
		this.idFornecedor = idFornecedor;
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
		if (!(object instanceof Fornecedor)) {
			return false;
		}
		
		Fornecedor otherObject = (Fornecedor) object;
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

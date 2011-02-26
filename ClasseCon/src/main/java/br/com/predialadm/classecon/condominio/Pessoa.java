/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Embedded;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import br.com.predialadm.classecon.address.Endereco;
import br.com.predialadm.classecon.condominio.enums.TipoPessoaEnum;

/**
 * Classe responsável por	
 * @author Idelvane 22/02/2011
 *
 */
@Embeddable
public class Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Embedded
	private Endereco endereco;
	
	@Embedded
	private Contato contato;

	@Enumerated(EnumType.ORDINAL)
	private TipoPessoaEnum tipoPessoa;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@Column(name="idPessoaFisica")
	private PessoaFisica pessoaFisica;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@Column(name="idPessoaJuridica")
	private PessoaJuridica pessoaJuridica;

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public TipoPessoaEnum getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(TipoPessoaEnum tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
	}

	public PessoaJuridica getPessoaJuridica() {
		return pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
	}
	
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Pessoa)) {
			return false;
		}

		Pessoa otherObject = (Pessoa) object;
		if (this.getTipoPessoa() != null && !this.getTipoPessoa().equals(otherObject.getTipoPessoa())) {
			return false;
		}
		
		Object pessoaAtual = null;
		Object pessoaComparada = null;
		if (TipoPessoaEnum.FISICA.equals(this.getTipoPessoa())) {
			pessoaAtual = this.getPessoaFisica();
			pessoaComparada = otherObject.getPessoaFisica();
			
		} else 
			if (TipoPessoaEnum.JURIDICA.equals(this.getTipoPessoa())) {
				pessoaAtual =  this.getPessoaJuridica();
				pessoaComparada = otherObject.getPessoaJuridica();
				
			} else {
				boolean isMesmaPessoaFisica = this.getPessoaFisica() != null && this.getPessoaFisica().equals(otherObject.getPessoaFisica());
				boolean isMesmaPessoaJuridica = this.getPessoaJuridica() != null && this.getPessoaJuridica().equals(otherObject.getPessoaJuridica());
				return isMesmaPessoaFisica && isMesmaPessoaJuridica;
			}
		
		return new EqualsBuilder()
			.append(pessoaAtual, pessoaComparada)
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getTipoPessoa())
			.append(this.getPessoaFisica())
			.append(this.getPessoaJuridica())
			.toHashCode();
	}

}

/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import br.com.predialadm.classecon.condominio.enums.TipoPessoaEnum;

/**
 * Classe responsável por	
 * @author Idelvane 22/02/2011
 *
 */
@Embeddable
public class Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;
<<<<<<< HEAD

	@Enumerated(EnumType.ORDINAL)
	private TipoPessoaEnum tipoPessoa;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idPessoaFisica")
	@Cascade(value={CascadeType.SAVE_UPDATE})
	private PessoaFisica pessoaFisica;

	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idPessoaJuridica")
	@Cascade(value={CascadeType.SAVE_UPDATE})
	private PessoaJuridica pessoaJuridica;

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
=======
	
>>>>>>> branch 'refs/heads/gh-pages' of https://rondinele@github.com/fnapoleao/condominio.git
}

/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Classe que representa uma ocorrência no sistema ClasseCon. Uma ocorrência está vinculada a um condômino e uma unidade e serve para prover
 * um canal de comunicação com a Administrado de Condomínios.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
public class Ocorrencia implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Long id;
	private String descricao;
	/**
	 * Unidade associada a ocorrência
	 */
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn ( name = "idUnidade")
	private Unidade unidade;
	
	@Temporal (TemporalType.TIMESTAMP)
	private Date data;
	/**
	 * Condômino que registrou a ocorrência.
	 */
	@ManyToOne
	//TODO como mapear o relacionamento que não é direto
	private Condomino condomino;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Unidade getUnidade() {
		return unidade;
	}

	public void setUnidade(Unidade unidade) {
		this.unidade = unidade;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Condomino getCondomino() {
		return condomino;
	}

	public void setCondomino(Condomino condomino) {
		this.condomino = condomino;
	}

}

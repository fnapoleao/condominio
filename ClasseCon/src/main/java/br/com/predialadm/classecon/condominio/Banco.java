/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Classe que representa um banco no sistema ClasseCon. Estará vinculado a uma
 * informaçaõ financeira de um condomínio.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
public class Banco implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String descricao;
	private String codigoFebraban;
	private String ispb;

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

	public String getCodigoFebraban() {
		return codigoFebraban;
	}

	public void setCodigoFebraban(String codigoFebraban) {
		this.codigoFebraban = codigoFebraban;
	}

	public String getIspb() {
		return ispb;
	}

	public void setIspb(String ispb) {
		this.ispb = ispb;
	}

}

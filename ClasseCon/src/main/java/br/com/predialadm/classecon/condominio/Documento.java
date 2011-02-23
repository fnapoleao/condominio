/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.util.Date;

/**
 * Classe responsável por
 * 
 * @author Idelvane 22/02/2011
 * 
 */
public class Documento {

	private Long id;
	private String descricao;
	private Date dataEnvio;
	private Usuario usuario;
	private byte[] conteudo;
	private String versao;

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

	public Date getDataEnvio() {
		return dataEnvio;
	}

	public void setDataEnvio(Date dataEnvio) {
		this.dataEnvio = dataEnvio;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public byte[] getConteudo() {
		return conteudo;
	}

	public void setConteudo(byte[] conteudo) {
		this.conteudo = conteudo;
	}

	public String getVersao() {
		return versao;
	}

	public void setVersao(String versao) {
		this.versao = versao;
	}

}

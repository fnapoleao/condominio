/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.predialadm.classecon.condominio.enums.TipoNoticiaEnum;

/**
 * Classe que representa uma noticia no sistema;
 * 
 * @author Idelvane 27/02/2011
 * 
 */
@Entity
public class Noticia implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String titulo;
	@Lob
	private String corpo;

	@Enumerated(EnumType.STRING)
	private TipoNoticiaEnum tipoNoticia;

	/**
	 * Para quem a notícia é destinada
	 */
	private String destino;

	private boolean somenteNaPaginaInicial;

	private boolean ativa;
	@Temporal (TemporalType.DATE)
	private Date dataInclusao;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn (name = "idUsuario")
	private Usuario usuario;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCorpo() {
		return corpo;
	}

	public void setCorpo(String corpo) {
		this.corpo = corpo;
	}

	public TipoNoticiaEnum getTipoNoticia() {
		return tipoNoticia;
	}

	public void setTipoNoticia(TipoNoticiaEnum tipoNoticia) {
		this.tipoNoticia = tipoNoticia;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public boolean isSomenteNaPaginaInicial() {
		return somenteNaPaginaInicial;
	}

	public void setSomenteNaPaginaInicial(boolean somenteNaPaginaInicial) {
		this.somenteNaPaginaInicial = somenteNaPaginaInicial;
	}

	public boolean isAtiva() {
		return ativa;
	}

	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}

	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}

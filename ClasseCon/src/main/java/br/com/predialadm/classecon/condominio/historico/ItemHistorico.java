/**
 * 
 */
package br.com.predialadm.classecon.condominio.historico;

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
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.predialadm.classecon.condominio.Usuario;

/**
 * Classe que representa um item histórico que pode ser inserido em um objeto
 * que tenha história.
 * 
 * @author Idelvane 27/02/2011
 * 
 */
@Entity
public class ItemHistorico implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUsuario")
	private Usuario usuario;

	private String descricao;

	@Temporal(TemporalType.DATE)
	private Date data;

	@Enumerated(EnumType.STRING)
	private TipoHistoricoEnum tipoHistorico;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn ( name = "idHistorico")
	private Historico historico;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public TipoHistoricoEnum getTipoHistorico() {
		return tipoHistorico;
	}

	public void setTipoHistorico(TipoHistoricoEnum tipoHistorico) {
		this.tipoHistorico = tipoHistorico;
	}

	public Historico getHistorico() {
		return historico;
	}

	public void setHistorico(Historico historico) {
		this.historico = historico;
	}
	
}

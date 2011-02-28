/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.predialadm.classecon.condominio.enums.TipoCondominoEnum;


/**
 * Classe que representa um Condômino no sistema ClasseCon.
 * 
 * @author Idelvane 22/02/2011
 * 
 */
@Entity
public class Condomino implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	/**
	 * Um condomíno pode estar vinculado a uma pessoa fisica ou pessoa juridica,
	 * depende do tipo de pessoa escolhido na hora do cadastrado.
	 */
	@Embedded
	private Pessoa pessoa;

	/**
	 * Data de início do contrato com o condomínio.
	 */
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Date dataInicioContrato;

	/**
	 * Data término do contrato com o condomínio.
	 */
	@Temporal(TemporalType.DATE)
	private Date dataTerminoContrato;

	/**
	 * Um condomino pode estar vinculado a várias unidades com o passar do tempo
	 * ou ao mesmo tempo.
	 */
	@ManyToMany (mappedBy ="condominos")
	//TODO verificar se está certo
	private Set<Unidade> unidades;

	/**
	 * Usuário vinculado ao condomino.
	 */
	@OneToOne (fetch = FetchType.LAZY)
	private UsuarioCondomino usuario;

	
	@Enumerated(EnumType.STRING)
	private TipoCondominoEnum tipoCondomino;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Date getDataInicioContrato() {
		return dataInicioContrato;
	}

	public void setDataInicioContrato(Date dataInicioContrato) {
		this.dataInicioContrato = dataInicioContrato;
	}

	public Date getDataTerminoContrato() {
		return dataTerminoContrato;
	}

	public void setDataTerminoContrato(Date dataTerminoContrato) {
		this.dataTerminoContrato = dataTerminoContrato;
	}

	public Set<Unidade> getUnidades() {
		return unidades;
	}

	public void setUnidades(Set<Unidade> unidades) {
		this.unidades = unidades;
	}

	public UsuarioCondomino getUsuario() {
		return usuario;
	}

	public void setUsuario(UsuarioCondomino usuario) {
		this.usuario = usuario;
	}

	public TipoCondominoEnum getTipoCondomino() {
		return tipoCondomino;
	}

	public void setTipoCondomino(TipoCondominoEnum tipoCondomino) {
		this.tipoCondomino = tipoCondomino;
	}

}

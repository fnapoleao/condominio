package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import br.com.predialadm.classecon.condominio.enums.StatusEnum;
/**
 * 
 * Classe que respresenta um usuário do sistema. Esse usuário que poderá fazer login e acessar o sistema.
 * @author Idelvane 25/02/2011
 *
 */
@Entity
@Inheritance (strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn (name = "tipoUsuario", discriminatorType = DiscriminatorType.STRING, length = 3)
@DiscriminatorValue ("USU")
public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Long id;
	/**
	 * Dados cadastrais de um usuário
	 */
	private String nome;
	private String senha;
	private String email;
	private String cpf;
	private String celular;
	/**
	 * Define o status do usuário: ativo, cancelado, suspenso.
	 */
	@Enumerated (EnumType.ORDINAL)
	private StatusEnum status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public StatusEnum getStatus() {
		return status;
	}

	public void setStatus(StatusEnum status) {
		this.status = status;
	}

}

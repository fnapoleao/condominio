package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import br.com.predialadm.classecon.condominio.enums.EstadoCivilEnum;
import br.com.predialadm.classecon.condominio.enums.GrauInstrucaoEnum;
import br.com.predialadm.classecon.condominio.enums.SexoEnum;
import br.com.predialadm.classecon.condominio.enums.TipoRG;

@Entity
public class PessoaFisica implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idPessoa;
	private String nome;
	private String nomeMae;
	
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;
	
	@Column(name="cpf", nullable=false)
	private String cpf;
	private String rg;
	
	@Enumerated(EnumType.ORDINAL)
	private TipoRG tipoRg;
	
	@Enumerated(EnumType.ORDINAL)
	private SexoEnum sexo;
	
	@Enumerated(EnumType.ORDINAL)
	private GrauInstrucaoEnum grauInstrucao;
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoCivilEnum estadoCivil;
	
	public Long getIdPessoa() {
		return idPessoa;
	}

	public void setIdPessoa(Long idPessoa) {
		this.idPessoa = idPessoa;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public TipoRG getTipoRg() {
		return tipoRg;
	}

	public void setTipoRg(TipoRG tipoRg) {
		this.tipoRg = tipoRg;
	}

	public SexoEnum getSexo() {
		return sexo;
	}

	public void setSexo(SexoEnum sexo) {
		this.sexo = sexo;
	}

	public GrauInstrucaoEnum getGrauInstrucao() {
		return grauInstrucao;
	}

	public void setGrauInstrucao(GrauInstrucaoEnum grauInstrucao) {
		this.grauInstrucao = grauInstrucao;
	}

	public EstadoCivilEnum getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(EstadoCivilEnum estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof PessoaFisica)) {
			return false;
		}
		PessoaFisica otherObject = (PessoaFisica) object;
		return new EqualsBuilder()
			.append(this.getCpf(), otherObject.getCpf())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getCpf())
			.toHashCode();
	}

}


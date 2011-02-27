<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="infoway" %>

<%@ attribute name="titulo" required="true" %>
<div class="only-for-print" style="font-family: Courier;">
	<pre>
	<c:if test="${!empty titulo}"> 
	----------------------------------   UNIPLAM   --------------------------------
	
	<center><b>- ${titulo} -</b></center>

	-- <b>INFORMA&Ccedil;&Otilde;ES DA GUIA</b> -------------------------------------------------
	Autoriza&ccedil;&atilde;o:    <infoway:abbreviate text="${guia.autorizacao}" size="29" align="left"/> Atendimento: <fmt:formatDate var="dataAtendimento" value="${guia.dataAtendimento}" pattern="dd/MM/yyyy" scope="request"/><infoway:abbreviate text="${dataAtendimento}" size="10" align="left"/>
	Tipo:           <infoway:abbreviate text="${guia.tipo}" size="64" align="left"/>
	Situa&ccedil;&atilde;o Atual: <infoway:abbreviate text="${guia.situacao.descricao}" size="24" align="left"/> Data da Situa&ccedil;&atilde;o: <fmt:formatDate var="dataSituacao" value="${guia.situacao.dataSituacao}" pattern="dd/MM/yyyy" scope="request"/><infoway:abbreviate text="${dataSituacao}" size="10" align="left"/>
	Especialidade:  <infoway:abbreviate text="${guia.especialidade.descricao}" size="64" align="left"/>

	-- <b>INFORMA&Ccedil;&Otilde;ES DO SEGURADO</b> ---------------------------------------------
	Numero do cartao: <infoway:abbreviate text="${guia.segurado.numeroDoCartao}" size="41" align="left"/><%--Empresa: <infoway:abbreviate text="${guia.segurado.grupo.descricao}" size="23" align="left"/>--%>
	Nome: <infoway:abbreviate text="${guia.segurado.pessoaFisica.nome}" size="50" align="left"/>Tel: <infoway:abbreviate text="${guia.segurado.pessoaFisica.telefoneResidencial}" size="23" align="left"/>
	Sexo: <infoway:abbreviate text="${guia.segurado.pessoaFisica.descricaoDoSexo}" size="42" align="left"/> Nascimento: <fmt:formatDate var="dataNascimento" value="${guia.segurado.pessoaFisica.dataNascimento}" pattern="dd/MM/yyyy" scope="request"/><infoway:abbreviate text="${dataNascimento}" size="23" align="left"/>
	Endere&ccedil;o: <infoway:abbreviate text="${endereco}" size="40" align="left"/>Municipio: <infoway:abbreviate text="${guia.segurado.pessoaFisica.endereco.municipio.descricao}" size="23" align="left"/>

	-- <b>INFORMA&Ccedil;&Otilde;ES DO PRESTADOR</b> --------------------------------------------
	Prestador: <infoway:abbreviate text="${guia.prestador.pessoaJuridica.fantasia}" size="45" align="left"/>Tel:  <infoway:abbreviate text="${guia.prestador.pessoaJuridica.telefone}" size="22" align="left"/>
	Endere&ccedil;o: <infoway:abbreviate text="${guia.prestador.pessoaJuridica.endereco.descricaoCompleta}" size="40" align="left"/>Municipio: <infoway:abbreviate text="${guia.prestador.pessoaJuridica.endereco.municipio.descricao}" size="22" align="left"/>
	Solicitante:    <infoway:abbreviate text="${guia.solicitante.pessoaFisica.nome}" size="64" align="left"/>	
	<c:if test="${guia.simples}">
	-- <b>PROCEDIMENTOS:</b> ------------------------------------------------------------
	+----------+-----------------------+---------------+-------------+------------+
	|  C&oacute;digo  | Descri&ccedil;&atilde;o            |Situa&ccedil;&atilde;o     |Valor(R$)|Co-part.(R$)|
	+----------+-----------------------+---------------+-------------+------------+<c:forEach var="procedimento" items="${guia.procedimentos}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="9" align="left"/> | <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="20" align="left"/>  |<infoway:abbreviate text="${procedimento.situacao.descricao}" size="12" align="left"/> | <infoway:abbreviate text="${procedimento.valorTotalFormatado}" size="8" align="right"/>|<infoway:abbreviate text="${procedimento.valorCoParticipacaoFormatado}" size="12" align="right"/>|</c:forEach>
	+----------+-----------------------+---------------+-------------+------------+
	</c:if>
	<c:if test="${guia.completa}"><c:if test="${fn:length (guia.procedimentosSimples) > 0 }">
	-- <b>EXAMES:</b> --------------------------------------------------------------------
	+----------+-----------------------+---------------+-------------+------------+
	|  C&oacute;digo  | Descri&ccedil;&atilde;o             |Situa&ccedil;&atilde;o       |Valor B.(R$) |Co-part.(R$)|
	+----------+-----------------------+---------------+-------------+------------+<c:forEach var="procedimento" items="${guia.procedimentosSimples}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="9" align="left"/> | <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="20" align="left"/>  |<infoway:abbreviate text="${procedimento.situacao.descricao}" size="14" align="left"/> | <infoway:abbreviate text="${procedimento.valorTotalFormatado}" size="12" align="right"/>|<infoway:abbreviate text="${procedimento.valorCoParticipacaoFormatado}" size="12" align="right"/>|</c:forEach>
	+----------+-----------------------+---------------+-------------+------------+ </c:if>
	<c:if test="${fn:length (guia.procedimentosCirurgicos) > 0}">
	-- <b>PROCEDIMENTOS CIR&Uacute;RGICOS:</b> --------------------------------------------------
	+----------+-----------------------+---------------+-------------+------------+
	|  C&oacute;digo  | Descri&ccedil;&atilde;o             |Situa&ccedil;&atilde;o       |Valor B.(R$) |Co-part.(R$)|
	+----------+-----------------------+---------------+-------------+------------+<c:forEach var="procedimento" items="${guia.procedimentosCirurgicos}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="9" align="left"/> | <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="20" align="left"/>  |<infoway:abbreviate text="${procedimento.situacao.descricao}" size="14" align="left"/> | <infoway:abbreviate text="${procedimento.valorTotalFormatado}" size="12" align="right"/>|<infoway:abbreviate text="${procedimento.valorCoParticipacaoFormatado}" size="12" align="right"/>|</c:forEach>
	+----------+-----------------------+---------------+-------------+------------+ </c:if>
	<c:if test="${fn:length (guia.itensPacote) > 0}">	
	-- <b>PACOTES:</b> -------------------------------------------------------------------
	+----------------------------------+---------------+-------------+------------+
	|  Descri&ccedil;&atilde;o                                     |Situa&ccedil;&atilde;o       | Valor (R$) |
	+----------------------------------+---------------+-------------+------------+<c:forEach var="itemPacote" items="${guia.itensPacote}"><br/>        |<infoway:abbreviate text="${itemPacote.pacote.descricao}" size="47" align="left"/> |<infoway:abbreviate text="${itemPacote.situacao.descricao}" size="14" align="left"/> |<infoway:abbreviate text="${itemPacote.pacote.valorTotal}" size="11" align="left"/> |</c:forEach>
	+----------------------------------+---------------+-------------+------------+ </c:if>	
	<c:if test="${fn:length (guia.itensDiaria) > 0}">	
	-- <b>DI&Aacute;RIAS:</b> -------------------------------------------------------------------
	+----------------------------------+---------------+-------------+------------+
	|  Descri&ccedil;&atilde;o                       |Situa&ccedil;&atilde;o       | Quantidade  | Valor (R$) |
	+----------------------------------+---------------+-------------+------------+<c:forEach var="itemDiaria" items="${guia.itensDiaria}"><br/>        |<infoway:abbreviate text="${itemDiaria.diaria.descricao}" size="33" align="left"/> |<infoway:abbreviate text="${itemDiaria.situacao.descricao}" size="14" align="left"/> | <infoway:abbreviate text="${itemDiaria.valor.quantidade}" size="10" align="left"/>  |<infoway:abbreviate text="${itemDiaria.diaria.valor}" size="11" align="left"/> |</c:forEach>
	+----------------------------------+---------------+-------------+------------+ </c:if>			
	<c:if test="${fn:length (guia.itensGasoterapia) > 0}">	
	-- <b>GASOTERAPIA:</b> ---------------------------------------------------------------
	+----------------------------------+---------------+-------------+------------+
	|  Descri&ccedil;&atilde;o                       |Situa&ccedil;&atilde;o       | Quantidade  | Valor (R$) |
	+----------------------------------+---------------+-------------+------------+<c:forEach var="itemGasoterapia" items="${guia.itensGasoterapia}"><br/>        |<infoway:abbreviate text="${itemGasoterapia.gasoterapia.descricao}" size="33" align="left"/> |<infoway:abbreviate text="${itemGasoterapia.situacao.descricao}" size="14" align="left"/> | <infoway:abbreviate text="${itemGasoterapia.valor.quantidade}" size="10" align="left"/>  |<infoway:abbreviate text="${itemGasoterapia.gasoterapia.valor}" size="11" align="left"/> |</c:forEach>
	+----------------------------------+---------------+-------------+------------+ </c:if>		
	<c:if test="${fn:length (guia.itensTaxa) > 0}">	
	-- <b>TAXAS:</b> --------------------------------------------------------------------
	+----------------------------------+---------------+-------------+------------+
	|  Descri&ccedil;&atilde;o                       |Situa&ccedil;&atilde;o       | Quantidade  | Valor (R$) |
	+----------------------------------+---------------+-------------+------------+<c:forEach var="itemTaxa" items="${guia.itensTaxa}"><br/>        |<infoway:abbreviate text="${itemTaxa.taxa.descricao}" size="33" align="left"/> |<infoway:abbreviate text="${itemTaxa.situacao.descricao}" size="14" align="left"/> | <infoway:abbreviate text="${itemTaxa.valor.quantidade}" size="10" align="left"/>  |<infoway:abbreviate text="${itemTaxa.taxa.valor}" size="11" align="left"/> |</c:forEach>
	+----------------------------------+---------------+-------------+------------+ </c:if>	
	<c:if test="${guia.situacao.descricao eq 'Auditado(a)'}"> 
    	-- <b>VALORES DE MATERIAIS</b>------------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  APARTEMENTO                                            | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosApartamentoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  UTI                                                    | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosUTIAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  BLOCO CIR&Uacute;RGICO                                        | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosBlocoCirurgicoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  PRONTO SOCORRO                                         | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisProntoSocorroAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
 		
        -- <b>VALORES DE MEDICAMENTOS</b>----------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  APARTEMENTO                                            | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosApartamentoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  UTI                                                    | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosUTIAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  BLOCO CIR&Uacute;RGICO                                        | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosBlocoCirurgicoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  PRONTO SOCORRO                                         | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosProntoSocorroAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	
    	-- <b>VALORES MAT/MED ESPECIAIS</b>-------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  SOLU&Ccedil;&Otilde;ES PARENTERAIS                                   | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalSolucoesParenteraisAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  OPMES                                                  | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalOPMESAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
	</c:if>
	</c:if>
                                                           +-------------+------------+
	                                                   |Valor B.(R$) |Co-part.(R$)|
        +--------------------------------------------------+-------------+------------+
        |  V A L O R  T O T A L                            | <infoway:abbreviate text="${guia.valorTotalFormatado}" size="12" align="right"/>|   <infoway:abbreviate text="${guia.valorCoParticipacaoFormatado}" size="9" align="right"/>|
        +--------------------------------------------------+-------------+------------+
         
         
         
         
         Autorizo a cobran&ccedil;a em meu contra-cheque da CO-PARTICIPA&Ccedil;&Atilde;O referente a este
                         atendimento no valor acima especificado
                         
                         
                                          
	--------------------------------------   --------------------------------------
	       Assinatura do Paciente                  Assinatura do Prestador

	-------------------------------------------------------------------------------
	 Autentica&ccedil;&atilde;o: ${guia.numeroAutenticacao}
	<b><center>		 
	IMPORTANTE!!
	Caso o atendimento n&atilde;o seja realizado, EXIJA o cancelamento dessa guia!
	</center></b>
	</c:if>
	</pre>
	</div>
#BANCO DE DADOS


#SOLUCOES TOTVS
##Analisa servicos totvs. 
##Os parametros servicos indicam strings que existem no display name dos servicos para identificar dentre os servicos do windows quais possuem essas strings.  
##Os parametros executaveis sao a conferencia de que os servicos encontrados com o parametro servicos possuem executaveis contendo essa lista de strings.
[string[]]$SERVICOS_PROTHEUS = 'totvs','microsiga','protheus','sped','totvs','tss','mp11','mp10','mp12','appserver'
[string[]]$SERVICOS_LICENSE_SERVER = 'license','licenca','licença'
[string[]]$SERVICOS_TAF = 'taf'
[string[]]$SERVICOS_DISCOVERY = 'Discovery'

[string[]]$EXECUTAVEIS_PROTHEUS = 'APP%exe'

[string[]]$SERVICOS_DBACCESS = 'dbaccess','topconnect','topconect','dbacess','dbacces'
[string[]]$EXECUTAVEIS_DBACCESS = 'DBA%exe'

[string[]]$SERVICOS_FLUIG = 'fluig'
[string[]]$EXECUTAVEIS_FLUIG = 'wildfly','nssm','java','wmiprvse'

[string[]]$SERVICOS_TOTVSBI = 'bi'
[string[]]$EXECUTAVEIS_TOTVSBI = 'tomcat%exe'

[string[]]$SERVICOS_RM = 'RM'
[string[]]$EXECUTAVEIS_RM = 'RM.host%exe'

[string[]]$SERVICOS_GLOBAIS = $SERVICOS_PROTHEUS + $SERVICOS_LICENSE_SERVER + 
$SERVICOS_TAF + $SERVICOS_DISCOVERY + $SERVICOS_DBACCESS + $SERVICOS_FLUIG + $SERVICOS_TOTVSBI + $SERVICOS_RM

[string[]]$EXECUTAVEIS_GLOBAIS = $EXECUTAVEIS_PROTHEUS + $EXECUTAVEIS_DBACCESS + $EXECUTAVEIS_FLUIG + $EXECUTAVEIS_TOTVSBI + $EXECUTAVEIS_RM
##Analisa servicos totvs
#SOLUCOES TOTVS




#ANALISE DE ERROS NOS LOGS 
## PARAMETROS GLOBAIS
$ANALISE_HORAS_DIA='0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,21,22,23,24'
$ANALISE_DIAS_SEMANA='0,1,2,3,4,5,6'
$ANALISE_ULTIMA_ALTERACAO=24

#LICENSE SERVER:
#[string[]]$CODIGO_ERRO_LICENSE = ' -1',' -2',' -3',' -5',' -6',' -9',' -30',' -40',' -50',' -80'
#[string[]]$DESCRICAO_ERRO_LICENSE = 'O TOTVS | License Server nao esta respondendo','Erro nos parametros.','Data de expiracao invalida.','Erro na secao [LicenseServer], do arquivo de configuracao do TOTVS | Application Server.','Erro interno inesperado.','Data do TOTVS | License Server difere da data do servidor TOTVS | Application Server.','Excedeu numero de processos.','Licenca expirou (data).','Erro no Checksum.','Erro na tentativa de salvar arquivo de configuracao.'

#ERROS PROTHEUS E DBACCESS:
[string[]]$CODIGO_ERRO_PROTHEUS = ' -1 ',' -2 ',' -6 ',' -34 ',' -35 ',' -36 ',' -88 ',' -89 ',' -99 ',' -100 '
[string[]]$DESCRICAO_ERRO_PROTHEUS ='NO_ROUTED_INSTALLED - Falha ao tentar estabelecer uma conexao com o TOPConnect / DBAcccess.','NO_CONNECTION - Tentativa de executar uma funcao sem estabelecer conexao previa.','NO_MORE_CONNECTIONS - O DBAccess nao consegue aceitar uma nova conexao','TOO_MANY_USERS - O numero maximo de usuarios conectados foi alcancado.','NO_DB_CONNECTION - O Banco de Dados nao pode ser acessado.','NO_CONN_ALLOWED - Nao e possivel conectar com o DBAccess, pois as novas conexoes estao bloqueadas.','COMM_PROGRAM_ERROR - Erro de comunicacao entre APPServer e DBACCESS','COMM_ENVIRONMENT_ERROR - Timeout de comunicacao (30 segundos) entre DBAPI e DBACCESS.','INVALID_BUILD - A DBAPI (client do DBAccess) esta em uma versao menor que o DBAccess em uso','INVALID_TOPAPI - API Client do DBAccess nao encontrada ou incompativel'
[string[]]$SOLUCAO_ERRO_PROTHEUS = ' Verifique o endereco IP/Host/Porta informados. Verifique se o servico do DBAccess esta em execucao. Verifique se nao ha restricao de Firewall ou infra-estrutura de rede entre o servidor onde esta o TOTVS Application Server e o DBAccess.','Antes de executar uma funcao da RDD TOPCONN, execute a funcao TCLink() para estabelecer uma conexao com o DBAccess e a base de dados em uso.','Verifique se nao houve esgotamento de memoria na maquina onde esta sendo executado o DBAccess','Necessario desconectar alguns usuarios ou solicitar mais licencas.','Verifique os detalhes adicionais na mensagem de erro no DBACCESS para determinar a causa.','Houve um bloqueio manual de novas conexoes da aplicacao ao DBACcess atraves do DBAcecss Monitor.','A conexao TCP foi fechada ou interrompida de forma abrupta entre as aplicacoes. Verifique os logs de ambas as aplicacoes ( APPServer e DBAccess ) para maiores detalhes.','Verifique: a quantidade de conexoes simultaneas recebidas pelo DBACCESS; o consumo de CPU e memoria nas maquinas onde estao a DBAPI, o DBACCESS e o SGBD; a comunicacao entre DBAPI e DBACCESS e entre DBACCESS e SGBD; o tempo de processamento das instrucoes e tarefas do SGBD; se as versoes de DBAPI e DBACCESS sao compativeis.','Atualize a DBAPI (.dll|.so) nos diretorios do AppServer com a versao disponivel no pacote do DBAccess em uso.','Verifique se a configuracao DRIVER da secao DBACCESS do TOTVS Application Server esta apontando para o driver client atualizado do DBAccess'


#Style eh utilizado por alguns tipos de relatorios
$style = "<style>" 
$style = $style + "table,tr,td { font:10pt Arial,Helvetica,sans-serif; text-align:left; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px; }"
$style = $style + "th { font:bold 12pt Arial,Helvetica,sans-serif; padding:0px 0px 0px 0px; text-align:left; 
    color:#008dc0}" 
$style = $style + "</style>"

#CSS HTML PARA UTILIZACAO NOS RELATORIOS EM TELA


$CABECALHO_HTML = "<style type='text/css'> 
table,tr,td { 
font:10pt Arial,Helvetica,sans-serif; 
text-align:left; 
padding:0px 0px 0px 0px; 
margin:0px 0px 0px 0px; 
} 
th { 
font:bold 12pt Arial,Helvetica,sans-serif; 
padding:0px 0px 0px 0px;
text-align:left;
color:#008dc0
} 
</style>"

$RODAPE_HTML = ""

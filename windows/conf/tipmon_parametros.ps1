#SQLSERVER  ------------------------------------------------------------------------------------------------------------------------------
$SQL_INSTANCIA=""
$SQL_USUARIO=""
$SQL_PORTA=""

[string[]]$BANCOS_BACKUP_FULL = 'AUTO'
#[string[]]$BANCOS_BACKUP_FULL representa os bancos que precisam ter um backup full, indique cada banco no formato 'BANCO','BANCO'. Caso nao va ser realizado um backup full colocar 'NAO'. Caso opte por nao indicar qual backup sera backupeado, deixar como 'AUTO', o tipmon vai analisar todos os bancos que nao sao de sistema. CUIDADO ao escrever o valor correspondente

[string[]]$BANCOS_BACKUP_LOG = 'AUTO'
#[string[]]$BANCOS_BACKUP_LOG representa os bancos que precisam ter um backup log, indique cada banco no formato 'BANCO','BANCO'. Caso nao va ser realizado um backup log colocar 'NAO'. Caso opte por nao indicar qual backup sera backupeado, deixar como 'AUTO', o tipmon vai analisar todos os bancos que nao sao de sistema. CUIDADO ao escrever o valor correspondente


[string[]]$VALIDA_ESTATISTICA = 'AUTO'
#Indica se a coleta de estatisticas deve ser analisada e de que forma deve ser feito a analise
#'NAO' => indica para nao analisar nenhuma coleta. 
#'AUTO' => indica para analisar a coleta de todos os bancos de usuarios. 
#'SELECIONAR' => indica que sera passado no parametro abaixo a lista de quais bancos devem ser monitorados. Isso quer dizer que apenas os bancos passados na lista abaixo serao analisados.
#'EXCLUIR' => indica que sera passado no parametro abaixo a lista de quais bancos devem ser excluidos da lista dos bancos analisados. Isso quer dizer que todos os bancos de usuarios serao analisados menos os passados na lista abaixo.
[string[]]$BANCOS_ESTATISTICA = ''
#Lista os bancos indicando quais devem ser monitorados ou excluidos do monitoramento. Esse parametro depende do parametro anterior VALIDA_ESTATISTICA para funcionar.
#Liste os bancos no formato 'banco1','banco2'.

[string[]]$IGNORA_JOBS = ''

#SQLSERVER  ------------------------------------------------------------------------------------------------------------------------------


#TOTVS --------------------------------------------------------------------------------------------------------------------
[string[]]$IGNORA_SERVICOS = ''
#Caso queira ignorar algum serviço, basta colocar o Name do servico entre '',''. Lembrando que o name do servico nao eh igual ao display name.  

#TOTVS  -------------------------------------------------------------------------------------------------------------------



#TASK SCHEDULER ---------------------------------------------------------------------------------------------------------------
[string[]]$TASK_SCHEDULER_USUARIO ='BROSDK015\totvsadmin'
#Informe o usuario a ser usado para executar o agendamento que executa as rotinas mais pesadas do agente. Esse usuario precisa ter permissao de administrador. 
#O formato correto para configuracao do parametro eh dominio\usuario. Exemplo: WIN-HMI6NFRSAM5\Administrator
#Somente utilize esse parametro se o padrao nao funcionar.
#A Senha devera ser configurada atraves do executavel agente/conf/tipmon_configura_conexao_task_scheduler.exe. Esse executavel ira criptografar a senha.
#TASK SCHEDULER   -------------------------------------------------------------------------------------------------------------------



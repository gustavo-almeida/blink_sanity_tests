# language: pt
Funcionalidade: Tela de listagem de suítes de testes
				lista de suítes de testes
				Deve permitir CRUD de suítes de testes
				Deve permitir executar as suítes de testes

Cenário: CT-01-Test_Suites - Validar tela de suíte de testes do Blink
	Dado que estou logado no Blink
	E possuo Suítes de Testes cadastradas
	Quando clico no menu Suítes de Testes
	Então sou redirecionado para página com título Suítes de Testes 
	E deve ser exibida migalha Início > Suítes de Testes
	E opção de engrenagem com mais opções desabilitada por padrão
	E opção para Nova suíte
	E campo de Busca com opção Buscar
	E tabela ordenada por últimas suítes de testes criadas/editadas
	E checkbox para seleção em cada uma das linhas da tabela
	E com colunas Nome, Criador, Data de Atualização e Ações
	E opção 'Informações' na coluna Nome
	E na coluna Data de Atualização deve exibir a data/hora no formato do idioma escolhida no sistema
	E opções 'Executar' 'Editar', 'Duplicar' e 'Excluir' na coluna Ações
	E na última linha da tabela uma opção para expandir exibição de Suítes de Testes

Cenário: CT-02-Test_Suites - Validar Migalha
	Dado que estou logado no Blink
	E estou na página de Suítes de Teste
	Quando clico em Início na migalha 
	Então sou redirecionado para a página Visão Geral

Cenário: CT-03-Test_Suites - Habilitar opção de engrenagem
	Dado que estou logado no Blink
	E estou na página de Suítes de Teste com suítes de testes pré-cadastradas
	Quando clico no checkbox 'selecionar tudo'
	Então o sistema deve marcar o checkbox de todos as suítes de testes exibidas
	E desabilitar opções individuais de exclusão na coluna 'Ações' dessas suítes de testes
	E habilitar opção engrenagem

Cenário: CT-04-Test_Suites - Iniciar execução de testes em massa
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de mais de uma suíte de teste na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	Então um modal de confirmação deve ser exibido com título 'Aviso' 
	E tela esmaecida ao redor do modal
	E opção 'Fechar'
	E mensagem 'Você tem certeza que deseja rodar estes items?'
	E opções 'Sim' e 'Não'

Esquema do Cenário: CT-05-Test_Suites - Cancelar execução de testes em massa no modal de confirmação
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção <valor>
	Então a execução de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes
	Mas a seleção das suítes de testes deve ser desfeita

	Exemplos:
		| valor  |
		| Fechar |
		| Não    |

Cenário: CT-06-Test_Suites - Validar modal de seleção de aparelhos na execução de testes em massa
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	Então um outro modal deve ser exibido com título Aparelhos disponíveis
	E campo Busca
	E listagem de aparelhos com colunas Modelo, Fabricante, Tipo, SO, Versão, Status, Ação
	E opção 'Executar' em cada um dos aparelhos na coluna Ação
	E com possíveis status 'Disponível', 'Ocupado' e 'Offline' na coluna Status
	E checkbox de seleção em cada um dos aparelhos
	E opção 'Fechar'

Esquema do Cenário: CT-07-Test_Suites - Realizar busca no modal de seleção de aparelhos na execução de testes em massa
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E preencha o campo Busca com as primeiras letras do <item> da listagem
	Então a lista de aparelhos deve ser atualizada 
	Mas exibir apenas os aparelhos que atendem ao termo buscado

	Exemplos:
		| item       |
		| Modelo     |
		| Fabricante |
		| Tipo       |
		| SO         |
		| Versão     |
		| Status     |

Esquema do Cenário: CT-08-Test_Suites - Ordenar itens no modal de seleção de aparelhos na execução de testes em massa
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E clico no cabeçalho <header> da tabela de aparelhos
	Então a listagem deve ficar ordenada de forma crescente/decrescente
	E uma pequena seta deve indicar a direção

	Exemplos:
		| header     |
		| Modelo     |
		| Fabricante |
		| Tipo       |
		| SO         |
		| Versão     |
		| Status     |

Cenário: CT-09-Test_Suites - Cancelar execução de testes em massa no modal de seleção de aparelhos
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E no modal de seleção de aparelhos eu clique em 'Fechar'
	Então a execução de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes
	Mas a seleção das suítes de testes deve ser mantida

Cenário: CT-10-Test_Suites - Exibir opção Executar suíte no modal de seleção de aparelhos na execução de testes em massa
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E na listagem de aparelhos eu selecione um ou mais checkbox de aparelhos
	Então a opção 'Executar suíte' deve ser exibida
	Mas deve voltar a ficar oculta caso os mesmos aparelhos selecionados anteriormente sejam desmarcados

Cenário: CT-11-Test_Suites - Validar modal de seleção de número de execuções em testes em massa
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos
	Então o sistema exibirá um modal com título 'Suite de testes' 
	E campo 'Número de execuções' preenchido com '1' por padrão
	E opções 'Concluir' e 'Fechar'

Cenário: CT-12-Test_Suites - Realizar uma execução de testes em massa com número de execuções inválido
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos
	E no modal exibido eu altere o campo 'Número de execuções' com valor inválido
	Então o sistema desabilitará o botão 'Concluir'
	E eu não consigo avançar com a execução

Cenário: CT-13-Test_Suites - Cancelar execução de testes em massa no modal de seleção de número de execuções
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos
	E no modal exibido eu altere o campo 'Número de execuções' com valor válido
	E eu clique em 'Fechar'
	Então a execução de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes
	Mas a seleção das suítes de testes deve ser mantida

Cenário: CT-14-Test_Suites - Realizar execução de testes em massa em apenas um aparelho 
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos com status 'Disponível'
	E no modal exibido eu altere o campo 'Número de execuções' com dados válidos
	E eu clique em 'Concluir'
	Então uma mensagem 'Test Suite enviado para execucao!' deve ser exibida
	E a execução de teste deve ser iniciada com sucesso na página de execuções em andamento no aparelho selecionado
	E as suítes de testes selecionadas e número de execuções devem ser obedecidos

Cenário: CT-15-Test_Suites - Realizar execução de testes em massa em aparelhos com diferentes status 
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	E eu selecione o checkbox de mais de um aparelho com diferentes status, 'Disponível', 'Ocupado' e 'Offline'
	E clique no botão 'Executar suite'
	E no modal exibido eu altere o campo 'Número de execuções' com dados válidos
	E eu clique em 'Concluir'
	Então uma mensagem 'Test Suite enviado para execucao!' deve ser exibida
	E uma mensagem 'Atenção! Um ou mais dispositivos estão indisponíveis. Os testes serão executados assim que possível.' deve ser exibida
	E a execução de teste deve ser iniciada com sucesso na página de execuções em andamento no aparelho selecionado com status disponível
	E a execução de teste deve ficar na fila de execução para os aparelhos com status 'Ocupado' e 'Offline' até que os mesmos estejam disponíveis
	E as suítes de testes selecionadas e número de execuções devem ser obedecidos para cada um dos aparelhos

Cenário: CT-16-Test_Suites - Iniciar exclusão em massa
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de mais de uma suíte de teste na listagem
	E aciono a opção de exclusão em massa na engrenagem
	Então um modal de confirmação deve ser exibido com título 'Aviso' 
	E tela esmaecida ao redor do modal
	E opção 'Fechar'
	E mensagem 'Você tem certeza que deseja deletar estes items?'
	E opções 'Sim' e 'Não'

Esquema do Cenário: CT-17-Test_Suites - Cancelar exclusão em massa
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção de exclusão em massa na engrenagem
	E no modal exibido eu selecione a opção <valor>
	Então a exclusão deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes
	Mas a seleção das suítes de testes deve ser desfeita

	Exemplos:
		| valor  |
		| Fechar |
		| Não    |

@sanity
Cenário: CT-18-Test_Suites - Confirmar exclusão em massa
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção de exclusão em massa na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	Então a exclusão deve ser concluída com sucesso
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes atualizada

Cenário: CT-19-Test_Suites - Iniciar Criação de nova suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Nova suíte'
	Então um modal de confirmação deve ser exibido com título 'Nova suíte de teste' 
	E tela esmaecida ao redor do modal
	E campo 'Digite o nome da suíte de teste'
	E opções 'Concluir' e 'Fechar'

Cenário: CT-20-Test_Suites - Cancelar criação de nova suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Nova suíte'
	E preencho o campo nome da suíte de teste com dados válidos
	E no modal exibido eu selecione a opção Fechar
	Então a criação da suíte de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suíte de testes

Cenário: CT-21-Test_Suites - Criar nova suíte de teste com dados em branco
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Nova suíte'
	E não preencho o campo com nome do novo suíte de teste no modal
	E clico em "Concluir"
	Então campo é marcado em vermelho
	E uma mensagem "Campo obrigatório não preenchido" é exibida

@sanity
Cenário: CT-22-Test_Suites - Criar nova suíte de teste com dados válidos
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Nova suíte'
	E preencho o campo com nome da nova suíte de teste no modal com dados válidos
	E clico em "Concluir"
	Então o usuário deve ser redirecionado para a página de edição de suíte de testes
	E o sistema exibe o nome da suíte de teste escolhido no campo Nome

Cenário: CT-23-Test_Suites - Cancelar criação de nova suíte de teste após escolha do nome no modal
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Nova suíte'
	E preencho o campo nome da suíte de teste com dados válidos
	E clico em "Concluir"
	E clico em Fechar na página de edição de suíte de testes
	Então o usuário deve ser redirecionado para a listagem de suíte de testes
	E a suíte de teste criada deve ficar no topo da lista de suítes de testes
	Mas com nome do criador e data de atualização consistentes

Cenário: CT-24-Test_Suites - Realizar busca com dados em branco
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico na opção Buscar
	Então uma mensagem informando que o campo não foi preenchido deve ser exibida
	E a listagem exibida anteriormente não deve sofrer alterações

Cenário: CT-25-Test_Suites - Realizar busca com dados inválidos
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando preencho o campo de busca com dados inválidos
	E clico na opção Buscar
	Então a tabela deve ser atualizada e não exibir mais a listagem de suítes de testes
	E uma mensagem de "Nenhum Resultado encontrado" deve ser exibida

Cenário: CT-26-Test_Suites - Realizar busca com dados válidos
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando preencho o campo de busca com dados válidos
	E clico na opção Buscar
	Então a tabela deve ser atualizada
	E exibir na listagem apenas os items de acordo com o termo utilizado na busca

Cenário: CT-27-Test_Suites - Exibir informações da Suíte de Testes
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Informações' de alguma suíte de testes da listagem
	Então um modal com o título com nome da suíte escolhida deve ser exibido
	E tela esmaecida ao redor do modal
	E opção 'Fechar'
	E ID com número de identificação da Suíte selecionada
	E Tabela de Casos de Teste que compõem a Suíte de teste selecionada
	E Opção 'Editar' em cada um dos suítes de testes da lista

Cenário: CT-28-Test_Suites - Fechar modal de informações da Suíte de Testes
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Informações' de alguma suíte de testes da listagem
	E clico em 'Fechar' no modal exibido
	Então o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes sem alterações

@sanity
Cenário: CT-29-Test_Suites - Iniciar edição de casos de teste por informações da suíte de testes
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Informações' de alguma suíte de testes da listagem
	E clico em "Editar" em algum caso de teste da listagem
	Então o usuário deve ser redirecionado para a página de criação de caso de teste
	E o sistema exibe o nome do caso de teste escolhido logo acima do espaço da tela do aparelho
	E na lateral direita deve ser exibida a lista de passos criadas para esse suíte de teste

Cenário: CT-30-Test_Suites - Validar modal de seleção de aparelhos na execução de testes individual
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	Então um modal deve ser exibido com título Aparelhos disponíveis
	E campo Busca
	E listagem de aparelhos com colunas Modelo, Fabricante, Tipo, SO, Versão, Status, Ação
	E opção 'Executar' em cada um dos aparelhos na coluna Ação
	E com possíveis status 'Disponível', 'Ocupado' e 'Offline' na coluna Status
	E checkbox de seleção em cada um dos aparelhos
	E opção 'Fechar'

Esquema do Cenário: CT-31-Test_Suites - Realizar busca no modal de seleção de aparelhos na execução de testes individual
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E preencha o campo Busca com as primeiras letras do <item> da listagem
	Então a lista de aparelhos deve ser atualizada 
	Mas exibir apenas os aparelhos que atendem ao termo buscado

	Exemplos:
		| item       |
		| Modelo     |
		| Fabricante |
		| Tipo       |
		| SO         |
		| Versão     |
		| Status     |

Esquema do Cenário: CT-32-Test_Suites - Ordenar itens no modal de seleção de aparelhos na execução de testes individual
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E clico no cabeçalho <header> da tabela de aparelhos
	Então a listagem deve ficar ordenada de forma crescente/decrescente
	E uma pequena seta deve indicar a direção

	Exemplos:
		| header     |
		| Modelo     |
		| Fabricante |
		| Tipo       |
		| SO         |
		| Versão     |
		| Status     |

Cenário: CT-33-Test_Suites - Cancelar execução de testes individual no modal de seleção de aparelhos
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E no modal de seleção de aparelhos eu clique em 'Fechar'
	Então a execução de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes

Cenário: CT-34-Test_Suites - Exibir opção Executar suíte no modal de seleção de aparelhos na execução de testes individual
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E na listagem de aparelhos eu selecione um ou mais checkbox de aparelhos
	Então a opção 'Executar suíte' deve ser exibida
	Mas deve voltar a ficar oculta caso os mesmos aparelhos selecionados anteriormente sejam desmarcados

Cenário: CT-35-Test_Suites - Validar modal de seleção de número de execuções em testes individual
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos
	Então o sistema exibirá um modal com título 'Suite de testes' 
	E campo 'Número de execuções' preenchido com '1' por padrão
	E opções 'Concluir' e 'Fechar'

Cenário: CT-36-Test_Suites - Realizar uma execução de testes individual com número de execuções inválido
	Dado que estou logado no Blink
	E estou na página de Suites de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos
	E no modal exibido eu altere o campo 'Número de execuções' com valor inválido
	Então o sistema desabilitará o botão 'Concluir'
	E eu não consigo avançar com a execução

Cenário: CT-37-Test_Suites - Cancelar execução de testes individual no modal de seleção de número de execuções
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos
	E no modal exibido eu altere o campo 'Número de execuções' com valor válido
	E eu clique em 'Fechar'
	Então a execução de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes

Cenário: CT-38-Test_Suites - Realizar execução de testes individual em apenas um aparelho 
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E na lista de aparelhos eu clique na opção 'Executar' em um dos aparelhos com status 'Disponível'
	E no modal exibido eu altere o campo 'Número de execuções' com dados válidos
	E eu clique em 'Concluir'
	Então uma mensagem 'Test Suite enviado para execucao!' deve ser exibida
	E a execução de teste deve ser iniciada com sucesso na página de execuções em andamento no aparelho selecionado
	E as suítes de testes selecionadas e número de execuções devem ser obedecidos

Cenário: CT-39-Test_Suites - Realizar execução de testes em massa em aparelhos com diferentes status 
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Executar' em alguma suíte de testes da listagem
	E eu selecione o checkbox de mais de um aparelho com diferentes status, 'Disponível', 'Ocupado' e 'Offline'
	E clique no botão 'Executar suite'
	E no modal exibido eu altere o campo 'Número de execuções' com dados válidos
	E eu clique em 'Concluir'
	Então uma mensagem 'Test Suite enviado para execucao!' deve ser exibida
	E uma mensagem 'Atenção! Um ou mais dispositivos estão indisponíveis. Os testes serão executados assim que possível.' deve ser exibida
	E a execução de teste deve ser iniciada com sucesso na página de execuções em andamento no aparelho selecionado com status disponível
	E a execução de teste deve ficar na fila de execução para os aparelhos com status 'Ocupado' e 'Offline' até que os mesmos estejam disponíveis
	E as suítes de testes selecionadas e número de execuções devem ser obedecidos para cada um dos aparelhos

Cenário: CT-40-Test_Suites - Validar link para edição de Suíte de Testes
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono a opção 'Editar' em alguma suíte de testes da listagem
	Então eu devo ser redirecionado para a página de edição da suíte de testes selecionada

Cenário: CT-41-Test_Suites - Iniciar duplicação de suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico em "Duplicar" em alguma suíte de teste da listagem
	Então um modal de confirmação deve ser exibido com título 'Duplicar suíte de teste' 
	E tela esmaecida ao redor do modal
	E campo 'Nome' com nome atual do suíte de teste seguido de termo '(Copy)'
	E opções 'Salvar' e 'Fechar'

Cenário: CT-42-Test_Suites - Cancelar duplicação de suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico em "Duplicar" em alguma suíte de teste da listagem
	E preencho o campo nome de suíte de teste com dados válidos
	E no modal exibido eu selecione a opção 'Fechar'
	Então a duplicação do suíte de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes	

Cenário: CT-43-Test_Suites - Duplicar suíte de teste com nome em branco
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico em "Duplicar" em alguma suíte de teste da listagem
	E limpo o campo nome de suíte de teste
	E no modal exibido eu selecione a opção 'Salvar'
	Então o campo nome é marcado em vermelho
	E uma mensagem "Campo obrigatório não preenchido" é exibida
	E a duplicação não deve ser concretizada

@sanity
Cenário: CT-44-Test_Suites - Duplicar suíte de teste com dados válidos
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico em "Duplicar" em alguma suíte de teste da listagem
	E preencho o campo nome de suíte de teste com dados válidos
	E no modal exibido eu selecione a opção 'Salvar'
	Então a duplicação do suíte de teste deve ser concluída com sucesso
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes
	E o suíte de teste duplicado deve ficar no topo da lista de suítes de testes
	Mas com nome do criador e data de atualização consistentes

Cenário: CT-45-Test_Suites - Iniciar exclusão individual de suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico na opção de exclusão de uma suíte de testes qualquer na listagem
	Então um modal de confirmação deve ser exibido com título 'Aviso' 
	E tela esmaecida ao redor do modal
	E opção 'Fechar'
	E mensagem 'Você tem certeza que deseja deletar este item?'
	E opções 'Sim' e 'Não'

Esquema do Cenário: CT-46-Test_Suites - Cancelar exclusão individual de suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico na opção de exclusão de um suíte de testes qualquer na listagem
	E no modal exibido eu selecione a opção <valor>
	Então a exclusão deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes

	Exemplos:
		| valor  |
		| Fechar |
		| Não    |

@sanity
Cenário: CT-47-Test_Suites - Confirmar exclusão individual de suíte de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico na opção de exclusão de um suíte de testes qualquer na listagem
	E no modal exibido eu selecione a opção 'Sim'
	Então a exclusão deve ser concluída com sucesso
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes atualizada

Cenário: CT-48-Test_Suites - Expandir lista de suítes de teste
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando clico na opção de expansão da lista de suítes de teste
	Então uma mensagem 'Carregando suítes de testes' deve ser exibida rapidamente
	E a lista deve ser expandida e exibir novas suítes de testes
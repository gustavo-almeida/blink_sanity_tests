# language: pt
Funcionalidade: Tela de edição/finalização de cadastro de suítes de testes
				Mesma tela de criação e edição de testes
				Deve permitir incluir os casos de testes para compor suíte de testes para posterior execução

Cenário: CT-01-Test_Suites_Editor - Validar tela de edição de suíte de testes
	Dado que estou logado no Blink na página de Suítes de Testes
	Quando clico na opção de edição de uma suíte de testes qualquer na listagem
	Então eu devo ser redirecionado para a página de edição da suíte de testes selecionada
	E título Suíte de Testes
	E deve ser exibida migalha Início > Suítes de Testes
	E campo Nome preenchido com o nome da Suíte escolhida
	E campo Massa de dados com opção 'Nenhum' por padrão
	E quadro Casos de testes para execução com campo Busca
	E tabela de casos de testes e colunas Nome, Criador, Data de atualização e Ações
	E ícone '-' em cada caso de teste da tabela do quadro "Casos de testes para execução"
	E quadro Casos de testes disponíveis com campo Busca e opção Buscar
	E tabela ordenada por últimos casos de testes criados/editados e colunas Nome, Criador, Data de atualização e Ações
	E ícone '+' em cada caso de teste da tabela do quadro "Casos de testes disponíveis"
	E na última linha da lista uma opção para expandir exibição de casos de teste
	E opções Salvar e Cancelar

Cenário: CT-02-Test_Suites_Editor - Validar Migalha
	Dado que estou logado no Blink
	E estou na página de edição de uma suíte de testes
	Quando clico em Início na migalha 
	Então sou redirecionado para a página Visão Geral

@bug
Cenário: CT-03-Test_Suites_Editor - Salvar suite com dados em branco
	Dado que estou logado no Blink
	E estou na página de edição de uma suíte de testes
	Quando limpo o campo Nome da Suíte de testes
	E clico em Salvar
	Então uma mensagem exigindo o preenchimento do campo Nome deve ser exibida

@todo #esse caso de testes precisa estar aqui, ou pode estar na parte de massa de dados?
Cenário: CT-04-Test_Suites_Editor - Selecionar massa de dados para uso
	Dado que estou logado no Blink
	E que tenha ao menos uma massa de dados cadastrada
	E estou na página de edição de uma suíte de testes
	Quando seleciono uma massa de dados para a suíte em questão
	E seleciono um caso de teste cadastrado utilizando essa suíte
	Então ao executar essa suíte de testes a massa de dados deve ser utilizada corretamente
	E no relatório de teste deve ser exibido o valor utilizado na massa de dados

Cenário: CT-05-Test_Suites_Editor - Realizar busca com dados ausentes em Casos de testes para execução
	Dado que estou logado no Blink
	E estou na página de edição de uma suíte de testes
	E que eu tenha alguns casos de testes na lista Casos de testes para execução
	Quando preencho o campo Busca de Casos de testes para execução com dados ausentes da listagem de casos de testes
	Então a mensagem "Nenhum Resultado encontrado" deve ser exibida

Cenário: CT-06-Test_Suites_Editor - Limpar busca com dados ausentes 
	Dado que estou logado no Blink
	E estou na página de edição de uma suíte de testes
	E que eu tenha alguns casos de testes na lista Casos de testes para execução
	Quando preencho o campo Busca de Casos de testes para execução com dados ausentes na listagem de casos de testes
	E após exibição de mensagem "Nenhum Resultado encontrado" eu apague o termo inserido no campo
	Então a mensagem "Nenhum Resultado encontrado" deixa de ser exibida
	E os casos de testes que compõem essa suíte de testes voltam a ser exibidos

Cenário: CT-07-Test_Suites_Editor - Realizar busca com dados válidos em Casos de testes para execução
	Dado que estou logado no Blink
	E estou na página de edição de uma suíte de testes
	E que eu tenha alguns casos de testes na lista Casos de testes para execução
	Quando preencho o campo Busca de Casos de testes para execução com dados válidos na listagem de casos de testes
	Então a lista de casos de testes deve ser atualizada
	E exibir apenas os casos de testes obedecendo os termos inseridos no campo busca

@todo #essa ordenação deveria existir?
Esquema do Cenário: CT-07-Test_Suites_Editor - Ordenar itens da listagem Casos de testes para execução
	Dado que estou logado no Blink
	E estou na página de edição de uma suíte de testes
	E que eu tenha alguns casos de testes na lista Casos de testes para execução
	Quando clico no cabeçalho <header> da tabela de casos de testes para execução
	Então a listagem deve ficar ordenada de forma crescente/decrescente
	E uma pequena seta deve indicar a direção

	Exemplos:
		| header              |
		| Nome                |
		| Criador             |
		| Data de atualização |

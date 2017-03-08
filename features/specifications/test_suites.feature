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
	E tabela com últimas suítes de testes criadas/editadas
	E checkbox para seleção em cada uma das linhas da tabela
	E com colunas Nome, Criador, Data de Atualização e Ações
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

Esquema do Cenário: CT-05-Test_Suites - Cancelar execução de testes em massa
	Dado que estou logado no Blink
	E estou na página de Suítes de Testes
	Quando seleciono o checkbox de um ou mais suítes de testes na listagem
	E aciono a opção 'Rodar todos' na engrenagem
	E no modal exibido eu selecione a opção <valor>
	Então a execução de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de suítes de testes
	Mas a seleção dos casos de testes deve ser desfeita

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
	E checkbox de seleção em cada um dos aparelhos
	E opção 'Fechar'

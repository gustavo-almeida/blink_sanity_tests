# language: pt
Funcionalidade: Tela de listagem de casos de testes
				lista de casos de testes
				Deve permitir CRUD de casos de testes

Cenário: CT-01-Test_Cases - Validar tela de caso de testes do Blink
	Dado que estou logado no Blink
	Quando clico no menu Casos de Teste
	Então sou redirecionado para página com título Casos de Teste 
	E deve ser exibida migalha Início > Casos de teste
	E opção de engrenagem com mais opções desabilitada por padrão
	E opção para Novo caso de Teste
	E campo de Busca com opção Buscar
	E tabela com últimos casos de testes criados/editados
	E checkbox para seleção em cada uma das linhas da tabela
	E com colunas Nome, Criador, Data de Atualização e Ações
	E opções 'Editar', 'Duplicar' e 'Excluir' na coluna Ações
	E na última linha da tabela uma opção para expandir exibição de casos de teste

Cenário: CT-02-Test_Cases - Validar Migalha
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico em Início na migalha 
	Então sou redirecionado para a página Visão Geral

Cenário: CT-03-Test_Cases - Habilitar opção de engrenagem
	Dado que estou logado no Blink
	E estou na página de Casos de Teste com casos de testes pré-cadastrados
	Quando clico no checkbox 'selecionar tudo'
	Então o sistema deve marcar o checkbox de todos os casos de testes exibidos
	E desabilitar opções individuais de exclusão na coluna 'Ações' desses casos de testes
	E habilitar opção engrenagem

Cenário: CT-04-Test_Cases - Iniciar exclusão em massa
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando seleciono o checkbox de mais de um caso de teste na listagem
	E aciono a opção de exclusão em massa na engrenagem
	Então um modal de confirmação deve ser exibido com título 'Aviso' 
	E tela esmaecida ao redor do modal
	E opção 'Fechar'
	E mensagem 'Você tem certeza que deseja deletar estes items?'
	E opções 'Sim' e 'Não'

Esquema do Cenário: CT-05-Test_Cases - Cancelar exclusão em massa
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando seleciono o checkbox de um ou mais casos de testes na listagem
	E aciono a opção de exclusão em massa na engrenagem
	E no modal exibido eu selecione a opção <valor>
	Então a exclusão deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes
	Mas a seleção dos casos de testes deve ser desfeita

	Exemplos:
		| valor  |
		| Fechar |
		| Não    |

@sanity
Cenário: CT-06-Test_Cases - Confirmar exclusão em massa
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando seleciono o checkbox de um ou mais casos de testes na listagem
	E aciono a opção de exclusão em massa na engrenagem
	E no modal exibido eu selecione a opção 'Sim'
	Então a exclusão deve ser concluída com sucesso
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes atualizada

Cenário: CT-07-Test_Cases - Iniciar criação de novo caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando aciono opção 'Novo caso de teste'
	Então um modal de confirmação deve ser exibido com título 'Novo caso de teste' 
	E tela esmaecida ao redor do modal
	E opção para Fechar modal
	E campo 'Digite o nome do caso de teste'
	E opções 'Concluir' e 'Fechar'

Esquema do Cenário: CT-08-Test_Cases - Cancelar criação de novo caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando aciono opção 'Novo caso de teste'
	E preencho o campo nome de caso de teste com dados válidos
	E no modal exibido eu selecione a opção <valor>
	Então a criação de novo caso de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes

	Exemplos:
		| valor        |
		| Fechar modal |
		| Botão Fechar |


Cenário: CT-09-Test_Cases - Criar novo caso de teste com dados em branco
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando aciono opção 'Novo caso de teste'	
	E não preencho o campo com nome do novo caso de teste no modal
	E clico em "Concluir"
	Então campo é marcado em vermelho
	E uma mensagem "Campo obrigatório não preenchido" é exibida

Cenário: CT-10-Test_Cases - Criar novo caso de teste com dados válidos
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando aciono opção 'Novo caso de teste'
	E preencho o campo com nome do novo caso de teste no modal com dados válidos
	E clico em "Concluir"
	Então o usuário deve ser redirecionado para a página de criação de caso de teste
	E o sistema exibe o nome do caso de teste escolhido logo acima do espaço da tela do aparelho
	E o caso de teste criado deve ficar no topo da lista de casos de testes
	Mas com nome do criador e data de atualização consistentes

Cenário: CT-11-Test_Cases - Realizar busca com dados em branco
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico na opção Buscar
	Então uma mensagem informando que o campo não foi preenchido deve ser exibida
	E a listagem de Casos de Teste exibida anteriormente não deve sofrer alterações

Cenário: CT-12-Test_Cases - Realizar busca com dados inválidos
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando preencho o campo de busca com dados inválidos
	E clico na opção Buscar
	Então a tabela deve ser atualizada
	E uma mensagem de "Nenhum Resultado encontrado" deve ser exibida

Cenário: CT-13-Test_Cases - Realizar busca com dados válidos
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando preencho o campo de busca com dados válidos
	E clico na opção Buscar
	Então a tabela deve ser atualizada
	E exibir na listagem apenas os Casos de Teste de acordo com o termo utilizado na busca

Esquema do Cenário: CT-14-Test_Cases - Ordenar listagem de casos de testes
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico no cabeçalho <header> da tabela de casos de testes
	Então a listagem deve ficar ordenada de forma crescente/decrescente
	E uma pequena seta deve indicar a direção

	Exemplos:
		| header              |
		| Nome                |
		| Criador             |
		| Data de atualização |

Cenário: CT-15-Test_Cases - Iniciar edição de caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico em "Editar" em algum dos casos de teste da listagem
	Então o usuário deve ser redirecionado para a página de criação de caso de teste
	E o sistema exibe o nome do caso de teste escolhido logo acima do espaço da tela do aparelho
	E na lateral direita deve ser exibida a lista de passos criadas para esse caso de testes

Cenário: CT-16-Test_Cases - Iniciar duplicação de caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico em "Duplicar" em algum dos casos de teste da listagem
	Então um modal de confirmação deve ser exibido com título 'Duplicar caso de teste' 
	E tela esmaecida ao redor do modal
	E campo 'Nome' com nome atual do caso de teste seguido de termo '(copy)'
	E opções 'Salvar' e 'Fechar'

Cenário: CT-17-Test_Cases - Cancelar duplicação de caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico em "Duplicar" em algum dos casos de teste da listagem
	E preencho o campo nome de caso de teste com dados válidos
	E no modal exibido eu selecione a opção 'Fechar'
	Então a duplicação do caso de teste deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes	

Cenário: CT-18-Test_Cases - Duplicar caso de teste com nome em branco
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico em "Duplicar" em algum dos casos de teste da listagem
	E limpo o campo nome de caso de teste
	E no modal exibido eu selecione a opção 'Salvar'
	Então o campo nome é marcado em vermelho
	E uma mensagem "Campo obrigatório não preenchido" é exibida
	E a duplicação não deve ser concretizada

@sanity
Cenário: CT-19-Test_Cases - Duplicar caso de teste com dados válidos
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico em "Duplicar" em algum dos casos de teste da listagem
	E preencho o campo nome de caso de teste com dados válidos
	E no modal exibido eu selecione a opção 'Salvar'
	Então a duplicação do caso de teste deve ser concluída com sucesso
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes
	E o caso de teste duplicado deve ficar no topo da lista de casos de testes
	Mas com nome do criador e data de atualização consistentes

Cenário: CT-20-Test_Cases - Iniciar exclusão individual de caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico na opção de exclusão de um caso de testes qualquer na listagem
	Então um modal de confirmação deve ser exibido com título 'Aviso' 
	E tela esmaecida ao redor do modal
	E opção 'Fechar'
	E mensagem 'Você tem certeza que deseja deletar este item?'
	E opções 'Sim' e 'Não'

Esquema do Cenário: CT-21-Test_Cases - Cancelar exclusão individual de caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico na opção de exclusão de um caso de testes qualquer na listagem
	E no modal exibido eu selecione a opção <valor>
	Então a exclusão deve ser cancelada
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes

	Exemplos:
		| valor  |
		| Fechar |
		| Não    |

@sanity
Cenário: CT-22-Test_Cases - Confirmar exclusão individual de caso de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico na opção de exclusão de um caso de testes qualquer na listagem
	E no modal exibido eu selecione a opção 'Sim'
	Então a exclusão deve ser concluída com sucesso
	E o modal deve ser fechado
	E o usuário deve ser redirecionado para a listagem de casos de testes atualizada

Cenário: CT-23-Test_Cases - Expandir lista de casos de teste
	Dado que estou logado no Blink
	E estou na página de Casos de Teste
	Quando clico na opção de expansão da lista de casos de teste
	Então uma mensagem 'Carregando casos de testes' deve ser exibida rapidamente
	E a lista deve ser expandida e exibir novos casos de testes
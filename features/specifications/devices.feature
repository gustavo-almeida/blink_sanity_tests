# language: pt
Funcionalidade: Tela de listagem de aparelhos
				Exibição de status de cada aparelho
				Opções para conectar nos aparelhos

Cenário: CT-01-Devices - Validar tela de devices do Blink
	Dado que estou logado no Blink
	Quando clico no menu Aparelhos
	Então sou redirecionado para página com título Aparelhos 
	E deve ser exibida migalha Início > Aparelhos
	E campo de Busca com opção Buscar
	E tabela ordenada por padrão exibindo devices com status online, ocupado e offline respectivamente
	E com colunas Status, Nome / Modelo, Fabricante, Tipo, SO, Versão e Ações
	E opções "Informações" e "Label" na coluna Nome / Modelo
	E opções Conectar na coluna Ações habilitada para aparelhos online e desabilitada para aparelhos ocupados ou offline

Cenário: CT-02-Devices - Validar Migalha
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico em Início na migalha 
	Então sou redirecionado para a página Visão Geral

Cenário: CT-03-Devices - Realizar busca com dados em branco
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico na opção Buscar
	Então uma mensagem informando que o campo não foi preenchido deve ser exibida
	E a listagem de aparelhos exibida anteriormente não deve sofrer alterações

Cenário: CT-04-Devices - Realizar busca com dados inválidos
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando preencho o campo de busca com dados inválidos
	E clico na opção Buscar
	Então a tabela deve ser atualizada
	E uma mensagem de "Resultado não encontrado" deve ser exibida

Cenário: CT-05-Devices - Realizar busca com dados válidos
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando preencho o campo de busca com dados válidos
	E clico na opção Buscar
	Então a tabela deve ser atualizada
	E exibir na listagem apenas os aparelhos de acordo com o termo utilizado na busca

Esquema do Cenário: CT-06-Devices - Ordenar listagem de aparelhos
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico no cabeçalho <header> da tabela de aparelhos
	Então a listagem deve ficar ordenada de forma crescente/decrescente
	E uma pequena seta deve indicar a direção

	Exemplos:
		| header     |
		| Status     |
		| Nome       |
		| Fabricante |
		| Tipo       |
		| SO         |
		| Versão     |
	
Cenário: CT-07-Devices - Verificar informações do dispositivo
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico na opção Informações de um dos aparelhos da listagem
	Então um modal com dados de Device Id, Device Hub, Device Farms e Device Model deve ser exibido
	E a tela deve ser esmaecida ao redor do modal

Cenário: CT-08-Devices - Validar opção para alterar label do dispositivo
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico na opção Label de um dos aparelhos da listagem
	Então um modal com título "Dispositivo" deve ser exibido
	E campo Nome do aparelho
	E opções Salvar e Fechar

Cenário: CT-09-Devices - Salvar label do dispositivo com dados em branco
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico na opção Label de um dos aparelhos da listagem
	E não preencho o campo Nome do dispositivo
	E clico em "Salvar" no modal exibido
	Então uma mensagem "Preencha o nome" deve ser exibida
	E o modal deve continuar a ser exibido 
	E o nome do dispositivo não deve sofrer alterações

Cenário: CT-10-Devices - Cancelar criação de label do dispositivo
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico na opção Label de um dos aparelhos da listagem
	E preencho o nome do dispositivo
	E clico em "Fechar" 
	Então o modal é fechado
	E o nome do dispositivo não deve sofrer alterações

Cenário: CT-11-Devices - Salvar Label de dispositivo com dados válidos
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico na opção Label de um dos aparelhos da listagem
	E preencho o nome do dispositivo com caracteres especiais
	E clico em "Salvar" 
	Então o modal é fechado
	E o nome do dispositivo deve ser alterado com sucesso
	E o novo nome deve ser replicado nas outras páginas do sistema

Cenário: CT-12-Devices - Alterar label de dispositivo
	Dado que estou logado no Blink e estou na página de Aparelhos
	E tenho um dispositivo que já teve um label definido
	Quando clico na opção Label desse dispositivo
	E preencho o nome do dispositivo com caracteres especiais
	E clico em "Salvar" 
	Então o modal é fechado
	E o nome do dispositivo deve ser alterado com sucesso
	E o novo nome deve ser replicado nas outras páginas do sistema

Esquema do Cenário: CT-13-Devices - Conectar em dispositivo não disponível
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico em Conectar em um dispositivo que esteja com status <status>
	Então nada deve acontecer

	Exemplos:
		| status  |
		| ocupado |
		| offline |

@sanity
Cenário: CT-14-Devices - Conectar em dispositivo disponível
	Dado que estou logado no Blink
	E estou na página de Aparelhos
	Quando clico em Conectar em um dispositivo que esteja com status online
	Então o usuário deve ser redirecionado para a página de criação de caso de teste
	E o sistema conecta ao aparelho selecionado exibindo sua tela atual
Funcionalidade: Tela inicial do Blink
				Tela exibida ao logar no Blink
				Dashboard com algumas informações são exibidas
				Acesso a todos os menus

Cenário: CT-01-Tela_Inicial - Validar tela inicial do Blink
	Dado que efetuei login no Blink com sucesso
	Então deve ser exibida tela inicial (visão geral)
	E opção para recolher menu
	E logotipo Blink
	E menu lateral com opções
	E título "Visão Geral"
	E opções de alterar idioma e deslogar usuário
	E migalha Início > Visão geral
	E filtro Suite de teste
	E filtro de data inicial exibindo primeiro dia do mês anterior
	E filtro de data final exibindo data corrente
	E opção para filtrar
	E opção para exportar o relatório em PDF
	E título da suíte de teste selecionada no filtro
	E quadros com número de execuções de teste para o período filtrado e número de dispositivos
	E gráfico de pizza com Total de Sucessos e Falhas
	E gráfico de resultado por período
	E tabela com Aparelhos testados
	E gráfico em pizza do aparelho selecionado na tabela de aparelhos testados
	E gráfico de resultados por período do aparelho selecionado na tabela de aparelhos testados
	E tabela com Casos de testes que compõem a suíte de teste filtrada com número de falhas e acertos por caso de teste
	E gráfico em pizza com resultado por caso de teste selecionado

Cenário: CT-02-Tela_Inicial - Recolher menu de opções
	Dado que estou na página inicial do Blink
	Quando clico no ícone de recolher menu
	Então todo o menu deve ser recolhido 
	E o dashboard deve ser exibido de maneiro expandida

Cenário: CT-03-Tela_Inicial - Voltar a exibir menu de opções
	Dado que eu esteja na página inicial do Blink 
	E com o menu de opções recolhido
	Quando clico no ícone de recolher menu
	Então todo o menu deve retornar a ser exibido
	E o dashboard deve voltar a sua exibição original

Cenário: CT-04-Tela_Inicial - Realizar filtro de dashboard com campo data inicial em branco
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E apago a data inicial
	E mantenho a data final como a data corrente
	E seleciono opção filtrar
	Então o campo data inicial deve voltar a exibir a data anterior 
	E o dashboard deve exibir informações de acordo com o filtro selecionado

Cenário: CT-05-Tela_Inicial - Realizar filtro de dashboard com campo data final em branco
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E apago a data final
	E mantenho a data inicial como a data padrão
	E seleciono opção filtrar
	Então o campo data final deve voltar a exibir a data corrente 
	E o dashboard deve exibir informações de acordo com o filtro selecionado

Cenário: CT-06-Tela_Inicial - Realizar filtro de dashboard com data inicial maior que data final
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E altero a data inicial para uma data posterior a final
	E seleciono opção filtrar
	Então a mensagem "Nenhum Resultado encontrado" deve ser exibida
	E o filtro não deve ser realizado

Cenário: CT-07-Tela_Inicial - Realizar filtro de dashboard com data inicial inválida
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E preencho a data inicial com dados inválidos
	E mudo o foco do cursor
	Então a data inicial deve voltar para a data padrão

Cenário: CT-08-Tela_Inicial - Realizar filtro de dashboard com data final inválida
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E preencho a data final com dados inválidos
	E mudo o foco do cursor
	Então a data final deve voltar para a data padrão

Cenário: CT-09-Tela_Inicial - Realizar filtro de dashboard com período que não ocorreu testes
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E seleciono um período de datas onde não ocorreram testes para a suíte selecionada
	E seleciono opção filtrar
	Então a mensagem "Nenhum Resultado encontrado" deve ser exibida
	E o filtro não deve ser realizado

Cenário: CT-10-Tela_Inicial - Realizar filtro de dashboard com dados válidos
	Dado que eu esteja logado na página inicial do Blink
	Quando seleciono uma suíte qualquer no filtro do dashboard
	E seleciono um período de datas válido onde ocorreram testes para a suíte selecionada
	E seleciono opção filtrar
	Então o dashboard deve ser atualizado
	E e exibir dados consistentes com o filtro selecionado

@sanity
Cenário: CT-11-Tela_Inicial - Gerar relatório em PDF a partir do dashboard
	Dado que eu esteja logado na página inicial do Blink
	E que tenha realizado um filtro do dashboard com sucesso
	Quando clico na opção de exportar relatório
	E confirmo
	Então Uma mensagem de sucesso de ve ser exibida "Relatório disponível dentro de alguns minutos dentro de Relatórios exportados"
	E dentro de alguns minutos o relatório deve estar acessível em Relatórios > Exportados
	E seu conteúdo deve ser consistente com os dados filtrados no dashboard
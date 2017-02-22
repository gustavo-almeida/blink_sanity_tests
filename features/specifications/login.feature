# language: pt
Funcionalidade: Tela de Login do Blink

Cenário: CT-01-Login - Validar tela de Login do Blink
	Dado que estou na página de login do Blink sem estar logado
	Então deve ser exibido página de login com logotipo do Blink
	E Campo para inserir Nome do usuário
	E Campo para inserir Senha
	E Opção Entrar
	E Opção Esqueci minha senha
	E Opção para alterar idioma da página

Cenário: CT-02-Login - Validar opção de alteração de idioma
	Dado que estou na página de login do Blink sem estar logado
	Quando clico na opção de alterar idioma da página
	Então deve ser exibido as opções "Português", "English" e "Español"
	E suas respectivas bandeiras

Esquema do Cenário: CT-03-Login - Alterar idioma da página de login
	Dado que estou na página de login do Blink sem estar logado
	Quando clico na opção de alterar idioma da página
	E seleciono a linguagem <bandeira>
	Então todo o texto da página deve ser atualizado para a linguagem selecionada

	Exemplos:
		| bandeira  |
		| Português |
		| English   |
		| Español   |

Cenário: CT-04-Login - Tentar efetuar login sem preencher campos
	Dado que estou na página de login do Blink sem estar logado
	E que nenhum dos campos esteja preenchido
	Quando clico no botão "Entrar"
	Então o usuário deve permanecer na mesma página
	E a mensagem "Nome de usuário ou senha inválido" deve ser exibida

Cenário: CT-05-Login - Tentar efetuar login sem preencher campo senha
	Dado que estou na página de login do Blink sem estar logado	
	Quando preencho o campo usuário com um usuário válido
	E deixo o campo senha em branco
	E clico no botão "Entrar"
	Então o usuário deve permanecer na mesma página
	E a mensagem "Nome de usuário ou senha inválido" deve ser exibida

Cenário: CT-06-Login - Tentar efetuar login sem preencher campo usuário
	Dado que estou na página de login do Blink sem estar logado	
	Quando preencho o campo senha com uma senha válida
	E deixo o campo usuário em branco	
	E clico no botão "Entrar"
	Então o usuário deve permanecer na mesma página
	E a mensagem "Nome de usuário ou senha inválido" deve ser exibida

Cenário: CT-07-Login - Tentar efetuar login com senha inválida
	Dado que estou na página de login do Blink sem estar logado
	Quando preencho o campo usuário com um usuário válido
	E preencho o campo senha com uma senha inválida	
	E clico no botão "Entrar"
	Então o usuário deve permanecer na mesma página
	E a mensagem "Nome de usuário ou senha inválido" deve ser exibida

Cenário: CT-08-Login - Tentar efetuar login com usuário inválido
	Dado que estou na página de login do Blink sem estar logado
	Quando preencho o campo usuário com um usuário inválido
	E preencho o campo senha com uma senha válida
	E clico no botão "Entrar"
	Então o usuário deve permanecer na mesma página
	E a mensagem "Nome de usuário ou senha inválido" deve ser exibida

Cenário: CT-09-Login - Efetuar login com dados válidos
	Dado que estou na página de login do Blink sem estar logado
	Quando preencho o campo usuário com um usuário válido
	E preencho o campo senha com uma senha válida
	E clico no botão "Entrar"
	Então o login deve ser efetuado com sucesso
	E o usuário deve ser redirecionado para a página Visão Geral do Blink
	E deve ser exibida mensagem de saudação "Olá, <nome do usuário>" no canto superior direito

Cenário: CT-10-Login - Tentar efetuar login com usuário já logado
	Dado que eu tenha logado no Blink em outra máquina ou navegador
	E que esteja na página de login do Blink sem estar logado
	Quando preencho os campos com dados válidos do mesmo usuário que já está logado em outra máquina ou navegador
	E clico no botão "Entrar"
	Então o usuário deve permanecer na mesma página
	E a mensagem "Usuário em uso" deve ser exibida
	E o acesso do usuário que estava logado anteriormente deve ser revogado

Cenário: CT-11-Login - Confirmar login com usuário já logado
	Dado que eu tenha executado os passos do caso de teste CT-10-Login
	Então quando eu clico Entrar
	E o usuário deve ser redirecionado para a página Visão Geral do Blink
	E deve ser exibida mensagem de saudação "Olá, <nome do usuário>" no canto superior direito

Cenário: CT-12-Login - Validar página de lembrete de senha
	Dado que estou na página de login do Blink sem estar logado
	Quando seleciono a opção "Esqueci minha senha"
	Então o sistema exibe um novo modal com título "Recuperar senha"
	E campo E-mail
	E opção Enviar
	E opção Voltar

Cenário: CT-13-Login - Enviar senha sem preencher campo e-mail
	Dado que estou na página de recuperação de senha
	E o campo E-mail está em branco
	Quando clico em Enviar
	Então uma mensagem de e-mail inválido deve ser exibida

Cenário: CT-14-Login - Enviar senha com e-mail inválido
	Dado que estou na página de recuperação de senha
	Quando preencho o campo E-mail com dados inválidos
	E clico em Enviar
	Então a mensagem "E-mail inválido" deve ser exibida

Cenário: CT-15-Login - Enviar senha com e-mail não cadastrado
	Dado que estou na página de recuperação de senha
	Quando preencho o campo E-mail com um e-mail não cadastrado
	E clico em Enviar
	Então a mensagem "E-mail inválido" deve ser exibida

Cenário: CT-16-Login - Voltar para a tela de login
	Dado que estou na página de recuperação de senha
	Quando preencho o campo E-mail com dados válidos
	E seleciono a opção Voltar
	Então o usuário deve ser redirecionado para a tela inicial de login

Cenário: CT-17-Login - Enviar senha com e-mail válido
	Dado que estou na página de recuperação de senha
	Quando preencho o campo E-mail com dados válidos
	E clico em Enviar
	Então a mensagem "Nova senha enviada por e-mail" deve ser exibida
	E o usuário deve ser redirecionado para a tela inicial de login
	E um e-mail com dados para substituição de senha deve ser encaminhado para o e-mail escolhido
*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar o catálogo de produtos

Library     SeleniumLibrary

Resource    ../resources/actions.robot

#Executa a cada início de um caso de teste
#Test Setup  Open Browser ${url} chrome 

#Executa a cada termino de um caso de teste
Test Teardown   Close Browser

# Lego (peças e vc usa a criativade para montar o que vc quiser)

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "arthur@ninjapixel.com" e "123456"
    Então devo ser autenticado

Senha incorreta
    [Template]      Tentativa de login
    arthur@ninjapixel.com       senhaerrada     Usuário e/ou senha inválidos

Email que não existe
    [Template]      Tentativa de login
    emailerrado@ninjapixel.com       123456     Usuário e/ou senha inválidos

Email nao informado
    [Template]      Tentativa de login
    ${EMPTY}       senhaerrada     Opps. Informe o seu email!

Senha nao informada
    [Template]      Tentativa de login
    arthur@ninjapixel.com       ${EMPTY}     Opps. Informe a sua senha!

*** Keywords ***
#Testes com Input/Output iguais
Tentativa de login
    [Arguments]     ${email}    ${password}     ${output}

    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "${email}" e "${password}"
    Então devo ver uma mensagem de alerta "${output}"
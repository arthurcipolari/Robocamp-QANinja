*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar o catálogo de produtos

Library     SeleniumLibrary

# Lego (peças e vc usa a criativade para montar o que vc quiser)

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "arthur@ninjapixel.com" e "123456"
    Então devo ser autenticado

Senha incorreta
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "arthur@ninjapixel.com" e "senhaerrada"
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Email que não existe
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "emailerrado@ninjapixel.com" e "123456"
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Email nao informado
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "" e "123456"
    Então devo ver uma mensagem de alerta "Opps. Informe o seu email!"

Senha nao informada
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "arthur@ninjapixel.com" e ""
    Então devo ver uma mensagem de alerta "Opps. Informe a sua senha!"



*** Keywords ***
Dado que eu acesso a página de login
    Open Browser    http://pixel-web:3000/login     chrome

Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn

Então devo ser autenticado
    Wait Until Page Contains    Arthur Cipolari
    Close Browser

Então devo ver uma mensagem de alerta "${mensagem}"
    Wait Until Page Contains    ${mensagem}
    Close Browser

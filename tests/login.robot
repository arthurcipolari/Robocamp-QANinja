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
    Quando eu submeto minhas credenciais com senha incorreta
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Email que não existe
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais com email nao cadastrado
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Email nao informado
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais sem o email
    Então devo ver uma mensagem de alerta "Opps. Informe o seu email!"

Senha nao informada
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais sem a senha
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

Quando eu submeto minhas credenciais com senha incorreta
    Input Text      id:emailId      arthur@ninjapixel.com
    Input Text      id:passId       senhaerrada
    Click Element   class:btn

Quando eu submeto minhas credenciais com email nao cadastrado
    Input Text      id:emailId      emailerrado@ninjapixel.com
    Input Text      id:passId       senhaqualquer
    Click Element   class:btn

Quando eu submeto minhas credenciais sem o email
    Input Text      id:passId       senha
    Click Element   class:btn

Quando eu submeto minhas credenciais sem a senha
    Input Text      id:emailId      arthur@ninjapixel.com
    Click Element   class:btn

Então devo ver uma mensagem de alerta "${mensagem}"
    Wait Until Page Contains    ${mensagem}
    Close Browser

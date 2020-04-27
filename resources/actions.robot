*** Settings ***
Documentation   Actions é o arquivo que terá as Keywords que implementam os steps

Library     SeleniumLibrary

Resource    pages/LoginPage.robot
Resource    pages/BasePage.robot
Resource    pages/CadastroPage.robot

*** Keywords ***
Dado que eu acesso a página de login
    BasePage.Open

Quando eu submeto minhas credenciais "${email}" e "${pass}"
    LoginPage.Login With        ${email}        ${pass}

Então devo ser autenticado
    Wait Until Page Contains    Arthur Cipolari


Então devo ver uma mensagem de alerta "${expect_message}"
    Wait Until Element Contains     class:alert    ${expect_message}

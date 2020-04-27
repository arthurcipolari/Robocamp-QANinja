*** Settings ***
Documentation       Cadastro de produtos
...         Sendo um Adm de catálogo
...         Quero cadastrar produtos
...         Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Library     OperatingSystem

Test Setup      BasePage.Open
Test Teardown   BasePage.Close

*** Test Cases ***
Disponibilizar produto
    Dado que estou logado
    Quando eu faço o cadastro desse produto     
    Devo ver este item no catálogo

*** Keywords ***
Dado que estou logado
    Login With      arthur@ninjapixel.com       123456

Quando eu faço o cadastro desse produto
    Cadastra Json       dk.json

Devo ver este item no catálogo
    Wait Until Page Contains Element         xpath://div[contains(@class,'table-products')]//td[text()='${product_json['name']}']
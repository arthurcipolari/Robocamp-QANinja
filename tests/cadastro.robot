*** Settings ***
Documentation       Cadastro de produtos
...         Sendo um Adm de catálogo
...         Quero cadastrar produtos
...         Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Library     OperatingSystem

Test Setup      BasePage.Open
Test Teardown   BasePage.Close

#produto: nome*, descrição, preço*, categoria*, imagem, produtores

*** Variables ***


*** Test Cases ***
Disponibilizar produto
    Dado que estou logado
    Quando eu faço o cadastro desse produto     dk.json
    Devo ver este item no catálogo      dk.json

*** Keywords ***
Dado que estou logado
    Login With      arthur@ninjapixel.com       123456


Quando eu faço o cadastro desse produto
    [Arguments]     ${json_file}

    ${product_file}=     Get File        fixtures/${json_file}
    ${product_json}=     Evaluate        json.loads($product_file)       json

    Click Element       class:product-add
    Input Text                          css:input[name=title]               ${product_json['name']}
    
    Click Element                       css:input[placeholder="Gategoria"]
    #Coloquei um sleep pois ele realiza a ação muito rápido
    #e seleciona a categoria errada ????
    Sleep       1
    Click Element                       xpath://li/span[text()='${product_json['cat']}']
    
    Input Text                          css:input[placeholder="Preço"]      ${product_json['price']}
    Input Text                          css:textarea[name=description]         ${product_json['desc']}
    Click Element                       id:create-product

Devo ver este item no catálogo
    [Arguments]     ${json_file}

    ${product_file}=     Get File        fixtures/${json_file}
    ${product_json}=     Evaluate        json.loads($product_file)       json

    Wait Until Page Contains          ${product_json['name']}
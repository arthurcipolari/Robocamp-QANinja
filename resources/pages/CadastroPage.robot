*** Settings ***
Documentation       Este arquivo cadastra um novo produto


*** Keywords ***
Cadastra Json
    [Arguments]     ${json_file}

    ${product_file}=     Get File        tests/fixtures/${json_file}
    ${product_json}=     Evaluate        json.loads($product_file)       json

    Click Element                       class:product-add
    Input Text                          css:input[name=title]               ${product_json['name']}
    Click Element                       css:input[placeholder="Gategoria"]
    #Coloquei um sleep pois ele realiza a ação muito rápido
    #e seleciona a categoria errada ????
    Sleep       1
    Click Element                       xpath://li/span[text()='${product_json['cat']}']                          
    Input Text                          css:input[placeholder="Preço"]      ${product_json['price']}
    Input Text                          css:textarea[name=description]         ${product_json['desc']}
    Click Element                       id:create-product
    Set Test Variable                   ${product_json}

    
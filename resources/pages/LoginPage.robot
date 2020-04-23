*** Settings ***
Documentation       Este arquivo implementa funções da página Login


*** Keywords ***
Login With
    [Arguments]     ${email}        ${pass}

    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn
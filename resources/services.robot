*** Settings ***
Documentation        Camada de serviços

Library                RequestsLibrary


*** Variables ***
${BASE_URL}         http://localhost:3333
${PATH_POST}        /partners

&{HEADER}           Content-Type=application/json    # passado como SUPER VARIÁVEL com o simbolo '&', onde o FW já interpreta como DICIONÁRIO
    ...             auth_user=qa
    ...             auth_password=ninja

*** Keywords ***
Post Partner 
    [Arguments]        ${payload}

    ${RESPONSE}           POST On Session
    ...                   BaseURI
    ...                   ${PATH_POST}
    ...                   json=${PAYLOAD}
    ...                   headers=${HEADER}  
    ...                   expected_status=any
    
    [Return]              ${RESPONSE}

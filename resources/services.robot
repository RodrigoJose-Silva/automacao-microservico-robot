*** Settings ***
Documentation        Camada de serviços

Library                RequestsLibrary


*** Variables ***
${BASE_URL}         http://localhost:3333
${PATH_BASE}        /partners

&{HEADER}           Content-Type=application/json    # passado como SUPER VARIÁVEL com o simbolo '&', onde o FW já interpreta como DICIONÁRIO
    ...             auth_user=qa
    ...             auth_password=ninja

*** Keywords ***
Conect
    [Arguments]           ${API}
    Create Session        BaseURI        ${BASE_URL}        verify=false        disable_warnings=true
Post Partner 
    [Arguments]        ${payload}

    ${response}           POST On Session
    ...                   BaseURI
    ...                   ${PATH_BASE}
    ...                   json=${PAYLOAD}
    ...                   headers=${HEADER}  
    ...                   expected_status=any
    [Return]              ${response}

GET Partners 
    ${response}           Get On Session
    ...                   BaseURI
    ...                   ${PATH_BASE}
    ...                   headers=${HEADER}  
    ...                   expected_status=any
    [Return]              ${response}

Search Partners 
    [Arguments]           ${name}

    ${query}              Create Dictionary        name=${name}

    ${response}           Get On Session
    ...                   BaseURI
    ...                   ${PATH_BASE}
    ...                   params=${query}
    ...                   headers=${HEADER}  
    ...                   expected_status=any
    [Return]              ${response}

Put Enable Partner 
    [Arguments]        ${partner_id}

    ${response}           PUT On Session
    ...                   BaseURI
    ...                   ${PATH_BASE}/${partner_id}/enable
    ...                   headers=${HEADER}  
    ...                   expected_status=any
    [Return]              ${response}

Put Disable Partner 
    [Arguments]        ${partner_id}

    ${response}           PUT On Session
    ...                   BaseURI
    ...                   ${PATH_BASE}/${partner_id}/disable
    ...                   headers=${HEADER}  
    ...                   expected_status=any
    [Return]              ${response}
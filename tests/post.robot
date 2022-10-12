*** Settings ***
Documentation          POST /partners

Resource            ../resources/base.robot  # aponta a variável "${EXECDIR}" da aplicação e seu path de recursos

Suite Setup         Conectar API

*** Test Cases ***

Shoud create a new partner
    ${PAYLOAD_PARTNER}        Factory New Partner
    Remove Partner By Name        ${PAYLOAD_PARTNER}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
   
    ### AÇÃO
    ${response}        Post Partner        ${PAYLOAD_PARTNER}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'
    
    ### VERIFICAÇÕES
    Status Should Be        201      

    ${results}        Filter Partner By Name        ${PAYLOAD_PARTNER}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
    Should Be Equal        ${response.json()}[partner_id]      ${results}[_id]   # valida o (PK) 'id' da request é o mesmo no BD

Should return duplicate company name
    [Tags]        bug
    ${PAYLOAD_PARTNER}            Factory Dup Name
    Post Partner        ${PAYLOAD_PARTNER}
    
    ### AÇÃO
    ${response}        Post Partner        ${PAYLOAD_PARTNER}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'
    
    ### VERIFICAÇÕES
    Status Should Be        409
    Should Be Equal        ${response.reason}                  Conflict
    Should Be Equal        ${response.json()}[message]         Duplicate company name

*** Keywords ***
Conectar API
    Conect        API

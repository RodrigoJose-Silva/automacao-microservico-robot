*** Settings ***
Documentation          POST /partners

Resource            ../resources/base.robot  # aponta a variável "${EXECDIR}" da aplicação e seu path de recursos

Suite Setup         Conectar API

*** Test Cases ***

Shoud create a new partner
    ${partner}        Factory New Partner
    Remove Partner By Name        ${partner}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
   
    ### AÇÃO
    ${response}        Post Partner        ${partner}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'
    
    ### VERIFICAÇÕES
    Status Should Be        201      

    ${results}        Filter Partner By Name        ${partner}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
    Should Be Equal        ${response.json()}[partner_id]      ${results}[_id]   # valida o (PK) 'id' da request é o mesmo no BD

Should return duplicate company name
    [Tags]        bug
    ${partner}            Factory Dup Name
    
    Create a new partner        ${partner}
    
    ### AÇÃO
    ${response}        Post Partner        ${partner}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'
    
    ### VERIFICAÇÕES
    Status Should Be       409
    Should Be Equal        ${response.reason}                  Conflict
    Should Be Equal        ${response.json()}[message]         Duplicate company name

*** Keywords ***
Conectar API
    Conect        API

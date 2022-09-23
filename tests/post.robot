*** Settings ***
Documentation          POST /partners

Resource            ${EXECDIR}/resources/base.robot  # aponta a variável "${EXECDIR}" da aplicação e seu path de recursos

*** Test Cases ***

Shoud create a new partner
    Conect        API

    ${PAYLOAD_PARTNER}        Factory New Partner
    Remove Partner By Name        ${PAYLOAD_PARTNER}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
   
    ### AÇÃO
    ${RESPONSE}        Post Partner        ${PAYLOAD_PARTNER}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'
    
    ### VERIFICAÇÕES
    Status Should Be        201      

    ${RESULTS}        Filter Partner By Name        ${PAYLOAD_PARTNER}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
    # valida o (PK) 'id' da request é o mesmo no BD
    Should Be Equal        ${RESPONSE.json()}[partner_id]      ${RESULTS}[_id]  

Should return duplicate company name
    [Tags]        bug
    Conect        API
    
    ${PAYLOAD_PARTNER}            Factory Dup Name
    Remove Partner By Name        ${PAYLOAD_PARTNER}[name]   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
    Post Partner        ${PAYLOAD_PARTNER}
    
    ### AÇÃO
    ${RESPONSE}        Post Partner        ${PAYLOAD_PARTNER}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'
    
    ### VERIFICAÇÕES
    Status Should Be        409
    Should Be Equal        ${RESPONSE.reason}                  Conflict
    Should Be Equal        ${RESPONSE.json()}[message]         Duplicate company name
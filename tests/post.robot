*** Settings ***
Documentation          POST /partners

Resource            ${EXECDIR}/resources/base.robot  # aponta a variável da aplicação e seu path

*** Test Cases ***

Shoud create a new partner
    Create Session        BaseURI        ${BASE_URL}        verify=false        disable_warnings=true

    ${PAYLOAD}        Create Dictionary
    ...               name=Pizzas Papito
    ...               email=contato01@papito.com.br
    ...               whatsapp=11999999999
    ...               business=Restaurante
    Remove Partner By Name        Pizzas Papito   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'

   
    ### AÇÃO
    ${RESPONSE}        Post Partner        ${PAYLOAD}  # conforme o encapsulamento, está ação encontra-se no file 'services.robot'

    
    ### VERIFICAÇÕES
    Status Should Be        201      
    
    ${RESULTS}        Filter Partner By Name        Pizzas Papito   # conforme o encapsulamento, está ação encontra-se no file 'database.robot'
    # valida o (PK) 'id' da request é o mesmo no BD
    Should Be Equal        ${RESPONSE.json()}[partner_id]      ${RESULTS}[_id]  

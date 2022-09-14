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

    ${HEADER}            Create Dictionary
    ...                  Content-Type=application/json
    ...                  auth_user=qa
    ...                  auth_password=ninja

    ${FILTER}        Create Dictionary
    ...              name=Pizzas Papito

    # deleta o cadastro no MongoDB, a ponto de deixar a automação passando cada vez que executar o POST com o mesmo PAYLOAD
    DeleteOne            ${MONGO_URI}        ${FILTER}     

    ${REPONSE}            POST On Session
    ...                   BaseURI
    ...                   ${PATH_POST}
    ...                   json=${PAYLOAD}
    ...                   headers=${HEADER}  
    ...                   expected_status=any

    Status Should Be        201      
    
    # consulta no BD o valor da variável FILTER
    ${RESULTS}     Find    ${MONGO_URI}    ${FILTER}

    # valida o (PK) 'id' da request é o mesmo no BD
    Should Be Equal        ${REPONSE.json()}[partner_id]      ${RESULTS}[0][_id]  

*** Settings ***
Documentation          POST /partners

Library                RequestsLibrary
Library                RobotMongoDBLibrary.Delete

*** Variables ***
${BASE_URL}         http://localhost:3333
${PATH_POST}        /partners

&{MONGO_URI}        connection=mongodb+srv://bugereats:0RqnozfFfxZ5TQXg@cluster0.zvgplqx.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                 database=PartnerDB
...                 collection=partner


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

    DeleteOne            ${MONGO_URI}        ${FILTER}     

    ${REPONSE}            POST On Session
    ...                   BaseURI
    ...                   ${PATH_POST}
    ...                   json=${PAYLOAD}
    ...                   headers=${HEADER}  
    ...                   expected_status=any

    Status Should Be        201      
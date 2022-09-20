*** Settings ***
Documentation        Database helpers connection

Library                RobotMongoDBLibrary.Delete          #import MongoDB
Library                RobotMongoDBLibrary.Find            #import MongoDB

*** Variables ***
# conexão com MongoDB de acordo paramentros da aplicação
&{MONGO_URI}        connection=mongodb+srv://bugereats:0RqnozfFfxZ5TQXg@cluster0.zvgplqx.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                 database=PartnerDB
...                 collection=partner

*** Keywords ***
Remove Partner By Name
    [Arguments]        ${PARTNER_NAME}

    ${FILTER}        Create Dictionary
    ...              name=${PARTNER_NAME}
    
    # deleta o cadastro no MongoDB, a ponto de deixar a automação passando cada vez que executar o POST com o mesmo PAYLOAD
    DeleteOne            ${MONGO_URI}        ${FILTER}    

Filter Partner By Name
    [Arguments]        ${PARTNER_NAME}

    ${FILTER}        Create Dictionary
    ...              name=${PARTNER_NAME} 
    
    # consulta no BD o valor da variável FILTER
    ${RESULTS}      Find            ${MONGO_URI}    ${FILTER}
    [Return]        ${RESULTS}[0]   # retornando uma posição especifíca da lista
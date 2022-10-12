*** Settings ***
Documentation          Put /partners

Resource            ../resources/base.robot  # aponta a variável da aplicação e seu path de recursos

Suite Setup         Conect API

*** Test Cases ***
Should enable a partner
    ${partner}          Factory Enable Partner

    Remove Partner By Name                  ${partner}[name]
    ${response}         Post Partner        ${partner}
    ${partner_id}       Set Variable        ${response.json()}[partner_id]

    ${response}             Put Enable Partner        ${partner_id}
    Status Should Be        200

Should return 404 on enable a partner
    ${partner}          Factory 404 Partner

    ${response}         Post Partner        ${partner}
    ${partner_id}       Set Variable        ${response.json()}[partner_id]
    Remove Partner By Name                  ${partner}[name]
    
    ${response}             Put Enable Partner        ${partner_id}
    Status Should Be        404

*** Keywords ***
## Gancho para os testes acima
Conect API
    # usanso o POST como pré-condição, para garantir que haja uma massa para validação do GET
    Conect        API
*** Settings ***
Documentation          Put /partners

Resource            ../resources/base.robot  # aponta a variável da aplicação e seu path de recursos

Suite Setup         Conect API

*** Test Cases ***
Should enable a partner
    ${partner}          Factory Enable Partner

    ${partner_id}       Create a new partner        ${partner}

    ${response}             Put Enable Partner        ${partner_id}
    Status Should Be        200

Should disable a partner
    ${partner}          Factory Disable Partner

    ${partner_id}             Create a new partner        ${partner}
    Put Enable Partner        ${partner_id}

    ${response}             Put Disable Partner        ${partner_id}
    Status Should Be        200

Should return 404 on enable a partner
    ${partner}          Factory 404 Partner

    ${partner_id}       Create a new partner        ${partner}
    
    Remove Partner By Name                  ${partner}[name]
    
    ${response}             Put Enable Partner        ${partner_id}
    Status Should Be        404

Should return 404 on disable a partner
    ${partner}          Factory 404 Partner

    ${partner_id}       Create a new partner        ${partner}
    
    Remove Partner By Name                  ${partner}[name]
    
    ${response}             Put Disable Partner        ${partner_id}
    Status Should Be        404

*** Keywords ***
## Gancho para os testes acima
Conect API
    # usanso o POST como pré-condição, para garantir que haja uma massa para validação do GET
    Conect        API
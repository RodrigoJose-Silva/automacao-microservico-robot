*** Settings ***
Documentation          Put /partners

Resource            ../resources/base.robot  # aponta a variável da aplicação e seu path de recursos

Suite Setup         Conect API

*** Test Cases ***
Should delete a partner
    ${partner}           Factory Remove Partner
    ${partner_id}        Create a new partner        ${partner}

    Delete Partner        ${partner_id}
    Status Should Be        204

Should retunr 404 on remover partner
    ${partner}           Factory 404 Partner
    ${partner_id}        Create a new partner        ${partner}
    Remove Partner By Name        ${partner}[name]

    Delete Partner        ${partner_id}
    Status Should Be        404

*** Keywords ***
## Gancho para os testes acima
Conect API
    # usanso o POST como pré-condição, para garantir que haja uma massa para validação do GET
    Conect        API
*** Settings ***
Documentation          GET /partners

Resource            ../resources/base.robot  # aponta a variável "${EXECDIR}" da aplicação e seu path de recursos

Suite Setup         Conect API and create partner list

*** Test Cases ***
Should return a partner list
    # AÇÃO
    ${response}        GET Partners

    # VALIDAÇÕES
    Status Should Be        200
    # pegando o tamando da lista retornada da request
    ${size}        Get Length        ${response.json()}
    # verificando que a lista não retornou vazia e/ou com valor maior do que validado
    Should Be True        ${size} > 0

Should search partner by name
    ${response}        Search Partners        KiGostoso
    Status Should Be        200

*** Keywords ***
## Gancho para os testes acima
Conect API and create partner list
    # usanso o POST como pré-condição, para garantir que haja uma massa para validação do GET
    Conect        API

    ${PAYLOAD_PARTNER}        Factory Partner List
    FOR  ${P}  IN  @{PAYLOAD_PARTNER}
        Post Partner        ${P}
    END
    
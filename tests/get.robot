*** Settings ***
Documentation          GET /partners

Resource            ${EXECDIR}/resources/base.robot  # aponta a variável "${EXECDIR}" da aplicação e seu path de recursos

*** Test Cases ***
Should return a partner list
    Conect        API
    
    # usanso o POST como pré-condição, para garantir que haja uma massa para validação do GET
    ${PAYLOAD_PARTNER}        Factory Partner List
    FOR  ${P}  IN  @{PAYLOAD_PARTNER}
        Post Partner        ${P}
    END
        
    # AÇÃO
    ${RESPOSNE}        GET Partners

    # VALIDAÇÕES
    Status Should Be        200

    # pegando o tamando da lista retornada da request
    ${SIZE}        Get Length        ${RESPOSNE.json()}
    # verificando que a lista não retornou vazia e/ou com valor maior do que validado
    Should Be True        ${SIZE} > 0
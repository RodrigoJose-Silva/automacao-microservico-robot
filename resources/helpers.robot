*** Settings ***
Documentation            Helper

*** Keywords ***
Create a new partner
    [Arguments]        ${partner}

    Remove Partner By Name                  ${partner}[name]
    
    ${response}         Post Partner        ${partner}
    ${partner_id}       Set Variable        ${response.json()}[partner_id]

    [return]              ${partner_id}
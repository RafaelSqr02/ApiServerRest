*** Settings ***

Documentation    Gerar os dados da Requisição Post
Resource    ../resources/base.robot

*** Keywords ***
Generate POST and DELETE User
    #------- POST -------
    Create Session    alias=server_rest    url=https://serverest.dev    verify=true

    ${HEADER}    Create Dictionary     Content-Type=application/json   
    ${EMAIL}    FakerLibrary.Email
    ${RESPONSE}    POST On Session   alias=server_rest    url=/usuarios    expected_status=201    headers=${header}    data={"nome": "Fulano da Silva","email": "${EMAIL}","password": "teste","administrador": "true"}
    
    Log To Console    ${Response.json()}
    ${ID}    Set Variable    ${Response.json()["_id"]}
    
    #------- DELETE -------
    Create Session    alias=server_rest    url=https://serverest.dev    verify=true
    
    ${RESPONSE}    DELETE On Session   alias=server_rest    url=/usuarios/${ID}    expected_status=200  

    Log To Console    ${Response.json()}


Generate POST Email 400
     #------- POST -------
    Create Session    alias=server_rest    url=https://serverest.dev    verify=true

    ${HEADER}    Create Dictionary     Content-Type=application/json   
    ${EMAIL}    FakerLibrary.Email
    ${RESPONSE}    POST On Session   alias=server_rest    url=/usuarios    expected_status=400    headers=${header}    data={"nome": "Fulano da Silva","email": "ghernandez@example.net","password": "teste","administrador": "true"}
    
    Log To Console    ${Response.json()}
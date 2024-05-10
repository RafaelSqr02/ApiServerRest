*** Settings ***

Documentation    Teste de Criação e exclusão de um novo user

Resource    ../resources/base.robot


*** Test Cases ***
01 - Dado que realizamos um cadastro de um novo User e posteriormente a exclusão do mesmo
    [Documentation]
    ...    Descrição: Realizar um cadastro e uma exclusão do mesmo na API ServeRest
    ...    Criação: 08/05/2024
    [Tags]    positive    1
    
    Log    Realizo o cadastro e a exclusão de um email
    Generate POST and DELETE User
    
02 - Dado que realizamos um POST com um Email já cadastrado
    [Documentation]
    ...    Descrição: Realizar um cadastro de um Email já existente
    ...    Criação: 08/05/2024
    [Tags]    negative    2
    
    Log    Tento cadastrar email já existente
    Generate POST Email 400
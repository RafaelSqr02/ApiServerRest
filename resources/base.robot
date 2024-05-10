*** Settings ***
Documentation    Arquivo de implementação e estrutura do Projeto

Library    RequestsLibrary
Library    FakerLibrary
Library    SeleniumLibrary
Library    JSONLibrary
Library    collections
Library    OperatingSystem

Resource    ../tests/serve-rest-API.robot
Resource    ../actions/actions-Post-ServerRest.robot



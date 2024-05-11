*** Settings ***
Resource  ../resources/data/01-loginT11.robot
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***
${url}   https://chips.qacoders-academy.com.br

*** Keywords ***
Criar uma sessão
   ${headers}        Create Dictionary        accept=application/json        Content-Type=application/json
   Create Session    alias=Chips              url=${url}                 headers=${headers}

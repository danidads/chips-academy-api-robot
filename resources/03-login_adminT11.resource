*** Settings ***
Resource  ../resources/data/01-loginT11.robot
Resource  ../resources/02-geralT11.resource
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Entrar usuario sysadmin
  ${body}   Create Dictionary        mail=${mail}        password=${password}
  Log    ${body}
  Criar uma sessão
  ${resposta}        POST On Session        alias=Chips        url=/api/login/      json=${body}
  Log    ${resposta.json()}
  Set Test Variable    ${TOKEN}      ${resposta.json()["token"]}

Validar token e gravar - header de autorização
  ${headers}        Create Dictionary        Authorization=${TOKEN}
  ${resposta}       GET On Session           alias=Chips        url=/api/validateToken    headers=${headers}
  Log    Resposta da solicitação:${resposta.content}
  Log    ${TOKEN}
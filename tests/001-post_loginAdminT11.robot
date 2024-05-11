*** Settings ***

Resource    ../resources/02-geralT11.resource
Resource    ../resources/03-login_adminT11.resource

*** Test Cases ***
T11 - Login usuario
  Criar uma sessão
  Entrar usuario sysadmin
  Validar token e gravar - header de autorização
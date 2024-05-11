*** Settings ***
Resource  ../resources/02-geralT11.resource
Resource  ../resources/03-login_adminT11.resource
Resource    ../resources/07-listar_departamentoT11.resource

*** Test Cases ***
T11 - Listar o departamento
  Criar uma sessão
  Entrar usuario sysadmin
  #Listar os departamentos - todos
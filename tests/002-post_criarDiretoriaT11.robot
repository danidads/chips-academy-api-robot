*** Settings ***

Resource  ../resources/02-geralT11.resource
Resource  ../resources/03-login_adminT11.resource
Resource  ../resources/04-criar_diretoriaT11.resource



*** Test Cases ***
T11 - Criar Diretoria
  Criar uma sessão
  Entrar usuario sysadmin
  Criar nova diretoria
  Cadastrar nova diretoria
  Conferir se nova diretoria foi cadastrada corretamente
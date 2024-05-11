*** Settings ***
Resource    ../resources/02-geralT11.resource
Resource    ../resources/03-login_adminT11.resource
Resource    ../resources/04-criar_diretoriaT11.resource
Resource    ../resources/05-criar_centrodecustosT11.resource
Resource    ../resources/06-criar_departamentoT11.resource

*** Test Cases ***
T11 - Criar um departamento
  Criar uma sessão
  Entrar usuario sysadmin
  Criar nova diretoria
  Cadastrar nova diretoria
  Conferir se nova diretoria foi cadastrada corretamente
  Criar novo centro de custos
  Cadastrar novo centro de custos criado
  Conferir se novo centro de custos foi cadastrado corretamente 
  Criar novo departamento
  Cadastrar novo departamento criado
  Conferir se novo departamento foi cadastrado corretamente

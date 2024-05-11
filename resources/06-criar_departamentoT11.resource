*** Settings ***
Resource  ../resources/02-geralT11.resource
Resource  ../resources/03-login_adminT11.resource
Resource  ../resources/04-criar_diretoriaT11.resource
Resource  ../resources/05-criar_centrodecustosT11.resource
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***

*** Keywords ***
Criar novo departamento
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${DEPARTMENT_NAME}        ${palavra_randomica}
    Log                     ${DEPARTMENT_NAME}

Cadastrar novo departamento criado
    ${body}        Create Dictionary       departmentName=${DEPARTMENT_NAME}        costCenterId=${ID_COSTCENTER}
    Log            ${body}
    Criar uma sessão
    Entrar usuario sysadmin
    ${headers}     Create Dictionary        Authorization=${TOKEN}
    ${resposta}    POST On Session          alias=Chips        url=/api/department/        json=${body}        headers=${headers}    expected_status=201
    Log                  ${resposta.json()}
    Set Test Variable    ${ID_DEPARTMENT}        ${resposta.json()["newDepartment"]["_id"]}
    Set Test Variable    ${RESPOSTA}             ${resposta.json()}

 Conferir se novo departamento foi cadastrado corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}                     msg    Cadastro realizado com sucesso.
    Dictionary Should Contain Key     ${RESPOSTA["newDepartment"]}    _id
    Status Should Be    expected_status=201
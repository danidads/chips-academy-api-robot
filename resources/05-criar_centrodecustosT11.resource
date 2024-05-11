*** Settings ***
Resource  ../resources/data/01-loginT11.robot
Resource  ../resources/02-geralT11.resource
Resource  ../resources/03-login_adminT11.resource
Resource  ../resources/04-criar_diretoriaT11.resource
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***

*** Keywords ***
Criar novo centro de custos
    ${palavra_randomica}    Generate Random String    length=10    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${COSTCENTER_NAME}        ${palavra_randomica}
    Log                     ${COSTCENTER_NAME}

Cadastrar novo centro de custos criado
    ${body}        Create Dictionary        costCenterName=${COSTCENTER_NAME}    boardId=${ID_BOARD}
    Log            ${body}
    Criar uma sessão
    Entrar usuario sysadmin
    ${headers}     Create Dictionary        Authorization=${TOKEN}
    ${resposta}    POST On Session          alias=Chips        url=/api/costCenter/        json=${body}        headers=${headers}    expected_status=201
    Log            ${resposta.json()}
    Set Test Variable    ${ID_COSTCENTER}        ${resposta.json()["newCostCenter"]["_id"]}
    Set Test Variable    ${RESPOSTA}             ${resposta.json()}
    Log    ${ID_COSTCENTER}

Conferir se novo centro de custos foi cadastrado corretamente 
    Log  ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}                     msg    Cadastro realizado com sucesso.
    Dictionary Should Contain Key     ${RESPOSTA["newCostCenter"]}    board
    Status Should Be    201
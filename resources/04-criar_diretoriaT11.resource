*** Settings ***
Resource  ../resources/data/01-loginT11.robot
Resource  ../resources/02-geralT11.resource
Resource  ../resources/03-login_adminT11.resource
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***

*** Keywords ***
Criar nova diretoria
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${BOARD_NAME}             ${palavra_randomica}
    Log                     ${BOARD_NAME}

Cadastrar nova diretoria
    ${body}        Create Dictionary       boardName=${BOARD_NAME}
    Log            ${body}
    Criar uma sessão
    Entrar usuario sysadmin
    ${headers}     Create Dictionary        Authorization=${TOKEN}
    ${resposta}    POST On Session          alias=Chips        url=/api/board/        json=${body}        headers=${headers}    expected_status=201
    Log            ${resposta.json()}
    Set Test Variable    ${ID_BOARD}        ${resposta.json()["newBoard"]["_id"]}
    Set Test Variable    ${RESPOSTA}        ${resposta.json()}

Conferir se nova diretoria foi cadastrada corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}                msg    Cadastro realizado com sucesso!
    Dictionary Should Contain Key     ${RESPOSTA["newBoard"]}    _id
    Status Should Be    expected_status=201
*** Settings ***
Resource  ../resources/02-geralT11.resource
Resource  ../resources/03-login_adminT11.resource
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***

*** Keywords ***
Listar os departamentos - todos
    ${headers}     Create Dictionary   Authorization=${TOKEN}
    ${resposta}    GET On Session      alias=Chips     url=/api/department/    headers=${headers}    expected_status=200
    Log            ${resposta}

    ${json}=    Set Variable    ${resposta.json()}    
    ${department_name}=    Set To Dictionary    ${json}[0]
    Log    ${department_name}
    
    Should Not Be Empty       ${department_name["departmentName"]}
    Should Be True            ${department_name["status"]}
    Should Not Be Empty       ${department_name["costCenter"]["costCenterName"]}
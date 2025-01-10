*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that api status is active
    ${headers}=    BuiltIn.Create Dictionary             &{default_headers}
    check_api.Check Api Status            
    ...    ${api['url']['dev']}        
    ...    ${api['status']}      
    ...    ${headers}
    ...    ${status_api['active']['status']}
    ...    ${status_api['active']['expected_status_code']} 



*** comments ***

Verify that api status is active
    ${headers}=    api_commons.Create headers
    ${response}=    api_commons.Send Get Request With Header       ${API['url']['dev']}        ${API['status']}     ${headers}     ${status_api['active']['expected_status_code']}
    ${expected_response}     BuiltIn.Create Dictionary        status=${status_api['active']['status']}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}

Verify that api status is active
    ${headers}=    api_commons.Create headers
    ${response}=    api_commons.Send get request not header        ${API['url']['dev']}        ${API['status']}          ${status_api['active']['expected_status_code']}
    ${expected_response}     BuiltIn.Create Dictionary        status=${status_api['active']['status']}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}
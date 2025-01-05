*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that api status is active
    ${headers}=    api_common.Create headers             &{default_headers}
    check_api.Check api status            
    ...    ${API['url']['dev']}        
    ...    ${API['status']}      
    ...    ${headers}
    ...    ${status_api['active']['status']}
    ...    ${status_api['active']['expected_status_code']} 



*** comments ***

Verify that api status is active
    ${headers}=    api_common.Create headers
    ${response}=    api_common.Send get request with header       ${API['url']['dev']}        ${API['status']}     ${headers}     ${status_api['active']['expected_status_code']}
    ${expected_response}     BuiltIn.Create Dictionary        status=${status_api['active']['status']}
    api_common.Verify response with dict      ${response.json()}    &{expected_response}

Verify that api status is active
    ${headers}=    api_common.Create headers
    ${response}=    api_common.Send get request not header        ${API['url']['dev']}        ${API['status']}          ${status_api['active']['expected_status_code']}
    ${expected_response}     BuiltIn.Create Dictionary        status=${status_api['active']['status']}
    api_common.Verify response with dict      ${response.json()}    &{expected_response}
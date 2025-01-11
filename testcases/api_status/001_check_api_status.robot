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
*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/heal_check_api_keywords.robot

*** Test Cases ***
Verify that api status is active
       [Tags]    high 
       Given Create Headers        &{default_headers}
       When Check Api Status
    ...    ${api['url']['dev']}        
    ...    ${api['status']}
    ...    ${headers}       
       Then Verify Api Is Available        ${response}    ${status_api['active']['status']}
            
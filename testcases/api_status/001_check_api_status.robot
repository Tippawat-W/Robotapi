*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/heal_check_api_keywords.robot

*** Test Cases ***
Verify that api status is active
       [Tags]    high 
       Given api check status has valid header
       When Send request to check status
       Then Verify Api Is Available        ${response}    ${status_api['active']['status']}
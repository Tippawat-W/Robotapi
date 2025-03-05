*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/heal_check_api_keywords.robot

*** Test Cases ***
Verify That Api Status Is Active
    [Tags]    high 
    Given Api Check Status Has Valid Header
    When Send Request To Check Status
    Then Verify Api Is Available
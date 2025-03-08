*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot

*** Test Cases ***
Verify That User Cannot Register Member When Email Is Invalid Format
    [Tags]    TC-002    High
    Given Api Register Member Has Valid Header
    When Send Request To Register Member    ${register_member.invalid_email}
    Then Verify Register Member Is A Failed    ${register_member.status.failed.response_invalid}

Verify That System Can Register Member Is A Success
    [Tags]    TC-003    High
    [Setup]    Setup Email For Register Member    ${register_member.valid_email}
    Given Api Register Member Has Valid Header
    When Send Request To Register Member    ${prepare_email_for_register_is_already}
    Then Verify Register Member Is A Success

Verify That User Cannot Register Member When Email Is Exist On System
    [Tags]    TC-004    High
    [Setup]    Setup Email For Register Member    ${register_member.valid_email}
    Given Api Register Member Has Valid Header
    When Send Request To Register Member    ${prepare_email_for_register_is_already}
    And Verify Register Member Is A Success
    And Send Request To Register Member    ${prepare_email_for_register_is_already}
    Then Verify Register Member Is A Failed    ${register_member.status.failed.response_exist}
*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot

*** Test Cases ***
Verify That User Cannot Register Member When Email Is Invalid Format
    [Tags]    high
    Given Api Register Member Has Valid Header
    And Payload Register Member Has Email    email=${member.email.invalid}
    When Rest Api For Register Member
    Then Verify Register Failed    ${member.status.failed.response_invalid}

Verify That System Can Register Member Success
    [Tags]    high
    Given Api Register Member Has Valid Header
    And Add Current Date Time On Data    ${member.email.new}
    And Payload Register Member Has Email    email=${value_inclue_date_and_time}
    When Rest Api For Register Member
    Then Verify Register Success

Verify That User Cannot Register Member When Email Is Exist On System
    [Tags]    high
    Given Api Register Member Has Valid Header
    And Add Current Date Time On Data    ${member.email.new}
    And Payload Register Member Has Email    email=${value_inclue_date_and_time}
    When Rest Api For Register Member
    And Verify Register Success
    And Rest Api For Register Member
    Then Verify Register Failed    ${member.status.failed.response_exist}
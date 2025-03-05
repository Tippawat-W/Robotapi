*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot

*** Test Cases ***
Verify That User Cannot Register Member When Email Is Invalid Format
    [Tags]    high
    Given Create Headers    &{default_headers}
    And Create Body    email=${member.email.invalid}
    When Register Member
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.register}
    ...    ${req_body}
    ...    ${headers}
    ...    ${member.status.failed.code}
    Then Verify Register Failed    ${response}    ${member.status.failed.response_invalid}

Verify That System Can Register Member Success
    [Tags]    high
    Given Create Headers    &{default_headers}
    And Add Current Date Time On Data    ${member.email.new}
    And Create Body    email=${value_inclue_date_and_time}
    When Register Member
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.register}
    ...    ${req_body}
    ...    ${headers}
    ...    ${member.status.success.code}
    Then Verify Register Success    ${response}    ${member.status.success.response_key}

Verify That User Cannot Register Member When Email Is Exist On System
    [Tags]    high
    Given Create Headers    &{default_headers}
    And Add Current Date Time On Data    ${member.email.new}
    And Create Body    email=${value_inclue_date_and_time}
    When Register Member
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.register}
    ...    ${req_body}
    ...    ${headers}
    ...    ${member.status.success.code}
    And Verify Register Success    ${response}    ${member.status.success.response_key}
    And Register Member
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.register}
    ...    ${req_body}
    ...    ${headers}
    ...    ${member.status.failed.code}
    Then Verify Register Failed    ${response}    ${member.status.failed.response_exist}
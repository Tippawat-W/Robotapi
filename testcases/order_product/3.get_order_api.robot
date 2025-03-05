*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot

*** Test Cases ***
Verify That Get Order Success
    [Tags]    high
    Given Create Headers    x-api-key=${Token}
    When Check Order
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.single_order}
    ...    ${headers}
    ...    ${order_id}
    ...    ${order_list.success.code}
    Then Verify Check Order Is Success    ${response}    ${order_id}    ${order_list}

Verify That Get Order Failed When Token Not Match Order Id
    [Tags]    high
    Given Create Headers    &{default_headers}
    And Add Current Date Time On Data    ${member.email.new}
    And Create Body    email=${value_inclue_date_and_time}
    And Register Member
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.register}
    ...    ${req_body}
    ...    ${headers}
    ...    ${member.status.success.code}
    And Verify Register Success    ${response}    ${member.status.success.response_key}
    And Create Headers    x-api-key=${Token}
    When Check Order
    ...    ${api_coffee_shop.url.dev}
    ...    ${api_path.single_order}
    ...    ${headers}
    ...    ${order_id}
    ...    ${order_list.failed.code}
    Then Verify Check Order Is Failed    ${response}    ${order_list.failed.message}
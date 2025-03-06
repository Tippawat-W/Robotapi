*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot

*** Test Cases ***
Verify That Get Order Success
    [Tags]    high
    Given Api Get Order Has Valid Token
    When Rest Api For Get Order
    ...    ${api_coffee_shop.url.dev}
    ...    ${order_list.success.code}
    Then Verify Check Order Is A Success

Verify That Get Order Failed When Token Not Match Order Id
    [Tags]    high
    Given Api Register Member Has Valid Header
    And Add Current Date Time On Data    ${member.email.new}
    And Payload Register Member Has Email    email=${value_inclue_date_and_time}
    And Rest Api For Register Member
    ...    ${api_coffee_shop.url.dev}
    ...    ${member.status.success.code}
    And Verify Register Success
    And Api Get Order Has Valid Token
    When Rest Api For Get Order
    ...    ${api_coffee_shop.url.dev}
    ...    ${order_list.failed.code}
    Then Verify Check Order Is A Failed    ${response}    ${order_list.failed.message}
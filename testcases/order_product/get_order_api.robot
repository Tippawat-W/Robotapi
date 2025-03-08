*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot
Resource    ${CURDIR}/../../keywords/order_product_api_keywords.robot

*** Test Cases ***
Verify That Get Order Success
    [Tags]    TC-006    High
    [Setup]    Prepare Access Token And Product List
    When Send Request To Get Product Order
    Then Verify Product Order Is A Success

Verify That Get Order Failed When Token Not Match Order Id
    [Tags]    TC-007    High
    [Setup]    Prepare Access Token And Product List
    Given Setup Email For Register Member    ${register_member.valid_email}
    And Send Request To Register Member    ${prepare_email_for_register_is_already}
    And Verify Register Member Is A Success
    And Api Get Order Has Valid Token
    When Send Request To Get Product Order
    Then Verify Product Order Is A Failed
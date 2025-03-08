*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/order_product_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot

*** Test Cases ***
Verify that user can order product success
    [Tags]    TC-005    High
    [Setup]    Prepare Access Token
    Given Api Order Coffee Has Valid Token
    When Send Request To Order Coffee    ${order_product_request}
    Then Verify Order Coffee Is Success
    And Verify Order Coffee Is Correct
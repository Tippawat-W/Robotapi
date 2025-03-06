*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/order_product_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot

*** Test Cases ***
Verify that user can order product success
    [Tags]    high
    Given Api Order Coffee Has Valid Token
    And Payload Order coffee Has Product    ${products_order}
    When Rest Api for Order Coffee
    ...    ${api_coffee_shop.url.dev}
    ...    ${order_coffee.success.code}
    Then Verify Order Coffee Is Success
    And Verify Order Coffee Is Correct
    ...    ${api_coffee_shop.url.dev}
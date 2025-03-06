*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/order_product_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot

*** Test Cases ***
Verify that user can order product success
    [Tags]    High
    Given Api Order Coffee Has Valid Token
    And Payload Order Coffee Has Product    ${products_order}
    When Rest Api For Order Coffee
    Then Verify Order Coffee Is Success
    And Verify Order Coffee Is Correct
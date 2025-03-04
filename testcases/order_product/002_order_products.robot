*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/order_product_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot

*** Test Cases ***
Verify that user can order product success
    [Tags]    high
    Given Create Headers         x-api-key=${Token}                 
    And Create Order Product List       ${products_order}
    And Create Body       customerName=${user_01['name']}     products=${products_order}
    When Order Coffee   
    ...    ${api['url']['dev']}       
    ...    ${api['order']}   
    ...    ${req_body}
    ...    ${headers}
    ...    ${status_order['success']['code']}
    Then Verify Order Coffee Is Success    ${response}     ${req_body}      # API response data same as payload.
    And Verify Order Coffee Is Correct
    ...    ${response}
    ...    ${api['url']['dev']}       
    ...    ${headers}
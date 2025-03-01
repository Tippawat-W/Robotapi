*** Settings ***
Resource    ${CURDIR}/../../import/import.robot

*** Test Cases ***
Verify that user can order product success
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

*** Comments ***

Verify that user can order product success
    ${headers}=      BuiltIn.Create Dictionary         x-api-key=${Token}                 
    ${products}=     api_commons.Built Json File       ${products_order}
    ${req_body}=     BuiltIn.Create Dictionary        customerName=${user_01['name']}     products=${products}

    # API response data same as payload.
    ${expected_response}=       BuiltIn.Set Variable    ${req_body}
    order_product_api.Order Coffee Success      
    ...    ${api['url']['dev']}       
    ...    ${api['order']}   
    ...    ${req_body}
    ...    ${headers}
    ...    ${expected_response}
    ...    ${status_order['success']['code']}
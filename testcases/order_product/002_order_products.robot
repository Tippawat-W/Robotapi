*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that user can order product success
    ${headers}=      BuiltIn.Create Dictionary         x-api-key=${Token}                 
    ${products}=     api_commons.Built Json File       ${products_order}
    ${req_body}=     BuiltIn.Create Dictionary        customerName=${user_01['name']}     products=${products}
    ${expected_response}=       BuiltIn.Set Variable    ${req_body}    #  API response data same as payload.
    order_product_api.Order Coffee Success      
    ...    ${api['url']['dev']}       
    ...    ${api['order']}   
    ...    ${req_body}
    ...    ${headers}
    ...    ${expected_response}
    ...    ${status_order['success']['code']}
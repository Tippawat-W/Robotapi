*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that user can order product success
    ${headers}=      BuiltIn.Create Dictionary         x-api-key=${Token}             #x-api-key=${Token}         #x-api-key=58a571df1a6286b4cb5caed1ad88ce915557830a       
    ${products}=     api_commons.Built Json File       ${products_order}
    ${req_body}=     BuiltIn.Create Dictionary        customerName=${user_01['name']}     products=${products}
    order_product_api.Order Coffee Success      
    ...    ${api['url']['dev']}       
    ...    ${api['order']}   
    ...    ${req_body}
    ...    ${headers}
    ...    ${req_body}
    ...    ${status_order['success']['code']}

*** comment ***   
*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that user can order product success
    ${headers}=      api_common.Create headers        x-api-key=${Token}         #x-api-key=dec512a97688769f82ca62c3cc5d3e824cf309e5       
    ${products}=     api_common.Built JSON file       ${products_order}
    ${req_body}=     BuiltIn.Create Dictionary        customerName=${user_01['name']}     products=${products}
    ${response}=     order_product_api.Order coffee success      
    ...    ${API['url']['dev']}       
    ...    ${API['order']}   
    ...    ${req_body}
    ...    ${headers}
    ...    ${req_body}
    ...    ${status_order['success']['code']}

*** comment ***   
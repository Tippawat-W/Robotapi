*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify That Get Order Success
    ${headers}=      BuiltIn.Create Dictionary             x-api-key=${Token}           #x-api-key=58a571df1a6286b4cb5caed1ad88ce915557830a        x-api-key=${Token}
    get_order_api.Check Order By Id Success
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id}         #${order_id}  ${order_coffee['id']}
    ...    ${order_coffee}
    ...    ${order_coffee['success']['code']}

Verify That Get Order Failed When Token Not Match Order Id
    ${headers}=      BuiltIn.Create Dictionary             x-api-key=58a571df1a6286b4cb5caed1ad88ce915557830a           #x-api-key=58a571df1a6286b4cb5caed1ad88ce915557830a        x-api-key=${Token}
    get_order_api.Check Order By Id Failed
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id}         #${order_id}  ${order_coffee['id']}
    ...    ${order_coffee['failed']['message']}
    ...    ${order_coffee['failed']['code']}


*** comment ***   
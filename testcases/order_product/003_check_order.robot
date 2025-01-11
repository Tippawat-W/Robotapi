*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify That Get Order Success
    ${headers}=      BuiltIn.Create Dictionary             x-api-key=${Token}      
    get_order_api.Check Order By Id Success
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id}     
    ...    ${order_coffee}
    ...    ${order_coffee['success']['code']}

Verify That Get Order Failed When Token Not Match Order Id
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${final_email_format}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary            email=${final_email_format}
    ${response}=    register_api.Register Member Success   
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['response_key']}  
    ...    ${member['status']['success']['code']}
    ${Token}    Collections.Get From Dictionary            ${response.json()}       token
    ${headers}=      BuiltIn.Create Dictionary             x-api-key=${Token}
    get_order_api.Check Order By Id Failed
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id} 
    ...    ${order_coffee['failed']['message']}
    ...    ${order_coffee['failed']['code']}
*** Settings ***
Resource    ${CURDIR}/../../import/import.robot

*** Test Cases ***
Verify That Get Order Success
    Given Create Headers             x-api-key=${Token}
    When Check Order
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}  
    ...    ${headers}
    ...    ${order_id}
    ...    ${order_coffee['success']['code']}    
    Then Verify Check Order Is Success        ${response}        ${order_id}             ${order_coffee}
    

Verify That Get Order Failed When Token Not Match Order Id
    Given Create Headers             &{default_headers}
    And Add Days And Time To Current Date    ${member['email']['new']}
    And Create Body           email=${value_inclue_date_and_time}
    And Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['code']}
    And Verify Register Success     ${response}            ${member['status']['success']['response_key']} 
    And Create Headers            x-api-key=${Token}
    When Check Order
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id} 
    ...    ${order_coffee['failed']['code']}
    Then Verify Check Order Is Failed        ${response}             ${order_coffee['failed']['message']}


*** Comments ***
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
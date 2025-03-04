*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot
Resource    ${CURDIR}/../../keywords/get_order_api_keywords.robot

*** Test Cases ***
Verify That Get Order Success
    [Tags]    high
    Given Create Headers             x-api-key=${Token}
    When Check Order
    ...    ${api['url']['dev']}       
    ...    ${api['single_order']}  
    ...    ${headers}
    ...    ${order_id}
    ...    ${order_coffee['success']['code']}    
    Then Verify Check Order Is Success        ${response}        ${order_id}             ${order_coffee}
    

Verify That Get Order Failed When Token Not Match Order Id
    [Tags]    high
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
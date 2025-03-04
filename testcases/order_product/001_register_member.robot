*** Settings ***
Resource    ${CURDIR}/../../resource/import/import.robot
Resource    ${CURDIR}/../../keywords/register_api_keywords.robot

*** Test Cases ***
Verify that user cannot register member when email is invalid format
    [Tags]    high
    Given Create Headers        &{default_headers}
    And Create Body            email=${member['email']['invalid']}    
    When Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['failed']['code']}
    Then Verify Register Failed     ${response}            ${member['status']['failed']['response_invalid']} 

Verify that system can Register Member Success
    [Tags]    high
    Given Create Headers        &{default_headers}
    And Add Days And Time To Current Date    ${member['email']['new']}
    And Create Body    email=${value_inclue_date_and_time}
    When Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['code']}
    Then Verify Register Success     ${response}            ${member['status']['success']['response_key']}  

Verify that user cannot register member when email is exist on system
    [Tags]    high
    Given Create Headers        &{default_headers}
    And Add Days And Time To Current Date    ${member['email']['new']}
    And Create Body             email=${value_inclue_date_and_time}
    When Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['code']}
    And Verify Register Success     ${response}            ${member['status']['success']['response_key']} 
    And Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}   
    ...    ${member['status']['failed']['code']}
    Then Verify Register Failed     ${response}            ${member['status']['failed']['response_exist']} 
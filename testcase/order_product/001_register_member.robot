*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that system can register member success
    ${headers}=      api_common.Create headers             &{default_headers}
    ${add_today}=    common.Add days and time to current date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary            email=${add_today}
    register_api.Register member success   
    ...    ${API['url']['dev']}       
    ...    ${API['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['response_key']}  
    ...    ${member['status']['success']['code']}

Verify that user cannot register member when email is exist on system
    ${headers}=      api_common.Create headers             &{default_headers}
    ${req_body}=     BuiltIn.Create Dictionary             email=${member['email']['exist']}
    register_api.Register member is failed        
    ...    ${API['url']['dev']}       
    ...    ${API['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['failed']['response_exist']}  
    ...    ${member['status']['failed']['code']}

Verify that user cannot register member when email is invalid format
    ${headers}=      api_common.Create headers             &{default_headers}
    ${req_body}=     BuiltIn.Create Dictionary             email=${member['email']['invalid']}
    register_api.Register member is failed        
    ...    ${API['url']['dev']}       
    ...    ${API['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['failed']['response_invalid']}  
    ...    ${member['status']['failed']['code']}


*** comments ***

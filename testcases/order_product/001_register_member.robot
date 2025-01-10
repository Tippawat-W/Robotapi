*** Settings ***
Resource    ${CURDIR}/../../import/import.resource

*** Test Cases ***
Verify that user cannot register member when email is invalid format
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${req_body}=     BuiltIn.Create Dictionary             email=${member['email']['invalid']}
    register_api.Register Member Is Failed        
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['failed']['response_invalid']}  
    ...    ${member['status']['failed']['code']}


Verify that system can Register Member Success
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${add_today}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary            email=${add_today}
    register_api.Register Member Success   
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['response_key']}  
    ...    ${member['status']['success']['code']}

Verify that user cannot register member when email is exist on system
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${add_today}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary             email=${add_today}
    register_api.Register Member Success   
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['response_key']}  
    ...    ${member['status']['success']['code']}
    register_api.Register Member Is Failed        
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['failed']['response_exist']}  
    ...    ${member['status']['failed']['code']}


*** comments ***

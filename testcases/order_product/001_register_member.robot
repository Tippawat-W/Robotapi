*** Settings ***
Resource    ${CURDIR}/../../import/import.robot

*** Test Cases ***
Verify that user cannot register member when email is invalid format
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
    Given Create Headers        &{default_headers}
    And Add Days And Time To Current Date    ${member['email']['new']}
    And Create Body             email=${value_inclue_date_and_time}
    When Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['code']}
    Then Verify Register Success     ${response}            ${member['status']['success']['response_key']} 
    When Register Member
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}   
    ...    ${member['status']['failed']['code']}
    Then Verify Register Failed     ${response}            ${member['status']['failed']['response_exist']} 


*** Comments ***
Verify that user cannot register member when email is invalid format
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${req_body}=     BuiltIn.Create Dictionary             email=${member['email']['invalid']}
    ${response}=     register_api.Register Member     
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['failed']['code']}
    register_api.Verify Register Failed     ${response}            ${member['status']['failed']['response_invalid']} 
    


Verify that system can Register Member Success
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${final_email_format}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary            email=${final_email_format}
    ${response}=     register_api.Register Member 
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['code']}
    register_api.Verify Register Success     ${response}            ${member['status']['success']['response_key']}  

Verify that user cannot register member when email is exist on system
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${final_email_format}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary             email=${final_email_format}
    ${response}=     register_api.Register Member  
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['code']}
    register_api.Verify Register Success     ${response}            ${member['status']['success']['response_key']} 
    ${response}=    register_api.Register Member    
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}   
    ...    ${member['status']['failed']['code']}
    register_api.Verify Register Failed     ${response}            ${member['status']['failed']['response_exist']} 





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
    ${final_email_format}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary            email=${final_email_format}
    register_api.Register Member Success   
    ...    ${api['url']['dev']}       
    ...    ${api['register']}   
    ...    ${req_body}  
    ...    ${headers}  
    ...    ${member['status']['success']['response_key']}  
    ...    ${member['status']['success']['code']}

Verify that user cannot register member when email is exist on system
    ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
    ${final_email_format}=    commons.Add Days And Time To Current Date    ${member['email']['new']}
    ${req_body}=     BuiltIn.Create Dictionary             email=${final_email_format}
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
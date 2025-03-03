*** Settings ***
Resource    ${CURDIR}/../../import/import.robot
#Change folder import to resource

*** Test Cases ***
Verify that api status is active
       Given Create Headers        &{default_headers}
       When Check Api Status
    ...    ${api['url']['dev']}        
    ...    ${api['status']}
    ...    ${headers}      
    ...    ${status_api['active']['expected_status_code']}
#If this keywords use only for Check api it not necessary to parse Arguments
       Then Verify Api Is Available        ${response}    ${status_api['active']['status']}
            


*** Comments ***
Verify that api status is active
           ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
           ${response}=    heal_check_api.Check Api Status            
    ...    ${api['url']['dev']}        
    ...    ${api['status']}
    ...    ${headers}      
    ...    ${status_api['active']['expected_status_code']} 
           heal_check_api.Verify Api Is Available        ${response}    ${status_api['active']['status']}

Verify that api status is active
           ${headers}=      BuiltIn.Create Dictionary             &{default_headers}
           heal_check_api.Check Api Status            
    ...    ${api['url']['dev']}        
    ...    ${api['status']}
    ...    ${headers}      
    ...    ${status_api['active']['status']}
    ...    ${status_api['active']['expected_status_code']} 
*** Keywords ***
Check api status
    [Arguments]    ${url}        ${part}      ${headers}     ${status}         ${expected_status}  
    ${response}=   api_common.Send get request with header       ${url}        ${part}     ${headers}     ${expected_status}  
    ${expected_response}     BuiltIn.Create Dictionary        status=${status}  
    api_common.Verify response with dict      ${response.json()}    &{expected_response}


*** comments ***
Check api status
    [Arguments]    ${url}        ${part}          ${status}           ${expected_status}  
    ${headers}=    api_common.Create headers        
    ${response}=   api_common.Send get request with header       ${url}        ${part}     ${headers}     ${expected_status}  
    ${expected_response}     BuiltIn.Create Dictionary        status=${status}  
    api_common.Verify response with dict      ${response.json()}    &{expected_response}

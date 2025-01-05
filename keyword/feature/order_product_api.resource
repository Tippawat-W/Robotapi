*** Keywords ***
Order coffee success
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${expected_response}         ${expected_status} 
    ${response}=     api_common.Send post request with json body           
    ...    ${url}       
    ...    ${part}  
    ...    ${req_body}
    ...    ${headers}  
    ...    ${expected_status}
    api_common.Verify response with dict      ${response.json()}    &{expected_response}
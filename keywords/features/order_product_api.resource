*** Keywords ***
Order Coffee Success
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${expected_response}         ${expected_status} 
    ${response}=     api_commons.Send Post Request With Json Body           
    ...    ${url}       
    ...    ${part}  
    ...    ${req_body}
    ...    ${headers}  
    ...    ${expected_status}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}
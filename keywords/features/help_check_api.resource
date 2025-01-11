*** Keywords ***
Check Api Status
    [Arguments]    ${url}        ${part}      ${headers}     ${status}         ${expected_status}  
    ${response}=   api_commons.Send Get Request With Header       ${url}        ${part}     ${headers}     ${expected_status}  
    ${expected_response}     BuiltIn.Create Dictionary        status=${status}  
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}
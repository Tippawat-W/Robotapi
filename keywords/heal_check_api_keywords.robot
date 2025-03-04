*** Keywords ***
Check Api Status
    [Arguments]    ${url}        ${part}      ${headers}         ${expected_status}=200 
    ${response}=   api_commons_keywords.Send Get Request With Header       ${url}        ${part}     ${headers}     ${expected_status}  
    Set Test Variable    ${response}        ${response}

Verify Api Is Available
    [Arguments]    ${response}         ${status}       
    ${expected_response}     BuiltIn.Create Dictionary        status=${status}  
    api_commons_keywords.Verify Response With Dict      ${response.json()}    &{expected_response}
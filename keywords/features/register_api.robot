*** Keywords ***
Register Member
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}         ${expected_status} 
    ${response}=     api_commons.Send Post Request With Json Body       ${url}        ${part}     ${req_body}        ${headers}    ${expected_status}
    Set Test Variable    ${response}        ${response}


Verify Register Success
    [Arguments]        ${response}         ${response_key}
    api_commons.Verify Key Exists In Response        ${response.json()}       ${response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}       ${response_key}
    BuiltIn.Set Global Variable    ${Token}    ${Token} 
    Set Test Variable    ${response}        ${response}
    
    

Verify Register Failed
    [Arguments]   ${response}        ${expected_response}
    ${expected_response}     BuiltIn.Create Dictionary        error=${expected_response}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}

*** Comments ***

Verify Register Success
    [Arguments]        ${response}         ${response_key}
    api_commons.Verify Key Exists In Response        ${response.json()}       ${response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}       ${response_key}
    BuiltIn.Set Global Variable    ${Token}    ${Token} 
    Set Test Variable    ${response}        ${response}

Register Member Success
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${response_key}         ${expected_status} 
    ${response}=     api_commons.Send Post Request With Json Body       ${url}        ${part}     ${req_body}        ${headers}    ${expected_status}
    api_commons.Verify Key Exists In Response        ${response.json()}       ${response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}       ${response_key}
    BuiltIn.Set Global Variable    ${Token}    ${Token} 
    [Return]     ${response}

Register Member Is Failed
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${expected_response}         ${expected_status} 
    ${response}=     api_commons.Send Post Request With Json Body       ${url}        ${part}     ${req_body}        ${headers}    ${expected_status}
    ${expected_response}     BuiltIn.Create Dictionary        error=${expected_response}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}
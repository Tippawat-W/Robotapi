*** Keywords ***
Register Member
    [Arguments]    ${url}    ${path}    ${req_body}    ${headers}    ${expected_status}
    ${response}    api_commons_keywords.Send Post Request With Json Body    ${url}    ${path}    ${req_body}    ${headers}    ${expected_status}
    Set Test Variable    ${response}    ${response}

Verify Register Success
    [Arguments]    ${response}    ${response_key}
    api_commons_keywords.Verify Key Exists In Response    ${response.json()}    ${response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}    ${response_key}
    BuiltIn.Set Global Variable    ${Token}    ${Token}
    Set Test Variable    ${response}    ${response}

Verify Register Failed
    [Arguments]    ${response}    ${expected_response}
    ${expected_response}    BuiltIn.Create Dictionary    error=${expected_response}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}
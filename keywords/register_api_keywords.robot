*** Keywords ***
Api Register Member Has Valid Header
    Create Headers    &{default_headers}

Payload Register Member Has Email
    [Arguments]    &{req_body}
    Create Body    &{req_body}

Rest Api For Register Member
    [Arguments]    ${url}    ${expected_status}
    ${response}    api_commons_keywords.Send Post Request With Json Body    ${url}    ${api_path.register}    ${req_body}    ${headers}    ${expected_status}
    Set Test Variable    ${response}    ${response}

Verify Register Success
    api_commons_keywords.Verify Key Exists In Response    ${response.json()}    ${member.status.success.response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}    ${member.status.success.response_key}
    BuiltIn.Set Global Variable    ${Token}    ${Token}
    Set Test Variable    ${response}    ${response}

Verify Register Failed
    [Arguments]    ${response}    ${expected_response}
    ${expected_response}    BuiltIn.Create Dictionary    error=${expected_response}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}
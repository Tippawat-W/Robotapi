*** Keywords ***
Api Register Member Has Valid Header
    Create Headers    &{default_headers}

Payload Register Member Has Email
    [Arguments]    &{req_body}
    Create Body    &{req_body}

Rest Api For Register Member
    ${response}    api_commons_keywords.Send Post Request With Json Body   ${api_coffee_shop['url']['dev']}    ${api_path.register}    ${req_body}    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Register Success
    RequestsLibrary.Status Should Be    ${member.status.success.code}    ${response}
    api_commons_keywords.Verify Key Exists In Response    ${response.json()}    ${member.status.success.response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}    ${member.status.success.response_key}
    BuiltIn.Set Global Variable    ${Token}    ${Token}
    Set Test Variable    ${response}    ${response}

Verify Register Failed
    [Arguments]    ${expected_response}
    RequestsLibrary.Status Should Be    ${member.status.failed.code}    ${response}
    ${expected_response}    BuiltIn.Create Dictionary    error=${expected_response}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}
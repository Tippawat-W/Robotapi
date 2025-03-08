*** Keywords ***
Api Register Member Has Valid Header
    Create Headers    &{default_headers}

Send Request To Register Member
    [Arguments]    ${req_body}
    ${response}    Send Post Request With Json Body   ${api_coffee_shop['url']}    ${api_path.register}    ${req_body}    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Register Member Is A Success
    Status Should Be    ${register_member.status.success.code}    ${response}
    Dictionary Should Contain Key    ${response.json()}    token
    ${Token}    Collections.Get From Dictionary    ${response.json()}    ${register_member.status.success.response_key}
    Set Test Variable    ${Token}    ${Token}

Verify Register Member Is A Failed
    [Arguments]    ${expected_response}
    Status Should Be    ${register_member.status.failed.code}    ${response}
    Should Be Equal    ${response.json()}    ${expected_response}
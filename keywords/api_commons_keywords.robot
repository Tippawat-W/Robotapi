*** Keywords ***
Create Headers
    [Arguments]    &{objects}
    ${headers}    BuiltIn.Create Dictionary    &{objects}
    Set Test Variable    ${headers}        ${headers}

Create Body
    [Arguments]    &{objects}
    ${req_body}=    BuiltIn.Create Dictionary    &{objects}
    Set Test Variable    ${req_body}        ${req_body}

Send Post Request With Json Body
    [Arguments]    ${url}    ${path}    ${request_body}    ${header}    ${expected_status_code}
    RequestsLibrary.Create Session    alias=post_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Post On Session    post_session    ${path}    json=${request_body}   headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Get Request With Header
    [Arguments]    ${url}    ${path}   ${header}    ${expected_status_code}=200
    RequestsLibrary.Create Session    alias=get_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Get On Session    get_session    ${path}    headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Verify Key Exists In Response
    [Documentation]  Check dict key by expected data key
    [Arguments]    ${resp_json}    ${key_name}
    IF    '${key_name}' in ${resp_json}    
        BuiltIn.Log    Key '${key_name}' exists
    ELSE
        BuiltIn.Fail    Key '${key_name}' does not exist
    END

Verify Response Text Value
    [Arguments]    ${resp_text}    ${expected_value}
    BuiltIn.Should Be Equal    ${resp_text}    ${expected_value}

Verify Response With Dict
    [Documentation]  Check dict key:value by expected data key:value
    [Arguments]    ${resp_json_data}    &{expected_data}
    FOR    ${key}    IN    @{expected_data.keys()}
        ${expected_value}    Collections.Get From Dictionary    ${expected_data}    ${key}
        ${actual_value}      Collections.Get From Dictionary    ${resp_json_data}    ${key}
        BuiltIn.Log    Key: ${key} should be ${expected_value}
        BuiltIn.Log    Key: ${key} should be ${actual_value}
        BuiltIn.Should Be Equal    ${actual_value}    ${expected_value}
    END
    
Create Order Product List
    [Documentation]  Change order list to JSON format.
    [Arguments]    ${order}
    ${list}=    BuiltIn.Create List
    @{keys}=    Collections.Get Dictionary Keys    ${order}
    FOR    ${value}    IN    @{keys}
        ${data}=    Collections.Get From Dictionary    ${order}    ${value}
        Collections.Append To List    ${list}    ${data}
    END
    Set Test Variable    ${products_order}        ${list}

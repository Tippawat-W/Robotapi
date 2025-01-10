*** Keywords ***
Create headers
    [Arguments]    &{objects}
    ${headers}=    BuiltIn.Create Dictionary    &{objects}
    [Return]    ${headers}

Send Post Request With Json Body
    [Arguments]    ${url}    ${path}    ${request_body}    ${header}    ${expected_status_code}
    RequestsLibrary.Create Session    alias=post_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Post On Session    post_session    ${path}    json=${request_body}   headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Post Request With Json Body If Session Exist
    [Arguments]    ${path}    ${request_body}    ${header}    ${expected_status_code}    ${session_alias}=post_session
    ${response}=    RequestsLibrary.Post On Session    ${session_alias}    ${path}    json=${request_body}   headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Post Request Without Header
    [Arguments]    ${url}    ${path}    ${request_body}    ${expected_status_code}
    RequestsLibrary.Create Session    alias=post_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Post On Session    post_session    ${path}    json=${request_body}   expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Get Request With Header
    [Arguments]    ${url}    ${path}   ${header}    ${expected_status_code}
    RequestsLibrary.Create Session    alias=get_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Get On Session    get_session    ${path}    headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Get Request Not Header
    [Arguments]    ${url}    ${path}    ${expected_status_code}
    RequestsLibrary.Create Session    alias=get_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Get On Session    get_session    ${path}      expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Get Request With Header If Session Exist
    [Arguments]    ${session}    ${path}   ${header}    ${expected_status_code}
    ${response}=    RequestsLibrary.Get On Session    ${session}    ${path}    headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send Delete Request
    [Arguments]    ${url}    ${path}    ${request_body}    ${header}    ${expected_status_code}
    RequestsLibrary.Create Session    alias=delete_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Delete On Session    delete_session    ${path}    json=${request_body}    headers=${header}    expected_status=anything
    RequestsLibrary.Status Should Be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Verify Response Code Message And Success Status Is Correctly
    [Arguments]    ${resp_json}    ${expected_code}    ${expected_message}    ${expected_success}
    BuiltIn.Should Be Equal    ${resp_json['code']}    ${expected_code}
    BuiltIn.Should Be Equal    ${resp_json['message']}    ${expected_message}
    BuiltIn.Should Be Equal    ${resp_json['success']}    ${expected_success}

Verify Response Message And Success status Is Correctly
    [Arguments]    ${resp_json}    ${expected_message}    ${expected_success}
    BuiltIn.Should Be Equal    ${resp_json['message']}    ${expected_message}
    BuiltIn.Should Be Equal    ${resp_json['success']}    ${expected_success}

Verify Response Error Description And Error Status Is Incorrectly
    [Arguments]    ${resp_json}    ${expected_message}    ${expected_success}
    BuiltIn.Should Be Equal    ${resp_json['error']}    ${expected_message}
    BuiltIn.Should Be Equal    ${resp_json['error_description']}    ${expected_success}

Verify Response value By Key
    [Arguments]    ${resp_json}    ${key_name}    ${expected_value}
    BuiltIn.Should Be Equal    ${resp_json['${key_name}']}    ${expected_value}

Verify Key Exists In Response
    [Arguments]    ${resp_json}    ${key_name}
    Run Keyword If    '${key_name}' in ${resp_json}    Log    Key '${key_name}' exists
    ...    ELSE    Fail    Key '${key_name}' does not exist

Verify Response Text Value
    [Arguments]    ${resp_text}    ${expected_value}
    BuiltIn.Should Be Equal    ${resp_text}    ${expected_value}

Verify Response With Dict
    [Arguments]    ${resp_json_data}    &{expected_data}
    FOR    ${key}    IN    @{expected_data.keys()}
        ${expected_value}    Collections.Get From Dictionary    ${expected_data}    ${key}
        ${actual_value}      Collections.Get From Dictionary    ${resp_json_data}    ${key}
        BuiltIn.Log    Key: ${key} should be ${expected_value}
        BuiltIn.Log    Key: ${key} should be ${actual_value}
        BuiltIn.Should Be Equal    ${actual_value}    ${expected_value}
    END
    
Built Json File
    [Arguments]    ${order}
    ${list}=    Create List
    @{keys}=    Get Dictionary Keys    ${order}
    FOR    ${value}    IN    @{keys}
        ${data}=    Get From Dictionary    ${order}    ${value}
        Append To List    ${list}    ${data}
    END
    [Return]    ${list}

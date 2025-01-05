*** Keywords ***
Create headers
    [Arguments]    &{objects}
    ${headers}=    BuiltIn.Create Dictionary    &{objects}
    [Return]    ${headers}

Create session
    [Arguments]    ${url}    ${alias}
    RequestsLibrary.Create session    alias=${alias}    url=${url}    verify=true

Send post request with json body
    [Arguments]    ${url}    ${path}    ${request_body}    ${header}    ${expected_status_code}
    RequestsLibrary.Create session    alias=post_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Post on session    post_session    ${path}    json=${request_body}   headers=${header}    expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send post request with json body if session exist
    [Arguments]    ${path}    ${request_body}    ${header}    ${expected_status_code}    ${session_alias}=post_session
    ${response}=    RequestsLibrary.Post on session    ${session_alias}    ${path}    json=${request_body}   headers=${header}    expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send post request without header
    [Arguments]    ${url}    ${path}    ${request_body}    ${expected_status_code}
    RequestsLibrary.Create session    alias=post_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Post on session    post_session    ${path}    json=${request_body}   expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send get request with header
    [Arguments]    ${url}    ${path}   ${header}    ${expected_status_code}
    RequestsLibrary.Create session    alias=get_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.GET On Session    get_session    ${path}    headers=${header}    expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send get request not header
    [Arguments]    ${url}    ${path}    ${expected_status_code}
    RequestsLibrary.Create session    alias=get_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.GET On Session    get_session    ${path}      expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send get request with header if session exist
    [Arguments]    ${session}    ${path}   ${header}    ${expected_status_code}
    ${response}=    RequestsLibrary.GET On Session    ${session}    ${path}    headers=${header}    expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Send delete request
    [Arguments]    ${url}    ${path}    ${request_body}    ${header}    ${expected_status_code}
    RequestsLibrary.Create session    alias=delete_session    url=${url}    verify=true
    ${response}=    RequestsLibrary.Delete on session    delete_session    ${path}    json=${request_body}    headers=${header}    expected_status=anything
    RequestsLibrary.Status should be    ${expected_status_code}    ${response}    Got unexpected status from request : Expect status : ${expected_status_code} but got ${response.status_code} ${response.reason}
    [Return]    ${response}

Verify response code message and success status is correctly
    [Arguments]    ${resp_json}    ${expected_code}    ${expected_message}    ${expected_success}
    BuiltIn.Should Be Equal    ${resp_json['code']}    ${expected_code}
    BuiltIn.Should Be Equal    ${resp_json['message']}    ${expected_message}
    BuiltIn.Should Be Equal    ${resp_json['success']}    ${expected_success}

Verify response message and success status is correctly
    [Arguments]    ${resp_json}    ${expected_message}    ${expected_success}
    BuiltIn.Should Be Equal    ${resp_json['message']}    ${expected_message}
    BuiltIn.Should Be Equal    ${resp_json['success']}    ${expected_success}

Verify response error description and error status is incorrectly
    [Arguments]    ${resp_json}    ${expected_message}    ${expected_success}
    BuiltIn.Should Be Equal    ${resp_json['error']}    ${expected_message}
    BuiltIn.Should Be Equal    ${resp_json['error_description']}    ${expected_success}

Verify response value by key
    [Arguments]    ${resp_json}    ${key_name}    ${expected_value}
    BuiltIn.Should Be Equal    ${resp_json['${key_name}']}    ${expected_value}

Verify key exists in response
    [Arguments]    ${resp_json}    ${key_name}
    Run Keyword If    '${key_name}' in ${resp_json}    Log    Key '${key_name}' exists
    ...    ELSE    Fail    Key '${key_name}' does not exist

Verify response text value
    [Arguments]    ${resp_text}    ${expected_value}
    BuiltIn.Should Be Equal    ${resp_text}    ${expected_value}

Verify response with dict
    [Arguments]    ${resp_json_data}    &{expected_data}
    FOR    ${key}    IN    @{expected_data.keys()}
        ${expected_value}    Collections.Get From Dictionary    ${expected_data}    ${key}
        ${actual_value}      Collections.Get From Dictionary    ${resp_json_data}    ${key}
        BuiltIn.Log    Key: ${key} should be ${expected_value}
        BuiltIn.Log    Key: ${key} should be ${actual_value}
        BuiltIn.Should Be Equal    ${actual_value}    ${expected_value}
    END
Built JSON file
    [Arguments]    ${order}
    ${list}=    Create List
    @{keys}=    Get Dictionary Keys    ${order}
    FOR    ${value}    IN    @{keys}
        ${data}=    Get From Dictionary    ${order}    ${value}
        Append To List    ${list}    ${data}
    END
    [Return]    ${list}

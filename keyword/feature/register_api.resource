*** Keywords ***
Register member success
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${response_key}         ${expected_status} 
    ${response}=     api_common.Send post request with json body       ${url}        ${part}     ${req_body}        ${headers}    ${expected_status}
    api_common.Verify key exists in response        ${response.json()}       ${response_key}
    ${Token}    Collections.Get From Dictionary    ${response.json()}       ${response_key}
    Set Global Variable    ${Token}    ${Token} 

Register member is failed
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${expected_response}         ${expected_status} 
    ${response}=     api_common.Send post request with json body       ${url}        ${part}     ${req_body}        ${headers}    ${expected_status}
    ${expected_response}     BuiltIn.Create Dictionary        error=${expected_response}
    api_common.Verify response with dict      ${response.json()}    &{expected_response}
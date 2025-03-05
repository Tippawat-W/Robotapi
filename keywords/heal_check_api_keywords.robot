*** Keywords ***
Api check status has valid header
    Create Headers    ${default_headers}

Send request to check status
    ${response}   api_commons_keywords.Send Get Request With Header       ${api.url.dev}        ${api['status']}     ${headers}  
    Set Test Variable    ${response}        ${response}

Verify api is available
    ${expected_response}     BuiltIn.Create Dictionary        status=${status}
    Verify response with dict      ${response.json()}    ${status_api.active.status}
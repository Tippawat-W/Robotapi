*** Keywords ***
Api Check Status Has Valid Header
    Create Headers    &{default_headers}

Send Request To Check Status
    ${response}   Send Get Request With Header    ${api_coffee_shop['url']}    ${api_path.status}    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Api Is Available
    Status Should Be    ${status_api.active.expected_status_code}    ${response}
    Should Be Equal    ${response.json()['status']}    ${status_api.active.status}
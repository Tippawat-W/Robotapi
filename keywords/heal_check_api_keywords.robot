*** Keywords ***
Api Check Status Has Valid Header
    Create Headers    &{default_headers}

Send Request To Check Status
    ${response}   api_commons_keywords.Send Get Request With Header    ${api_coffee_shop.url.dev}    ${api_path.status}    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Api Is Available
    ${expected_response}    BuiltIn.Create Dictionary    status=${status_api.active.status}
    api_commons_keywords.Verify Response With Dict    ${response.json()}    &{expected_response}
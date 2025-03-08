*** Keywords ***
Create Headers
    [Arguments]    &{objects}
    ${headers}    BuiltIn.Create Dictionary    &{objects}
    Set Test Variable    ${headers}    ${headers}

Send Post Request With Json Body
    [Arguments]    ${url}    ${path}    ${request_body}    ${header}
    RequestsLibrary.Create Session    alias=post_session    url=${url}    verify=true
    ${response}    RequestsLibrary.Post On Session    post_session    ${path}    json=${request_body}   headers=${header}    expected_status=anything
    [Return]    ${response}

Send Get Request With Header
    [Arguments]    ${url}    ${path}    ${header}
    RequestsLibrary.Create Session    alias=get_session    url=${url}    verify=true
    ${response}    RequestsLibrary.Get On Session    get_session    ${path}    headers=${header}    expected_status=anything
    [Return]    ${response}

Prepare Access Token
    Api Register Member Has Valid Header
    Setup Email For Register Member    ${register_member.valid_email}
    Send Request ToRegister Member    ${prepare_email_for_register_is_already}
    Verify Register Member Is A SuccessIs A Success

Prepare Access Token And Product List
    Prepare Access Token
    Api Order Coffee Has Valid Token
    Send Request ToOrder Coffeeffee    ${order_product_request}
    Verify Order Coffee Is Success

Setup Email For Register Member
    [Arguments]    ${valid_email}
    ${current_date}=    Get Current Date    result_format=%Y%m%d
    ${current_time}=    Get Current Date    result_format=%H%M%S
    ${updated_email_dic}    Evaluate    ${valid_email}.copy()
    ${updated_email}    Set Variable    ${updated_email_dic['email']}
    ${updated_email}    Replace String    ${updated_email}    {date}   ${current_date}
    ${updated_email}    Replace String    ${updated_email}    {time}   ${current_time}
    Set To Dictionary    ${updated_email_dic}    email=${updated_email}
    Set Test Variable    ${prepare_email_for_register_is_already}    ${updated_email_dic}
*** Keywords ***
Api Get Order Has Valid Token
    Create Headers    x-api-key=${Token}

Rest Api For Get Order
    [Arguments]    ${url}    ${expected_status_code}
    ${order_id_part}    String.Replace String    ${api_path.single_order}    {order_id}    ${order_id}
    ${response}    api_commons_keywords.Send Get Request With Header    ${url}    ${order_id_part}    ${headers}    ${expected_status_code}
    Set Test Variable    ${response}    ${response}

Verify Check Order Is A Success
    ${expected_response}    BuiltIn.Create Dictionary    id=${order_id}    customerName=${order_list['customerName']}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}

Verify Check Order Is A Failed
    [Arguments]    ${response}    ${expected_response}
    ${expected_response}    BuiltIn.Create Dictionary    error=${expected_response}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}
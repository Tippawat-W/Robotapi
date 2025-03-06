*** Keywords ***
Api Get Order Has Valid Token
    Create Headers    x-api-key=${Token}

Rest Api For Get Order
    ${order_id_part}    String.Replace String    ${api_path.single_order}    {order_id}    ${order_id}
    ${response}    api_commons_keywords.Send Get Request With Header    ${api_coffee_shop['url']['dev']}    ${order_id_part}    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Check Order Is A Success
    RequestsLibrary.Status Should Be    ${order_list.success.code}    ${response}
    ${expected_response}    BuiltIn.Create Dictionary    id=${order_id}    customerName=${order_list['customerName']}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}

Verify Check Order Is A Failed
    RequestsLibrary.Status Should Be    ${order_list.failed.code}    ${response}
    ${expected_response}    BuiltIn.Create Dictionary    error=${order_list.failed.message}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{expected_response}
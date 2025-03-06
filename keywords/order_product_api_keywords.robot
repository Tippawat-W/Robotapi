*** Keywords ***
Api Order Coffee Has Valid Token
    Create Headers    x-api-key=${Token}

Payload Order coffee Has Product
    [Arguments]    ${products_order}
    Create Order Product List    ${products_order}
    Create Body   customerName=${customer.name}    products=${products_order}

Rest Api for Order Coffee
    [Arguments]    ${url}    ${expected_status}
    ${response}    api_commons_keywords.Send Post Request With Json Body
    ...    ${url}
    ...    ${api_path.order}
    ...    ${req_body}
    ...    ${headers}
    ...    ${expected_status}
    Set Test Variable    ${response}    ${response}

Verify Order Coffee Is Success
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{req_body}    # API response data same as payload.

Verify Order Coffee Is Correct
    [Arguments]    ${url}
    BuiltIn.Set Global Variable    ${order_id}    ${response.json()['id']}
    Rest Api For Get Order
    ...    ${url}
    ...    ${order_list.success.code}
    Verify Check Order Is A Success
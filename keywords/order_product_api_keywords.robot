*** Keywords ***
Api Order Coffee Has Valid Token
    Create Headers    x-api-key=${Token}

Payload Order Coffee Has Product
    [Arguments]    ${products_order}
    Create Order Product List    ${products_order}
    Create Body   customerName=${customer.name}    products=${products_order}

Rest Api For Order Coffee
    ${response}    api_commons_keywords.Send Post Request With Json Body
    ...    ${api_coffee_shop['url']['dev']}
    ...    ${api_path.order}
    ...    ${req_body}
    ...    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Order Coffee Is Success
    RequestsLibrary.Status Should Be    ${order_coffee.success.code}    ${response}
    api_commons_keywords.Verify Response With Dictionary Key    ${response.json()}    &{req_body}    # API response data same as payload.

Verify Order Coffee Is Correct
    BuiltIn.Set Global Variable    ${order_id}    ${response.json()['id']}
    Rest Api For Get Order
    Verify Check Order Is A Success
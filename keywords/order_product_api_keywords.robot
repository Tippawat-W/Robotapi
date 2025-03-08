*** Keywords ***
Api Order Coffee Has Valid Token
    Create Headers    x-api-key=${Token}

Send Request To Order Coffee
    [Arguments]    ${req_body}
    ${response}    api_commons_keywords.Send Post Request With Json Body
    ...    ${api_coffee_shop['url']}
    ...    ${api_path.order}
    ...    ${req_body}
    ...    ${headers}
    Set Test Variable    ${req_body}    ${req_body}
    Set Test Variable    ${response}    ${response}

Verify Order Coffee Is Success
    RequestsLibrary.Status Should Be    ${order_product.success.code}    ${response}
    Should Be Equal    ${response.json()['customerName']}    ${req_body.customerName}
    Should Be Equal    ${response.json()['products']}    ${req_body.products}
    Set Test Variable    ${order_id}    ${response.json()['id']}

Verify Order Coffee Is Correct
    Send Request To Get Product Order
    Verify Product Order Is A Success
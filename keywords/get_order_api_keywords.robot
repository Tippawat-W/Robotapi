*** Keywords ***
Api Get Order Has Valid Token
    Create Headers    x-api-key=${Token}

Send Request To Get Product Order
    ${order_id_part}    String.Replace String    ${api_path.single_order}    {order_id}    ${order_id}
    ${response}    api_commons_keywords.Send Get Request With Header    ${api_coffee_shop['url']}    ${order_id_part}    ${headers}
    Set Test Variable    ${response}    ${response}

Verify Product Order Is A Success
    RequestsLibrary.Status Should Be    ${order_list.success.code}    ${response}
    Should Be Equal    ${response.json()['customerName']}    ${order_list.customerName}
    Should Be Equal    ${response.json()['id']}    ${order_id}

Verify Product Order Is A Failed
    RequestsLibrary.Status Should Be    ${order_list.failed.code}    ${response}
    Should Be Equal    ${response.json()['error']}    ${order_list.failed.message}
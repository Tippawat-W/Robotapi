*** Keywords ***
Check Order
    [Arguments]    ${url}        ${part}      ${headers}      ${order_id}        ${expected_status_code} 
    ${order_id_part}=     String.Replace String       ${part}     {order_id}        ${order_id}
    ${response}=     api_commons_keywords.Send Get Request With Header       ${url}        ${order_id_part}       ${headers}        ${expected_status_code}
    Set Test Variable    ${response}        ${response}

Verify Check Order Is Success
    [Arguments]        ${response}        ${order_id}        ${expected_response}
    ${expected_response}     BuiltIn.Create Dictionary        id=${order_id}       customerName=${expected_response['customerName']} 
    api_commons_keywords.Verify Response With Dict      ${response.json()}    &{expected_response}

Verify Check Order Is Failed
      [Arguments]        ${response}        ${expected_response}
    ${expected_response}     BuiltIn.Create Dictionary        error=${expected_response}
    api_commons_keywords.Verify Response With Dict      ${response.json()}    &{expected_response}
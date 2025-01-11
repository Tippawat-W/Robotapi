*** Keywords ***
Check Order By Id Success
    [Arguments]    ${url}        ${part}      ${headers}      ${order_id}    ${expected_response}      ${expected_status_code} 
    ${order_id_part}=     String.Replace String       ${part}     {order_id}        ${order_id}
    ${response}=     api_commons.Send Get Request With Header       ${url}        ${order_id_part}       ${headers}        ${expected_status_code}
    ${expected_response}     BuiltIn.Create Dictionary        id=${order_id}       customerName=${expected_response['customerName']} 
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}

Check Order By Id Failed
    [Arguments]    ${url}        ${part}      ${headers}      ${order_id}    ${expected_response}      ${expected_status_code} 
    ${order_id_part}=     String.Replace String       ${part}     {order_id}        ${order_id}
    ${response}=     api_commons.Send Get Request With Header       ${url}        ${order_id_part}       ${headers}        ${expected_status_code}
    ${expected_response}     BuiltIn.Create Dictionary        error=${expected_response}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}
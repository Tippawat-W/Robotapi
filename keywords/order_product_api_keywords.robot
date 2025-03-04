*** Keywords ***
Order Coffee
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}        ${expected_status} 
    ${response}=     api_commons_keywords.Send Post Request With Json Body           
    ...    ${url}       
    ...    ${part}  
    ...    ${req_body}
    ...    ${headers}  
    ...    ${expected_status}
    Set Test Variable    ${response}        ${response}


Verify Order Coffee Is Success
    [Arguments]         ${response}      ${expected_response}
    api_commons_keywords.Verify Response With Dict      ${response.json()}         &{expected_response}

Verify Order Coffee Is Correct
    [Arguments]     ${response}     ${url}        ${headers}
    BuiltIn.Set Global Variable    ${order_id}    ${response.json()['id']} 
    get_order_api_keywords.Check Order
    ...    ${url}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id}
    ...    ${order_coffee['success']['code']}
    get_order_api_keywords.Verify Check Order Is Success    ${response}        ${order_id}        ${response.json()}
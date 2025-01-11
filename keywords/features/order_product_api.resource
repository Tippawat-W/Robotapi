*** Keywords ***
Order Coffee Success
    [Arguments]    ${url}        ${part}      ${req_body}      ${headers}      ${expected_response}         ${expected_status} 
    ${response}=     api_commons.Send Post Request With Json Body           
    ...    ${url}       
    ...    ${part}  
    ...    ${req_body}
    ...    ${headers}  
    ...    ${expected_status}
    api_commons.Verify Response With Dict      ${response.json()}    &{expected_response}
    Set Global Variable    ${order_id}    ${response.json()['id']} 
    get_order_api.Check Order By Id Success
    ...    ${url}       
    ...    ${api['single_order']}   
    ...    ${headers}
    ...    ${order_id}
    ...    ${response.json()}
    ...    ${order_coffee['success']['code']}
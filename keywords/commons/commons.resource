*** Keywords ***
Get Today Date
    ${today}=           BuiltIn.Get Time    day,month,year
    [Return]            ${today}

Get Time
    ${today}=           BuiltIn.Get Time    hour,min,sec
    [Return]            ${today}

Get Today And Time
    ${today}=           BuiltIn.Get Time    day,month,year,hour,min,sec
    [Return]            ${today}

Add Days To Current Date
    [Arguments]    ${value}
    ${today}=        commons.Get Today Date
    ${year}          BuiltIn.Set Variable    ${today}[0]
    ${month}         BuiltIn.Set Variable    ${today}[1]
    ${day}           BuiltIn.Set Variable    ${today}[2]
    ${new_date}=     String.Replace String       ${value}     {date}    ${date}
    [Return]    ${new_date}

Add Days And Time To Current Date
    [Arguments]    ${value}
    ${today}=        commons.Get Today And Time
    ${year}          BuiltIn.Set Variable    ${today}[0]
    ${month}         BuiltIn.Set Variable    ${today}[1]
    ${day}           BuiltIn.Set Variable    ${today}[2]
    ${hour}          BuiltIn.Set Variable    ${today}[3]
    ${min}           BuiltIn.Set Variable    ${today}[4]
    ${sec}           BuiltIn.Set Variable    ${today}[5]
    ${date}=         BuiltIn.Set Variable    ${year}${month}${day}
    ${add_date}=     String.Replace String   ${value}     {date}    ${date}
    ${time}=         BuiltIn.Set Variable    ${hour}${min}${sec} 
    ${add_time}=     String.Replace String   ${add_date}     {time}    ${time}
    ${new_date}=     BuiltIn.Set Variable    ${add_time}
    [Return]    ${new_date}
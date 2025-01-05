*** Keywords ***
Get today date
    ${today}=           BuiltIn.Get time    day,month,year
    [Return]            ${today}

Get time
    ${today}=           BuiltIn.Get time    hour,min,sec
    [Return]            ${today}

Get today and time
    ${today}=           BuiltIn.Get time    day,month,year,hour,min,sec
    [Return]            ${today}

Add days to current date
    [Arguments]    ${value}
    ${today}=        common.Get today date
    ${year}          BuiltIn.Set variable    ${today}[0]
    ${month}         BuiltIn.Set variable    ${today}[1]
    ${day}           BuiltIn.Set variable    ${today}[2]
    ${add_date}=     String.Replace string       ${value}     {date}    ${date}
    [Return]    ${add_date}

Add days and time to current date
    [Arguments]    ${value}
    ${today}=        common.Get today and time
    ${year}          BuiltIn.Set variable    ${today}[0]
    ${month}         BuiltIn.Set variable    ${today}[1]
    ${day}           BuiltIn.Set variable    ${today}[2]
    ${hour}          BuiltIn.Set variable    ${today}[3]
    ${min}           BuiltIn.Set variable    ${today}[4]
    ${sec}           BuiltIn.Set variable    ${today}[5]
    ${date}=         Set Variable    ${year}${month}${day}
    ${add_date}=     String.Replace string       ${value}     {date}    ${date}
    ${time}=         Set Variable    ${hour}${min}${sec} 
    ${add_time}=     String.Replace string       ${add_date}     {time}    ${time}
    ${new_date}=     Set Variable    ${add_time}
    [Return]    ${new_date}

*** comments ***
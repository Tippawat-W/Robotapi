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
    ${year}          BuiltIn.Set variable    ${today}[0]
    ${month}         BuiltIn.Set variable    ${today}[1]
    ${day}           BuiltIn.Set variable    ${today}[2]
    ${add_date}=     String.Replace string       ${value}     {date}    ${date}
    [Return]    ${add_date}

Add Days And Time To Current Date
    [Arguments]    ${value}
    ${today}=        commons.Get Today And Time
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
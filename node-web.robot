*** Variables ***

${PORT}     8082 
${HOST}     web:${PORT}

*** Settings ***

Library         HttpLibrary.HTTP
Library         Selenium2Library
Test Setup      Create HTTP Context     ${HOST}

*** Test Cases ***

Error if GET before connect
    [Setup]  No Operation
    Run Keyword And Expect Error
    ...  Not connected to any HTTP Host. Use "Create HTTP Context" keyword first.
    ...  GET   /

Error if invalid URL
    [Setup]  No Operation
    Run Keyword And Expect Error
    ...  "NEITHER_URL_NOR_PATH" needs to be in form of "/path" or "http://host/path"
    ...  GET   NEITHER_URL_NOR_PATH

Open test browser
    Open browser  ${HOST}  browser=chrome  remote_url=http://chrome:4444/wd/hub

Page should contain Hello World!
    Page should contain  Hello World!

Close test browser
    Close all browsers

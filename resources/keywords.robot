*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open OrangeHRM
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    # sanity: confirm page is really the login page
    Wait Until Element Is Visible    name:username    ${WAIT}

Login With Valid Credentials
    Input Text    name:username    ${USERNAME}
    Input Text    name:password    ${PASSWORD}
    Click Button  css:button[type="submit"]

Should See Dashboard
    Wait Until Page Contains Element    css:h6.oxd-text--h6.oxd-topbar-header-breadcrumb-module    ${WAIT}
    Element Should Contain    css:h6.oxd-text--h6.oxd-topbar-header-breadcrumb-module    Dashboard

Logout
    Click Element    css:span.oxd-userdropdown-tab
    Click Element    xpath=//a[normalize-space(.)="Logout"]
    Wait Until Element Is Visible    name:username    ${WAIT}

Close Browser Session
    Close Browser

*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
User Can Login And Logout
    [Tags]    smoke
    Open OrangeHRM
    Login With Valid Credentials
    Should See Dashboard
    Logout
    Close Browser Session

*** Settings ***
Library                        SeleniumLibrary
Resource                       ../Resources/UserData.robot
Resource                       ../Resources/CommonFunc.robot
Resource                       ../Resources/LoginValidUser.robot

*** Variables ***
# Test Variables
&{LOGIN-VALID}                username=${USER-VALID}    password=${PASS-VALID}
&{LOGIN-INVALID}              username=${USER-INVALID}    password=${PASS-INVALID}

${LOGOUT}                       //a[@id='logout2']
${CLOSE-LOGIN}                  //div[@id='logInModal']//button[@type='button'][normalize-space()='Close']

*** Test Cases ***
Valid Login
    [Tags]    positiveCases
    [Setup]                          Open-Homepage
    Login-User
    Click Element                    ${LOGOUT}

Unregistered User Login
    [Tags]    negativeCases
    [Setup]                          Open-Homepage
    Click Element                    ${LOGIN}
    Wait Until Element Is Visible    ${LOGIN-USER}
    Input Text                       ${LOGIN-USER}        ${LOGIN-INVALID}[username]
    Input Password                   ${LOGIN-PASSWD}      ${LOGIN-INVALID}[password]
    Click Element                    ${LOGIN-BUTTON}
    Alert Should Be Present          User does not exist.
    #Handle Alert                     Accept
    Click Element                    ${CLOSE-LOGIN}

Wrong Password Login
    [Tags]    negativeCases
    [Setup]                          Open-Homepage
    Click Element                    ${LOGIN}
    Wait Until Element Is Visible    ${LOGIN-USER}
    Input Text                       ${LOGIN-USER}        ${LOGIN-VALID}[username]
    Input Password                   ${LOGIN-PASSWD}      ${LOGIN-INVALID}[password]
    Click Element                    ${LOGIN-BUTTON}
    Alert Should Be Present          Wrong password.
    Click Element                    ${CLOSE-LOGIN}

Empty User Login
    [Tags]    negativeCases
    [Setup]                          Open-Homepage
    Click Element                    ${LOGIN}
    Wait Until Element Is Visible    ${LOGIN-USER}
    Sleep                            1
    Click Element                    ${LOGIN-BUTTON}
    Sleep                            1
    Alert Should Be Present          Please fill out Username and Password.
    Click Element                    ${CLOSE-LOGIN}

    [Teardown]                        Close All Browsers
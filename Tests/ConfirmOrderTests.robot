*** Settings ***
Library                        SeleniumLibrary
Resource                       ../Resources/CommonFunc.robot
Resource                       ../Resources/LoginValidUser.robot

*** Variables ***
${PLACE-ORDER}            css:[data-target='#orderModal']
${PURCHASE}               css:[onclick='purchaseOrder()']

*** Test Cases ***
Add Product and Confirm Order
    [Tags]    positiveCases
    [Setup]    Open-Homepage
    Login-User
    Add-Product
    Click Element                    ${PLACE-ORDER}
    Input-User-Data
    Click Element                    ${PURCHASE}

Purchase with Empty Data
    [Tags]    negativeCases
    [Setup]    Open-Homepage
    Login-User
    Click Link                       link:Cart
    Wait Until Element Is Visible    ${PLACE-ORDER}
    Click Element                    ${PLACE-ORDER}
    Wait Until Element Is Visible    ${PURCHASE}
    Click Element                    ${PURCHASE}
    Alert Should Be Present          Please fill out Name and Creditcard.

    [Teardown]    Close All Browsers
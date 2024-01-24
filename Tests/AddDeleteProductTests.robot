*** Settings ***
Library                        SeleniumLibrary
Resource                       ../Resources/CommonFunc.robot
Resource                       ../Resources/LoginValidUser.robot

*** Variables ***
${PHONE-PRODUCT}                link:Sony xperia z5
${LAPTOP-PRODUCT}               link:MacBook Pro
${MONITOR-PRODUCT}              link:Apple monitor 24

${CART-ITEMS}                 css:tr.success

*** Test Cases ***
Add Phone Product to Cart
    [Tags]    positiveCases
    [Setup]                          Open-Homepage
    Login-User
    Click Link                        link:Phones
    Sleep                             2
    Click Link                        ${PHONE-PRODUCT}
    Wait Until Element Is Visible     ${ADD-TO-CART}    timeout=5
    Click Element                     ${ADD-TO-CART}
    Alert Should Be Present           Product added.
    Click Link                        link:Cart

Add Laptop Product to Cart
    [Tags]    positiveCases
    [Setup]                          Open-Homepage
    Login-User
    Click Link                        link:Laptops
    Sleep                             2
    Click Link                        ${LAPTOP-PRODUCT}
    Wait Until Element Is Visible     ${ADD-TO-CART}    timeout=5
    Click Element                     ${ADD-TO-CART}
    Alert Should Be Present           Product added.
    Click Link                        link:Cart

Add Monitor Product to Cart
    [Tags]    positiveCases
    [Setup]                          Open-Homepage
    Login-User
    Click Link                        link:Monitors
    Sleep                             2
    Click Link                        ${MONITOR-PRODUCT}
    Wait Until Element Is Visible     ${ADD-TO-CART}    timeout=5
    Click Element                     ${ADD-TO-CART}
    Alert Should Be Present           Product added.
    Click Link                        link:Cart
    
    [Teardown]    Close All Browsers
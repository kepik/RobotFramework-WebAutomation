*** Settings ***
Library                        SeleniumLibrary
Resource                       ../Resources/UserData.robot

*** Variables ***
# Test Variables
&{LOGIN-VALID}                username=${USER-VALID}    password=${PASS-VALID}
&{USER-DATA}                  name=${NAME} AND
...                           country=${COUNTRY} AND
...                           city=${CITY} AND
...                           card=${CARDNUMBER} AND
...                           month=${MONTH} AND
...                           year=${YEAR} AND

# Login
${LOGIN}                        //a[@id='login2']
${LOGIN-USER}                   css:input#loginusername
${LOGIN-PASSWD}                 css:input#loginpassword
${LOGIN-BUTTON}                 //button[normalize-space()='Log in']
${CONFIRM-LOGIN}                id=nameofuser

# Products
${ADD-TO-CART}                  //a[@class='btn btn-success btn-lg']

# Checkout User Data
${DATA-NAME}                    //input[@id='name']
${DATA-COUNTRY}                 //input[@id='country']
${DATA-CITY}                    //input[@id='city']
${DATA-CARD}                    //input[@id='card']
${DATA-MONTH}                   //input[@id='month']
${DATA-YEAR}                    //input[@id='year']

*** Keywords ***
Login-User
    Click Element                    ${LOGIN}
    Wait Until Element Is Visible    ${LOGIN-USER}
    Input Text                       ${LOGIN-USER}                ${LOGIN-VALID}[username]
    Input Password                   ${LOGIN-PASSWD}              ${LOGIN-VALID}[password]
    Click Element                    ${LOGIN-BUTTON}
    Wait Until Element Is Visible    ${CONFIRM-LOGIN}             timeout=10
    Element Should Contain           ${CONFIRM-LOGIN}             Welcome

Add-Product
    Click Link                        link:Laptops
    Sleep                             2
    Click Link                        MacBook Pro
    Wait Until Element Is Visible     ${ADD-TO-CART}    timeout=5
    Click Element                     ${ADD-TO-CART}
    Alert Should Be Present           Product added.
    Click Link                        link:Cart

Input-User-Data
    Wait Until Element Is Visible     ${DATA-NAME}
    Input Text                        ${DATA-NAME}        ${USER-DATA}[name]
    Input Text                        ${DATA-COUNTRY}     ${USER-DATA}[country]
    Input Text                        ${DATA-CITY}        ${USER-DATA}[city]
    Input Text                        ${DATA-CARD}        ${USER-DATA}[card]
    Input Text                        ${DATA-MONTH}       ${USER-DATA}[month]
    Input Text                        ${DATA-YEAR}        ${USER-DATA}[year]
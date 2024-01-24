*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    headlesschrome

*** Keywords ***
Open-Homepage
    Open Browser    https://www.demoblaze.com/        ${BROWSER}
    Maximize Browser Window
*** Settings ***
Documentation   Resource File
...
...
...
Library     SeleniumLibrary
Library     Collections
*** Variables ***
${SERVER}   www.saucedemo.com
${BROWSER}  edge
${DELAY}    0
${VALID USER}   standard_user
${LOCKED OUT USER}  locked_out_user
${PROBLEM USER}     problem_user
${VALID PASSWORD}   secret_sauce
${LOGIN URL}    https://${SERVER}/
${HOME URL}     https://${SERVER}/inventory.html
${INCORRECT PASSWORD}       asfadgasf

*** Keywords ***

Open Browser To Login Page
    Open Browser    ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Page Should Contain Element     login-button

Standard User
    Input Text  user-name   ${VALID USER}
    Input Password  password    ${VALID PASSWORD}

Locked User
    Input Text  user-name   ${LOCKED OUT USER}
    Input Password  password    ${VALID PASSWORD}
    
Problem User
    Input Text  user-name    ${PROBLEM USER}
    Input Password  password    ${VALID PASSWORD}

Invalid Password
    Input Text  user-name    ${PROBLEM USER}
    Input Password  password    ${INCORRECT PASSWORD}

Check Problem
    Click button    login-button
    Element Attribute Value Should Be   xpath://*[@id="item_4_img_link"]/img    src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    Element Attribute Value Should Be   xpath://*[@id="item_0_img_link"]/img    src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    Element Attribute Value Should Be   xpath://*[@id="item_1_img_link"]/img    src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    Element Attribute Value Should Be   xpath://*[@id="item_5_img_link"]/img    src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    Element Attribute Value Should Be   xpath://*[@id="item_2_img_link"]/img    src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    Element Attribute Value Should Be   xpath://*[@id="item_3_img_link"]/img    src     https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    [Teardown]      Close Browser


Valid Login
    Click button    login-button
    Element Text Should Be     class:title      PRODUCTS
    [Teardown]      Close Browser


Invalid Login
    Click button    login-button
    Element Text Should Be      tag:h3     Epic sadface: Sorry, this user has been locked out.
    [Teardown]      Close Browser

Invalid Password Login
    Click button    login-button
    Element Text Should Be      tag:h3     Epic sadface: Username and password do not match any user in this service
    [Teardown]      Close Browser

Sort AZ
    Click button    login-button
    Element Text Should Be     class:title      PRODUCTS
    click element   xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[1]
    ${L2} =      Create List
    ${elements}=    Get WebElements    xpath=//*[@class='inventory_item_name']
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List  ${L2}   ${text}
    END
    ${L1} =         Create List    Sauce Labs Backpack     Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt       Sauce Labs Fleece Jacket        Sauce Labs Onesie       Test.allTheThings() T-Shirt (Red)
    Lists Should Be Equal	${L2}	${L1}
    [Teardown]      Close Browser 

Sort ZA
    Click button    login-button
    Element Text Should Be     class:title      PRODUCTS
    click element   xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[2]
    ${L4} =      Create List
    ${elements}=    Get WebElements    xpath=//*[@class='inventory_item_name']
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List  ${L4}   ${text}
    END
    ${L3} =         Create List    Test.allTheThings() T-Shirt (Red)   Sauce Labs Onesie   Sauce Labs Fleece Jacket   Sauce Labs Bolt T-Shirt   Sauce Labs Bike Light   Sauce Labs Backpack    
    Lists Should Be Equal	${L4}	${L3}
    [Teardown]      Close Browser 
                                            
Sort LH
    Click button    login-button
    Element Text Should Be     class:title      PRODUCTS
    click element   xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[3]   
    ${L4} =      Create List
    ${elements}=    Get WebElements    xpath=//*[@class='inventory_item_price']
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List  ${L4}   ${text}
    END                   
    ${L3} =         Create List     $7.99   $9.99   $15.99  $15.99  $29.99  $49.99
    Lists Should Be Equal	${L4}	${L3}
    [Teardown]      Close Browser 

Sort HL
    Click button    login-button
    Element Text Should Be     class:title      PRODUCTS
    click element   xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[4]   
    ${L5} =      Create List
    ${elements}=    Get WebElements    xpath=//*[@class='inventory_item_price']
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List  ${L5}   ${text}
    END                   
    ${L6} =         Create List    $49.99  $29.99    $15.99     $15.99   $9.99   $7.99         
    Lists Should Be Equal	${L5}	${L6}
    [Teardown]      Close Browser 
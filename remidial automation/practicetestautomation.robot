*** Settings ***
Library                             SeleniumLibrary
Test Setup                          Open Browser                                                    ${openurl}      ${browsertype}
Test Teardown                       Close Browser

***Variables***
${openurl}                          https://practicetestautomation.com/practice-test-login/
${browsertype}                      chrome
${Vusername}                        student
${Vpassword}                        Password123
${Iusername}                        incorrectUser
${Ipassword}                        incorrectPassword

    
***Test Cases***
Positive Login test using valid username and valid password
    maximize Browser window                  
    input text                      //*[@id="username"]                                             ${Vusername}   
    input text                      //*[@id="password"]                                             ${Vpassword}
    click element                   //*[@id="submit"]
    Wait Until Element Is Visible   //*[@id="loop-container"]/div/article/div[1]/h1
    Wait Until Element Is Visible   //*[@id="loop-container"]/div/article/div[2]/div/div/div/a
    Page should contain                                                                             Congratulations student. You successfully logged in!

Negative username test using invalid username and valid password
    maximize Browser window
    input text                      //*[@id="username"]                                             ${Iusername}   
    input text                      //*[@id="password"]                                             ${Vpassword}
    click element                   //*[@id="submit"]
    Wait Until element Is Visible   //div[@id="error"]
    Page should contain                                                                             Your username is invalid!

Negative password test using valid username and invalid password
    maximize Browser window                  
    input text                      //*[@id="username"]                                             ${Vusername}   
    input text                      //*[@id="password"]                                             ${Ipassword} 
    click element                   //*[@id="submit"]
    Wait Until Element Is Visible   //*[@id="error"]
    Page should contain                                                                             Your password is invalid!
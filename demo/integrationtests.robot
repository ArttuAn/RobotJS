*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***

1: Kortin editointi pysyy auki vaikka painaa muita nappuloita
    Open Browser    http://127.0.0.1:3000/projects    Chrome
    Maximize Browser Window
    Set Selenium Speed     0.3
    Wait Until Element Is Visible    //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Click Element    //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Clear Element Text    id:description 
    Input Text    id:description    Esimerkkideskriptio
    Click Button    More...
    Click Link    Projects
    Element Text Should Be    id:description    Esimerkkideskriptio
    [Teardown]    Close Browser


2: Tarkastetaan, että vaihdettu nimi näkyy oikein
    Open Browser    http://127.0.0.1:3000/projects    Chrome
    Maximize Browser Window
    Set Selenium Speed     0.5
    Wait Until Element Is Visible    //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Click Element    //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Input Text    name:name    Kauppakeskus Trio
    Click Button    Save
    Element Text Should Be    //*[@id="root"]/div/div[1]/div[1]/div/section/a/h5/strong    Kauppakeskus Trio
    [Teardown]    Close Browser
    

3: Tarkastetaan, onko kortin omassa näkymässä samat tiedot
    Open Browser    http://127.0.0.1:3000/projects    Chrome
    Maximize Browser Window
    Set Selenium Speed     0.5
    Click Element    //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Clear Element Text    id:name        
    Input Text    id:name    Kauppakeskus Jumbo
    Click Button    //*[@id="root"]/div/div[1]/div[1]/form/div/button[1]
    Click Element    //*[@id="root"]/div/div[1]/div[1]/div/section/a/p[1]
    Page Should Contain    Kauppakeskus Jumbo
    [Teardown]    Close Browser







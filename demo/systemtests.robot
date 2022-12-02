*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***

1: Projektien tallennustoiminnon testaaminen oikalla datalla
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Set Selenium Speed     0.2
    Click Link    Projects
    Click Button    //*[@id="root"]/div/div[2]/div/div/button
    Click Button    //*[@id="root"]/div/div[1]/div[36]/div/section/button
    Clear Element Text    id:budget
    Clear Element Text    name:name    
    Clear Element Text    id:description
    Input Text    id:budget    1450000
    Input Text    name:name    Haljamintie 21
    Input Text    id:description    Tämä rakennus sai alkunsa vuonna 2000, ja on käymässä läpi renevaatioita.
    Click Button    Save
    Click Element    //*[@id="root"]/div/div[1]/div[36]/div/section/a/p[1]
    Page Should Contain    Project Detail
    Page Should Contain    Haljamintie 21
    Page Should Contain    Tämä rakennus sai alkunsa vuonna 2000, ja on käymässä läpi renevaatioita. 
    Page Should Contain    1450000
    [Teardown]    Close Browser

2: Tarkastetaan, että korttien määrä palautuu ennalleen sivun päivityksen jälkeen 
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Set Selenium Speed     0.4
    Click Link    Projects
    Scroll Element Into View    //*[@id="root"]/div/div[2]/div/div/button
    Click Button       //*[@id="root"]/div/div[2]/div/div/button
    Scroll Element Into View    //*[@id="root"]/div/div[2]/div/div/button
    Click Button    //*[@id="root"]/div/div[2]/div/div/button
    Scroll Element Into View    //*[@id="root"]/div/div[2]/div/div/button
    Click Button    //*[@id="root"]/div/div[2]/div/div/button
    Scroll Element Into View    //*[@id="root"]/div/div[2]/div/div/button
    Click Button    //*[@id="root"]/div/div[2]/div/div/button
    Scroll Element Into View    //*[@id="root"]/div/div[2]/div/div/button        
    Page Should Contain Element    //*[@id="root"]/div/div[1]/div[97]/div/section/a/h5/strong
    Click Link    Home
    Click Link    Projects
    Page Should Not Contain Element    //*[@id="root"]/div/div[1]/div[97]/div/section/a/h5/strong
   [Teardown]    Close Browser

3: Käyttäjän navigointi kaikilla mahdollisilla sovelluksen sivuilla
    Open Browser    http://127.0.0.1:3000/   Chrome
    Maximize Browser Window
    Set Selenium Speed     0.3
    Page Should Contain    Home
    Click Link    Projects
    Page Should Contain    Projects
    Click Element    //*[@id="root"]/div/div[1]/div[1]/div/section/a/p[1]
    Page Should Contain    Project Detail
    Go To    http://127.0.0.1:3000/falseurl
    Page Should Not contain    //*[@id="root"]/div/h2
    Page Should Not Contain    Project Detail
    Go To    http://localhost:3000/projects/53123
    Page Should Not Contain    Home
    Page Should Not Contain    Projects
    Page Should Not Contain    Project Detail
   [Teardown]    Close Browser

4: Edit toiminnon testaus, siirtyminen kortilta toiselle
    Open Browser    http://127.0.0.1:3000/    Chrome
    Maximize Browser Window
    Set Selenium Speed     0.3
    Page Should Contain    Home
    Click Link    Projects
    Click Button   //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Clear Element Text    id:budget
    Clear Element Text    name:name    
    Clear Element Text    id:description
    Input Text    id:budget    1450000
    Input Text    name:name    Haljamintie 21
    Input Text    id:description    Tämä rakennus sai alkunsa vuonna 2000, ja on käymässä läpi renevaatioita.
    Click Button    Save
    Click Button   //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Clear Element Text    id:budget
    Clear Element Text    name:name    
    Clear Element Text    id:description
    Click Button    //*[@id="root"]/div/div[1]/div[2]/div/section/button
    Click Button   //*[@id="root"]/div/div[1]/div[1]/div/section/button
    Element Text Should Be    id:description    Tämä rakennus sai alkunsa vuonna 2000, ja on käymässä läpi renevaatioita.
   [Teardown]    Close Browser

5: Projektien tallennustoiminnon testaminen oikalla datalla, ikkunan kokona iPhone 12 Pro
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Set Window Size    390    844
    Set Selenium Speed     0.3
    Click Link    Projects
    Click Button    //*[@id="root"]/div/div[2]/div/div/button
    Click Button    //*[@id="root"]/div/div[1]/div[36]/div/section/button
    Clear Element Text    id:budget
    Clear Element Text    name:name    
    Clear Element Text    id:description
    Input Text    id:budget    1450000
    Input Text    name:name    Haljamintie 21
    Input Text    id:description    Tämä rakennus sai alkunsa vuonna 2000, ja on käymässä läpi renevaatioita.
    Click Button    Save
    Click Element    //*[@id="root"]/div/div[1]/div[36]/div/section/a/p[1]
    Page Should Contain    Project Detail
    Page Should Contain    Haljamintie 21
    Page Should Contain    Tämä rakennus sai alkunsa vuonna 2000, ja on käymässä läpi renevaatioita. 
    Page Should Contain    1450000
    [Teardown]    Close Browser

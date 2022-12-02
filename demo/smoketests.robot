*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***

1: Lähteekö ohjelma käyntiin
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Title Should Be    React App
    [Teardown]    Close Browser

2: 'Home'-otsikko on näkyvissä
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Page Should Contain Link    Home
    [Teardown]    Close Browser

3: Logo on näkyvissä ohjelman avattua
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Page Should Contain Image    //*[@id="root"]/header/span/img
    [Teardown]    Close Browser

4: Menussa näkyvää linkkiä voi painaa
    Open Browser    http://127.0.0.1:3000    Chrome
    Maximize Browser Window
    Click Link    //*[@id="root"]/header/a[2]
    Page Should Contain    Projects
    [Teardown]    Close Browser

5: Projektit-sivulla näkyy kortit
    Open Browser    http://127.0.0.1:3000/projects    Chrome
    Maximize Browser Window
    Page Should Contain Element    class:row
    [Teardown]    Close Browser
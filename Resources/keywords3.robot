*** Keywords ***
Begin Web Test
        Open Browser                about:blank  ${BROWSER}
        Maximize Browser Window
Go to Web Page
        Load Page
        Verify Page Loaded
        Click on Todays Deal

Load Page
        Go To                       ${URL}
Verify Page Loaded
        ${link_text} =              Get Text  id:nav-your-amazon
        Should Be Equal             ${link_text}  Your Amazon.com

Click on Todays Deal
        Click Element               id:twotabsearchtextbox
        Click Element               xpath://*[@id="navSwmHoliday"]/a

Todays Deal
        Verify Text

Verify Text
        ${promotion_text} =         Get Text    xpath://*[@id="fst-hybrid-dynamic-h1"]/div/h1/b
        Should Be Equal             ${promotion_text}   Deals and Promotions


End Web Test
        Close Browser

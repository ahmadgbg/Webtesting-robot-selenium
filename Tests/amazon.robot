*** Settings ***
Documentation  This is a test suite that tests the Amazon site
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
        Open Browser                about:blank  chrome
Go to Web Page
        Go To                       http://www.amazon.com
        Wait Until Page Contains    Your Amazon.com
Search for Product
        Input Text                  id:twotabsearchtextbox  ferrari 458
        Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input
        Wait Until Page Contains    results for "ferrari 458"
End Web Test
        Close Browser

*** Test Cases ***
User can access Amazon.com
        [Documentation]             Test for accessing website Amazon.com
        [Tags]                      Access Test
        Begin Web Test
        Go to Web Page
        Search for Product
        End Web Test